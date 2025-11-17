import pandas as pd
import geopandas as gpd
import matplotlib.pyplot as plt
from geobr import read_state, read_municipality
from matplotlib.colors import LogNorm
import unicodedata
import os
import sys

# --- CORREÇÃO: Define os caminhos com base na localização do script ---
# Pega o caminho absoluto do diretório onde este script (plotar_rankings.py) está
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

# Cria os caminhos DATA_PATH e GRAFICOS_PATH baseados no SCRIPT_DIR
# O script espera que 'dados/exportados' e 'graficos' estejam no mesmo nível que ele.
# Se a estrutura é Fase2/plotar_rankings.py e Fase2/dados/exportados, está correto.
DATA_PATH = os.path.join(SCRIPT_DIR, 'dados', 'exportados')
GRAFICOS_PATH = os.path.join(SCRIPT_DIR, 'graficos')

def normalizar_string(text):
    """Remove acentos e converte para minúsculas."""
    if isinstance(text, str):
        return unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode("utf-8").lower()
    return text

def plot_choropleth_ranking(df_ranking, coluna_cidade, coluna_score, titulo_mapa, mun_sp_gdf, state_sp_gdf, graficos_path, destacar_top=10, escala_log=False): # <-- Adicionado graficos_path
    """
    Plota um mapa coroplético do estado de SP com base em um score.
    (Versão modificada para receber os GDFs e o caminho de saída)
    """
    print(f"  Plotando: {titulo_mapa}")
    
    # Normaliza os nomes para o merge
    df_ranking_copy = df_ranking.copy()
    df_ranking_copy["name_norm"] = df_ranking_copy[coluna_cidade].apply(normalizar_string)

    # Junta geodados com ranking (usando o GDF pré-carregado)
    gdf = mun_sp_gdf.merge(df_ranking_copy, on="name_norm", how="left")

    # Garante que não tenha nulo/zero se for usar log
    gdf[coluna_score] = gdf[coluna_score].fillna(0)
    if escala_log:
        gdf.loc[gdf[coluna_score] == 0, coluna_score] = 1 # Usa .loc para evitar warnings

    fig, ax = plt.subplots(figsize=(12, 12))

    # Define estilo do mapa
    norm = LogNorm(vmin=gdf[coluna_score].min(), vmax=gdf[coluna_score].max()) if escala_log else None
    legenda_label = f"{coluna_score} (escala log)" if escala_log else coluna_score

    # Desenha o mapa
    gdf.plot(
        column=coluna_score,
        cmap="OrRd",
        linewidth=0,
        ax=ax,
        norm=norm,
        legend=True,
        legend_kwds={"label": legenda_label}
    )

    # Borda do estado (usando o GDF pré-carregado)
    state_sp_gdf.plot(ax=ax, facecolor="none", edgecolor="black", linewidth=2)

    # Destaca top municípios
    if destacar_top > 0:
        top = gdf.nlargest(destacar_top, coluna_score)
        top.plot(ax=ax, facecolor="none", edgecolor="black", linewidth=2)

        print(f"  --- Top {destacar_top} Cidades (Score: {coluna_score}) ---")
        for _, row in top.iterrows():
            print(f"  {row[coluna_cidade]} (Score: {row[coluna_score]:.4f})")

    ax.set_title(titulo_mapa, fontsize=16)
    ax.axis("off")
    
    # --- MUDANÇA AQUI: Salvar a figura na pasta de gráficos ---
    nome_arquivo_base = f"Ranking_{titulo_mapa.replace(' ', '_').replace('(', '').replace(')', '').replace('-', '')}.png"
    caminho_completo = os.path.join(graficos_path, nome_arquivo_base) # Usa os.path.join
    
    plt.savefig(caminho_completo, bbox_inches='tight')
    plt.close(fig) # Fecha a figura para economizar memória
    print(f"  Mapa salvo como: {caminho_completo}\n") # Mostra o caminho completo

def main(graficos_path): # <-- Adicionado graficos_path
    """
    Função principal para carregar dados e gerar plots.
    """
    print("Iniciando processo de plotagem...")
    
    # --- 1. Carregar Shapefiles (Geografia) ---
    print("Carregando shapefile de SP (geobr)...")
    try:
        mun_sp = read_municipality(code_muni="SP", year=2020)
        state_sp = read_state("SP", year=2020)
        # Adiciona coluna normalizada no geodataframe
        mun_sp["name_norm"] = mun_sp["name_muni"].apply(normalizar_string)
        print("Shapefiles carregados com sucesso.")
    except Exception as e:
        print(f"ERRO ao carregar dados do geobr: {e}", file=sys.stderr)
        print("Certifique-se de ter conexão com a internet para baixar os shapefiles.", file=sys.stderr)
        return

    # --- 2. Carregar Dados CSV Exportados ---
    print(f"Carregando dados CSV de {DATA_PATH}...")
    try:
        # Dimensões necessárias para os nomes
        df_cidades = pd.read_csv(os.path.join(DATA_PATH, 'DimCidadePotencial.csv'), sep=';')
        df_cidades.columns = df_cidades.columns.str.lower() # <-- CORREÇÃO: Força lowercase

        df_estimativas = pd.read_csv(os.path.join(DATA_PATH, 'DimEstimativa.csv'), sep=';')
        df_estimativas.columns = df_estimativas.columns.str.lower() # <-- CORREÇÃO: Força lowercase
        
        # Fatos (dados calculados)
        df_detalhado = pd.read_csv(os.path.join(DATA_PATH, 'FatoScoreDetalhado.csv'), sep=';')
        df_detalhado.columns = df_detalhado.columns.str.lower() # <-- CORREÇÃO: Força lowercase

        df_agregado = pd.read_csv(os.path.join(DATA_PATH, 'FatoScoreAgregado.csv'), sep=';')
        df_agregado.columns = df_agregado.columns.str.lower() # <-- CORREÇÃO: Força lowercase
        
        print("Arquivos CSV carregados com sucesso.")
    except FileNotFoundError as e:
        print(f"ERRO: Arquivo não encontrado. {e}", file=sys.stderr)
        print(f"Verifique se os arquivos CSV estão na pasta '{DATA_PATH}'", file=sys.stderr)
        return

    # --- 3. Preparar Dados para Plotagem (Merges) ---
    print("Preparando dados (juntando Fatos e Dimensões)...")
    
    # --- CORREÇÃO: Usar nomes de colunas em lowercase ---
    df_detalhado = pd.merge(df_detalhado, df_cidades[['keycidadepotencial', 'nomecidadepotencial']], on='keycidadepotencial')
    df_agregado = pd.merge(df_agregado, df_cidades[['keycidadepotencial', 'nomecidadepotencial']], on='keycidadepotencial')
    
    # Adiciona NomeEstimativa ao fato detalhado
    df_detalhado = pd.merge(df_detalhado, df_estimativas[['keyestimativa', 'nomeestimativa']], on='keyestimativa')
    
    print("Dados prontos para plotagem.")

    # --- 4. Gerar Gráficos ---

    # 4.1. Gráfico Agregado (Média)
    print("\n--- Gerando Mapa Agregado ---")
    plot_choropleth_ranking(
        df_agregado,
        coluna_cidade='nomecidadepotencial', # <-- CORREÇÃO: lowercase
        coluna_score='scorefinalnormmedio', # <-- CORREÇÃO: lowercase
        titulo_mapa="Ranking Agregado - Média de Scores",
        mun_sp_gdf=mun_sp,
        state_sp_gdf=state_sp,
        graficos_path=graficos_path # <-- Passa o caminho
    )

    # 4.2. Gráficos Detalhados (por Estimativa)
    print("\n--- Gerando Mapas Detalhados por Estimativa ---")
    lista_nomes_estimativas = df_detalhado['nomeestimativa'].unique() # <-- CORREÇÃO: lowercase
    
    for nome_est in lista_nomes_estimativas:
        df_subset = df_detalhado[df_detalhado['nomeestimativa'] == nome_est].copy() # <-- CORREÇÃO: lowercase
        titulo = f"Ranking Detalhado - {nome_est}"
        
        plot_choropleth_ranking(
            df_subset,
            coluna_cidade='nomecidadepotencial', # <-- CORREÇÃO: lowercase
            coluna_score='scorefinalnorm', # <-- CORREÇÃO: lowercase
            titulo_mapa=titulo,
            mun_sp_gdf=mun_sp,
            state_sp_gdf=state_sp,
            graficos_path=graficos_path # <-- Passa o caminho
        )

    print("====================================")
    print("Processo de plotagem concluído.")
    # --- MUDANÇA AQUI: Atualiza a mensagem final ---
    print(f"Todos os mapas foram salvos como arquivos .png na pasta '{graficos_path}'.")
    print("====================================")

if __name__ == "__main__":
    # Garante que a pasta de DADOS exista
    if not os.path.exists(DATA_PATH):
        print(f"ERRO: Pasta '{DATA_PATH}' não encontrada.", file=sys.stderr)
        print(f"Caminho verificado: {os.path.abspath(DATA_PATH)}", file=sys.stderr) # <-- Ajuda a debugar
        print("Crie a pasta e coloque os CSVs exportados nela.", file=sys.stderr)
    else:
        # --- MUDANÇA AQUI: Cria a pasta de GRÁFICOS se não existir ---
        try:
            os.makedirs(GRAFICOS_PATH, exist_ok=True)
            print(f"Salvando gráficos em: '{os.path.abspath(GRAFICOS_PATH)}'") # <-- Ajuda a debugar
            
            # Executa o script principal, passando o caminho dos gráficos
            main(GRAFICOS_PATH) 
            
        except OSError as e:
            print(f"ERRO: Não foi possível criar a pasta de gráficos '{GRAFICOS_PATH}'. {e}", file=sys.stderr)
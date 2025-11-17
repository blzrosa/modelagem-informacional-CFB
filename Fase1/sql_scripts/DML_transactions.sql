/*
============================
==    DML OPERACIONAL     == 
============================
*/


INSERT INTO oper.Municipio (NomeMunicipio, IDUF) VALUES
('Município Genérico 1', 'AC'), ('Município Genérico 2', 'AL'), ('Município Genérico 3', 'AP'), ('Município Genérico 4', 'AM'), ('Município Genérico 5', 'BA'),
('Município Genérico 6', 'CE'), ('Município Genérico 7', 'DF'), ('Município Genérico 8', 'ES'), ('Município Genérico 9', 'GO'), ('Município Genérico 10', 'MA'),
('Município Genérico 11', 'MT'), ('Município Genérico 12', 'MS'), ('Município Genérico 13', 'MG'), ('Município Genérico 14', 'PA'), ('Município Genérico 15', 'PB'),
('Município Genérico 16', 'PR'), ('Município Genérico 17', 'PE'), ('Município Genérico 18', 'PI'), ('Município Genérico 19', 'RJ'), ('Município Genérico 20', 'RN'),
('Município Genérico 21', 'RS'), ('Município Genérico 22', 'RO'), ('Município Genérico 23', 'RR'), ('Município Genérico 24', 'SC'), ('Município Genérico 25', 'SP'),
('Município Genérico 26', 'SE'), ('Município Genérico 27', 'TO'), ('Município Genérico 28', 'AC'), ('Município Genérico 29', 'AL'), ('Município Genérico 30', 'AP'),
('Município Genérico 31', 'AM'), ('Município Genérico 32', 'BA'), ('Município Genérico 33', 'CE'), ('Município Genérico 34', 'DF'), ('Rio de Janeiro', 'RJ'),
('Município Genérico 36', 'GO'), ('Município Genérico 37', 'MA'), ('Município Genérico 38', 'MT'), ('Município Genérico 39', 'MS'), ('Município Genérico 40', 'MG'),
('Município Genérico 41', 'PA'), ('Município Genérico 42', 'PB'), ('Município Genérico 43', 'PR'), ('Município Genérico 44', 'PE'), ('Município Genérico 45', 'PI'),
('Município Genérico 46', 'RJ'), ('Município Genérico 47', 'RN'), ('São Paulo', 'SP'), ('Município Genérico 49', 'RS'), ('Município Genérico 50', 'RO'),
('Município Genérico 51', 'RR'), ('Município Genérico 52', 'SC');


--  Categorias
-- Insere todas as categorias de uma vez. Se uma já existir, ela é ignorada.
INSERT INTO oper.Categoria (NomeCategoria) VALUES
('Analgesicos'), ('Antibióticos'), ('Vacinas'), ('Anti-inflamatórios'),
('Vitaminas'), ('Equipamentos Médicos'), ('Higiene Pessoal'), ('Dermocosméticos'),
('Primeiros Socorros'), ('Nutrição Esportiva'), ('Saúde Infantil'),
('Medicamentos Controlados'), ('Saúde da Mulher'), ('Saúde do Homem'),
('Produtos Ortopédicos'), ('Diet & Light'), ('Cabelos e Unhas'),
('Aparelhos de Pressão'), ('Termômetros'), ('Glicosímetros e Tiras'),
('Fórmulas Infantis'), ('Fraldas e Lenços Umedecidos'), ('Cuidados com o Bebê'),
('Suplementos Alimentares'), ('Fitoterápicos'), ('Produtos Naturais e Orgânicos'),
('Antialérgicos'), ('Relaxantes Musculares'), ('Saúde Ocular e Colírios'),
('Saúde Digestiva'), ('Cardiovasculares'), ('Proteção Solar'),
('Cuidados com os Pés'), ('Higiene Bucal Avançada'), ('Repelentes e Inseticidas'),
('Maquiagem e Acessórios'), ('Cuidados Faciais'), ('Cuidados Corporais'),
('Conveniência e Alimentos'), ('Acessórios de Saúde'), ('Óleos Essenciais e Aromaterapia'),
('Produtos Geriátricos'), ('Lentes de Contato e Soluções'), ('Homeopatia'),
('Controle de Peso'), ('Cremes e Loções'), ('Antissépticos e Curativos')
ON CONFLICT (NomeCategoria) DO NOTHING;


-- Fornecedores
-- Insere os fornecedores. Se um CNPJ já existir, ele é ignorado.
INSERT INTO oper.Fornecedor (NomeFornecedor, CNPJ) VALUES
('Med-Log Distribuidora', '25.159.753/0001-01'),
('GlobalPharma Suprimentos', '88.456.123/0001-02'),
('BioGen Laboratórios', '14.789.654/0001-03'),
('Precisão Equipamentos Médicos', '36.987.412/0001-04'),
('VitaPlus Vitaminas e Suplementos', '47.123.654/0001-05'),
('União Química Farmacêutica', '60.665.981/0001-18'),
('Eurofarma Laboratórios S.A.', '61.190.096/0001-92'),
('Cimed Indústria de Medicamentos', '02.814.497/0001-99')
ON CONFLICT (CNPJ) DO NOTHING;


-- Estoques
-- Insere os múltiplos locais de estoque.
INSERT INTO oper.Estoque (IDMunicipio) VALUES
(48), (23), (9), (35), (1), (3), (5), (7), (11), (13), (15), (17), (19),
(21), (25), (27), (29), (31), (33), (39), (47);


-- Clientes
INSERT INTO oper.Cliente (NomeCliente, EmailCliente, Senha, Logradouro, Bairro, IDMunicipio) VALUES
('Helena Martins', 'helena.martins@email.com', 'senha123', 'Rua das Gaivotas, 101', 'Jardim Oceânico', 35),
('Miguel Pereira', 'miguel.pereira@email.com', 'senha123', 'Avenida das Américas, 202', 'Barra da Tijuca', 35),
('Alice Ferreira', 'alice.ferreira@email.com', 'senha123', 'Rua Visconde de Pirajá, 303', 'Ipanema', 35),
('Arthur Rodrigues', 'arthur.rodrigues@email.com', 'senha123', 'Travessa das Laranjeiras, 404', 'Laranjeiras', 35),
('Laura Almeida', 'laura.almeida@email.com', 'senha123', 'Rua do Catete, 505', 'Catete', 35),
('Heitor Lima', 'heitor.lima@email.com', 'senha123', 'Avenida Atlântica, 606', 'Copacabana', 35),
('Manuela Barbosa', 'manuela.barbosa@email.com', 'senha123', 'Rua Augusta, 707', 'Consolação', 48),
('Bernardo Gonçalves', 'bernardo.goncalves@email.com', 'senha123', 'Avenida Brigadeiro Faria Lima, 808', 'Jardim Paulistano', 48),
('Valentina Ribeiro', 'valentina.ribeiro@email.com', 'senha123', 'Rua Oscar Freire, 909', 'Jardins', 48),
('Davi Nogueira', 'davi.nogueira@email.com', 'senha123', 'Alameda Santos, 1010', 'Cerqueira César', 48),
('Sophia Mendes', 'sophia.mendes@email.com', 'senha123', 'Rua da Consolação, 1111', 'Consolação', 48),
('Theo Cavalcanti', 'theo.cavalcanti@email.com', 'senha123', 'Avenida Ipiranga, 1212', 'República', 48),
('Isabella Santos', 'isabella.santos@email.com', 'senha123', 'Praça da Sé, 1313', 'Sé', 48),
('Lorenzo Silva', 'lorenzo.silva@email.com', 'senha123', 'Rua 25 de Março, 1414', 'Sé', 48),
('Júlia Oliveira', 'julia.oliveira@email.com', 'senha123', 'Avenida Tiradentes, 1515', 'Luz', 48),
('Pedro Souza', 'pedro.souza@email.com', 'senha123', 'Rua Direita, 1616', 'Sé', 48),
('Luiza Costa', 'luiza.costa@email.com', 'senha123', 'Largo do Arouche, 1717', 'República', 48),
('Gabriel Pereira', 'gabriel.pereira@email.com', 'senha123', 'Avenida São João, 1818', 'Centro', 48),
('Maria Clara Rodrigues', 'mariaclara.rodrigues@email.com', 'senha123', 'Rua Sete de Setembro, 1919', 'Centro', 35),
('Lucas Ferreira', 'lucas.ferreira@email.com', 'senha123', 'Avenida Rio Branco, 2020', 'Centro', 35),
('Beatriz Almeida', 'beatriz.almeida@email.com', 'senha123', 'Rua do Ouvidor, 2121', 'Centro', 35),
('Matheus Lima', 'matheus.lima@email.com', 'senha123', 'Praça XV de Novembro, 2222', 'Centro', 35),
('Yasmin Barbosa', 'yasmin.barbosa@email.com', 'senha123', 'Avenida Presidente Vargas, 2323', 'Centro', 35),
('Nicolas Gonçalves', 'nicolas.goncalves@email.com', 'senha123', 'Rua Uruguaiana, 2424', 'Centro', 35),
('Mariana Ribeiro', 'mariana.ribeiro@email.com', 'senha123', 'Largo da Carioca, 2525', 'Centro', 35),
('Rafael Nogueira', 'rafael.nogueira@email.com', 'senha123', 'Rua da Alfândega, 2626', 'Centro', 35),
('Lívia Mendes', 'livia.mendes@email.com', 'senha123', 'Avenida Passos, 2727', 'Centro', 35),
('Guilherme Cavalcanti', 'guilherme.cavalcanti@email.com', 'senha123', 'Rua Sete de Abril, 2828', 'República', 48),
('Letícia Santos', 'leticia.santos@email.com', 'senha123', 'Praça da República, 2929', 'República', 48),
('Enzo Silva', 'enzo.silva@email.com', 'senha123', 'Rua Barão de Itapetininga, 3030', 'República', 48),
('Ana Júlia Oliveira', 'anajulia.oliveira@email.com', 'senha123', 'Avenida Vieira de Carvalho, 3131', 'República', 48),
('Bruno Souza', 'bruno.souza@email.com', 'senha123', 'Largo do Paissandu, 3232', 'República', 48),
('Melissa Costa', 'melissa.costa@email.com', 'senha123', 'Rua Dom José de Barros, 3333', 'República', 48),
('Emanuel Pereira', 'emanuel.pereira@email.com', 'senha123', 'Rua 24 de Maio, 3434', 'República', 48),
('Sarah Rodrigues', 'sarah.rodrigues@email.com', 'senha123', 'Avenida Cásper Líbero, 3535', 'Luz', 48),
('Cauã Almeida', 'caua.almeida@email.com', 'senha123', 'Rua Washington Luís, 3636', 'Luz', 48),
('Esther Lima', 'esther.lima@email.com', 'senha123', 'Praça da Luz, 3737', 'Luz', 48),
('Isaac Barbosa', 'isaac.barbosa@email.com', 'senha123', 'Rua Mauá, 3838', 'Luz', 48),
('Rebeca Gonçalves', 'rebeca.goncalves@email.com', 'senha123', 'Rua Santa Ifigênia, 3939', 'Santa Efigênia', 48),
('Daniel Ribeiro', 'daniel.ribeiro@email.com', 'senha123', 'Rua dos Timbiras, 4040', 'Santa Efigênia', 48),
('Elisa Nogueira', 'elisa.nogueira@email.com', 'senha123', 'Avenida Ipiranga, 4141', 'Santa Efigênia', 48),
('Calebe Mendes', 'calebe.mendes@email.com', 'senha123', 'Rua dos Gusmões, 4242', 'Santa Efigênia', 48),
('Antonella Cavalcanti', 'antonella.cavalcanti@email.com', 'senha123', 'Alameda Barão de Limeira, 4343', 'Santa Efigênia', 48),
('Rodrigo Santos', 'rodrigos.santos@email.com', 'senha123', 'Rua Helvétia, 4444', 'Santa Efigênia', 48),
('Isabelly Silva', 'isabelly.silva@email.com', 'senha123', 'Avenida Duque de Caxias, 4545', 'Santa Efigênia', 48),
('Benjamin Oliveira', 'benjamin.oliveira@email.com', 'senha123', 'Largo Coração de Jesus, 4646', 'Santa Efigênia', 48),
('Clarice Souza', 'clarice.souza@email.com', 'senha123', 'Alameda Glete, 4747', 'Santa Efigênia', 48),
('Sebastião Costa', 'sebastiao.costa@email.com', 'senha123', 'Rua das Palmeiras, 4848', 'Santa Cecília', 48),
('Lavínia Pereira', 'lavinia.pereira@email.com', 'senha123', 'Rua Martim Francisco, 4949', 'Santa Cecília', 48),
('Felipe Barros', 'felipe.barros@email.com', 'senha123', 'Rua Conde de Bonfim, 5050', 'Tijuca', 35),
('Gabriela Azevedo', 'gabriela.azevedo@email.com', 'senha123', 'Avenida Angélica, 5151', 'Higienópolis', 48),
('Vinicius Cardoso', 'vinicius.cardoso@email.com', 'senha123', 'Rua da Passagem, 5252', 'Botafogo', 35),
('Larissa Monteiro', 'larissa.monteiro@email.com', 'senha123', 'Rua Haddock Lobo, 5353', 'Jardins', 48),
('Diego Pinto', 'diego.pinto@email.com', 'senha123', 'Praia do Flamengo, 5454', 'Flamengo', 35),
('Amanda Correia', 'amanda.correia@email.com', 'senha123', 'Avenida Rebouças, 5555', 'Pinheiros', 48),
('Leandro Teixeira', 'leandro.teixeira@email.com', 'senha123', 'Rua Marquês de Abrantes, 5656', 'Flamengo', 35),
('Bruna Campos', 'bruna.campos@email.com', 'senha123', 'Rua dos Pinheiros, 5757', 'Pinheiros', 48),
('Marcelo Rocha', 'marcelo.rocha@email.com', 'senha123', 'Rua General Glicério, 5858', 'Laranjeiras', 35),
('Juliana Dias', 'juliana.dias@email.com', 'senha123', 'Avenida Brigadeiro Luís Antônio, 5959', 'Jardim Paulista', 48),
('Ricardo Vieira', 'ricardo.vieira@email.com', 'senha123', 'Rua São Clemente, 6060', 'Botafogo', 35),
('Patrícia Duarte', 'patricia.duarte@email.com', 'senha123', 'Rua Augusta, 6161', 'Cerqueira César', 48),
('Eduardo Cunha', 'eduardo.cunha@email.com', 'senha123', 'Avenida Nossa Senhora de Copacabana, 6262', 'Copacabana', 35),
('Vanessa Neves', 'vanessa.neves@email.com', 'senha123', 'Alameda Jaú, 6363', 'Jardim Paulista', 48),
('Fábio Pires', 'fabio.pires@email.com', 'senha123', 'Rua Barata Ribeiro, 6464', 'Copacabana', 35),
('Carolina Macedo', 'carolina.macedo@email.com', 'senha123', 'Rua Frei Caneca, 6565', 'Consolação', 48),
('André Morais', 'andre.morais@email.com', 'senha123', 'Rua Voluntários da Pátria, 6666', 'Botafogo', 35),
('Márcia Freitas', 'marcia.freitas@email.com', 'senha123', 'Avenida do Ibirapuera, 6767', 'Moema', 48),
('Raul Ramos', 'raul.ramos@email.com', 'senha123', 'Rua Real Grandeza, 6868', 'Botafogo', 35),
('Tatiane Lopes', 'tatiane.lopes@email.com', 'senha123', 'Avenida Santo Amaro, 6969', 'Vila Nova Conceição', 48),
('Igor Resende', 'igor.resende@email.com', 'senha123', 'Rua Sorocaba, 7070', 'Botafogo', 35),
('Renata Brandão', 'renata.brandao@email.com', 'senha123', 'Rua Joaquim Floriano, 7171', 'Itaim Bibi', 48),
('Sérgio Siqueira', 'sergio.siqueira@email.com', 'senha123', 'Rua Pinheiro Guimarães, 7272', 'Botafogo', 35),
('Débora Moreira', 'debora.moreira@email.com', 'senha123', 'Avenida 9 de Julho, 7373', 'Jardim Paulista', 48),
('Vitor Drumond', 'vitor.drumond@email.com', 'senha123', 'Rua Dezenove de Fevereiro, 7474', 'Botafogo', 35),
('Sandra Fogaça', 'sandra.fogaca@email.com', 'senha123', 'Rua Tabapuã, 7575', 'Itaim Bibi', 48),
('Leonardo Paiva', 'leonardo.paiva@email.com', 'senha123', 'Rua da Glória, 7676', 'Glória', 35),
('Cristiane Andrade', 'cristiane.andrade@email.com', 'senha123', 'Avenida Brasil, 7777', 'Jardim América', 48),
('Alexandre Viana', 'alexandre.viana@email.com', 'senha123', 'Rua do Russel, 7878', 'Glória', 35),
('Daniela Borges', 'daniela.borges@email.com', 'senha123', 'Rua da Mooca, 7979', 'Mooca', 48),
('Fernando Queiroz', 'fernando.queiroz@email.com', 'senha123', 'Largo do Machado, 8080', 'Catete', 35),
('Aline Peixoto', 'aline.peixoto@email.com', 'senha123', 'Avenida Paes de Barros, 8181', 'Mooca', 48),
('Paulo Cordeiro', 'paulo.cordeiro@email.com', 'senha123', 'Rua do Riachuelo, 8282', 'Lapa', 35),
('Adriana Dantas', 'adriana.dantas@email.com', 'senha123', 'Rua do Oratório, 8383', 'Mooca', 48),
('Jonas Magalhães', 'jonas.magalhaes@email.com', 'senha123', 'Avenida Mem de Sá, 8484', 'Lapa', 35),
('Gisele Bezerra', 'gisele.bezerra@email.com', 'senha123', 'Rua da Bresser, 8585', 'Brás', 48),
('Carlos Santana', 'carlos.santana@email.com', 'senha123', 'Rua Taylor, 8686', 'Lapa', 35),
('Eliane Xavier', 'eliane.xavier@email.com', 'senha123', 'Largo da Concórdia, 8787', 'Brás', 48),
('Roberto Salgado', 'roberto.salgado@email.com', 'senha123', 'Rua dos Inválidos, 8888', 'Centro', 35),
('Simone Pimenta', 'simone.pimenta@email.com', 'senha123', 'Rua Maria Marcolina, 8989', 'Brás', 48),
('Marcos Valente', 'marcos.valente@email.com', 'senha123', 'Praça da Cruz Vermelha, 9090', 'Centro', 35),
('Cláudia Chaves', 'claudia.chaves@email.com', 'senha123', 'Rua Oriente, 9191', 'Brás', 48),
('Tiago Tavares', 'tiago.tavares@email.com', 'senha123', 'Rua Haddock Lobo, 9292', 'Tijuca', 35),
('Fernanda Guerra', 'fernanda.guerra@email.com', 'senha123', 'Rua Miller, 9393', 'Brás', 48),
('José Padilha', 'jose.padilha@email.com', 'senha123', 'Rua Afonso Pena, 9494', 'Tijuca', 35),
('Paula Franco', 'paula.franco@email.com', 'senha123', 'Avenida Celso Garcia, 9595', 'Tatuapé', 48),
('Anderson Melo', 'anderson.melo@email.com', 'senha123', 'Rua Barão de Mesquita, 9696', 'Tijuca', 35),
('Regina Bastos', 'regina.bastos@email.com', 'senha123', 'Rua Tuiuti, 9797', 'Tatuapé', 48),
('William Farias', 'william.farias@email.com', 'senha123', 'Rua Uruguai, 9898', 'Tijuca', 35),
('Cintia Arruda', 'cintia.arruda@email.com', 'senha123', 'Rua Itapura, 9999', 'Tatuapé', 48)
ON CONFLICT (EmailCliente) DO NOTHING;

INSERT INTO oper.Cliente (NomeCliente, EmailCliente, Senha, Logradouro, Bairro, IDMunicipio) VALUES
('Sofia Lima', 'sofia.lima@email.com', 'senha123', 'Rua da Paz, 101', 'Centro', 23),
('Davi Santos', 'davi.santos@email.com', 'senha123', 'Avenida Central, 202', 'Vila Nova', 41),
('Alice Costa', 'alice.costa@email.com', 'senha123', 'Travessa das Flores, 303', 'Jardim América', 5),
('Heitor Almeida', 'heitor.almeida@email.com', 'senha123', 'Praça da Liberdade, 404', 'Bela Vista', 18),
('Laura Ferreira', 'laura.ferreira@email.com', 'senha123', 'Alameda dos Anjos, 505', 'Boa Esperança', 33),
('Bernardo Azevedo', 'bernardo.azevedo@email.com', 'senha123', 'Rua do Comércio, 606', 'Centro', 51),
('Manuela Rocha', 'manuela.rocha@email.com', 'senha123', 'Avenida Brasil, 707', 'Vila Rica', 12),
('Theo Nogueira', 'theo.nogueira@email.com', 'senha123', 'Travessa da Saudade, 808', 'Jardim Paulista', 29),
('Valentina Gonçalves', 'valentina.goncalves@email.com', 'senha123', 'Rua XV de Novembro, 909', 'Centro Histórico', 4),
('Gabriel Ribeiro', 'gabriel.ribeiro@email.com', 'senha123', 'Avenida Principal, 1010', 'Setor Sul', 15),
('Júlia Cavalcanti', 'julia.cavalcanti@email.com', 'senha123', 'Rua das Palmeiras, 1111', 'Jardim Botânico', 38),
('Arthur Martins', 'arthur.martins@email.com', 'senha123', 'Alameda das Acácias, 1212', 'Parque Industrial', 49),
('Isabella Barros', 'isabella.barros@email.com', 'senha123', 'Praça do Sol, 1313', 'Centro', 2),
('Lucas Barbosa', 'lucas.barbosa@email.com', 'senha123', 'Rua da Matriz, 1414', 'Vila Mariana', 22),
('Sophia Pinto', 'sophia.pinto@email.com', 'senha123', 'Avenida Beira Mar, 1515', 'Orla', 44),
('Davi Moreira', 'davi.moreira@email.com', 'senha123', 'Travessa dos Coqueiros, 1616', 'Jardim Tropical', 8),
('Helena Dias', 'helena.dias@email.com', 'senha123', 'Rua da Fonte, 1717', 'Centro', 31),
('Pedro Cunha', 'pedro.cunha@email.com', 'senha123', 'Alameda dos Ipês, 1818', 'Bosque', 19),
('Manuela Duarte', 'manuela.duarte@email.com', 'senha123', 'Praça da Bandeira, 1919', 'Vila Operária', 47),
('Bernardo Fogaça', 'bernardo.fogaca@email.com', 'senha123', 'Avenida dos Pioneiros, 2020', 'Setor Oeste', 11),
('Laura Freitas', 'laura.freitas@email.com', 'senha123', 'Rua do Lago, 2121', 'Jardim das Flores', 35),
('Theo Gomes', 'theo.gomes@email.com', 'senha123', 'Travessa da Lua, 2222', 'Centro', 1),
('Alice Lopes', 'alice.lopes@email.com', 'senha123', 'Praça da Estação, 2323', 'Vila Industrial', 26),
('Heitor Macedo', 'heitor.macedo@email.com', 'senha123', 'Alameda das Rosas, 2424', 'Jardim Primavera', 42),
('Valentina Melo', 'valentina.melo@email.com', 'senha123', 'Rua do Norte, 2525', 'Setor Central', 14),
('Gabriel Monteiro', 'gabriel.monteiro@email.com', 'senha123', 'Avenida Sul, 2626', 'Bela Vista', 39),
('Júlia Morais', 'julia.morais@email.com', 'senha123', 'Travessa do Ouro, 2727', 'Centro', 7),
('Arthur Neves', 'arthur.neves@email.com', 'senha123', 'Praça da Sé, 2828', 'Jardim Europa', 21),
('Isabella Oliveira', 'isabella.oliveira@email.com', 'senha123', 'Rua do Ouro, 2929', 'Vila dos Montes', 48),
('Lucas Paiva', 'lucas.paiva@email.com', 'senha123', 'Avenida Leste, 3030', 'Centro', 17),
('Sophia Peixoto', 'sophia.peixoto@email.com', 'senha123', 'Travessa da Prata, 3131', 'Jardim Guanabara', 32),
('Davi Pimenta', 'davi.pimenta@email.com', 'senha123', 'Praça do Cruzeiro, 3232', 'Setor Aeroporto', 6),
('Helena Pires', 'helena.pires@email.com', 'senha123', 'Rua do Sol, 3333', 'Vila Aurora', 25),
('Pedro Queiroz', 'pedro.queiroz@email.com', 'senha123', 'Alameda das Orquídeas, 3434', 'Jardim das Acácias', 50),
('Manuela Ramos', 'manuela.ramos@email.com', 'senha123', 'Avenida das Nações, 3535', 'Centro Cívico', 13),
('Bernardo Resende', 'bernardo.resende@email.com', 'senha123', 'Rua da Serra, 3636', 'Vila Alpina', 37),
('Laura Rocha', 'laura.rocha@email.com', 'senha123', 'Travessa do Mar, 3737', 'Jardim Beira Mar', 3),
('Theo Rodrigues', 'theo.rodrigues@email.com', 'senha123', 'Praça da Matriz, 3838', 'Centro', 45),
('Alice Salgado', 'alice.salgado@email.com', 'senha123', 'Rua das Pedras, 3939', 'Vila da Penha', 20),
('Heitor Santana', 'heitor.santana@email.com', 'senha123', 'Avenida do Contorno, 4040', 'Jardim da Cidade', 46),
('Valentina Siqueira', 'valentina.siqueira@email.com', 'senha123', 'Rua das Árvores, 4141', 'Bosque da Saúde', 10),
('Gabriel Souza', 'gabriel.souza@email.com', 'senha123', 'Travessa da Esperança, 4242', 'Vila Progresso', 30),
('Júlia Tavares', 'julia.tavares@email.com', 'senha123', 'Praça do Coreto, 4343', 'Centro', 28),
('Arthur Teixeira', 'arthur.teixeira@email.com', 'senha123', 'Rua do Rio, 4444', 'Jardim Fluvial', 52),
('Isabella Valente', 'isabella.valente@email.com', 'senha123', 'Avenida das Torres, 4545', 'Parque das Nações', 16),
('Lucas Viana', 'lucas.viana@email.com', 'senha123', 'Rua da Vitória, 4646', 'Centro', 40),
('Sophia Vieira', 'sophia.vieira@email.com', 'senha123', 'Travessa do Campo, 4747', 'Jardim Rural', 9),
('Davi Xavier', 'davi.xavier@email.com', 'senha123', 'Praça das Fontes, 4848', 'Vila das Águas', 24),
('Helena Andrade', 'helena.andrade@email.com', 'senha123', 'Rua do Bosque, 4949', 'Jardim Floresta', 36),
('Pedro Arruda', 'pedro.arruda@email.com', 'senha123', 'Avenida das Montanhas, 5050', 'Vila Serrana', 23),
('Manuela Bastos', 'manuela.bastos@email.com', 'senha123', 'Rua do Vale, 5151', 'Jardim dos Lagos', 41),
('Bernardo Bezerra', 'bernardo.bezerra@email.com', 'senha123', 'Travessa da Colina, 5252', 'Centro', 5),
('Laura Borges', 'laura.borges@email.com', 'senha123', 'Praça do Pôr do Sol, 5353', 'Vila Bela', 18),
('Theo Brandão', 'theo.brandao@email.com', 'senha123', 'Rua do Cais, 5454', 'Jardim do Porto', 33),
('Alice Campos', 'alice.campos@email.com', 'senha123', 'Avenida do Parque, 5555', 'Bairro Novo', 51),
('Heitor Cardoso', 'heitor.cardoso@email.com', 'senha123', 'Rua da Cachoeira, 5656', 'Vila Verde', 12),
('Valentina Chaves', 'valentina.chaves@email.com', 'senha123', 'Travessa do Sol Nascente, 5757', 'Jardim Oriental', 29),
('Gabriel Cordeiro', 'gabriel.cordeiro@email.com', 'senha123', 'Praça da Amizade, 5858', 'Centro', 4),
('Júlia Correia', 'julia.correia@email.com', 'senha123', 'Rua da União, 5959', 'Vila da Fraternidade', 15),
('Arthur Dantas', 'arthur.dantas@email.com', 'senha123', 'Avenida da Igualdade, 6060', 'Jardim Social', 38),
('Isabella Dias', 'isabella.dias@email.com', 'senha123', 'Rua da Justiça, 6161', 'Parque dos Poderes', 49),
('Lucas Drumond', 'lucas.drumond@email.com', 'senha123', 'Travessa da Harmonia, 6262', 'Centro', 2),
('Sophia Duarte', 'sophia.duarte@email.com', 'senha123', 'Praça da Poesia, 6363', 'Vila dos Artistas', 22),
('Davi Farias', 'davi.farias@email.com', 'senha123', 'Rua da Música, 6464', 'Jardim Musical', 44),
('Helena Fernandes', 'helena.fernandes@email.com', 'senha123', 'Avenida da Dança, 6565', 'Bairro dos Ritmos', 8),
('Pedro Fogaça', 'pedro.fogaca@email.com', 'senha123', 'Rua da Pintura, 6666', 'Vila das Cores', 31),
('Manuela Franco', 'manuela.franco@email.com', 'senha123', 'Travessa da Escultura, 6767', 'Jardim das Formas', 19),
('Bernardo Freitas', 'bernardo.freitas@email.com', 'senha123', 'Praça do Teatro, 6868', 'Centro Cultural', 47),
('Laura Guerra', 'laura.guerra@email.com', 'senha123', 'Rua do Cinema, 6969', 'Vila dos Filmes', 11),
('Theo Lopes', 'theo.lopes@email.com', 'senha123', 'Avenida da Fotografia, 7070', 'Jardim da Imagem', 35),
('Alice Macedo', 'alice.macedo@email.com', 'senha123', 'Rua da Literatura, 7171', 'Centro', 1),
('Heitor Magalhães', 'heitor.magalhaes@email.com', 'senha123', 'Travessa da Arquitetura, 7272', 'Vila do Design', 26),
('Valentina Melo', 'valentina.melo1@email.com', 'senha123', 'Praça da Moda, 7373', 'Jardim Fashion', 42),
('Gabriel Mendes', 'gabriel.mendes@email.com', 'senha123', 'Rua da Gastronomia, 7474', 'Setor Gourmet', 14),
('Júlia Monteiro', 'julia.monteiro@email.com', 'senha123', 'Avenida do Vinho, 7575', 'Vila dos Sabores', 39),
('Arthur Moreira', 'arthur.moreira@email.com', 'senha123', 'Rua da Cerveja, 7676', 'Jardim Boêmio', 7),
('Isabella Morais', 'isabella.morais@email.com', 'senha123', 'Travessa do Café, 7777', 'Centro', 21),
('Lucas Neves', 'lucas.neves@email.com', 'senha123', 'Praça do Chá, 7878', 'Vila Zen', 48),
('Sophia Nogueira', 'sophia.nogueira@email.com', 'senha123', 'Rua do Chocolate, 7979', 'Jardim Doce', 17),
('Davi Nunes', 'davi.nunes@email.com', 'senha123', 'Avenida do Queijo, 8080', 'Vila Láctea', 32),
('Helena Oliveira', 'helena.oliveira@email.com', 'senha123', 'Rua do Pão, 8181', 'Centro', 6),
('Pedro Paiva', 'pedro.paiva@email.com', 'senha123', 'Travessa da Fruta, 8282', 'Jardim Tropical', 25),
('Manuela Peixoto', 'manuela.peixoto@email.com', 'senha123', 'Praça da Verdura, 8383', 'Vila Orgânica', 50),
('Bernardo Pereira', 'bernardo.pereira@email.com', 'senha123', 'Rua do Legume, 8484', 'Jardim da Horta', 13),
('Laura Pimenta', 'laura.pimenta@email.com', 'senha123', 'Avenida da Especiaria, 8585', 'Centro Culinário', 37),
('Theo Pinto', 'theo.pinto@email.com', 'senha123', 'Rua do Tempero, 8686', 'Vila dos Aromas', 3),
('Alice Pires', 'alice.pires@email.com', 'senha123', 'Travessa do Sabor, 8787', 'Jardim do Paladar', 45),
('Heitor Queiroz', 'heitor.queiroz@email.com', 'senha123', 'Praça da Gula, 8888', 'Centro', 20),
('Valentina Ramos', 'valentina.ramos@email.com', 'senha123', 'Rua do Apetite, 8989', 'Vila da Fartura', 46),
('Gabriel Resende', 'gabriel.resende@email.com', 'senha123', 'Avenida da Fome, 9090', 'Jardim da Saciedade', 10),
('Júlia Ribeiro', 'julia.ribeiro1@email.com', 'senha123', 'Rua da Sede, 9191', 'Vila da Hidratação', 30),
('Arthur Rocha', 'arthur.rocha@email.com', 'senha123', 'Travessa da Água, 9292', 'Jardim das Fontes', 28),
('Isabella Rodrigues', 'isabella.rodrigues@email.com', 'senha123', 'Praça do Suco, 9393', 'Centro', 52),
('Lucas Salgado', 'lucas.salgado@email.com', 'senha123', 'Rua do Refrigerante, 9494', 'Vila das Bolhas', 16),
('Sophia Santana', 'sophia.santana@email.com', 'senha123', 'Avenida da Cachaça, 9595', 'Jardim Etílico', 40),
('Davi Santos', 'davi.santos1@email.com', 'senha123', 'Rua do Rum, 9696', 'Vila Pirata', 9),
('Helena Siqueira', 'helena.siqueira@email.com', 'senha123', 'Travessa da Tequila, 9797', 'Jardim Mexicano', 24),
('Pedro Silva', 'pedro.silva@email.com', 'senha123', 'Praça da Vodka, 9898', 'Vila Russa', 36),
('Manuela Souza', 'manuela.souza@email.com', 'senha123', 'Rua do Whisky, 9999', 'Jardim Escocês', 23),
('Bernardo Tavares', 'bernardo.tavares@email.com', 'senha123', 'Avenida do Gin, 1001', 'Vila Inglesa', 41),
('Laura Teixeira', 'laura.teixeira@email.com', 'senha123', 'Rua do Licor, 1102', 'Centro', 5),
('Theo Valente', 'theo.valente@email.com', 'senha123', 'Travessa do Absinto, 1203', 'Jardim Verde', 18),
('Alice Viana', 'alice.viana@email.com', 'senha123', 'Praça do Conhaque, 1304', 'Vila Francesa', 33),
('Heitor Vieira', 'heitor.vieira@email.com', 'senha123', 'Rua da Catuaba, 1405', 'Jardim Selvagem', 51),
('Valentina Xavier', 'valentina.xavier@email.com', 'senha123', 'Avenida do Saquê, 1506', 'Vila Oriental', 12),
('Gabriel Andrade', 'gabriel.andrade@email.com', 'senha123', 'Rua do Hidromel, 1607', 'Jardim Viking', 29),
('Júlia Arruda', 'julia.arruda@email.com', 'senha123', 'Travessa do Quentão, 1708', 'Vila Junina', 4),
('Arthur Azevedo', 'arthur.azevedo@email.com', 'senha123', 'Praça do Vinho Quente, 1809', 'Centro', 15),
('Isabella Barbosa', 'isabella.barbosa@email.com', 'senha123', 'Rua do Pinhão, 1910', 'Jardim das Araucárias', 38),
('Lucas Barros', 'lucas.barros@email.com', 'senha123', 'Avenida do Chimarrão, 2011', 'Parque Gaúcho', 49),
('Sophia Bastos', 'sophia.bastos@email.com', 'senha123', 'Rua do Tereré, 2112', 'Centro', 2),
('Davi Bezerra', 'davi.bezerra@email.com', 'senha123', 'Travessa do Acarajé, 2213', 'Vila Baiana', 22),
('Helena Borges', 'helena.borges@email.com', 'senha123', 'Praça do Vatapá, 2314', 'Jardim do Dendê', 44),
('Pedro Brandão', 'pedro.brandao@email.com', 'senha123', 'Rua do Caruru, 2415', 'Centro', 8),
('Manuela Campos', 'manuela.campos@email.com', 'senha123', 'Avenida do Moqueca, 2516', 'Vila Capixaba', 31),
('Bernardo Cardoso', 'bernardo.cardoso@email.com', 'senha123', 'Rua do Açaí, 2617', 'Jardim Paraense', 19),
('Laura Cavalcanti', 'laura.cavalcanti@email.com', 'senha123', 'Travessa do Tucupi, 2718', 'Centro', 47),
('Theo Chaves', 'theo.chaves@email.com', 'senha123', 'Praça do Tacacá, 2819', 'Vila Amazônica', 11),
('Alice Cordeiro', 'alice.cordeiro@email.com', 'senha123', 'Rua do Pão de Queijo, 2920', 'Jardim Mineiro', 35),
('Heitor Correia', 'heitor.correia@email.com', 'senha123', 'Avenida do Feijão Tropeiro, 3021', 'Centro', 1),
('Valentina Costa', 'valentina.costa@email.com', 'senha123', 'Rua do Tutu, 3122', 'Vila Inconfidente', 26),
('Gabriel Cunha', 'gabriel.cunha@email.com', 'senha123', 'Travessa da Cachaça, 3223', 'Jardim da Cana', 42),
('Júlia Dantas', 'julia.dantas@email.com', 'senha123', 'Praça do Queijo Minas, 3324', 'Centro', 14),
('Arthur Dias', 'arthur.dias@email.com', 'senha123', 'Rua do Doce de Leite, 3425', 'Vila Doçura', 39),
('Isabella Drumond', 'isabella.drumond@email.com', 'senha123', 'Avenida do Goiabada, 3526', 'Jardim das Frutas', 7),
('Lucas Duarte', 'lucas.duarte@email.com', 'senha123', 'Rua do Romeu e Julieta, 3627', 'Centro', 21),
('Sophia Farias', 'sophia.farias@email.com', 'senha123', 'Travessa do Frango com Quiabo, 3728', 'Vila Colonial', 48),
('Davi Fernandes', 'davi.fernandes@email.com', 'senha123', 'Praça da Polenta, 3829', 'Jardim Italiano', 17),
('Helena Ferreira', 'helena.ferreira@email.com', 'senha123', 'Rua do Galeto, 3930', 'Vila Gaúcha', 32),
('Pedro Fogaça', 'pedro.fogaca1@email.com', 'senha123', 'Avenida do Churrasco, 4031', 'Centro', 6),
('Manuela Franco', 'manuela.franco1@email.com', 'senha123', 'Rua da Costela, 4132', 'Jardim do Fogo', 25),
('Bernardo Freitas', 'bernardo.freitas1@email.com', 'senha123', 'Travessa da Picanha, 4233', 'Vila da Grelha', 50),
('Laura Gonçalves', 'laura.goncalves@email.com', 'senha123', 'Praça da Farofa, 4334', 'Centro', 13),
('Theo Gomes', 'theo.gomes1@email.com', 'senha123', 'Rua do Vinagrete, 4435', 'Jardim dos Temperos', 37),
('Alice Guerra', 'alice.guerra@email.com', 'senha123', 'Avenida do Arroz Carreteiro, 4536', 'Vila Campeira', 3),
('Heitor Lima', 'heitor.lima1@email.com', 'senha123', 'Rua do Matambre, 4637', 'Jardim do Sul', 45),
('Valentina Lopes', 'valentina.lopes@email.com', 'senha123', 'Travessa do Xixo, 4738', 'Centro', 20),
('Gabriel Macedo', 'gabriel.macedo@email.com', 'senha123', 'Praça do Salsichão, 4839', 'Vila Alemã', 46),
('Júlia Magalhães', 'julia.magalhaes@email.com', 'senha123', 'Rua do Pão com Alho, 4940', 'Jardim do Churrasqueiro', 10),
('Arthur Martins', 'arthur.martins1@email.com', 'senha123', 'Avenida do Coração de Galinha, 5041', 'Centro', 30),
('Isabella Melo', 'isabella.melo@email.com', 'senha123', 'Rua do Queijo Coalho, 5142', 'Jardim do Nordeste', 28),
('Lucas Mendes', 'lucas.mendes@email.com', 'senha123', 'Travessa da Caipirinha, 5243', 'Vila Brasileira', 52),
('Sophia Monteiro', 'sophia.monteiro@email.com', 'senha123', 'Praça do Guaraná, 5344', 'Centro', 16),
('Davi Moreira', 'davi.moreira1@email.com', 'senha123', 'Rua do Cupuaçu, 5445', 'Jardim Amazônico', 40),
('Helena Morais', 'helena.morais@email.com', 'senha123', 'Avenida do Buriti, 5546', 'Vila do Cerrado', 9),
('Pedro Neves', 'pedro.neves@email.com', 'senha123', 'Rua do Pequi, 5647', 'Jardim Goiano', 24),
('Manuela Nogueira', 'manuela.nogueira@email.com', 'senha123', 'Travessa do Araticum, 5748', 'Centro', 36),
('Bernardo Nunes', 'bernardo.nunes@email.com', 'senha123', 'Praça da Cagaita, 5849', 'Vila Frutífera', 23),
('Laura Oliveira', 'laura.oliveira@email.com', 'senha123', 'Rua da Gabiroba, 5950', 'Jardim do Campo', 41),
('Theo Paiva', 'theo.paiva@email.com', 'senha123', 'Avenida do Ingá, 6051', 'Centro', 5),
('Alice Peixoto', 'alice.peixoto@email.com', 'senha123', 'Rua do Jatobá, 6152', 'Vila da Mata', 18),
('Heitor Pereira', 'heitor.pereira@email.com', 'senha123', 'Travessa do Jequitibá, 6253', 'Jardim das Árvores', 33),
('Valentina Pimenta', 'valentina.pimenta@email.com', 'senha123', 'Praça do Murici, 6354', 'Centro', 51),
('Gabriel Pires', 'gabriel.pires@email.com', 'senha123', 'Rua do Umbu, 6455', 'Vila da Caatinga', 12),
('Júlia Pinto', 'julia.pinto@email.com', 'senha123', 'Avenida do Xixá, 6556', 'Jardim do Sertão', 29),
('Arthur Queiroz', 'arthur.queiroz@email.com', 'senha123', 'Rua do Caju, 6657', 'Vila Tropical', 4),
('Isabella Ramos', 'isabella.ramos@email.com', 'senha123', 'Travessa da Manga, 6758', 'Jardim das Mangueiras', 15),
('Lucas Resende', 'lucas.resende@email.com', 'senha123', 'Praça da Goiaba, 6859', 'Centro', 38),
('Sophia Ribeiro', 'sophia.ribeiro@email.com', 'senha123', 'Rua da Pitanga, 6960', 'Vila Vermelha', 49),
('Davi Rocha', 'davi.rocha@email.com', 'senha123', 'Avenida da Jabuticaba, 7061', 'Jardim das Jabuticabeiras', 2),
('Helena Rodrigues', 'helena.rodrigues@email.com', 'senha123', 'Rua do Maracujá, 7162', 'Vila da Calma', 22),
('Pedro Salgado', 'pedro.salgado@email.com', 'senha123', 'Travessa do Abacaxi, 7263', 'Jardim Coroado', 44),
('Manuela Santana', 'manuela.santana@email.com', 'senha123', 'Praça da Melancia, 7364', 'Centro', 8),
('Bernardo Santos', 'bernardo.santos@email.com', 'senha123', 'Rua do Melão, 7465', 'Vila Doce', 31),
('Laura Siqueira', 'laura.siqueira@email.com', 'senha123', 'Avenida da Uva, 7566', 'Jardim da Videira', 19),
('Theo Silva', 'theo.silva@email.com', 'senha123', 'Rua da Laranja, 7667', 'Vila Cítrica', 47),
('Alice Souza', 'alice.souza@email.com', 'senha123', 'Travessa do Limão, 7768', 'Jardim Azedo', 11),
('Heitor Tavares', 'heitor.tavares@email.com', 'senha123', 'Praça da Tangerina, 7869', 'Centro', 35),
('Valentina Teixeira', 'valentina.teixeira@email.com', 'senha123', 'Rua da Maçã, 7970', 'Vila do Pomar', 1),
('Gabriel Valente', 'gabriel.valente@email.com', 'senha123', 'Avenida da Pera, 8071', 'Jardim das Peras', 26)
ON CONFLICT (EmailCliente) DO NOTHING;

-- mais categorias
INSERT INTO oper.Categoria (NomeCategoria) VALUES
('Testes e Diagnósticos'),
('Cuidados Femininos'),
('Proteção e Segurança')
ON CONFLICT (NomeCategoria) DO NOTHING;

INSERT INTO oper.Estoque (IDMunicipio) VALUES
(50), (2); -- IDMunicipio 50 e 2 existem na tabela populada anteriormente.


-- Bloco de Inserção de Produtos 1
WITH novosprodutos AS (
    INSERT INTO oper.Produto (NomeProduto, DescrProd, PrecVenda, DtValidade, IDEstoque) VALUES
    ('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2026-11-30', 10),
    ('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2027-05-31', 11),
    ('Lenços Umedecidos Antissépticos', 'Pacote com 20 lenços para higienização das mãos.', 15.00, '2026-09-30', 12),
    ('Ômega 3 1000mg 120 cápsulas', 'Suplemento de óleo de peixe rico em EPA e DHA.', 89.90, '2027-02-28', 13),
    ('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2026-10-31', 14),
    ('Seringa Descartável 5ml com Agulha', 'Produto estéril para aplicação de medicamentos.', 2.50, '2028-12-31', 15),
    ('Algodão em Bolas 100g', 'Algodão hidrófilo para higiene e cuidados com a pele.', 7.20, '2029-01-01', 16),
    ('Aparelho de Pressão Digital de Pulso', 'Monitoramento prático e rápido da pressão arterial.', 180.00, '2031-01-01', 17),
    ('Pasta de Dente Gengivas Sensíveis', 'Creme dental para alívio da sensibilidade.', 12.50, '2026-07-31', 18),
    ('Enxaguante Bucal Sem Álcool', 'Proteção anticáries e hálito fresco prolongado.', 22.90, '2027-03-31', 19),
    ('Absorvente Noturno Suave (16 un)', 'Cobertura suave com maior poder de absorção.', 14.80, '2028-01-01', 20),
    ('Coenzima Q10 100mg', 'Suplemento antioxidante para saúde cardiovascular.', 95.00, '2026-08-31', 21),
    ('Pomada para Picada de Inseto', 'Alívio imediato da coceira e irritação.', 25.40, '2027-04-30', 22),
    ('Sal de Frutas (Antiácido)', 'Antiácido para alívio de azia e má digestão.', 8.90, '2026-06-30', 23),
    ('Gase Estéril Pacote (10 un)', 'Compressas de gaze para curativos.', 9.50, '2029-03-31', 4),
    ('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2027-01-01', 5),
    ('Álcool em Gel 70% 500ml', 'Antisséptico para as mãos com hidratante.', 18.00, '2026-12-31', 6),
    ('Bolsa Térmica Gel Quente/Fria', 'Bolsa reutilizável para alívio de dores e lesões.', 35.00, '2032-01-01', 7),
    ('Cortador de Unha Aço Inox', 'Cortador de unhas de alta precisão e durabilidade.', 11.20, '2035-01-01', 8),
    ('Curativo Adesivo à Prova D''água', 'Caixa com 20 curativos resistentes à água.', 13.90, '2028-06-30', 9),
    ('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-01-15', 1),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-02-20', 2),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-03-10', 3),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-04-25', 4),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-05-15', 5),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-06-20', 6),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-07-10', 7),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-08-25', 8),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-09-15', 1),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-10-20', 2),
    ('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-02-01', 3),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-03-05', 4),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-04-10', 5),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-05-20', 6),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-06-01', 7),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-07-05', 8),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-08-10', 1),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-09-20', 2),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-10-01', 3),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-11-05', 4),
    ('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2027-10-01', 5),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2027-11-05', 6),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2027-12-10', 7),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-01-20', 8),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-02-01', 1),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-03-05', 2),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-04-10', 3),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-05-20', 4),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-06-01', 5),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-07-05', 6),
    ('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-01-15', 7),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-02-20', 8),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-03-10', 1),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-04-25', 2),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-05-15', 3),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-06-20', 4),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-07-10', 5),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-08-25', 6),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-09-15', 7),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-10-20', 8),
    ('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-05-01', 1),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-06-05', 2),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-07-10', 3),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-08-20', 4),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-09-01', 5),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-10-05', 6),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-11-10', 7),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-12-20', 8),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-01-01', 1),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-02-05', 2),
    ('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-01-10', 3),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-02-15', 4),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-03-20', 5),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-04-25', 6),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-05-30', 7),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-06-05', 8),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-07-10', 1),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-08-15', 2),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-09-20', 3),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-10-25', 4),
    ('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-03-01', 5),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-04-05', 6),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-05-10', 7),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-06-15', 8),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-07-20', 1),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-08-25', 2),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-09-01', 3),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-10-05', 4),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-11-10', 5),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-12-15', 6),
    ('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-01-01', 7),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-02-05', 8),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-03-10', 1),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-04-15', 2),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-05-20', 3),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-06-25', 4),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-07-01', 5),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-08-05', 6),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-09-10', 7),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-10-15', 8),
    ('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2027-11-01', 1),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2027-12-05', 2),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-01-10', 3),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-02-15', 4),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-03-20', 5),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-04-25', 6),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-05-01', 7),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-06-05', 8),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-07-10', 1),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-08-15', 2),
    ('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2030-01-01', 3),('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2030-02-05', 4),('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2030-03-10', 5),('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2030-04-15', 6)
    RETURNING IDProduto, NomeProduto
),
novosmedicamentos AS (
    INSERT INTO oper.Medicamento (IDProduto, Indicacao, Contraindicacao)
    SELECT np.IDProduto,
        CASE np.NomeProduto
            WHEN 'Analgésico Infantil em Gotas' THEN 'Febre e dores leves a moderadas em crianças.'
            WHEN 'Pomada para Picada de Inseto' THEN 'Alívio sintomático de picadas de insetos.'
            WHEN 'Sal de Frutas (Antiácido)' THEN 'Azia, má digestão e excesso de acidez no estômago.'
            WHEN 'Dorflex 36cp' THEN 'Analgésico e relaxante muscular para dores de cabeça tensionais.'
            WHEN 'Tylenol Sinus 24cp' THEN 'Analgésico e descongestionante para gripes e sinusite.'
            WHEN 'Loratadina 10mg 12cp' THEN 'Antialérgico para alívio de sintomas de rinite e urticária.'
        END,
        CASE np.NomeProduto
            WHEN 'Analgésico Infantil em Gotas' THEN 'Alergia ao paracetamol ou componentes.'
            WHEN 'Pomada para Picada de Inseto' THEN 'Não aplicar em feridas abertas ou pele com bolhas.'
            WHEN 'Sal de Frutas (Antiácido)' THEN 'Hipertensão, problemas renais.'
            WHEN 'Dorflex 36cp' THEN 'Alergia a dipirona, glaucoma, miastenia grave.'
            WHEN 'Tylenol Sinus 24cp' THEN 'Alergia a paracetamol, glaucoma, hipertensão grave.'
            WHEN 'Loratadina 10mg 12cp' THEN 'Hipersensibilidade à loratadina.'
        END
    FROM novosprodutos np
    WHERE np.NomeProduto IN ('Analgésico Infantil em Gotas', 'Pomada para Picada de Inseto', 'Sal de Frutas (Antiácido)', 'Dorflex 36cp', 'Tylenol Sinus 24cp', 'Loratadina 10mg 12cp')
)
INSERT INTO oper.ProdCateg (IDProduto, IDCategoria)
SELECT np.IDProduto, c.IDCategoria
FROM novosprodutos np
JOIN oper.Categoria c ON c.NomeCategoria =
    CASE
        WHEN np.NomeProduto = 'Vitamina C Efervescente 1g' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Teste de Gravidez Digital' THEN 'Testes e Diagnósticos'
        WHEN np.NomeProduto = 'Lenços Umedecidos Antissépticos' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Ômega 3 1000mg 120 cápsulas' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Analgésico Infantil em Gotas' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Seringa Descartável 5ml com Agulha' THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Algodão em Bolas 100g' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Aparelho de Pressão Digital de Pulso' THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Pasta de Dente Gengivas Sensíveis' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Enxaguante Bucal Sem Álcool' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Absorvente Noturno Suave (16 un)' THEN 'Cuidados Femininos'
        WHEN np.NomeProduto = 'Coenzima Q10 100mg' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Pomada para Picada de Inseto' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Sal de Frutas (Antiácido)' THEN 'Saúde Digestiva'
        WHEN np.NomeProduto = 'Gase Estéril Pacote (10 un)' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Máscara de Proteção N95' THEN 'Proteção e Segurança'
        WHEN np.NomeProduto = 'Álcool em Gel 70% 500ml' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Bolsa Térmica Gel Quente/Fria' THEN 'Produtos Ortopédicos'
        WHEN np.NomeProduto = 'Cortador de Unha Aço Inox' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Curativo Adesivo à Prova D''água' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Dorflex 36cp' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Protetor Solar Facial FPS 50' THEN 'Proteção Solar'
        WHEN np.NomeProduto = 'Tylenol Sinus 24cp' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Fraldas Infantis Pacote G' THEN 'Saúde Infantil'
        WHEN np.NomeProduto = 'Whey Protein Concentrado 900g' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Creme Dental Branqueador' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Loratadina 10mg 12cp' THEN 'Antialérgicos'
        WHEN np.NomeProduto = 'Preservativo Pacote Leve 8 Pague 6' THEN 'Saúde do Homem'
    END;


-- Bloco de Inserção de Produtos 2
WITH novosprodutos AS (
    INSERT INTO oper.Produto (NomeProduto, DescrProd, PrecVenda, DtValidade, IDEstoque) VALUES
    ('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2027-01-31', 4),
    ('Creme Hidratante Corporal', 'Hidratação profunda para peles secas.', 32.50, '2026-06-30', 5),
    ('Kit de Curativos Avançado', 'Contém band-aids, gaze, antisséptico e esparadrapo.', 25.00, '2028-01-01', 6),
    ('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2026-10-31', 7),
    ('Shampoo Anticaspa', 'Controle eficaz da caspa e oleosidade.', 28.90, '2025-12-31', 8),
    ('Termômetro Digital Infravermelho', 'Medição de temperatura sem contato.', 99.90, '2030-01-01', 9),
    ('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2027-03-31', 10),
    ('Tiras para Glicosímetro (50 un)', 'Tiras reagentes para medição de glicose.', 65.00, '2026-09-30', 11),
    ('Colírio Lubrificante', 'Alívio para olhos secos e irritados.', 22.00, '2025-08-31', 12),
    ('Relaxante Muscular 20cp', 'Indicado para dores e contraturas musculares.', 18.50, '2026-11-30', 13),
    ('Repelente de Insetos Loção', 'Proteção prolongada contra mosquitos.', 19.90, '2027-02-28', 14),
    ('Protetor Labial com Manteiga de Cacau', 'Hidrata e protege os lábios.', 8.50, '2026-07-31', 15),
    ('Fio Dental Menta 50m', 'Fio dental encerado com sabor de menta.', 6.80, '2028-05-31', 16),
    ('Sabonete Líquido Antisséptico', 'Limpeza profunda e proteção contra bactérias.', 12.30, '2026-04-30', 17),
    ('Multivitamínico A-Z Homem', 'Complexo vitamínico para a saúde masculina.', 49.90, '2025-10-31', 18),
    ('Creme para Assaduras', 'Proteção e tratamento para a pele do bebê.', 21.75, '2026-08-31', 19),
    ('Gel para Dores Musculares', 'Gel de massagem para alívio de dores e cansaço.', 35.40, '2027-01-31', 20),
    ('Barra de Proteína Chocolate', 'Lanche prático e nutritivo com 15g de proteína.', 9.00, '2025-07-31', 21),
    ('Água Micelar de Limpeza Facial', 'Limpa, demaquila e purifica a pele.', 42.00, '2026-02-28', 22),
    ('Tala para Punho Ajustável', 'Suporte e imobilização para o punho.', 55.80, '2030-01-01', 23),
    ('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2026-12-31', 4),
    ('Neosaldina 30 drágeas', 'Analgésico para dores de cabeça.', 29.90, '2027-01-31', 5),
    ('Escova de Dentes Macia', 'Escova com cerdas macias para gengivas sensíveis.', 14.20, '2029-01-01', 6),
    ('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2026-03-31', 7),
    ('Cálcio + Vitamina D3', 'Suplemento para fortalecimento dos ossos.', 38.00, '2025-11-30', 8),
    ('Antisséptico Bucal Menta Suave', 'Hálito fresco e proteção contra germes.', 25.50, '2026-05-31', 7),
    ('Melatonina 0.21mg', 'Suplemento para auxiliar na indução do sono.', 45.00, '2026-01-31', 11)
    RETURNING IDProduto, NomeProduto
),
novosmedicamentos AS (
    INSERT INTO oper.Medicamento (IDProduto, Indicacao, Contraindicacao)
    SELECT np.IDProduto,
        CASE np.NomeProduto
            WHEN 'Colírio Lubrificante' THEN 'Olhos secos e irritação.'
            WHEN 'Relaxante Muscular 20cp' THEN 'Dores musculares, torcicolo.'
            WHEN 'Dorflex 36cp' THEN 'Dores de cabeça tensionais.'
            WHEN 'Neosaldina 30 drágeas' THEN 'Enxaquecas e dores de cabeça.'
        END,
        CASE np.NomeProduto
            WHEN 'Colírio Lubrificante' THEN 'Alergia a componentes da fórmula.'
            WHEN 'Relaxante Muscular 20cp' THEN 'Glaucoma, miastenia grave.'
            WHEN 'Dorflex 36cp' THEN 'Alergia a dipirona, glaucoma.'
            WHEN 'Neosaldina 30 drágeas' THEN 'Pressão alta, alergia a componentes.'
        END
    FROM novosprodutos np
    WHERE np.NomeProduto IN ('Colírio Lubrificante', 'Relaxante Muscular 20cp', 'Dorflex 36cp', 'Neosaldina 30 drágeas')
)
INSERT INTO oper.ProdCateg (IDProduto, IDCategoria)
SELECT np.IDProduto, c.IDCategoria
FROM novosprodutos np
JOIN oper.Categoria c ON c.NomeCategoria =
    CASE
        WHEN np.NomeProduto = 'Protetor Solar Facial FPS 50' THEN 'Proteção Solar'
        WHEN np.NomeProduto = 'Creme Hidratante Corporal' THEN 'Cuidados Corporais'
        WHEN np.NomeProduto = 'Kit de Curativos Avançado' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Whey Protein Concentrado 900g' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Shampoo Anticaspa' THEN 'Cabelos e Unhas'
        WHEN np.NomeProduto = 'Termômetro Digital Infravermelho' THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Fraldas Infantis Pacote G' THEN 'Saúde Infantil'
        WHEN np.NomeProduto = 'Tiras para Glicosímetro (50 un)' THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Colírio Lubrificante' THEN 'Saúde Ocular e Colírios'
        WHEN np.NomeProduto = 'Relaxante Muscular 20cp' THEN 'Relaxantes Musculares'
        WHEN np.NomeProduto = 'Repelente de Insetos Loção' THEN 'Repelentes e Inseticidas'
        WHEN np.NomeProduto = 'Protetor Labial com Manteiga de Cacau' THEN 'Cuidados Corporais'
        WHEN np.NomeProduto = 'Fio Dental Menta 50m' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Sabonete Líquido Antisséptico' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Multivitamínico A-Z Homem' THEN 'Saúde do Homem'
        WHEN np.NomeProduto = 'Creme para Assaduras' THEN 'Saúde Infantil'
        WHEN np.NomeProduto = 'Gel para Dores Musculares' THEN 'Relaxantes Musculares'
        WHEN np.NomeProduto = 'Barra de Proteína Chocolate' THEN 'Nutrição Esportiva'
        WHEN np.NomeProduto = 'Água Micelar de Limpeza Facial' THEN 'Cuidados Faciais'
        WHEN np.NomeProduto = 'Tala para Punho Ajustável' THEN 'Produtos Ortopédicos'
        WHEN np.NomeProduto = 'Dorflex 36cp' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Neosaldina 30 drágeas' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Escova de Dentes Macia' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Creme Dental Branqueador' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Cálcio + Vitamina D3' THEN 'Vitaminas'
        WHEN np.NomeProduto = 'Antisséptico Bucal Menta Suave' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Melatonina 0.21mg' THEN 'Suplementos Alimentares'
    END;

-- Garante que as novas categorias necessárias existam.
INSERT INTO oper.Categoria (NomeCategoria) VALUES
('Cuidados Masculinos'),
('Cosméticos')
ON CONFLICT (NomeCategoria) DO NOTHING;

-- Bloco de Inserção de Produtos 3
WITH novosprodutos AS (
    INSERT INTO oper.Produto (NomeProduto, DescrProd, PrecVenda, DtValidade, IDEstoque) VALUES
    ('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2027-08-31', 4),
    ('Xarope para Tosse Seca 120ml', 'Xarope para alívio da tosse seca e irritativa.', 25.50, '2026-09-30', 5),
    ('Xarope Expectorante 120ml', 'Auxilia na eliminação do catarro em gripes e resfriados.', 27.80, '2026-10-31', 6),
    ('Descongestionante Nasal Adulto', 'Solução nasal para alívio da congestão.', 15.20, '2027-01-31', 7),
    ('Pastilhas para Garganta Sabor Mel e Limão', 'Alívio para dor e irritação na garganta.', 12.00, '2026-05-31', 8),
    ('Gel Anti-inflamatório para Dor Muscular', 'Gel tópico para tratamento de dores e inflamações locais.', 33.00, '2027-04-30', 9),
    ('Esmalte para Tratamento de Micose de Unha', 'Esmalte terapêutico antifúngico.', 55.40, '2026-11-30', 10),
    ('Creme para Tratamento de Hemorroidas', 'Pomada para alívio da dor e desconforto.', 42.00, '2026-08-31', 11),
    ('Laxante Suave em Comprimidos', 'Indicado para casos de prisão de ventre ocasional.', 14.75, '2027-07-31', 12),
    ('Antidiarreico 12cp', 'Controle rápido dos sintomas da diarreia.', 21.90, '2027-06-30', 13),
    ('Comprimido para Enjoo e Vômito (Dramin)', 'Prevenção e tratamento de náuseas, tonturas e vômitos.', 9.80, '2026-12-31', 14),
    ('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2027-09-30', 15),
    ('Sulfato Ferroso + Ácido Fólico', 'Suplemento para prevenção e tratamento de anemias.', 23.50, '2026-04-30', 16),
    ('Magnésio Quelato 60 cápsulas', 'Suplemento mineral para saúde muscular e óssea.', 58.00, '2027-03-31', 17),
    ('Zinco Quelato 60 cápsulas', 'Suplemento para fortalecimento do sistema imunológico.', 49.90, '2027-02-28', 18),
    ('Complexo B 100 cápsulas', 'Complexo de vitaminas B para energia e saúde neural.', 45.00, '2027-05-31', 19),
    ('Colágeno Hidrolisado em Pó 300g', 'Suplemento para firmeza da pele, cabelos e unhas.', 85.00, '2026-07-31', 20),
    ('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2027-10-31', 21),
    ('BCAA em Pó 200g Sabor Limão', 'Aminoácidos para recuperação muscular pós-treino.', 75.00, '2026-06-30', 22),
    ('Vitamina D3 2000 UI 60 cápsulas', 'Suplemento para imunidade e saúde óssea.', 42.80, '2027-11-30', 23),
    ('Gummy de Vitamina para Cabelo e Unha', 'Suplemento em goma para fortalecimento capilar.', 65.00, '2026-10-31', 4),
    ('Desodorante Aerosol Sem Perfume', 'Proteção 48h contra o suor, sem fragrância.', 16.50, '2027-12-31', 5),
    ('Espuma de Barbear Pele Sensível', 'Espuma densa para um barbear suave e sem irritação.', 28.00, '2028-01-31', 6),
    ('Loção Pós-Barba Hidratante', 'Acalma e hidrata a pele após o barbear.', 32.00, '2028-02-29', 7),
    ('Hastes Flexíveis com Pontas de Algodão (Cotonetes) 150un', 'Para higiene de áreas delicadas.', 8.50, '2030-01-01', 8),
    ('Talco Antisséptico para os Pés', 'Previne odores e mantém os pés secos.', 13.90, '2028-03-31', 9),
    ('Creme Esfoliante Facial Suave', 'Remove células mortas e impurezas da pele.', 38.00, '2026-09-30', 10),
    ('Máscara Facial de Argila Verde', 'Controle de oleosidade e efeito detox para a pele.', 25.00, '2026-08-31', 11),
    ('Sabonete Líquido Íntimo Feminino', 'Higiene e proteção com pH balanceado.', 22.50, '2027-04-30', 12),
    ('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2029-05-31', 13),
    ('Lubrificante Íntimo à Base de Água 50g', 'Lubrificação discreta e segura.', 20.00, '2028-06-30', 14),
    ('Chupeta Ortodôntica 6-18 meses', 'Design que respeita o desenvolvimento oral do bebê.', 28.90, '2030-03-31', 15),
    ('Mamadeira Anti-Cólica 260ml', 'Sistema que reduz a ingestão de ar e as cólicas.', 45.00, '2030-04-30', 16),
    ('Fórmula Infantil para Lactentes 800g', 'Leite em pó para bebês de 0 a 6 meses.', 68.00, '2026-05-31', 17),
    ('Lenços Umedecidos para Recém-Nascido', 'Fórmula suave com 99% de água, sem perfume.', 18.00, '2027-02-28', 18),
    ('Termômetro de Banheira em formato de Peixe', 'Mede a temperatura da água do banho do bebê.', 22.00, '2035-01-01', 19),
    ('Pomada para Assadura de Uso Diário', 'Cria uma camada protetora na pele do bebê.', 29.50, '2026-11-30', 20),
    ('Atadura Elástica de Compressão 10cm', 'Para enfaixamentos e suporte a articulações.', 17.00, '2031-05-31', 21),
    ('Esparadrapo Impermeável Branco', 'Fixação de curativos, alta resistência.', 9.00, '2029-06-30', 22),
    ('Solução de Iodo 10% Antisséptico', 'Antisséptico tópico para curativos.', 11.50, '2027-01-31', 23),
    ('Nebulizador e Inalador Portátil a Pilha', 'Para tratamento de doenças respiratórias.', 250.00, '2032-06-30', 4),
    ('Oxímetro de Dedo Portátil', 'Mede a saturação de oxigênio no sangue e pulso.', 150.00, '2032-07-31', 5),
    ('Soro Fisiológico 0.9% 500ml', 'Para limpeza de ferimentos, olhos e nariz.', 8.00, '2027-08-31', 6),
    ('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2026-12-31', 7),
    ('Creme Anti-idade Noturno Revitalizante', 'Hidrata e reduz linhas de expressão durante a noite.', 95.00, '2027-09-30', 8),
    ('Protetor Solar Corporal FPS 30 200ml', 'Proteção UVA/UVB resistente à água.', 48.00, '2027-03-31', 9),
    ('Removedor de Maquiagem Bifásico', 'Remove maquiagem à prova d''água sem esforço.', 35.00, '2027-06-30', 10),
    ('Esmalte de Unha Hipoalergênico Cor "Vinho"', 'Cor intensa e fórmula que minimiza alergias.', 9.90, '2028-08-31', 11),
    ('Removedor de Esmalte sem Acetona', 'Remove o esmalte sem ressecar as unhas.', 7.50, '2028-09-30', 12),
    ('Pinça de Sobrancelha Ponta Diagonal', 'Aço inox para alta precisão na remoção de pelos.', 14.00, '2035-01-01', 13),
    ('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-01-01', 1),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-02-05', 2),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-03-10', 3),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-04-15', 4),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-05-20', 5),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-06-25', 6),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-07-01', 7),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-08-05', 8),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-09-10', 9),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-10-15', 10),
    ('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-01-01', 11),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-02-05', 12),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-03-10', 13),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-04-15', 14),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-05-20', 15),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-06-25', 16),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-07-01', 17),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-08-05', 18),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-09-10', 19),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-10-15', 20),
    ('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-01-01', 1),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-02-05', 2),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-03-10', 3),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-04-15', 4),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-05-20', 5),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-06-25', 6),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-07-01', 7),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-08-05', 8),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-09-10', 9),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-10-15', 10),
    ('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-12-01', 11),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-12-05', 12),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-01-10', 13),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-01-15', 14),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-02-20', 15),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-02-25', 16),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-03-01', 17),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-03-05', 18),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-04-10', 19),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-04-15', 20),
    ('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-08-01', 1),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-08-05', 2),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-09-10', 3),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-09-15', 4),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-10-20', 5),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-10-25', 6),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-11-01', 7),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-11-05', 8),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-12-10', 9),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-12-15', 10),
    ('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-01-01', 11),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-01-05', 12),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-02-10', 13),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-02-15', 14),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-03-20', 15),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-03-25', 16),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-04-01', 17),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-04-05', 18),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-05-10', 19),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-05-15', 20),
    ('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-01-01', 1),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-02-05', 2),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-03-10', 3),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-04-15', 4),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-05-20', 5),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-06-25', 6),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-07-01', 7),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-08-05', 8),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-09-10', 9),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-10-15', 10),
    ('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-06-01', 11),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-06-05', 12),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-07-10', 13),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-07-15', 14),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-08-20', 15),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-08-25', 16),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-09-01', 17),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-09-05', 18),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-10-10', 19),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-10-15', 20),
    ('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-01-01', 1),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-02-05', 2),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-03-10', 3),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-04-15', 4),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-05-20', 5),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-06-25', 6),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-07-01', 7),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-08-05', 8),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-09-10', 9),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-10-15', 10),
    ('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-01-01', 11),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-02-05', 12),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-03-10', 13),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-04-15', 14),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-05-20', 15),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-06-25', 16),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-07-01', 17),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-08-05', 18),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-09-10', 19),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-10-15', 20)
    RETURNING IDProduto, NomeProduto
),
novosmedicamentos AS (
    INSERT INTO oper.Medicamento (IDProduto, Indicacao, Contraindicacao)
    SELECT np.IDProduto,
        CASE np.NomeProduto
            WHEN 'Loratadina 10mg 12cp' THEN 'Rinite alérgica, urticária e outras alergias.'
            WHEN 'Xarope para Tosse Seca 120ml' THEN 'Tosse de origem alérgica ou irritativa, sem catarro.'
            WHEN 'Xarope Expectorante 120ml' THEN 'Tosse produtiva, para facilitar a expectoração.'
            WHEN 'Descongestionante Nasal Adulto' THEN 'Congestão nasal em resfriados, rinites e sinusites.'
            WHEN 'Pastilhas para Garganta Sabor Mel e Limão' THEN 'Alívio temporário da dor de garganta.'
            WHEN 'Gel Anti-inflamatório para Dor Muscular' THEN 'Lesões musculares, contusões, torcicolos.'
            WHEN 'Esmalte para Tratamento de Micose de Unha' THEN 'Onicomicoses (micoses de unha).'
            WHEN 'Creme para Tratamento de Hemorroidas' THEN 'Alívio sintomático de hemorroidas externas.'
            WHEN 'Laxante Suave em Comprimidos' THEN 'Constipação intestinal ocasional.'
            WHEN 'Antidiarreico 12cp' THEN 'Diarreias agudas não infecciosas.'
            WHEN 'Comprimido para Enjoo e Vômito (Dramin)' THEN 'Cinetose (enjoo de movimento), náuseas.'
            WHEN 'Tylenol Sinus 24cp' THEN 'Dores e congestão nasal associadas à sinusite.'
            WHEN 'Analgésico Infantil em Gotas' THEN 'Febre e dores leves a moderadas em crianças.'
        END,
        CASE np.NomeProduto
            WHEN 'Loratadina 10mg 12cp' THEN 'Hipersensibilidade à loratadina.'
            WHEN 'Xarope para Tosse Seca 120ml' THEN 'Não usar em caso de tosse produtiva (com catarro).'
            WHEN 'Xarope Expectorante 120ml' THEN 'Hipersensibilidade a componentes da fórmula.'
            WHEN 'Descongestionante Nasal Adulto' THEN 'Não usar por mais de 3 dias consecutivos. Hipertensão.'
            WHEN 'Pastilhas para Garganta Sabor Mel e Limão' THEN 'Diabéticos devem usar com cautela (contém açúcar).'
            WHEN 'Gel Anti-inflamatório para Dor Muscular' THEN 'Não aplicar sobre feridas abertas. Alergia a AINEs.'
            WHEN 'Esmalte para Tratamento de Micose de Unha' THEN 'Alergia ao princípio ativo.'
            WHEN 'Creme para Tratamento de Hemorroidas' THEN 'Infecções virais ou fúngicas na área.'
            WHEN 'Laxante Suave em Comprimidos' THEN 'Obstrução intestinal, dores abdominais intensas.'
            WHEN 'Antidiarreico 12cp' THEN 'Não indicado para diarreias com sangue ou febre alta.'
            WHEN 'Comprimido para Enjoo e Vômito (Dramin)' THEN 'Glaucoma, asma aguda. Causa sonolência.'
            WHEN 'Tylenol Sinus 24cp' THEN 'Alergia a paracetamol, glaucoma, hipertensão grave.'
            WHEN 'Analgésico Infantil em Gotas' THEN 'Alergia ao paracetamol ou componentes.'
        END
    FROM novosprodutos np
    WHERE np.NomeProduto IN (
        'Loratadina 10mg 12cp', 'Xarope para Tosse Seca 120ml', 'Xarope Expectorante 120ml', 'Descongestionante Nasal Adulto',
        'Pastilhas para Garganta Sabor Mel e Limão', 'Gel Anti-inflamatório para Dor Muscular', 'Esmalte para Tratamento de Micose de Unha',
        'Creme para Tratamento de Hemorroidas', 'Laxante Suave em Comprimidos', 'Antidiarreico 12cp', 'Analgésico Infantil em Gotas',
        'Comprimido para Enjoo e Vômito (Dramin)', 'Tylenol Sinus 24cp'
    )
)
INSERT INTO oper.ProdCateg (IDProduto, IDCategoria)
SELECT np.IDProduto, c.IDCategoria
FROM novosprodutos np
JOIN oper.Categoria c ON c.NomeCategoria =
    CASE
        WHEN np.NomeProduto = 'Loratadina 10mg 12cp' THEN 'Antialérgicos'
        WHEN np.NomeProduto IN ('Xarope para Tosse Seca 120ml', 'Xarope Expectorante 120ml', 'Tylenol Sinus 24cp') THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Descongestionante Nasal Adulto' THEN 'Relaxantes Musculares'
        WHEN np.NomeProduto = 'Pastilhas para Garganta Sabor Mel e Limão' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Gel Anti-inflamatório para Dor Muscular' THEN 'Anti-inflamatórios'
        WHEN np.NomeProduto = 'Esmalte para Tratamento de Micose de Unha' THEN 'Cabelos e Unhas'
        WHEN np.NomeProduto IN ('Creme para Tratamento de Hemorroidas', 'Laxante Suave em Comprimidos', 'Antidiarreico 12cp') THEN 'Saúde Digestiva'
        WHEN np.NomeProduto = 'Comprimido para Enjoo e Vômito (Dramin)' THEN 'Saúde Digestiva'
        WHEN np.NomeProduto IN ('Sulfato Ferroso + Ácido Fólico', 'Magnésio Quelato 60 cápsulas', 'Zinco Quelato 60 cápsulas', 'Complexo B 100 cápsulas', 'Vitamina D3 2000 UI 60 cápsulas') THEN 'Vitaminas'
        WHEN np.NomeProduto = 'Colágeno Hidrolisado em Pó 300g' THEN 'Dermocosméticos'
        WHEN np.NomeProduto IN ('Creatina Monohidratada 300g', 'BCAA em Pó 200g Sabor Limão') THEN 'Nutrição Esportiva'
        WHEN np.NomeProduto = 'Gummy de Vitamina para Cabelo e Unha' THEN 'Cabelos e Unhas'
        WHEN np.NomeProduto = 'Desodorante Aerosol Sem Perfume' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto IN ('Espuma de Barbear Pele Sensível', 'Loção Pós-Barba Hidratante') THEN 'Cuidados Masculinos'
        WHEN np.NomeProduto = 'Hastes Flexíveis com Pontas de Algodão (Cotonetes) 150un' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Talco Antisséptico para os Pés' THEN 'Cuidados com os Pés'
        WHEN np.NomeProduto IN ('Creme Esfoliante Facial Suave', 'Máscara Facial de Argila Verde', 'Sérum Facial com Vitamina C Pura', 'Creme Anti-idade Noturno Revitalizante') THEN 'Cuidados Faciais'
        WHEN np.NomeProduto = 'Sabonete Líquido Íntimo Feminino' THEN 'Saúde da Mulher'
        WHEN np.NomeProduto IN ('Preservativo Pacote Leve 8 Pague 6', 'Lubrificante Íntimo à Base de Água 50g') THEN 'Saúde do Homem'
        WHEN np.NomeProduto IN ('Chupeta Ortodôntica 6-18 meses', 'Mamadeira Anti-Cólica 260ml', 'Fórmula Infantil para Lactentes 800g', 'Lenços Umedecidos para Recém-Nascido', 'Pomada para Assadura de Uso Diário', 'Analgésico Infantil em Gotas') THEN 'Saúde Infantil'
        WHEN np.NomeProduto = 'Termômetro de Banheira em formato de Peixe' THEN 'Acessórios de Saúde'
        WHEN np.NomeProduto IN ('Atadura Elástica de Compressão 10cm', 'Esparadrapo Impermeável Branco', 'Solução de Iodo 10% Antisséptico', 'Soro Fisiológico 0.9% 500ml') THEN 'Primeiros Socorros'
        WHEN np.NomeProduto IN ('Nebulizador e Inalador Portátil a Pilha', 'Oxímetro de Dedo Portátil') THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Protetor Solar Corporal FPS 30 200ml' THEN 'Proteção Solar'
        WHEN np.NomeProduto IN ('Removedor de Maquiagem Bifásico', 'Esmalte de Unha Hipoalergênico Cor "Vinho"', 'Removedor de Esmalte sem Acetona', 'Pinça de Sobrancelha Ponta Diagonal') THEN 'Cosméticos'
        WHEN np.NomeProduto = 'Whey Protein Concentrado 900g' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Fraldas Infantis Pacote G' THEN 'Fraldas e Lenços Umedecidos'
        WHEN np.NomeProduto = 'Protetor Solar Facial FPS 50' THEN 'Proteção Solar'
        WHEN np.NomeProduto = 'Vitamina C Efervescente 1g' THEN 'Vitaminas'
        WHEN np.NomeProduto = 'Máscara de Proteção N95' THEN 'Proteção e Segurança'
        WHEN np.NomeProduto LIKE 'Loratadina%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Xarope para Tosse Seca%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Xarope Expectorante%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Descongestionante Nasal%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Pastilhas para Garganta%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Gel Anti-inflamatório%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Esmalte para Tratamento de Micose%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Creme para Tratamento de Hemorroidas%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Laxante Suave%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Antidiarreico%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Comprimido para Enjoo%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Tylenol Sinus%' THEN 'Medicamentos'
        WHEN np.NomeProduto LIKE 'Sulfato Ferroso%' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto LIKE 'Magnésio Quelato%' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto LIKE 'Zinco Quelato%' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto LIKE 'Complexo B%' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto LIKE 'Colágeno Hidrolisado%' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto LIKE 'Creatina Monohidratada%' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto LIKE 'BCAA em Pó%' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto LIKE 'Vitamina D3%' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto LIKE 'Gummy de Vitamina%' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto LIKE 'Desodorante Aerosol%' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto LIKE 'Espuma de Barbear%' THEN 'Cuidados Masculinos'
        WHEN np.NomeProduto LIKE 'Loção Pós-Barba%' THEN 'Cuidados Masculinos'
        WHEN np.NomeProduto LIKE 'Hastes Flexíveis%' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto LIKE 'Talco Antisséptico para os Pés%' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto LIKE 'Creme Esfoliante Facial%' THEN 'Cuidados com a Pele'
        WHEN np.NomeProduto LIKE 'Máscara Facial de Argila Verde%' THEN 'Cuidados com a Pele'
        WHEN np.NomeProduto LIKE 'Sabonete Líquido Íntimo Feminino%' THEN 'Cuidados Femininos'
        WHEN np.NomeProduto LIKE 'Preservativo Pacote%' THEN 'Proteção e Segurança'
        WHEN np.NomeProduto LIKE 'Lubrificante Íntimo%' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto LIKE 'Chupeta Ortodôntica%' THEN 'Infantil'
        WHEN np.NomeProduto LIKE 'Mamadeira Anti-Cólica%' THEN 'Infantil'
        WHEN np.NomeProduto LIKE 'Fórmula Infantil para Lactentes%' THEN 'Infantil'
        WHEN np.NomeProduto LIKE 'Lenços Umedecidos para Recém-Nascido%' THEN 'Infantil'
        WHEN np.NomeProduto LIKE 'Termômetro de Banheira%' THEN 'Infantil'
        WHEN np.NomeProduto LIKE 'Pomada para Assadura de Uso Diário%' THEN 'Infantil'
        WHEN np.NomeProduto LIKE 'Atadura Elástica%' THEN 'Ortopédicos'
        WHEN np.NomeProduto LIKE 'Esparadrapo Impermeável%' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto LIKE 'Solução de Iodo%' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto LIKE 'Nebulizador e Inalador%' THEN 'Equipamentos de Saúde'
        WHEN np.NomeProduto LIKE 'Oxímetro de Dedo%' THEN 'Equipamentos de Saúde'
        WHEN np.NomeProduto LIKE 'Soro Fisiológico%' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto LIKE 'Sérum Facial com Vitamina C%' THEN 'Cuidados com a Pele'
        WHEN np.NomeProduto LIKE 'Creme Anti-idade Noturno%' THEN 'Cuidados com a Pele'
        WHEN np.NomeProduto LIKE 'Protetor Solar Corporal%' THEN 'Proteção Solar'
        WHEN np.NomeProduto LIKE 'Removedor de Maquiagem%' THEN 'Cuidados com a Pele'
        WHEN np.NomeProduto LIKE 'Esmalte de Unha Hipoalergênico%' THEN 'Cosméticos'
        WHEN np.NomeProduto LIKE 'Removedor de Esmalte sem Acetona%' THEN 'Cosméticos'
        WHEN np.NomeProduto LIKE 'Pinça de Sobrancelha%' THEN 'Cosméticos'
    END;

-- ===================================================================
-- DML - Inserção em Massa de Vendas Fictícias
-- ===================================================================
INSERT INTO oper.CliCompraProd (DataHoraCompra, Quantidade, IDCliente, IDProduto) VALUES
('2026-01-05 12:20:38', 2, 13, 5), ('2026-01-08 14:30:00', 1, 45, 12), ('2026-01-12 09:15:00', 3, 22, 25),
('2026-01-15 11:45:00', 1, 5, 30), ('2026-01-18 16:00:00', 2, 55, 1), ('2026-01-21 10:30:00', 1, 33, 8),
('2026-01-24 15:00:00', 4, 19, 15), ('2026-01-28 13:30:00', 1, 48, 22), ('2026-02-02 08:00:00', 2, 7, 29),
('2026-02-05 17:15:00', 1, 60, 4), ('2026-02-09 12:45:00', 1, 2, 18), ('2026-02-13 14:00:00', 3, 41, 26),
('2026-02-17 09:30:00', 2, 28, 11), ('2026-02-20 11:00:00', 1, 1, 31), ('2026-02-24 10:15:00', 1, 52, 6),
('2026-03-01 12:00:00', 2, 38, 14), ('2026-03-04 15:30:00', 1, 16, 21), ('2026-03-08 14:45:00', 3, 49, 2),
('2026-03-12 10:00:00', 1, 23, 28), ('2026-03-16 11:30:00', 2, 57, 19), ('2026-03-19 09:00:00', 1, 10, 24),
('2026-03-23 15:00:00', 4, 3, 1), ('2026-03-27 14:00:00', 1, 51, 16), ('2026-04-03 10:30:00', 2, 26, 7),
('2026-04-06 11:15:00', 1, 12, 23), ('2026-04-10 09:45:00', 1, 44, 13), ('2026-04-14 15:30:00', 2, 31, 27),
('2026-04-18 14:00:00', 3, 9, 3), ('2026-04-22 10:00:00', 1, 56, 10), ('2026-04-26 11:30:00', 2, 20, 17),
('2026-04-30 09:00:00', 1, 36, 20), ('2026-05-04 15:00:00', 1, 4, 9), ('2026-05-07 14:30:00', 3, 40, 5),
('2026-05-11 10:00:00', 2, 24, 22), ('2027-05-15 11:30:00', 1, 59, 18), ('2027-05-19 09:00:00', 4, 14, 1),
('2027-05-23 15:00:00', 1, 34, 29), ('2027-05-27 14:00:00', 2, 6, 11), ('2027-06-02 10:30:00', 1, 46, 25),
('2027-06-05 11:15:00', 3, 17, 30), ('2027-06-09 09:45:00', 1, 53, 2), ('2027-06-13 15:30:00', 2, 29, 21),
('2027-06-17 14:00:00', 1, 8, 26), ('2027-06-21 10:00:00', 4, 39, 12), ('2027-06-25 11:30:00', 1, 15, 7),
('2027-06-29 09:00:00', 2, 50, 23), ('2027-07-03 15:00:00', 1, 21, 14), ('2027-07-07 14:30:00', 3, 43, 6),
('2027-07-11 10:00:00', 1, 18, 20), ('2027-07-15 11:30:00', 2, 54, 15), ('2027-07-19 09:00:00', 1, 27, 28),
('2027-07-23 15:00:00', 5, 3, 1), ('2027-07-27 14:00:00', 1, 35, 24), ('2027-08-01 10:30:00', 2, 47, 9),
('2027-08-04 11:15:00', 1, 11, 27), ('2027-08-08 09:45:00', 3, 32, 4), ('2027-08-12 15:30:00', 1, 58, 17),
('2027-08-16 14:00:00', 2, 25, 23), ('2027-08-20 10:00:00', 1, 5, 29), ('2027-08-24 11:30:00', 4, 37, 1),
('2027-08-28 09:00:00', 1, 13, 19), ('2027-09-02 15:00:00', 2, 42, 11), ('2027-09-05 14:30:00', 1, 22, 26),
('2028-09-09 10:00:00', 3, 61, 8), ('2028-09-13 11:30:00', 1, 30, 21), ('2028-09-17 09:00:00', 2, 7, 30),
('2028-09-21 15:00:00', 1, 48, 5), ('2028-09-23 14:00:00', 4, 1, 1), ('2028-09-23 10:00:00', 1, 55, 12),
('2028-10-01 10:00:00', 2, 19, 25), ('2028-10-04 15:00:00', 1, 33, 31), ('2028-10-08 14:30:00', 3, 45, 2),
('2028-10-12 09:00:00', 1, 2, 28), ('2028-10-16 11:30:00', 2, 60, 18), ('2028-10-20 10:00:00', 1, 28, 7),
('2028-10-24 15:00:00', 4, 41, 14), ('2028-10-28 14:00:00', 1, 16, 22), ('2028-11-02 10:30:00', 2, 52, 4),
('2028-11-05 11:15:00', 1, 23, 29), ('2028-11-09 09:45:00', 1, 38, 10), ('2028-11-13 15:30:00', 3, 57, 20),
('2028-11-17 14:00:00', 2, 10, 27), ('2028-11-21 10:00:00', 1, 49, 3), ('2028-11-25 11:30:00', 1, 26, 16),
('2028-11-29 09:00:00', 4, 12, 1), ('2028-12-03 15:00:00', 2, 51, 9), ('2028-12-07 14:30:00', 1, 20, 24),
('2028-12-11 10:00:00', 1, 36, 6), ('2028-12-15 11:30:00', 3, 44, 13), ('2028-12-19 09:00:00', 2, 9, 30),
('2028-12-23 15:00:00', 1, 56, 17), ('2028-12-28 14:00:00', 5, 14, 1), ('2028-01-11 10:30:00', 1, 40, 23),
('2028-02-15 11:15:00', 2, 21, 15), ('2028-03-21 09:45:00', 1, 50, 28), ('2028-04-24 15:30:00', 3, 4, 2),
('2028-05-30 14:00:00', 1, 37, 26), ('2028-06-19 10:00:00', 2, 13, 11), ('2028-07-25 11:30:00', 1, 46, 22),
('2028-08-14 09:00:00', 4, 8, 1), ('2028-09-23 15:00:00', 2, 62, 29), ('2028-10-18 14:30:00', 1, 17, 5),
('2028-11-23 10:00:00', 3, 43, 19), ('2029-12-26 11:30:00', 1, 32, 27), ('2029-01-30 09:00:00', 2, 53, 10),
('2029-02-28 15:00:00', 1, 29, 25), ('2029-03-10 14:00:00', 1, 35, 8), ('2029-04-12 10:30:00', 4, 47, 1),
('2029-05-14 15:00:00', 1, 11, 16), ('2029-06-16 11:30:00', 2, 58, 20), ('2029-07-17 09:00:00', 1, 24, 27),
('2029-08-18 14:00:00', 3, 39, 3), ('2029-09-23 10:00:00', 1, 15, 13), ('2029-10-26 15:00:00', 2, 49, 29),
('2029-11-15 11:30:00', 1, 6, 6), ('2029-12-17 09:00:00', 4, 42, 1), ('2029-01-26 14:00:00', 1, 18, 10),
('2029-02-26 10:30:00', 2, 57, 21), ('2029-03-26 15:00:00', 1, 27, 26), ('2029-04-28 14:00:00', 3, 7, 2),
('2029-05-25 11:30:00', 1, 40, 30), ('2029-06-27 09:00:00', 2, 19, 4), ('2029-07-29 15:00:00', 1, 54, 18),
('2029-08-30 14:00:00', 5, 2, 1), ('2029-09-23 10:00:00', 1, 36, 11), ('2029-10-30 15:00:00', 2, 45, 25),
('2029-11-01 11:30:00', 1, 5, 28), ('2029-12-02 09:00:00', 3, 59, 15), ('2029-01-02 14:00:00', 1, 21, 7),
('2029-02-03 10:30:00', 2, 34, 14), ('2029-03-06 15:00:00', 1, 46, 20), ('2029-04-07 14:00:00', 4, 10, 1),
('2029-05-09 11:30:00', 1, 61, 23), ('2029-06-10 09:00:00', 2, 25, 9), ('2029-07-12 15:00:00', 1, 38, 17),
('2029-08-13 14:00:00', 3, 52, 3), ('2029-09-23 10:00:00', 1, 12, 12),('2029-01-03 15:00:00', 2, 73, 41),
('2024-01-04 11:30:00', 1, 88, 55), ('2024-01-06 09:00:00', 3, 15, 2),
('2024-01-07 14:00:00', 1, 99, 33), ('2024-01-09 10:30:00', 2, 4, 48), ('2024-01-10 15:00:00', 1, 68, 19),
('2024-01-13 14:00:00', 4, 29, 1), ('2024-01-14 09:00:00', 1, 81, 50), ('2024-01-16 15:00:00', 2, 37, 27),
('2024-01-17 11:30:00', 1, 95, 7), ('2024-01-20 14:00:00', 3, 53, 38), ('2024-01-22 09:00:00', 1, 11, 44),
('2024-01-23 15:00:00', 2, 77, 13), ('2024-01-25 11:30:00', 1, 62, 58), ('2024-01-27 09:00:00', 1, 23, 22),
('2024-01-29 14:00:00', 2, 91, 3), ('2024-01-31 10:30:00', 1, 49, 40), ('2024-02-01 15:00:00', 3, 8, 17),
('2024-02-04 11:30:00', 1, 72, 51), ('2024-02-06 09:00:00', 2, 33, 29), ('2024-02-07 14:00:00', 1, 89, 5),
('2024-02-08 15:00:00', 4, 1, 1), ('2024-02-10 11:30:00', 1, 66, 36), ('2024-02-11 09:00:00', 2, 25, 45),
('2024-02-12 14:00:00', 1, 84, 11), ('2024-02-14 09:00:00', 1, 43, 53), ('2024-02-16 15:00:00', 2, 98, 24),
('2024-02-18 14:00:00', 3, 18, 9), ('2024-02-19 11:30:00', 1, 59, 31), ('2024-02-21 09:00:00', 2, 3, 47),
('2024-02-22 15:00:00', 1, 76, 15), ('2024-02-23 14:00:00', 1, 51, 57), ('2024-02-25 10:30:00', 3, 28, 6),
('2024-02-26 15:00:00', 2, 86, 34), ('2024-02-27 14:00:00', 1, 14, 49), ('2024-03-02 11:30:00', 4, 47, 1),
('2024-03-03 15:00:00', 1, 93, 20), ('2024-03-05 09:00:00', 2, 21, 42), ('2024-03-06 14:00:00', 1, 79, 10),
('2024-03-07 11:30:00', 3, 6, 52), ('2024-03-09 15:00:00', 1, 64, 26), ('2024-03-11 09:00:00', 2, 39, 39),
('2024-03-13 14:00:00', 1, 96, 4), ('2024-03-14 11:30:00', 1, 31, 46), ('2024-03-15 15:00:00', 2, 83, 18),
('2024-03-17 11:30:00', 3, 12, 32), ('2024-03-18 14:00:00', 1, 56, 54), ('2024-03-20 09:00:00', 2, 27, 23),
('2024-03-22 15:00:00', 1, 92, 8), ('2024-03-24 11:30:00', 4, 42, 1), ('2024-03-25 15:00:00', 1, 70, 37),
('2024-03-26 09:00:00', 2, 17, 43), ('2024-03-28 14:00:00', 1, 88, 12), ('2024-03-29 11:30:00', 3, 35, 56),
('2024-03-30 15:00:00', 1, 54, 28), ('2024-04-01 09:00:00', 2, 9, 35), ('2024-04-02 14:00:00', 1, 75, 5),
('2024-04-04 11:30:00', 1, 45, 41), ('2024-04-05 09:00:00', 2, 97, 16), ('2024-04-07 14:00:00', 3, 22, 30),
('2024-04-08 15:00:00', 1, 69, 50), ('2024-04-09 11:30:00', 2, 5, 25), ('2024-04-11 09:00:00', 1, 82, 2),
('2024-04-13 15:00:00', 4, 34, 1), ('2024-04-15 11:30:00', 1, 100, 48), ('2025-04-16 09:00:00', 2, 63, 21),
('2025-04-17 14:00:00', 1, 26, 55), ('2025-04-19 11:30:00', 3, 71, 14), ('2025-04-20 09:00:00', 1, 48, 39),
('2025-04-21 15:00:00', 2, 90, 7), ('2025-04-23 14:00:00', 1, 16, 51), ('2025-04-25 10:30:00', 1, 67, 29),
('2025-04-27 15:00:00', 2, 32, 4), ('2025-04-29 14:00:00', 3, 87, 33), ('2025-04-30 11:30:00', 1, 20, 47),
('2025-05-01 15:00:00', 2, 74, 19), ('2025-05-02 14:00:00', 1, 50, 58), ('2025-05-03 11:30:00', 4, 13, 1),
('2025-05-05 15:00:00', 1, 85, 36), ('2025-05-06 14:00:00', 2, 24, 42), ('2025-05-08 15:00:00', 1, 61, 10),
('2025-05-10 11:30:00', 3, 36, 53), ('2025-05-12 14:00:00', 1, 94, 26), ('2025-05-13 15:00:00', 2, 41, 40),
('2025-05-16 09:00:00', 1, 78, 8), ('2025-05-17 14:00:00', 1, 52, 45), ('2025-05-18 15:00:00', 2, 99, 17),
('2025-05-20 09:00:00', 3, 2, 32), ('2025-05-21 15:00:00', 1, 58, 56), ('2025-05-22 14:00:00', 2, 30, 23),
('2025-05-24 11:30:00', 1, 80, 6), ('2025-05-26 15:00:00', 4, 46, 1), ('2025-05-28 14:00:00', 1, 65, 38),
('2025-05-29 11:30:00', 2, 10, 44), ('2025-05-31 15:00:00', 1, 73, 14), ('2025-06-01 09:00:00', 3, 44, 57),
('2025-06-03 14:00:00', 1, 19, 28), ('2025-06-04 15:00:00', 2, 88, 52), ('2025-06-06 09:00:00', 1, 55, 31),
('2025-06-07 14:00:00', 3, 29, 9), ('2025-06-08 15:00:00', 1, 91, 49), ('2025-06-11 09:00:00', 2, 7, 24),
('2025-06-12 14:00:00', 4, 66, 1), ('2025-06-14 15:00:00', 1, 40, 41), ('2025-06-15 11:30:00', 2, 81, 16),
('2025-06-17 09:00:00', 1, 1, 54), ('2025-06-18 14:00:00', 3, 57, 3), ('2025-06-20 15:00:00', 1, 33, 46),
('2025-06-22 09:00:00', 2, 75, 20), ('2025-06-23 14:00:00', 1, 48, 58), ('2025-06-24 15:00:00', 1, 96, 27),
('2025-06-26 09:00:00', 2, 20, 37), ('2025-06-27 14:00:00', 1, 68, 8), ('2025-06-28 15:00:00', 3, 11, 43),
('2025-06-30 09:00:00', 1, 84, 13), ('2025-07-01 14:00:00', 2, 53, 50), ('2025-07-02 15:00:00', 1, 25, 30),
('2025-07-04 11:30:00', 4, 72, 1), ('2025-07-05 14:00:00', 1, 4, 34), ('2025-07-06 15:00:00', 2, 93, 11),
('2025-07-08 15:00:00', 1, 38, 48), ('2025-07-09 14:00:00', 1, 63, 22), ('2025-07-10 15:00:00', 2, 15, 53),
('2025-07-13 09:00:00', 3, 89, 6), ('2025-07-14 14:00:00', 1, 42, 32), ('2025-07-16 15:00:00', 2, 99, 51),
('2025-07-17 09:00:00', 1, 28, 17), ('2025-07-18 14:00:00', 1, 77, 56), ('2025-07-20 15:00:00', 3, 50, 5),
('2025-07-21 09:00:00', 2, 23, 35), ('2025-07-22 14:00:00', 1, 60, 45), ('2025-07-24 15:00:00', 4, 9, 1),
('2025-07-26 09:00:00', 1, 71, 25), ('2025-07-28 14:00:00', 2, 36, 40), ('2025-07-29 15:00:00', 1, 86, 15),
('2025-07-30 09:00:00', 3, 12, 55), ('2025-08-01 14:00:00', 1, 67, 29), ('2025-08-02 15:00:00', 2, 31, 38),
('2025-08-03 15:00:00', 1, 95, 2), ('2025-08-05 14:00:00', 1, 51, 44), ('2025-08-06 15:00:00', 2, 22, 19),
('2025-08-07 15:00:00', 3, 79, 7), ('2025-08-09 14:00:00', 1, 18, 52), ('2025-08-10 15:00:00', 2, 83, 23),
('2025-08-11 15:00:00', 1, 41, 57), ('2025-08-13 09:00:00', 5, 6, 1), ('2025-08-15 14:00:00', 1, 92, 28),
('2025-08-17 15:00:00', 2, 30, 42), ('2025-08-19 09:00:00', 1, 65, 10), ('2025-08-21 14:00:00', 3, 10, 49),
('2025-08-22 15:00:00', 1, 87, 21), ('2025-08-23 09:00:00', 2, 34, 39), ('2025-08-25 14:00:00', 1, 98, 4),
('2025-08-26 15:00:00', 1, 56, 47), ('2025-08-27 09:00:00', 2, 27, 18), ('2025-08-29 14:00:00', 3, 73, 31),
('2025-08-30 15:00:00', 1, 49, 54), ('2025-08-31 09:00:00', 2, 94, 24), ('2025-09-01 14:00:00', 1, 14, 8),
('2025-09-02 15:00:00', 4, 69, 1), ('2025-09-03 09:00:00', 1, 39, 36), ('2025-09-04 14:00:00', 2, 85, 43),
('2025-09-05 15:00:00', 1, 17, 12), ('2025-09-06 09:00:00', 3, 62, 55), ('2025-09-07 14:00:00', 1, 32, 26),
('2025-09-08 15:00:00', 2, 78, 33), ('2025-09-09 09:00:00', 1, 5, 2), ('2025-09-10 14:00:00', 1, 58, 46),
('2025-09-11 15:00:00', 2, 26, 16), ('2025-09-12 09:00:00', 3, 76, 30), ('2025-09-13 14:00:00', 1, 43, 50),
('2025-09-14 15:00:00', 2, 97, 22), ('2025-09-15 09:00:00', 1, 21, 58), ('2025-09-16 14:00:00', 4, 16, 1),
('2025-09-17 02:00:00', 1, 70, 34), ('2025-09-18 09:00:00', 2, 35, 41), ('2025-09-19 14:00:00', 1, 80, 11),
('2025-09-20 15:00:00', 3, 13, 53), ('2025-09-21 09:00:00', 1, 64, 25), ('2025-09-22 14:00:00', 2, 37, 37),
('2025-09-22 15:00:00', 1, 82, 7), ('2025-09-22 09:00:00', 1, 54, 48), ('2025-09-23 14:00:00', 2, 100, 19),
('2025-09-23 15:00:00', 3, 45, 9), ('2025-09-23 09:00:00', 1, 90, 35), ('2025-09-23 14:00:00', 2, 24, 51),
('2025-09-23 09:00:00', 1, 74, 14), ('2025-09-23 15:00:00', 4, 3, 1), ('2025-09-23 09:00:00', 1, 61, 29),
('2025-01-15 15:00:00', 2, 88, 75), ('2025-01-19 09:00:00', 1, 12, 105), ('2025-01-23 14:00:00', 3, 45, 99),
('2025-01-28 19:00:00', 1, 92, 63), ('2025-02-02 15:00:00', 2, 2, 112), ('2025-02-05 09:00:00', 1, 67, 81),
('2025-02-10 14:00:00', 4, 33, 1), ('2025-02-14 09:00:00', 1, 78, 92), ('2025-02-18 14:00:00', 2, 21, 125),
('2025-02-22 09:00:00', 1, 58, 78), ('2025-02-27 14:00:00', 3, 19, 101), ('2025-03-03 09:00:00', 1, 85, 88),
('2025-03-08 14:00:00', 2, 40, 117), ('2025-03-12 09:00:00', 1, 99, 69), ('2025-03-17 14:00:00', 1, 14, 95),
('2025-03-21 09:00:00', 2, 73, 83), ('2025-03-26 14:00:00', 1, 30, 128), ('2025-04-01 09:00:00', 3, 5, 110),
('2025-04-05 14:00:00', 1, 64, 73), ('2025-04-10 09:00:00', 2, 28, 98), ('2025-04-14 14:00:00', 1, 81, 104),
('2025-04-19 09:00:00', 4, 1, 1), ('2025-04-23 14:00:00', 1, 53, 65), ('2025-04-28 09:00:00', 2, 17, 122),
('2025-05-02 07:00:00', 1, 96, 77), ('2025-05-07 09:00:00', 1, 38, 108), ('2025-05-11 14:00:00', 2, 62, 91),
('2025-05-16 01:00:00', 3, 25, 85), ('2025-05-20 08:00:00', 1, 77, 115), ('2025-05-25 14:00:00', 2, 43, 70),
('2025-05-30 03:00:00', 1, 90, 120), ('2025-06-03 19:00:00', 4, 22, 1), ('2025-06-08 14:00:00', 1, 69, 89),
('2025-06-12 22:00:00', 2, 11, 111), ('2025-06-17 24:00:00', 1, 55, 68), ('2025-06-21 00:00:00', 3, 3, 102),
('2025-06-26 21:00:00', 1, 88, 76), ('2025-07-01 00:00:00', 2, 34, 118), ('2025-07-05 00:00:00', 1, 71, 93),
('2025-07-10 17:00:00', 1, 16, 126), ('2025-07-15 23:00:00', 2, 59, 82), ('2025-07-20 00:32:00', 3, 8, 97),
('2025-07-25 00:00:00', 1, 94, 64), ('2025-07-30 00:00:00', 2, 29, 109), ('2025-08-05 00:00:00', 1, 75, 124),
('2025-08-11 00:00:00', 4, 48, 1), ('2025-08-18 00:00:00', 1, 9, 80), ('2025-08-26 00:00:00', 2, 66, 114),
('2025-09-04 00:00:00', 1, 36, 96), ('2025-09-15 00:00:00', 3, 50, 121);

INSERT INTO oper.Enfermidades (NomeEnferm, DescrEnferm) VALUES
('Hipertensão', 'Condição em que a força do sangue contra a parede das artérias é muito grande.'),
('Diabetes Mellitus Tipo 2', 'Distúrbio metabólico caracterizado por alto nível de glicose no sangue.'),
('Asma', 'Doença inflamatória crônica das vias aéreas.'),
('Colesterol Alto (Dislipidemia)', 'Níveis elevados de gorduras (lipídios) no sangue.'),
('Enxaqueca Crônica', 'Dores de cabeça recorrentes, muitas vezes acompanhadas de outros sintomas.')
ON CONFLICT (NomeEnferm) DO NOTHING;

INSERT INTO oper.Enfermidades (NomeEnferm, DescrEnferm) VALUES
('Rinite Alérgica', 'Inflamação da mucosa nasal devido a uma reação alérgica.'),
('Gastrite Crônica', 'Inflamação do revestimento do estômago de longa duração.'),
('Refluxo Gastroesofágico', 'Retorno do conteúdo do estômago para o esôfago, causando azia.'),
('Ansiedade Generalizada', 'Preocupação e tensão excessivas e persistentes sobre eventos ou atividades.'),
('Depressão', 'Transtorno de humor que causa um sentimento persistente de tristeza e perda de interesse.'),
('Artrite Reumatoide', 'Doença inflamatória crônica que afeta principalmente as articulações.'),
('Osteoporose', 'Condição que enfraquece os ossos, tornando-os frágeis e mais propensos a quebrar.'),
('Dermatite Atópica', 'Condição que causa secura, coceira e inflamação na pele.'),
('Psoríase', 'Doença de pele que causa manchas vermelhas e escamosas que coçam.'),
('Hipotireoidismo', 'Condição na qual a glândula tireoide não produz hormônios suficientes.'),
('Insônia Crônica', 'Dificuldade persistente para adormecer ou permanecer dormindo.'),
('Hiperplasia Prostática Benigna', 'Aumento não canceroso da próstata, comum em homens mais velhos.'),
('Glaucoma', 'Doença ocular que causa danos ao nervo óptico e pode levar à cegueira.'),
('Insuficiência Cardíaca', 'Condição na qual o coração não consegue bombear sangue suficiente para o corpo.'),
('Labirintite', 'Inflamação de uma parte do ouvido interno, causando tontura e vertigem.')
ON CONFLICT (NomeEnferm) DO NOTHING;

INSERT INTO oper.CliEnferm (IDCliente, IDEnfermidade, DtCadEnferm) VALUES
(3, 1, '2023-05-10'), (98, 2, '2024-01-15'), (15, 3, '2022-11-20'),
(42, 4, '2023-08-01'), (77, 5, '2024-02-28'), (8, 1, '2022-09-05'),
(63, 2, '2023-03-12'), (29, 3, '2024-04-18'), (51, 4, '2022-12-30'),
(90, 5, '2023-07-22'), (12, 1, '2024-05-01'), (81, 2, '2022-10-11'),
(37, 3, '2023-06-14'), (68, 4, '2024-03-09'), (2, 5, '2023-01-25'),
(55, 1, '2023-09-19'), (23, 2, '2024-06-03'), (88, 1, '2022-11-02'),
(4, 3, '2023-04-21'), (72, 4, '2024-07-15'), (18, 5, '2023-02-18'),
(49, 1, '2023-10-29'), (96, 2, '2024-08-11'), (25, 3, '2023-01-07'),
(66, 2, '2023-12-05'), (7, 4, '2024-09-02'), (83, 5, '2023-05-16'),
(31, 1, '2024-01-20'), (58, 2, '2023-11-13'), (11, 3, '2024-08-25'),
(99, 4, '2023-02-01'), (44, 1, '2024-09-10'), (20, 5, '2023-03-27'),
(70, 2, '2024-07-30'), (36, 1, '2023-04-05'), (64, 4, '2024-06-19'),
(1, 2, '2023-08-17'), (87, 3, '2024-05-23'), (53, 5, '2023-10-01'),
(22, 1, '2024-02-14');


INSERT INTO oper.CliCompraProd (DataHoraCompra, Quantidade, IDCliente, IDProduto) VALUES
('2025-01-02 10:00:00', 1, 88, 118), ('2025-01-02 11:00:00', 2, 45, 201), ('2025-01-03 12:00:00', 1, 22, 290),
('2025-01-03 13:00:00', 3, 5, 45), ('2025-01-04 14:00:00', 1, 55, 133), ('2025-01-04 15:00:00', 2, 33, 22),
('2025-01-05 16:00:00', 1, 19, 177), ('2025-01-05 17:00:00', 4, 48, 1), ('2025-01-06 18:00:00', 1, 7, 255),
('2025-01-06 19:00:00', 2, 60, 88), ('2025-01-07 20:00:00', 1, 2, 199), ('2025-01-07 21:00:00', 3, 41, 288),
('2025-01-08 22:00:00', 1, 28, 50), ('2025-01-08 23:00:00', 2, 1, 160), ('2025-01-09 00:00:00', 1, 52, 240),
('2025-01-09 01:00:00', 1, 38, 77), ('2025-01-10 02:00:00', 2, 16, 142), ('2025-01-10 03:00:00', 3, 49, 271),
('2025-01-11 04:00:00', 1, 23, 93), ('2025-01-11 05:00:00', 2, 57, 18), ('2025-01-12 06:00:00', 1, 10, 218),
('2025-01-12 07:00:00', 4, 3, 1), ('2025-01-13 08:00:00', 1, 51, 122), ('2025-01-13 09:00:00', 2, 26, 263),
('2025-01-14 10:00:00', 1, 12, 68), ('2025-01-14 11:00:00', 3, 44, 175), ('2025-01-15 12:00:00', 1, 31, 137),
('2025-01-15 13:00:00', 2, 9, 35), ('2025-01-16 14:00:00', 1, 56, 155), ('2025-01-16 15:00:00', 1, 20, 222),
('2025-01-17 16:00:00', 2, 36, 81), ('2025-01-17 17:00:00', 3, 4, 190), ('2025-01-18 18:00:00', 1, 40, 277),
('2025-01-18 19:00:00', 4, 24, 1), ('2025-01-19 20:00:00', 1, 59, 100), ('2025-01-19 21:00:00', 2, 14, 248),
('2025-01-20 22:00:00', 1, 34, 43), ('2025-01-20 23:00:00', 1, 6, 166), ('2025-01-21 00:00:00', 2, 46, 230),
('2025-01-21 01:00:00', 3, 17, 99), ('2025-01-22 02:00:00', 1, 53, 211), ('2025-01-22 03:00:00', 4, 29, 281),
('2025-01-23 04:00:00', 1, 8, 59), ('2025-01-23 05:00:00', 2, 50, 183), ('2025-01-24 06:00:00', 1, 21, 250),
('2025-01-24 07:00:00', 1, 43, 72), ('2025-01-25 08:00:00', 2, 18, 148), ('2025-01-25 09:00:00', 3, 54, 192),
('2025-01-26 10:00:00', 1, 27, 28), ('2025-01-26 11:00:00', 4, 35, 1), ('2025-01-27 12:00:00', 1, 47, 192),
('2025-01-27 13:00:00', 2, 11, 269), ('2025-01-28 14:00:00', 1, 32, 90), ('2025-01-28 15:00:00', 1, 58, 170),
('2025-01-29 16:00:00', 2, 25, 235), ('2025-01-29 17:00:00', 3, 37, 62), ('2025-01-30 18:00:00', 1, 13, 205),
('2025-01-30 19:00:00', 4, 42, 285), ('2025-01-31 20:00:00', 1, 22, 108), ('2025-01-31 21:00:00', 2, 61, 15),
('2025-02-01 22:00:00', 1, 30, 225), ('2025-02-01 23:00:00', 1, 7, 116), ('2025-02-02 00:00:00', 2, 48, 188),
('2025-02-02 01:00:00', 3, 19, 266), ('2025-02-03 02:00:00', 1, 50, 49), ('2025-02-03 03:00:00', 4, 28, 1),
('2025-02-04 04:00:00', 1, 63, 138), ('2025-02-04 05:00:00', 2, 29, 217), ('2025-02-05 06:00:00', 1, 90, 84),
('2025-02-05 07:00:00', 1, 51, 162), ('2025-02-06 08:00:00', 2, 98, 244), ('2025-02-06 09:00:00', 3, 12, 39),
('2025-02-07 10:00:00', 1, 68, 200), ('2025-02-07 11:00:00', 4, 41, 123), ('2025-02-08 12:00:00', 1, 81, 129),
('2025-02-08 13:00:00', 2, 37, 195), ('2025-02-09 14:00:00', 1, 77, 261), ('2025-02-09 15:00:00', 1, 99, 96),
('2025-02-10 16:00:00', 2, 2, 151), ('2025-02-10 17:00:00', 3, 55, 233), ('2025-02-11 18:00:00', 1, 23, 75),
('2025-02-11 19:00:00', 4, 65, 1), ('2025-02-12 20:00:00', 1, 33, 180), ('2025-02-12 21:00:00', 2, 72, 253),
('2025-02-13 22:00:00', 1, 45, 112), ('2025-02-13 23:00:00', 1, 88, 198), ('2025-02-14 00:00:00', 2, 14, 274),
('2025-02-14 01:00:00', 3, 52, 52), ('2025-02-15 02:00:00', 1, 30, 215), ('2025-02-15 03:00:00', 4, 69, 287),
('2025-02-16 04:00:00', 1, 40, 125), ('2025-02-16 05:00:00', 2, 79, 17), ('2025-02-17 06:00:00', 1, 56, 242),
('2025-02-17 07:00:00', 1, 97, 103), ('2025-02-18 08:00:00', 2, 19, 185), ('2025-02-18 09:00:00', 3, 62, 259),
('2025-02-19 10:00:00', 1, 31, 33), ('2025-02-19 11:00:00', 4, 71, 1), ('2025-02-20 12:00:00', 1, 42, 158),
('2025-02-20 13:00:00', 2, 82, 227), ('2025-02-21 14:00:00', 1, 26, 91), ('2025-02-21 15:00:00', 1, 64, 144),
('2025-02-22 16:00:00', 2, 38, 209), ('2025-02-22 17:00:00', 3, 76, 66), ('2025-02-23 18:00:00', 1, 1, 238),
('2025-02-23 19:00:00', 4, 50, 235), ('2025-02-24 20:00:00', 1, 94, 119), ('2025-02-24 21:00:00', 2, 11, 193),
('2025-02-25 22:00:00', 1, 43, 272), ('2025-02-25 23:00:00', 1, 84, 41), ('2025-02-26 00:00:00', 2, 28, 173),
('2025-02-26 01:00:00', 3, 68, 247), ('2025-02-27 02:00:00', 1, 22, 107), ('2025-02-27 03:00:00', 4, 59, 1),
('2025-02-28 04:00:00', 1, 99, 164), ('2025-02-28 05:00:00', 2, 8, 220), ('2025-03-01 06:00:00', 1, 47, 78),
('2025-03-01 07:00:00', 1, 85, 135), ('2025-03-02 08:00:00', 2, 30, 203), ('2025-03-02 09:00:00', 3, 72, 55),
('2025-03-03 10:00:00', 1, 19, 231), ('2025-03-03 11:00:00', 4, 61, 284), ('2025-03-04 12:00:00', 1, 37, 123),
('2025-03-04 22:20:00', 2, 76, 29), ('2025-03-05 00:00:00', 1, 54, 213), ('2025-03-05 01:00:00', 1, 97, 147),
('2025-03-06 21:22:30', 2, 17, 197), ('2025-03-06 17:47:20', 3, 60, 275), ('2025-03-07 14:00:00', 1, 33, 86),
('2025-03-07 13:47:38', 4, 75, 1), ('2025-03-08 12:00:00', 1, 41, 169), ('2025-03-08 12:00:00', 2, 80, 237),
('2025-03-09 14:00:00', 1, 23, 115), ('2025-03-09 12:00:00', 1, 63, 181), ('2025-03-10 12:00:00', 2, 39, 252),
('2025-03-10 20:00:00', 3, 79, 71), ('2025-03-11 12:00:00', 1, 5, 224), ('2025-03-11 12:00:00', 4, 52, 286),
('2025-03-12 12:00:00', 1, 93, 131), ('2025-03-12 12:00:00', 2, 12, 191), ('2025-03-13 12:00:00', 1, 45, 265),
('2025-03-13 12:00:00', 1, 88, 102), ('2025-03-14 12:00:00', 2, 27, 153), ('2025-03-14 12:00:00', 3, 69, 219),
('2025-03-15 19:00:00', 1, 38, 95), ('2025-03-15 12:00:00', 4, 78, 1), ('2025-03-16 12:00:00', 1, 49, 176),
('2025-03-16 12:00:00', 2, 89, 241), ('2025-03-17 12:00:00', 1, 14, 127), ('2025-03-17 12:00:00', 1, 57, 187),
('2025-03-18 12:00:00', 2, 35, 258), ('2025-03-18 12:00:00', 3, 74, 44), ('2025-03-19 12:00:00', 1, 24, 229),
('2025-03-19 12:00:00', 4, 62, 289), ('2025-03-20 12:00:00', 1, 40, 111), ('2025-03-20 12:00:00', 2, 83, 20),
('2025-03-21 12:00:00', 1, 9, 208), ('2025-03-21 12:00:00', 1, 56, 150), ('2025-03-22 12:00:00', 2, 32, 202),
('2025-03-22 12:00:00', 3, 71, 282), ('2025-03-23 12:00:00', 1, 20, 64), ('2025-03-23 12:00:00', 4, 60, 1),
('2025-03-24 12:00:00', 1, 95, 140), ('2025-03-24 12:00:00', 2, 16, 214), ('2025-03-25 12:00:00', 1, 46, 73),
('2025-03-25 23:00:00', 1, 86, 130), ('2025-03-26 12:00:00', 2, 31, 194), ('2025-03-26 12:00:00', 3, 68, 264),
('2025-03-27 02:00:00', 1, 25, 118), ('2025-03-27 03:00:00', 4, 64, 190), ('2025-03-28 12:00:00', 1, 39, 184),
('2025-03-28 18:00:00', 2, 79, 14), ('2025-03-29 12:00:00', 1, 53, 249), ('2025-03-29 12:00:00', 1, 96, 137),
('2025-03-30 12:00:00', 2, 15, 206), ('2025-03-30 12:00:00', 3, 58, 276), ('2025-03-31 12:00:00', 1, 34, 104),
('2025-03-31 13:30:20', 4, 76, 1), ('2025-04-01 21:00:00', 1, 42, 161), ('2025-04-01 12:00:00', 2, 82, 223),
('2025-04-02 12:00:00', 1, 29, 98), ('2025-04-02 12:00:00', 1, 67, 156), ('2025-04-03 12:00:00', 2, 36, 212),
('2025-04-03 12:00:00', 3, 75, 80), ('2025-04-04 12:00:00', 1, 51, 234), ('2025-04-04 12:00:00', 4, 92, 283),
('2025-04-05 12:00:00', 1, 8, 143), ('2025-04-05 12:00:00', 2, 50, 24), ('2025-04-06 12:00:00', 1, 90, 226),
('2025-04-06 12:00:00', 1, 11, 165), ('2025-04-07 12:00:00', 2, 45, 216), ('2025-04-07 12:00:00', 3, 85, 279),
('2025-04-08 12:00:00', 1, 30, 121), ('2025-04-08 12:00:00', 4, 70, 1), ('2025-04-09 12:00:00', 1, 40, 182),
('2025-04-09 12:00:00', 2, 81, 251), ('2025-04-10 12:00:00', 1, 26, 110), ('2025-04-10 12:00:00', 1, 66, 172),
('2025-04-11 12:00:00', 2, 37, 239), ('2025-04-11 12:00:00', 3, 77, 60), ('2025-04-12 12:00:00', 1, 55, 204),
('2025-04-12 12:00:00', 4, 99, 108), ('2025-04-13 12:00:00', 1, 19, 134), ('2025-04-13 12:00:00', 2, 59, 196),
('2025-04-14 12:00:00', 1, 35, 268), ('2025-04-14 12:00:00', 1, 76, 47), ('2025-04-15 12:00:00', 2, 44, 157),
('2025-04-15 12:00:00', 3, 84, 221), ('2025-04-16 12:00:00', 1, 27, 114), ('2025-04-16 12:00:00', 4, 65, 1),
('2025-04-17 12:00:00', 1, 38, 179), ('2025-04-17 12:00:00', 2, 78, 243), ('2025-04-18 12:00:00', 1, 52, 106),
('2025-04-18 12:00:00', 1, 92, 168), ('2025-04-19 12:00:00', 2, 13, 232), ('2025-04-19 12:00:00', 3, 54, 87),
('2025-04-20 12:00:00', 1, 31, 210), ('2025-04-20 12:00:00', 4, 72, 81), ('2025-04-21 12:00:00', 1, 47, 132),
('2025-04-21 12:00:00', 2, 88, 38), ('2025-04-22 12:00:00', 1, 10, 228), ('2025-04-22 12:00:00', 1, 56, 149),
('2025-04-23 12:00:00', 2, 33, 207), ('2025-04-23 12:00:00', 3, 73, 273), ('2025-04-24 12:00:00', 1, 48, 69),
('2025-04-24 12:00:00', 4, 90, 1), ('2025-04-25 12:00:00', 1, 17, 154), ('2025-04-25 12:00:00', 2, 60, 218),
('2025-04-26 17:00:00', 1, 36, 109), ('2025-04-26 17:00:00', 1, 79, 163), ('2025-04-27 12:00:00', 2, 43, 236),
('2025-04-27 12:00:00', 3, 83, 94), ('2025-04-28 12:00:00', 1, 25, 200), ('2025-04-28 12:00:00', 4, 66, 280),
('2025-04-29 12:00:00', 1, 39, 128), ('2025-04-29 12:00:00', 2, 80, 23), ('2025-04-30 12:00:00', 1, 53, 189),
('2025-04-30 12:00:00', 1, 94, 152), ('2025-05-01 12:00:00', 2, 15, 213), ('2025-05-01 12:00:00', 3, 58, 270),
('2025-05-02 12:00:00', 1, 34, 117), ('2025-05-02 12:00:00', 4, 74, 1), ('2025-05-03 12:00:00', 1, 46, 174),
('2025-05-03 12:00:00', 2, 87, 246), ('2025-05-04 12:00:00', 1, 28, 101), ('2025-05-04 12:00:00', 1, 69, 167),
('2025-05-05 12:00:00', 2, 38, 224), ('2025-05-05 12:00:00', 3, 79, 74), ('2025-05-06 04:00:00', 1, 54, 254),
('2025-05-06 04:00:00', 4, 95, 69), ('2025-05-07 05:00:00', 1, 16, 139), ('2025-05-07 06:00:00', 2, 61, 20),
('2025-05-08 07:00:00', 1, 37, 193), ('2025-05-08 08:00:00', 1, 78, 146), ('2025-05-09 09:00:00', 2, 42, 212),
('2025-05-09 10:00:00', 3, 82, 278), ('2025-05-10 11:00:00', 1, 29, 126), ('2025-05-10 12:00:00', 4, 68, 1),
('2025-05-11 12:00:00', 1, 41, 186), ('2025-05-11 12:00:00', 2, 81, 257), ('2025-05-12 12:00:00', 1, 24, 113),
('2025-05-12 12:00:00', 1, 63, 178), ('2025-05-13 12:00:00', 2, 36, 244), ('2025-05-13 12:00:00', 3, 76, 92),
('2025-05-14 14:00:00', 1, 50, 222), ('2025-05-14 14:00:00', 4, 91, 288), ('2025-05-15 14:00:00', 1, 12, 141);

INSERT INTO oper.Estoque (IDMunicipio) VALUES
(50), (2); -- IDMunicipio 50 e 2 existem na tabela populada anteriormente.


-- Bloco de Inserção de Produtos 1
WITH novosprodutos AS (
    INSERT INTO oper.Produto (NomeProduto, DescrProd, PrecVenda, DtValidade, IDEstoque) VALUES
    ('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2026-11-30', 10),
    ('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2027-05-31', 11),
    ('Lenços Umedecidos Antissépticos', 'Pacote com 20 lenços para higienização das mãos.', 15.00, '2026-09-30', 12),
    ('Ômega 3 1000mg 120 cápsulas', 'Suplemento de óleo de peixe rico em EPA e DHA.', 89.90, '2027-02-28', 13),
    ('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2026-10-31', 14),
    ('Seringa Descartável 5ml com Agulha', 'Produto estéril para aplicação de medicamentos.', 2.50, '2028-12-31', 15),
    ('Algodão em Bolas 100g', 'Algodão hidrófilo para higiene e cuidados com a pele.', 7.20, '2029-01-01', 16),
    ('Aparelho de Pressão Digital de Pulso', 'Monitoramento prático e rápido da pressão arterial.', 180.00, '2031-01-01', 17),
    ('Pasta de Dente Gengivas Sensíveis', 'Creme dental para alívio da sensibilidade.', 12.50, '2026-07-31', 18),
    ('Enxaguante Bucal Sem Álcool', 'Proteção anticáries e hálito fresco prolongado.', 22.90, '2027-03-31', 19),
    ('Absorvente Noturno Suave (16 un)', 'Cobertura suave com maior poder de absorção.', 14.80, '2028-01-01', 20),
    ('Coenzima Q10 100mg', 'Suplemento antioxidante para saúde cardiovascular.', 95.00, '2026-08-31', 21),
    ('Pomada para Picada de Inseto', 'Alívio imediato da coceira e irritação.', 25.40, '2027-04-30', 22),
    ('Sal de Frutas (Antiácido)', 'Antiácido para alívio de azia e má digestão.', 8.90, '2026-06-30', 23),
    ('Gase Estéril Pacote (10 un)', 'Compressas de gaze para curativos.', 9.50, '2029-03-31', 4),
    ('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2027-01-01', 5),
    ('Álcool em Gel 70% 500ml', 'Antisséptico para as mãos com hidratante.', 18.00, '2026-12-31', 6),
    ('Bolsa Térmica Gel Quente/Fria', 'Bolsa reutilizável para alívio de dores e lesões.', 35.00, '2032-01-01', 7),
    ('Cortador de Unha Aço Inox', 'Cortador de unhas de alta precisão e durabilidade.', 11.20, '2035-01-01', 8),
    ('Curativo Adesivo à Prova D''água', 'Caixa com 20 curativos resistentes à água.', 13.90, '2028-06-30', 9),
    ('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-01-15', 1),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-02-20', 2),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-03-10', 3),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-04-25', 4),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-05-15', 5),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-06-20', 6),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-07-10', 7),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-08-25', 8),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-09-15', 1),('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2027-10-20', 2),
    ('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-02-01', 3),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-03-05', 4),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-04-10', 5),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-05-20', 6),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-06-01', 7),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-07-05', 8),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-08-10', 1),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-09-20', 2),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-10-01', 3),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-11-05', 4),
    ('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2027-10-01', 5),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2027-11-05', 6),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2027-12-10', 7),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-01-20', 8),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-02-01', 1),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-03-05', 2),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-04-10', 3),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-05-20', 4),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-06-01', 5),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-07-05', 6),
    ('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-01-15', 7),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-02-20', 8),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-03-10', 1),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-04-25', 2),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-05-15', 3),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-06-20', 4),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-07-10', 5),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-08-25', 6),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-09-15', 7),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2028-10-20', 8),
    ('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-05-01', 1),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-06-05', 2),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-07-10', 3),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-08-20', 4),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-09-01', 5),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-10-05', 6),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-11-10', 7),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2027-12-20', 8),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-01-01', 1),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-02-05', 2),
    ('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-01-10', 3),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-02-15', 4),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-03-20', 5),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-04-25', 6),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-05-30', 7),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-06-05', 8),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-07-10', 1),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-08-15', 2),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-09-20', 3),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2027-10-25', 4),
    ('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-03-01', 5),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-04-05', 6),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-05-10', 7),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-06-15', 8),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-07-20', 1),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-08-25', 2),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-09-01', 3),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-10-05', 4),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-11-10', 5),('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2027-12-15', 6),
    ('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-01-01', 7),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-02-05', 8),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-03-10', 1),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-04-15', 2),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-05-20', 3),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-06-25', 4),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-07-01', 5),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-08-05', 6),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-09-10', 7),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-10-15', 8),
    ('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2027-11-01', 1),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2027-12-05', 2),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-01-10', 3),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-02-15', 4),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-03-20', 5),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-04-25', 6),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-05-01', 7),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-06-05', 8),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-07-10', 1),('Teste de Gravidez Digital', 'Resultado rápido e preciso com indicador de semanas.', 45.90, '2028-08-15', 2),
    ('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2030-01-01', 3),('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2030-02-05', 4),('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2030-03-10', 5),('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2030-04-15', 6)
    RETURNING IDProduto, NomeProduto
),
novosmedicamentos AS (
    INSERT INTO oper.Medicamento (IDProduto, Indicacao, Contraindicacao)
    SELECT np.IDProduto,
        CASE np.NomeProduto
            WHEN 'Analgésico Infantil em Gotas' THEN 'Febre e dores leves a moderadas em crianças.'
            WHEN 'Pomada para Picada de Inseto' THEN 'Alívio sintomático de picadas de insetos.'
            WHEN 'Sal de Frutas (Antiácido)' THEN 'Azia, má digestão e excesso de acidez no estômago.'
            WHEN 'Dorflex 36cp' THEN 'Analgésico e relaxante muscular para dores de cabeça tensionais.'
            WHEN 'Tylenol Sinus 24cp' THEN 'Analgésico e descongestionante para gripes e sinusite.'
            WHEN 'Loratadina 10mg 12cp' THEN 'Antialérgico para alívio de sintomas de rinite e urticária.'
        END,
        CASE np.NomeProduto
            WHEN 'Analgésico Infantil em Gotas' THEN 'Alergia ao paracetamol ou componentes.'
            WHEN 'Pomada para Picada de Inseto' THEN 'Não aplicar em feridas abertas ou pele com bolhas.'
            WHEN 'Sal de Frutas (Antiácido)' THEN 'Hipertensão, problemas renais.'
            WHEN 'Dorflex 36cp' THEN 'Alergia a dipirona, glaucoma, miastenia grave.'
            WHEN 'Tylenol Sinus 24cp' THEN 'Alergia a paracetamol, glaucoma, hipertensão grave.'
            WHEN 'Loratadina 10mg 12cp' THEN 'Hipersensibilidade à loratadina.'
        END
    FROM novosprodutos np
    WHERE np.NomeProduto IN ('Analgésico Infantil em Gotas', 'Pomada para Picada de Inseto', 'Sal de Frutas (Antiácido)', 'Dorflex 36cp', 'Tylenol Sinus 24cp', 'Loratadina 10mg 12cp')
    RETURNING IDProduto
)
INSERT INTO oper.ProdCateg (IDProduto, IDCategoria)
SELECT np.IDProduto, c.IDCategoria
FROM novosprodutos np
JOIN oper.Categoria c ON c.NomeCategoria =
    CASE
        WHEN np.NomeProduto = 'Vitamina C Efervescente 1g' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Teste de Gravidez Digital' THEN 'Testes e Diagnósticos'
        WHEN np.NomeProduto = 'Lenços Umedecidos Antissépticos' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Ômega 3 1000mg 120 cápsulas' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Analgésico Infantil em Gotas' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Seringa Descartável 5ml com Agulha' THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Algodão em Bolas 100g' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Aparelho de Pressão Digital de Pulso' THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Pasta de Dente Gengivas Sensíveis' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Enxaguante Bucal Sem Álcool' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Absorvente Noturno Suave (16 un)' THEN 'Cuidados Femininos'
        WHEN np.NomeProduto = 'Coenzima Q10 100mg' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Pomada para Picada de Inseto' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Sal de Frutas (Antiácido)' THEN 'Saúde Digestiva'
        WHEN np.NomeProduto = 'Gase Estéril Pacote (10 un)' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Máscara de Proteção N95' THEN 'Proteção e Segurança'
        WHEN np.NomeProduto = 'Álcool em Gel 70% 500ml' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Bolsa Térmica Gel Quente/Fria' THEN 'Produtos Ortopédicos'
        WHEN np.NomeProduto = 'Cortador de Unha Aço Inox' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Curativo Adesivo à Prova D''água' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Dorflex 36cp' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Protetor Solar Facial FPS 50' THEN 'Proteção Solar'
        WHEN np.NomeProduto = 'Tylenol Sinus 24cp' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Fraldas Infantis Pacote G' THEN 'Saúde Infantil'
        WHEN np.NomeProduto = 'Whey Protein Concentrado 900g' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Creme Dental Branqueador' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Loratadina 10mg 12cp' THEN 'Antialérgicos'
        WHEN np.NomeProduto = 'Preservativo Pacote Leve 8 Pague 6' THEN 'Saúde do Homem'
    END;


-- Bloco de Inserção de Produtos 2
WITH novosprodutos AS (
    INSERT INTO oper.Produto (NomeProduto, DescrProd, PrecVenda, DtValidade, IDEstoque) VALUES
    ('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2027-01-31', 4),
    ('Creme Hidratante Corporal', 'Hidratação profunda para peles secas.', 32.50, '2026-06-30', 5),
    ('Kit de Curativos Avançado', 'Contém band-aids, gaze, antisséptico e esparadrapo.', 25.00, '2028-01-01', 6),
    ('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2026-10-31', 7),
    ('Shampoo Anticaspa', 'Controle eficaz da caspa e oleosidade.', 28.90, '2025-12-31', 8),
    ('Termômetro Digital Infravermelho', 'Medição de temperatura sem contato.', 99.90, '2030-01-01', 9),
    ('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2027-03-31', 10),
    ('Tiras para Glicosímetro (50 un)', 'Tiras reagentes para medição de glicose.', 65.00, '2026-09-30', 11),
    ('Colírio Lubrificante', 'Alívio para olhos secos e irritados.', 22.00, '2025-08-31', 12),
    ('Relaxante Muscular 20cp', 'Indicado para dores e contraturas musculares.', 18.50, '2026-11-30', 13),
    ('Repelente de Insetos Loção', 'Proteção prolongada contra mosquitos.', 19.90, '2027-02-28', 14),
    ('Protetor Labial com Manteiga de Cacau', 'Hidrata e protege os lábios.', 8.50, '2026-07-31', 15),
    ('Fio Dental Menta 50m', 'Fio dental encerado com sabor de menta.', 6.80, '2028-05-31', 16),
    ('Sabonete Líquido Antisséptico', 'Limpeza profunda e proteção contra bactérias.', 12.30, '2026-04-30', 17),
    ('Multivitamínico A-Z Homem', 'Complexo vitamínico para a saúde masculina.', 49.90, '2025-10-31', 18),
    ('Creme para Assaduras', 'Proteção e tratamento para a pele do bebê.', 21.75, '2026-08-31', 19),
    ('Gel para Dores Musculares', 'Gel de massagem para alívio de dores e cansaço.', 35.40, '2027-01-31', 20),
    ('Barra de Proteína Chocolate', 'Lanche prático e nutritivo com 15g de proteína.', 9.00, '2025-07-31', 21),
    ('Água Micelar de Limpeza Facial', 'Limpa, demaquila e purifica a pele.', 42.00, '2026-02-28', 22),
    ('Tala para Punho Ajustável', 'Suporte e imobilização para o punho.', 55.80, '2030-01-01', 23),
    ('Dorflex 36cp', 'Analgésico e relaxante muscular.', 23.50, '2026-12-31', 4),
    ('Neosaldina 30 drágeas', 'Analgésico para dores de cabeça.', 29.90, '2027-01-31', 5),
    ('Escova de Dentes Macia', 'Escova com cerdas macias para gengivas sensíveis.', 14.20, '2029-01-01', 6),
    ('Creme Dental Branqueador', 'Auxilia no clareamento dos dentes.', 9.50, '2026-03-31', 7),
    ('Cálcio + Vitamina D3', 'Suplemento para fortalecimento dos ossos.', 38.00, '2025-11-30', 8),
    ('Antisséptico Bucal Menta Suave', 'Hálito fresco e proteção contra germes.', 25.50, '2026-05-31', 7),
    ('Melatonina 0.21mg', 'Suplemento para auxiliar na indução do sono.', 45.00, '2026-01-31', 11)
    RETURNING IDProduto, NomeProduto
),
novosmedicamentos AS (
    INSERT INTO oper.Medicamento (IDProduto, Indicacao, Contraindicacao)
    SELECT np.IDProduto,
        CASE np.NomeProduto
            WHEN 'Colírio Lubrificante' THEN 'Olhos secos e irritação.'
            WHEN 'Relaxante Muscular 20cp' THEN 'Dores musculares, torcicolo.'
            WHEN 'Dorflex 36cp' THEN 'Dores de cabeça tensionais.'
            WHEN 'Neosaldina 30 drágeas' THEN 'Enxaquecas e dores de cabeça.'
        END,
        CASE np.NomeProduto
            WHEN 'Colírio Lubrificante' THEN 'Alergia a componentes da fórmula.'
            WHEN 'Relaxante Muscular 20cp' THEN 'Glaucoma, miastenia grave.'
            WHEN 'Dorflex 36cp' THEN 'Alergia a dipirona, glaucoma.'
            WHEN 'Neosaldina 30 drágeas' THEN 'Pressão alta, alergia a componentes.'
        END
    FROM novosprodutos np
    WHERE np.NomeProduto IN ('Colírio Lubrificante', 'Relaxante Muscular 20cp', 'Dorflex 36cp', 'Neosaldina 30 drágeas')
    RETURNING IDProduto
)
INSERT INTO oper.ProdCateg (IDProduto, IDCategoria)
SELECT np.IDProduto, c.IDCategoria
FROM novosprodutos np
JOIN oper.Categoria c ON c.NomeCategoria =
    CASE
        WHEN np.NomeProduto = 'Protetor Solar Facial FPS 50' THEN 'Proteção Solar'
        WHEN np.NomeProduto = 'Creme Hidratante Corporal' THEN 'Cuidados Corporais'
        WHEN np.NomeProduto = 'Kit de Curativos Avançado' THEN 'Primeiros Socorros'
        WHEN np.NomeProduto = 'Whey Protein Concentrado 900g' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Shampoo Anticaspa' THEN 'Cabelos e Unhas'
        WHEN np.NomeProduto = 'Termômetro Digital Infravermelho' THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Fraldas Infantis Pacote G' THEN 'Saúde Infantil'
        WHEN np.NomeProduto = 'Tiras para Glicosímetro (50 un)' THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Colírio Lubrificante' THEN 'Saúde Ocular e Colírios'
        WHEN np.NomeProduto = 'Relaxante Muscular 20cp' THEN 'Relaxantes Musculares'
        WHEN np.NomeProduto = 'Repelente de Insetos Loção' THEN 'Repelentes e Inseticidas'
        WHEN np.NomeProduto = 'Protetor Labial com Manteiga de Cacau' THEN 'Cuidados Corporais'
        WHEN np.NomeProduto = 'Fio Dental Menta 50m' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Sabonete Líquido Antisséptico' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Multivitamínico A-Z Homem' THEN 'Saúde do Homem'
        WHEN np.NomeProduto = 'Creme para Assaduras' THEN 'Saúde Infantil'
        WHEN np.NomeProduto = 'Gel para Dores Musculares' THEN 'Relaxantes Musculares'
        WHEN np.NomeProduto = 'Barra de Proteína Chocolate' THEN 'Nutrição Esportiva'
        WHEN np.NomeProduto = 'Água Micelar de Limpeza Facial' THEN 'Cuidados Faciais'
        WHEN np.NomeProduto = 'Tala para Punho Ajustável' THEN 'Produtos Ortopédicos'
        WHEN np.NomeProduto = 'Dorflex 36cp' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Neosaldina 30 drágeas' THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Escova de Dentes Macia' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Creme Dental Branqueador' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Cálcio + Vitamina D3' THEN 'Vitaminas'
        WHEN np.NomeProduto = 'Antisséptico Bucal Menta Suave' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Melatonina 0.21mg' THEN 'Suplementos Alimentares'
    END;

-- Garante que as novas categorias necessárias existam.
INSERT INTO oper.Categoria (NomeCategoria) VALUES
('Cuidados Masculinos'),
('Cosméticos')
ON CONFLICT (NomeCategoria) DO NOTHING;

-- Bloco de Inserção de Produtos 3
WITH novosprodutos AS (
    INSERT INTO oper.Produto (NomeProduto, DescrProd, PrecVenda, DtValidade, IDEstoque) VALUES
    ('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2027-08-31', 4),
    ('Xarope para Tosse Seca 120ml', 'Xarope para alívio da tosse seca e irritativa.', 25.50, '2026-09-30', 5),
    ('Xarope Expectorante 120ml', 'Auxilia na eliminação do catarro em gripes e resfriados.', 27.80, '2026-10-31', 6),
    ('Descongestionante Nasal Adulto', 'Solução nasal para alívio da congestão.', 15.20, '2027-01-31', 7),
    ('Pastilhas para Garganta Sabor Mel e Limão', 'Alívio para dor e irritação na garganta.', 12.00, '2026-05-31', 8),
    ('Gel Anti-inflamatório para Dor Muscular', 'Gel tópico para tratamento de dores e inflamações locais.', 33.00, '2027-04-30', 9),
    ('Esmalte para Tratamento de Micose de Unha', 'Esmalte terapêutico antifúngico.', 55.40, '2026-11-30', 10),
    ('Creme para Tratamento de Hemorroidas', 'Pomada para alívio da dor e desconforto.', 42.00, '2026-08-31', 11),
    ('Laxante Suave em Comprimidos', 'Indicado para casos de prisão de ventre ocasional.', 14.75, '2027-07-31', 12),
    ('Antidiarreico 12cp', 'Controle rápido dos sintomas da diarreia.', 21.90, '2027-06-30', 13),
    ('Comprimido para Enjoo e Vômito (Dramin)', 'Prevenção e tratamento de náuseas, tonturas e vômitos.', 9.80, '2026-12-31', 14),
    ('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2027-09-30', 15),
    ('Sulfato Ferroso + Ácido Fólico', 'Suplemento para prevenção e tratamento de anemias.', 23.50, '2026-04-30', 16),
    ('Magnésio Quelato 60 cápsulas', 'Suplemento mineral para saúde muscular e óssea.', 58.00, '2027-03-31', 17),
    ('Zinco Quelato 60 cápsulas', 'Suplemento para fortalecimento do sistema imunológico.', 49.90, '2027-02-28', 18),
    ('Complexo B 100 cápsulas', 'Complexo de vitaminas B para energia e saúde neural.', 45.00, '2027-05-31', 19),
    ('Colágeno Hidrolisado em Pó 300g', 'Suplemento para firmeza da pele, cabelos e unhas.', 85.00, '2026-07-31', 20),
    ('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2027-10-31', 21),
    ('BCAA em Pó 200g Sabor Limão', 'Aminoácidos para recuperação muscular pós-treino.', 75.00, '2026-06-30', 22),
    ('Vitamina D3 2000 UI 60 cápsulas', 'Suplemento para imunidade e saúde óssea.', 42.80, '2027-11-30', 23),
    ('Gummy de Vitamina para Cabelo e Unha', 'Suplemento em goma para fortalecimento capilar.', 65.00, '2026-10-31', 4),
    ('Desodorante Aerosol Sem Perfume', 'Proteção 48h contra o suor, sem fragrância.', 16.50, '2027-12-31', 5),
    ('Espuma de Barbear Pele Sensível', 'Espuma densa para um barbear suave e sem irritação.', 28.00, '2028-01-31', 6),
    ('Loção Pós-Barba Hidratante', 'Acalma e hidrata a pele após o barbear.', 32.00, '2028-02-29', 7),
    ('Hastes Flexíveis com Pontas de Algodão (Cotonetes) 150un', 'Para higiene de áreas delicadas.', 8.50, '2030-01-01', 8),
    ('Talco Antisséptico para os Pés', 'Previne odores e mantém os pés secos.', 13.90, '2028-03-31', 9),
    ('Creme Esfoliante Facial Suave', 'Remove células mortas e impurezas da pele.', 38.00, '2026-09-30', 10),
    ('Máscara Facial de Argila Verde', 'Controle de oleosidade e efeito detox para a pele.', 25.00, '2026-08-31', 11),
    ('Sabonete Líquido Íntimo Feminino', 'Higiene e proteção com pH balanceado.', 22.50, '2027-04-30', 12),
    ('Preservativo Pacote Leve 8 Pague 6', 'Preservativos de látex, lubrificados.', 15.00, '2029-05-31', 13),
    ('Lubrificante Íntimo à Base de Água 50g', 'Lubrificação discreta e segura.', 20.00, '2028-06-30', 14),
    ('Chupeta Ortodôntica 6-18 meses', 'Design que respeita o desenvolvimento oral do bebê.', 28.90, '2030-03-31', 15),
    ('Mamadeira Anti-Cólica 260ml', 'Sistema que reduz a ingestão de ar e as cólicas.', 45.00, '2030-04-30', 16),
    ('Fórmula Infantil para Lactentes 800g', 'Leite em pó para bebês de 0 a 6 meses.', 68.00, '2026-05-31', 17),
    ('Lenços Umedecidos para Recém-Nascido', 'Fórmula suave com 99% de água, sem perfume.', 18.00, '2027-02-28', 18),
    ('Termômetro de Banheira em formato de Peixe', 'Mede a temperatura da água do banho do bebê.', 22.00, '2035-01-01', 19),
    ('Pomada para Assadura de Uso Diário', 'Cria uma camada protetora na pele do bebê.', 29.50, '2026-11-30', 20),
    ('Atadura Elástica de Compressão 10cm', 'Para enfaixamentos e suporte a articulações.', 17.00, '2031-05-31', 21),
    ('Esparadrapo Impermeável Branco', 'Fixação de curativos, alta resistência.', 9.00, '2029-06-30', 22),
    ('Solução de Iodo 10% Antisséptico', 'Antisséptico tópico para curativos.', 11.50, '2027-01-31', 23),
    ('Nebulizador e Inalador Portátil a Pilha', 'Para tratamento de doenças respiratórias.', 250.00, '2032-06-30', 4),
    ('Oxímetro de Dedo Portátil', 'Mede a saturação de oxigênio no sangue e pulso.', 150.00, '2032-07-31', 5),
    ('Soro Fisiológico 0.9% 500ml', 'Para limpeza de ferimentos, olhos e nariz.', 8.00, '2027-08-31', 6),
    ('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2026-12-31', 7),
    ('Creme Anti-idade Noturno Revitalizante', 'Hidrata e reduz linhas de expressão durante a noite.', 95.00, '2027-09-30', 8),
    ('Protetor Solar Corporal FPS 30 200ml', 'Proteção UVA/UVB resistente à água.', 48.00, '2027-03-31', 9),
    ('Removedor de Maquiagem Bifásico', 'Remove maquiagem à prova d''água sem esforço.', 35.00, '2027-06-30', 10),
    ('Esmalte de Unha Hipoalergênico Cor "Vinho"', 'Cor intensa e fórmula que minimiza alergias.', 9.90, '2028-08-31', 11),
    ('Removedor de Esmalte sem Acetona', 'Remove o esmalte sem ressecar as unhas.', 7.50, '2028-09-30', 12),
    ('Pinça de Sobrancelha Ponta Diagonal', 'Aço inox para alta precisão na remoção de pelos.', 14.00, '2035-01-01', 13),
    ('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-01-01', 1),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-02-05', 2),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-03-10', 3),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-04-15', 4),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-05-20', 5),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-06-25', 6),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-07-01', 7),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-08-05', 8),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-09-10', 9),('Loratadina 10mg 12cp', 'Antialérgico para alívio de sintomas de rinite e urticária.', 18.90, '2028-10-15', 10),
    ('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-01-01', 11),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-02-05', 12),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-03-10', 13),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-04-15', 14),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-05-20', 15),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-06-25', 16),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-07-01', 17),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-08-05', 18),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-09-10', 19),('Whey Protein Concentrado 900g', 'Suplemento para ganho de massa muscular.', 150.00, '2028-10-15', 20),
    ('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-01-01', 1),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-02-05', 2),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-03-10', 3),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-04-15', 4),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-05-20', 5),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-06-25', 6),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-07-01', 7),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-08-05', 8),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-09-10', 9),('Fraldas Infantis Pacote G', 'Pacote com 48 fraldas, ajuste confortável.', 45.75, '2029-10-15', 10),
    ('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-12-01', 11),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2028-12-05', 12),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-01-10', 13),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-01-15', 14),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-02-20', 15),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-02-25', 16),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-03-01', 17),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-03-05', 18),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-04-10', 19),('Protetor Solar Facial FPS 50', 'Proteção alta contra raios UVA/UVB, toque seco.', 55.90, '2029-04-15', 20),
    ('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-08-01', 1),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-08-05', 2),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-09-10', 3),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-09-15', 4),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-10-20', 5),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-10-25', 6),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-11-01', 7),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-11-05', 8),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-12-10', 9),('Tylenol Sinus 24cp', 'Analgésico e descongestionante para gripes e sinusite.', 29.90, '2028-12-15', 10),
    ('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-01-01', 11),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-01-05', 12),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-02-10', 13),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-02-15', 14),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-03-20', 15),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-03-25', 16),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-04-01', 17),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-04-05', 18),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-05-10', 19),('Vitamina C Efervescente 1g', 'Suplemento alimentar de vitamina C, sabor laranja.', 28.50, '2028-05-15', 20),
    ('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-01-01', 1),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-02-05', 2),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-03-10', 3),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-04-15', 4),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-05-20', 5),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-06-25', 6),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-07-01', 7),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-08-05', 8),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-09-10', 9),('Creatina Monohidratada 300g', 'Suplemento para aumento de força e desempenho físico.', 99.90, '2029-10-15', 10),
    ('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-06-01', 11),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-06-05', 12),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-07-10', 13),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-07-15', 14),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-08-20', 15),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-08-25', 16),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-09-01', 17),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-09-05', 18),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-10-10', 19),('Sérum Facial com Vitamina C Pura', 'Antioxidante que uniformiza o tom da pele.', 120.00, '2027-10-15', 20),
    ('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-01-01', 1),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-02-05', 2),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-03-10', 3),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-04-15', 4),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-05-20', 5),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-06-25', 6),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-07-01', 7),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-08-05', 8),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-09-10', 9),('Analgésico Infantil em Gotas', 'Alívio de febre e dores para crianças, sabor frutas.', 19.80, '2027-10-15', 10),
    ('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-01-01', 11),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-02-05', 12),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-03-10', 13),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-04-15', 14),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-05-20', 15),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-06-25', 16),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-07-01', 17),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-08-05', 18),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-09-10', 19),('Máscara de Proteção N95', 'Máscara com alta capacidade de filtragem de partículas.', 6.00, '2028-10-15', 20)
    RETURNING IDProduto, NomeProduto
),
novosmedicamentos AS (
    INSERT INTO oper.Medicamento (IDProduto, Indicacao, Contraindicacao)
    SELECT np.IDProduto,
        CASE np.NomeProduto
            WHEN 'Loratadina 10mg 12cp' THEN 'Rinite alérgica, urticária e outras alergias.'
            WHEN 'Xarope para Tosse Seca 120ml' THEN 'Tosse de origem alérgica ou irritativa, sem catarro.'
            WHEN 'Xarope Expectorante 120ml' THEN 'Tosse produtiva, para facilitar a expectoração.'
            WHEN 'Descongestionante Nasal Adulto' THEN 'Congestão nasal em resfriados, rinites e sinusites.'
            WHEN 'Pastilhas para Garganta Sabor Mel e Limão' THEN 'Alívio temporário da dor de garganta.'
            WHEN 'Gel Anti-inflamatório para Dor Muscular' THEN 'Lesões musculares, contusões, torcicolos.'
            WHEN 'Esmalte para Tratamento de Micose de Unha' THEN 'Onicomicoses (micoses de unha).'
            WHEN 'Creme para Tratamento de Hemorroidas' THEN 'Alívio sintomático de hemorroidas externas.'
            WHEN 'Laxante Suave em Comprimidos' THEN 'Constipação intestinal ocasional.'
            WHEN 'Antidiarreico 12cp' THEN 'Diarreias agudas não infecciosas.'
            WHEN 'Comprimido para Enjoo e Vômito (Dramin)' THEN 'Cinetose (enjoo de movimento), náuseas.'
            WHEN 'Tylenol Sinus 24cp' THEN 'Dores e congestão nasal associadas à sinusite.'
            WHEN 'Analgésico Infantil em Gotas' THEN 'Febre e dores leves a moderadas em crianças.'
        END,
        CASE np.NomeProduto
            WHEN 'Loratadina 10mg 12cp' THEN 'Hipersensibilidade à loratadina.'
            WHEN 'Xarope para Tosse Seca 120ml' THEN 'Não usar em caso de tosse produtiva (com catarro).'
            WHEN 'Xarope Expectorante 120ml' THEN 'Hipersensibilidade a componentes da fórmula.'
            WHEN 'Descongestionante Nasal Adulto' THEN 'Não usar por mais de 3 dias consecutivos. Hipertensão.'
            WHEN 'Pastilhas para Garganta Sabor Mel e Limão' THEN 'Diabéticos devem usar com cautela (contém açúcar).'
            WHEN 'Gel Anti-inflamatório para Dor Muscular' THEN 'Não aplicar sobre feridas abertas. Alergia a AINEs.'
            WHEN 'Esmalte para Tratamento de Micose de Unha' THEN 'Alergia ao princípio ativo.'
            WHEN 'Creme para Tratamento de Hemorroidas' THEN 'Infecções virais ou fúngicas na área.'
            WHEN 'Laxante Suave em Comprimidos' THEN 'Obstrução intestinal, dores abdominais intensas.'
            WHEN 'Antidiarreico 12cp' THEN 'Não indicado para diarreias com sangue ou febre alta.'
            WHEN 'Comprimido para Enjoo e Vômito (Dramin)' THEN 'Glaucoma, asma aguda. Causa sonolência.'
            WHEN 'Tylenol Sinus 24cp' THEN 'Alergia a paracetamol, glaucoma, hipertensão grave.'
            WHEN 'Analgésico Infantil em Gotas' THEN 'Alergia ao paracetamol ou componentes.'
        END
    FROM novosprodutos np
    WHERE np.NomeProduto IN (
        'Loratadina 10mg 12cp', 'Xarope para Tosse Seca 120ml', 'Xarope Expectorante 120ml', 'Descongestionante Nasal Adulto',
        'Pastilhas para Garganta Sabor Mel e Limão', 'Gel Anti-inflamatório para Dor Muscular', 'Esmalte para Tratamento de Micose de Unha',
        'Creme para Tratamento de Hemorroidas', 'Laxante Suave em Comprimidos', 'Antidiarreico 12cp', 'Analgésico Infantil em Gotas',
        'Comprimido para Enjoo e Vômito (Dramin)', 'Tylenol Sinus 24cp'
    )
)
INSERT INTO oper.ProdCateg (IDProduto, IDCategoria)
SELECT np.IDProduto, c.IDCategoria
FROM novosprodutos np
JOIN oper.Categoria c ON c.NomeCategoria =
    CASE
        WHEN np.NomeProduto = 'Loratadina 10mg 12cp' THEN 'Antialérgicos'
        WHEN np.NomeProduto IN ('Xarope para Tosse Seca 120ml', 'Xarope Expectorante 120ml', 'Tylenol Sinus 24cp') THEN 'Analgesicos'
        WHEN np.NomeProduto = 'Descongestionante Nasal Adulto' THEN 'Relaxantes Musculares'
        WHEN np.NomeProduto = 'Pastilhas para Garganta Sabor Mel e Limão' THEN 'Higiene Bucal Avançada'
        WHEN np.NomeProduto = 'Gel Anti-inflamatório para Dor Muscular' THEN 'Anti-inflamatórios'
        WHEN np.NomeProduto = 'Esmalte para Tratamento de Micose de Unha' THEN 'Cabelos e Unhas'
        WHEN np.NomeProduto IN ('Creme para Tratamento de Hemorroidas', 'Laxante Suave em Comprimidos', 'Antidiarreico 12cp') THEN 'Saúde Digestiva'
        WHEN np.NomeProduto = 'Comprimido para Enjoo e Vômito (Dramin)' THEN 'Saúde Digestiva'
        WHEN np.NomeProduto IN ('Sulfato Ferroso + Ácido Fólico', 'Magnésio Quelato 60 cápsulas', 'Zinco Quelato 60 cápsulas', 'Complexo B 100 cápsulas', 'Vitamina D3 2000 UI 60 cápsulas') THEN 'Vitaminas'
        WHEN np.NomeProduto = 'Colágeno Hidrolisado em Pó 300g' THEN 'Dermocosméticos'
        WHEN np.NomeProduto IN ('Creatina Monohidratada 300g', 'BCAA em Pó 200g Sabor Limão') THEN 'Nutrição Esportiva'
        WHEN np.NomeProduto = 'Gummy de Vitamina para Cabelo e Unha' THEN 'Cabelos e Unhas'
        WHEN np.NomeProduto = 'Desodorante Aerosol Sem Perfume' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto IN ('Espuma de Barbear Pele Sensível', 'Loção Pós-Barba Hidratante') THEN 'Cuidados Masculinos'
        WHEN np.NomeProduto = 'Hastes Flexíveis com Pontas de Algodão (Cotonetes) 150un' THEN 'Higiene Pessoal'
        WHEN np.NomeProduto = 'Talco Antisséptico para os Pés' THEN 'Cuidados com os Pés'
        WHEN np.NomeProduto IN ('Creme Esfoliante Facial Suave', 'Máscara Facial de Argila Verde', 'Sérum Facial com Vitamina C Pura', 'Creme Anti-idade Noturno Revitalizante') THEN 'Cuidados Faciais'
        WHEN np.NomeProduto = 'Sabonete Líquido Íntimo Feminino' THEN 'Saúde da Mulher'
        WHEN np.NomeProduto IN ('Preservativo Pacote Leve 8 Pague 6', 'Lubrificante Íntimo à Base de Água 50g') THEN 'Saúde do Homem'
        WHEN np.NomeProduto IN ('Chupeta Ortodôntica 6-18 meses', 'Mamadeira Anti-Cólica 260ml', 'Fórmula Infantil para Lactentes 800g', 'Lenços Umedecidos para Recém-Nascido', 'Pomada para Assadura de Uso Diário', 'Analgésico Infantil em Gotas') THEN 'Saúde Infantil'
        WHEN np.NomeProduto = 'Termômetro de Banheira em formato de Peixe' THEN 'Acessórios de Saúde'
        WHEN np.NomeProduto IN ('Atadura Elástica de Compressão 10cm', 'Esparadrapo Impermeável Branco', 'Solução de Iodo 10% Antisséptico', 'Soro Fisiológico 0.9% 500ml') THEN 'Primeiros Socorros'
        WHEN np.NomeProduto IN ('Nebulizador e Inalador Portátil a Pilha', 'Oxímetro de Dedo Portátil') THEN 'Equipamentos Médicos'
        WHEN np.NomeProduto = 'Protetor Solar Corporal FPS 30 200ml' THEN 'Proteção Solar'
        WHEN np.NomeProduto IN ('Removedor de Maquiagem Bifásico', 'Esmalte de Unha Hipoalergênico Cor "Vinho"', 'Removedor de Esmalte sem Acetona', 'Pinça de Sobrancelha Ponta Diagonal') THEN 'Cosméticos'
        WHEN np.NomeProduto = 'Whey Protein Concentrado 900g' THEN 'Suplementos Alimentares'
        WHEN np.NomeProduto = 'Fraldas Infantis Pacote G' THEN 'Fraldas e Lenços Umedecidos'
        WHEN np.NomeProduto = 'Protetor Solar Facial FPS 50' THEN 'Proteção Solar'
        WHEN np.NomeProduto = 'Vitamina C Efervescente 1g' THEN 'Vitaminas'
        WHEN np.NomeProduto = 'Máscara de Proteção N95' THEN 'Proteção e Segurança'
    END;

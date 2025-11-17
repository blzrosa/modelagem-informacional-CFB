# Ator: Cliente

|Ator: Cliente -  Objetivo 1: Consultar medicamentos ofertados|
|---|
|<- medicamentos_ofertados = IDProduto + NomeProduto + PrecVenda + DescrProd + DtValidade + Indicacao + ContraIndicacao + 0{FabricanteVac}m + IDCategoria + NomeCategoria|
|Descrição: Lista de medicamentos disponíveis no estoque da farmácia, incluindo detalhes básicos para consulta rápida pelo cliente via aplicativo.|
|Propósito: Permitir que o cliente visualize os medicamentos ofertados para decidir sobre compras, verificando preços, descrições e indicações sem necessidade de interação física.|
|Frequência: 500/dia.|

|Ator: Cliente - Objetivo A2: Receber alertas de interação medicamentosa|
|---|
|<- alerta_interacao = IDProdutoX + IDProdutoY + DescrInteracaoMedicam|
|Descrição: Notificação automática sobre possíveis interações entre medicamentos já adquiridos pelo cliente e um novo medicamento que está tentando comprar.|
|Propósito: Alertar o cliente sobre riscos de saúde decorrentes de interações medicamentosas, promovendo uso seguro e prevenindo efeitos colaterais.|
|Frequência: 10/dia.|

|Ator: Cliente - Objetivo 3: Realizar/Alterar cadastro|
|---|
|-> cadastro_cliente = IDCliente + NomeCliente + EmailCliente + Senha + TelefoneCliente + Rua + Bairro + IDMunicipio + IDUF|
|Descrição: Formulário para inserção ou atualização dos dados pessoais do cliente, incluindo endereço e contatos.|
|Propósito: Manter os dados do cliente atualizados para personalização de serviços, como envios de alertas e histórico de compras.|
|Frequência: 5/dia.|

|Ator: Cliente - Objetivo 4: Cadastrar vacinas/data|
|---|
|-> cadastro_vacina = IDProduto + IDCliente + VacDatAplic + FabricanteVac + DtPAlarme|
|Descrição: Registro de vacinas aplicadas, incluindo data de aplicação e fabricante, com opção de alarme para doses futuras.|
|Propósito: Permitir que o cliente mantenha um histórico de vacinação no aplicativo, facilitando o acompanhamento de imunizações.|
|Frequência: 7/dia.|

|Ator: Cliente - Objetivo 5: Consultar vacinas|
|---|
|<- consulta_vacinas = IDProduto + NomeProduto + VacDatAplic + FabricanteVac + VacDatProx|
|Descrição: Lista de vacinas cadastradas pelo cliente, com datas de aplicação e alertas programados.|
|Propósito: Fornecer ao cliente uma visão rápida do histórico de vacinas para planejamento de saúde.|
|Frequência: 30/dia.|

|Ator: Cliente - Objetivo 6: Cadastrar/Alterar histórico de saúde (enfermidades, alergias, etc)|
|---|
|-> cadastro_historico_saude = IDCliente + IDEnfermidade + DtCadEnferm + NomeEnferm + DescrEnferm|
|Descrição: Inserção ou atualização de enfermidades, alergias e condições crônicas no perfil do cliente.|
|Propósito: Integrar o histórico de saúde ao perfil para melhorar alertas personalizados e interações com medicamentos.|
|Frequência: 10dia.|

|Ator: Cliente - Objetivo 7: Consultar histórico de saúde|
|---|
|<- consulta_historico_saude = IDEnfermidade + NomeEnferm + DescrEnferm + DtCadEnferm|
|Descrição: Visualização das enfermidades e condições cadastradas no histórico de saúde do cliente.|
|Propósito: Permitir que o cliente revise seu histórico para referência pessoal ou compartilhamento com profissionais de saúde.|
|Frequência: 10/dia.|

|Ator: Cliente - Objetivo 8: Registar lembrete|
|---|
|-> registro_lembrete = IDProduto + DtPAlarme + IDCliente|
|Descrição: Criação de um lembrete para aquisição periódica de medicamentos ou vacinas.|
|Propósito: Auxiliar o cliente a lembrar de reposições de medicamentos ou doses de vacinas, promovendo adesão ao tratamento.|
|Frequência: 50/dia.|

|Ator: Cliente - Objetivo 9: Receber lembrete registrado|
|---|
|<- lembrete_registrado = IDProduto + NomeProduto + DtPAlarme|
|Descrição: Notificação automática de lembrete previamente cadastrado pelo cliente.|
|Propósito: Enviar alertas timely para que o cliente não esqueça de adquirir ou aplicar itens de saúde.|
|Frequência: 50/dia.|

---

# Ator: Atendente

|Ator: Atendente - Objetivo 10: Consultar estoque|
|---|
|<- consulta_estoque = IDEstoque + Quantidade + Prateleira + IDProduto + NomeProduto + PrecVenda + DtValidade|
|Descrição: Exibição dos itens disponíveis no estoque da farmácia, incluindo Quantidade, localização e detalhes do produto.|
|Propósito: Permitir que o atendente verifique a disponibilidade de medicamentos e outros produtos para atender solicitações de clientes.|
|Frequência: 150/dia.|

|Ator: Atendente - Objetivo 11: Verificar interações medicamentosas|
|---|
|<- verifica_interacao = IDProdutoX + IDProdutoY + DescrInteracaoMedicam  |
|Descrição: Consulta de possíveis interações entre medicamentos adquiridos por um cliente e um novo medicamento em processo de venda.|
|Propósito: Auxiliar o atendente a identificar riscos de interações medicamentosas antes de finalizar uma transação, garantindo segurança ao cliente.|
|Frequência: 500/dia.|

|Ator: Atendente - Objetivo 12: Consultar histórico de compra do cliente|
|---|
|<- historico_compra = IDCliente + NomeCliente + IDProduto + NomeProduto + PrecVenda + DataCompra + IDCompra|
|Descrição: Lista de todas as compras realizadas por um cliente, incluindo produtos e datas.|
|Propósito: Permitir que o atendente acompanhe o histórico de compras para oferecer suporte personalizado ou verificar interações medicamentosas.|
|Frequência: 80/dia.|

|Ator: Atendente - Objetivo 13: Registrar transação de venda|
|---|
|-> registro_venda = IDCompra + IDCliente + IDProduto + Quantidade + PrecVenda + DataCompra|
|Descrição: Registro dos dados de uma venda realizada, associando o cliente, produto e valor.|
|Propósito: Documentar transações para controle financeiro e histórico do cliente, além de atualizar o estoque.|
|Frequência: 200/dia.|

|Ator: Atendente - Objetivo 14: Consultar histórico de vendas|
|---|
|<- historico_vendas = IDCompra + IDCliente + NomeCliente + IDProduto + NomeProduto + Quantidade + PrecVenda + DataCompra|
|Descrição: Relatório de todas as vendas registradas, com detalhes de clientes e produtos.|
|Propósito: Facilitar a análise de vendas pelo atendente para relatórios ou identificação de padrões de compra.|
|Frequência: 3/dia.|

|Ator: Atendente - Objetivo 15: Cadastrar/Alterar cadastro de cliente|
|---|
|-> cadastro_cliente = IDCliente + NomeCliente + EmailCliente + TelefoneCliente + Rua + Bairro + IDMunicipio + IDUF|
|Descrição: Formulário para inserção ou atualização dos dados de um cliente no sistema.|
|Propósito: Manter os dados dos clientes atualizados para melhor atendimento e integração com alertas.|
|Frequência: 7/dia.|

---

# Ator: Administração

|Ator: Administração - Objetivo 16: Consultar estoque|
|---|
|<- consulta_estoque = IDEstoque + Quantidade + Prateleira + IDProduto + NomeProduto + PrecVenda + DtValidade|
|Descrição: Relatório detalhado do estoque disponível, incluindo Quantidade, localização e informações dos produtos.|
|Propósito: Permitir que a administração monitore o estoque para gestão eficiente e tomada de decisões sobre reposição.|
|Frequência: 1/dia.|

|Ator: Administração - Objetivo 17: Pedir fornecimento|
|---|
|-> pedido_fornecimento = IDFornecedor + IDProduto + Quantidade |
|Descrição: Solicitação de produtos ao fornecedor, especificando itens e Quantidades necessárias.|
|Propósito: Facilitar a reposição do estoque pela administração, garantindo disponibilidade de produtos.|
|Frequência: 3/semana.|

|Ator: Administração - Objetivo 18: Consultar histórico de vendas|
|---|
|<- historico_vendas = IDCompra + IDCliente + NomeCliente + IDProduto + NomeProduto + Quantidade + PrecVenda + DataCompra|
|Descrição: Relatório completo de todas as vendas realizadas, com detalhes de clientes e produtos.|
|Propósito: Auxiliar a administração na análise de desempenho e planejamento estratégico baseado em dados de vendas.|
|Frequência: 1/dia.|

|Ator: Administração - Objetivo 19: Consultar histórico de fornecimento|
|---|
|<- historico_fornecimento = IDFornecedor + NomeFornecedor + IDProduto + Quantidade + PrecoCompra|
|Descrição: Registro de todos os fornecimentos recebidos, incluindo dados do fornecedor e produtos entregues.|
|Propósito: Permitir que a administração acompanhe os fornecimentos para avaliar fornecedores e otimizar compras.|
|Frequência: 2/mês.|

|Ator: Administração - Objetivo 20: Cadastrar produtos e interações|
|---|
|-> cadastro_produto = IDProduto + NomeProduto + PrecVenda + DescrProd + DtValidade + IDCategoria + Indicacao + ContraIndicacao + IDProdutoX + IDProdutoY + DescrInteracaoMedicam|
|Descrição: Inserção de novos produtos e suas interações medicamentosas no sistema.|
|Propósito: Manter o catálogo de produtos atualizado e garantir que interações sejam monitoradas para segurança dos clientes.|
|Frequência: 15/mês.|

|Ator: Administração - Objetivo 21: Cadastrar fornecedor|
|---|
|-> cadastro_fornecedor = IDFornecedor + NomeFornecedor + CNPJ + Telefone|
|Descrição: Registro de novos fornecedores no sistema, incluindo dados básicos de contato.|
|Propósito: Facilitar a gestão de parcerias com fornecedores para abastecimento do estoque.|
|Frequência: 1/mes.|

|Ator: Administração - Objetivo 22: Consultar produtos e interações|
|---|
|<- consulta_produtos = IDProduto + NomeProduto + PrecVenda + DescrProd + Indicacao + ContraIndicacao + IDProdutoX + IDProdutoY + DescrInteracaoMedicam|
|Descrição: Lista de produtos cadastrados com detalhes e possíveis interações medicamentosas.|
|Propósito: Auxiliar a administração na revisão de produtos e na prevenção de riscos por interações medicamentosas.|
|Frequência: 1/semana.|

---

# Ator: Fornecedor

|Ator: Fornecedor - Objetivo 2: Consultar requisições da farmácia|
|---|
|<- consulta_requisicoes = IDRequisicao + IDFornecedor + IDProduto + Quantidade|
|Descrição: Lista de requisições enviadas pela farmácia, detalhando produtos e Quantidades solicitadas.|
|Propósito: Permitir que o fornecedor visualize e priorize os pedidos para atender às necessidades da farmácia.|
|Frequência: 12/semana.|

|Ator: Fornecedor - Objetivo 2: Obter histórico de produtos fornecidos|
|---|
|<- historico_fornecimento = IDFornecedor + IDProduto + NomeProduto + Quantidade + PrecoCompra|
|Descrição: Registro de todos os produtos fornecidos à farmácia, incluindo detalhes de entrega e valores.|
|Propósito: Auxiliar o fornecedor a rastrear entregas anteriores e planejar futuros fornecimentos.|
|Frequência: 15/mês.|

|Ator: Fornecedor - Objetivo 2: Alterar cadastro|
|---|
|-> cadastro_fornecedor = IDFornecedor + NomeFornecedor + CNPJ + Telefone|
|Descrição: Formulário para atualização dos dados do fornecedor, como nome, CNPJ e contatos.|
|Propósito: Manter as informações do fornecedor atualizadas para facilitar a comunicação com a farmácia.|
|Frequência: 12/ano.
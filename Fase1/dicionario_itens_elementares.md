# Dicionário de itens elementares

## Ator: Cliente
### Objetivo 1: Consultar medicamentos ofertados
| Ator: Cliente | Objetivo 1: Consultar medicamentos ofertados |  |  |
|---------------|-----------------------------------------------|--|--|
| **Nome**      | **Descrição**                                 | **Tipo** | **Domínio** |
| IDProduto     | Identificador único do produto                | Num. Sequencial natural | Gerado automaticamente |
| NomeProduto   | Nome do produto                               | Str |  |
| PrecVenda     | Preço de venda do produto                     | Float | [0..] |
| DescrProd     | Descrição do produto                          | Str |  |
| DtValidade    | Data de validade do produto                   | Date | Formato YYYY-MM-DD |
| Indicacao     | Indicação de uso do medicamento               | Str |  |
| ContraIndicacao | Contraindicação do medicamento            | Str |  |
| FabricanteVac | Fabricante da vacina (se aplicável)           | Str |  |
| IDCategoria   | Identificador único da categoria              | Num. Sequencial natural | Gerado automaticamente |
| NomeCategoria | Nome da categoria                             | Str |  |

### Objetivo 2: Receber alertas de interação medicamentosa
| Ator: Cliente | Objetivo 2: Receber alertas de interação medicamentosa |  |  |
|---------------|-------------------------------------------------------|--|--|
| **Nome**      | **Descrição**                                         | **Tipo** | **Domínio** |
| IDProdutoX    | Identificador único do primeiro medicamento           | Num. Sequencial natural | Gerado automaticamente |
| IDProdutoY    | Identificador único do segundo medicamento            | Num. Sequencial natural | Gerado automaticamente |
| DescrInteracaoMedicam | Descrição da interação medicamentosa          | Str |  |

### Objetivo 3: Realizar/Alterar cadastro
| Ator: Cliente | Objetivo 3: Realizar/Alterar cadastro |  |  |
|---------------|---------------------------------------|--|--|
| **Nome**      | **Descrição**                         | **Tipo** | **Domínio** |
| IDCliente     | Identificador único do cliente        | Num. Sequencial natural | Gerado automaticamente |
| NomeCliente   | Nome do cliente                       | Str |  |
| EmailCliente  | Endereço de e-mail do cliente         | Str |  |
| Senha         | Senha de acesso do cliente            | Str |  |
| TelefoneCliente | Telefone do cliente                  | Num. Natural |  |
| Rua           | Rua do endereço do cliente            | Str |  |
| Bairro        | Bairro do endereço do cliente         | Str |  |
| IDMunicipio   | Identificador único do município      | Num. Sequencial natural | Gerado automaticamente |
| IDUF          | Identificador único da unidade federativa | Str | Formato XX |

### Objetivo 4: Cadastrar vacinas/data
| Ator: Cliente | Objetivo 4: Cadastrar vacinas/data |  |  |
|---------------|------------------------------------|--|--|
| **Nome**      | **Descrição**                      | **Tipo** | **Domínio** |
| IDProduto     | Identificador único do produto     | Num. Sequencial natural | Gerado automaticamente |
| IDCliente     | Identificador único do cliente     | Num. Sequencial natural | Gerado automaticamente |
| VacDtAplic    | Data de aplicação da vacina         | Date | Formato YYYY-MM-DD |
| FabricanteVac | Fabricante da vacina                | Str |  |
| DtPAlarme     | Data programada para alarme         | Date | Formato YYYY-MM-DD |

### Objetivo 5: Consultar vacinas
| Ator: Cliente | Objetivo 5: Consultar vacinas |  |  |
|---------------|-------------------------------|--|--|
| **Nome**      | **Descrição**                 | **Tipo** | **Domínio** |
| IDProduto     | Identificador único do produto| Num. Sequencial natural | Gerado automaticamente |
| NomeProduto   | Nome do produto               | Str |  |
| VacDtAplic    | Data de aplicação da vacina   | Date | Formato YYYY-MM-DD |
| FabricanteVac | Fabricante da vacina          | Str |  |
| DtPAlarme     | Data programada para alarme   | Date | Formato YYYY-MM-DD |

### Objetivo 6: Cadastrar/Alterar histórico de saúde (enfermidades, alergias, etc)
| Ator: Cliente | Objetivo 6: Cadastrar/Alterar histórico de saúde (enfermidades, alergias, etc) |  |  |
|-----------------|---------------------------------------------------------------------------------|--|--|
| **Nome**        | **Descrição**                                                                  | **Tipo** | **Domínio** |
| IDCliente       | Identificador único do cliente                                                 | Num. Sequencial natural | Gerado automaticamente |
| IDEnfermidade   | Identificador único da enfermidade                                             | Num. Sequencial natural | Gerado automaticamente |
| DtCadEnferm     | Data de cadastro da enfermidade                                                | Date | Formato YYYY-MM-DD |
| NomeEnferm      | Nome da enfermidade ou condição                                                | Str |  |
| DescrEnferm     | Descrição da enfermidade ou condição                                           | Str |  |

### Objetivo 7: Consultar histórico de saúde
| Ator: Cliente | Objetivo 7: Consultar histórico de saúde |  |  |
|---------------|------------------------------------------|--|--|
| **Nome**      | **Descrição**                            | **Tipo** | **Domínio** |
| IDEnfermidade | Identificador único da enfermidade       | Num. Sequencial natural | Gerado automaticamente |
| NomeEnferm    | Nome da enfermidade ou condição          | Str |  |
| DescrEnferm   | Descrição da enfermidade ou condição     | Str |  |
| DtCadEnferm   | Data de cadastro da enfermidade          | Date | Formato YYYY-MM-DD |

### Objetivo 8: Registar lembrete
| Ator: Cliente | Objetivo 8: Registar lembrete |  |  |
|---------------|-------------------------------|--|--|
| **Nome**      | **Descrição**                 | **Tipo** | **Domínio** |
| IDProduto     | Identificador único do produto| Num. Sequencial natural | Gerado automaticamente |
| DtPAlarme     | Data programada para alarme   | Date | Formato YYYY-MM-DD |
| IDCliente     | Identificador único do cliente| Num. Sequencial natural | Gerado automaticamente |

### Objetivo 9: Receber lembrete registrado
| Ator: Cliente | Objetivo 9: Receber lembrete registrado |  |  |
|---------------|----------------------------------------|--|--|
| **Nome**      | **Descrição**                          | **Tipo** | **Domínio** |
| IDProduto     | Identificador único do produto         | Num. Sequencial natural | Gerado automaticamente |
| NomeProduto   | Nome do produto                        | Str |  |
| DtPAlarme     | Data programada para alarme            | Date | Formato YYYY-MM-DD |

## Ator: Atendente
### Objetivo 10: Consultar estoque
| Ator: Atendente | Objetivo 10: Consultar estoque |  |  |
|----------------|-------------------------------|--|--|
| **Nome**       | **Descrição**                 | **Tipo** | **Domínio** |
| IDEstoque      | Identificador único do estoque| Num. Sequencial natural | Gerado automaticamente |
| Quantidade     | Quantidade disponível do produto no estoque | Num. Natural | [0..] |
| Prateleira     | Localização da prateleira onde o produto está armazenado | Str |  |
| IDProduto      | Identificador único do produto| Num. Sequencial natural | Gerado automaticamente |
| NomeProduto    | Nome do produto               | Str |  |
| PrecVenda      | Preço de venda do produto     | Float | [0..] |
| DtValidade     | Data de validade do produto   | Date | Formato YYYY-MM-DD |

### Objetivo 11: Verificar interações medicamentosas
| Ator: Atendente | Objetivo 11: Verificar interações medicamentosas |  |  |
|-----------------|-------------------------------------------------|--|--|
| **Nome**        | **Descrição**                                   | **Tipo** | **Domínio** |
| IDProdutoX      | Identificador único do primeiro medicamento     | Num. Sequencial natural | Gerado automaticamente |
| IDProdutoY      | Identificador único do segundo medicamento      | Num. Sequencial natural | Gerado automaticamente |
| DescrInteracaoMedicam | Descrição da interação medicamentosa        | Str |  |

### Objetivo 12: Consultar histórico de compra do cliente
| Ator: Atendente | Objetivo 12: Consultar histórico de compra do cliente |  |  |
|-----------------|-----------------------------------------------------|--|--|
| **Nome**        | **Descrição**                                       | **Tipo** | **Domínio** |
| IDCliente       | Identificador único do cliente                      | Num. Sequencial natural | Gerado automaticamente |
| NomeCliente     | Nome do cliente                                     | Str |  |
| IDProduto       | Identificador único do produto                      | Num. Sequencial natural | Gerado automaticamente |
| NomeProduto     | Nome do produto                                     | Str |  |
| PrecVenda       | Preço de venda do produto                           | Float | [0..] |
| DataCompra      | Data da compra                                      | Date | Formato YYYY-MM-DD |

### Objetivo 13: Registrar transação de venda
| Ator: Atendente | Objetivo 13: Registrar transação de venda |  |  |
|-----------------|------------------------------------------|--|--|
| **Nome**        | **Descrição**                            | **Tipo** | **Domínio** |
| IDTransacao     | Identificador único da transação          | Num. Sequencial natural | Gerado automaticamente |
| IDCliente       | Identificador único do cliente            | Num. Sequencial natural | Gerado automaticamente |
| IDProduto       | Identificador único do produto            | Num. Sequencial natural | Gerado automaticamente |
| Quantidade      | Quantidade vendida                        | Num. Natural | [0..] |
| PrecVenda       | Preço de venda do produto                 | Float | [0..] |
| DtHrVenda       | Data e hora da venda                      | Timestamp | Formato YYYY-MM-DD HH:MM:SS |

### Objetivo 14: Consultar histórico de vendas
| Ator: Atendente | Objetivo 14: Consultar histórico de vendas |  |  |
|-----------------|-------------------------------------------|--|--|
| **Nome**        | **Descrição**                             | **Tipo** | **Domínio** |
| IDCompra        | Identificador único da compra             | Num. Sequencial natural | Gerado automaticamente |
| IDCliente       | Identificador único do cliente            | Num. Sequencial natural | Gerado automaticamente |
| NomeCliente     | Nome do cliente                           | Str |  |
| IDProduto       | Identificador único do produto            | Num. Sequencial natural | Gerado automaticamente |
| NomeProduto     | Nome do produto                           | Str |  |
| Quantidade      | Quantidade vendida                        | Num. Natural | [0..] |
| PrecVenda       | Preço de venda do produto                 | Float | [0..] |
| DataCompra      | Data da compra                            | Date | Formato YYYY-MM-DD |

### Objetivo 15: Cadastrar/Alterar cadastro de cliente
| Ator: Atendente | Objetivo 15: Cadastrar/Alterar cadastro de cliente |  |  |
|-----------------|--------------------------------------------------|--|--|
| **Nome**        | **Descrição**                                    | **Tipo** | **Domínio** |
| IDCliente       | Identificador único do cliente                   | Num. Sequencial natural | Gerado automaticamente |
| NomeCliente     | Nome do cliente                                  | Str |  |
| EmailCliente    | Endereço de e-mail do cliente                    | Str |  |
| TelefoneCliente | Telefone do cliente                              | Num. Natural |  |
| Rua             | Rua do endereço do cliente                       | Str |  |
| Bairro          | Bairro do endereço do cliente                    | Str |  |
| IDMunicipio     | Identificador único do município                 | Num. Sequencial natural | Gerado automaticamente |
| IDUF            | Identificador único da unidade federativa        | Str | Formato XX |

## Ator: Administração
### Objetivo 16: Consultar estoque
| Ator: Administração | Objetivo 16: Consultar estoque |  |  |
|---------------------|-------------------------------|--|--|
| **Nome**            | **Descrição**                 | **Tipo** | **Domínio** |
| IDEstoque           | Identificador único do estoque| Num. Sequencial natural | Gerado automaticamente |
| Quantidade          | Quantidade disponível do produto no estoque | Num. Natural | [0..] |
| Prateleira          | Localização da prateleira onde o produto está armazenado | Str |  |
| IDProduto           | Identificador único do produto| Num. Sequencial natural | Gerado automaticamente |
| NomeProduto         | Nome do produto               | Str |  |
| PrecVenda           | Preço de venda do produto     | Float | [0..] |
| DtValidade          | Data de validade do produto   | Date | Formato YYYY-MM-DD |

### Objetivo 17: Pedir fornecimento
| Ator: Administração | Objetivo 17: Pedir fornecimento |  |  |
|---------------------|---------------------------------|--|--|
| **Nome**            | **Descrição**                   | **Tipo** | **Domínio** |
| IDFornecedor        | Identificador único do fornecedor | Num. Sequencial natural | Gerado automaticamente |
| IDProduto           | Identificador único do produto  | Num. Sequencial natural | Gerado automaticamente |
| Quantidade          | Quantidade solicitada           | Num. Natural | [0..] |
| DtHrPedido          | Data e hora do pedido           | Timestamp | Formato YYYY-MM-DD HH:MM:SS |

### Objetivo 18: Consultar histórico de vendas
| Ator: Administração | Objetivo 18: Consultar histórico de vendas |  |  |
|---------------------|-------------------------------------------|--|--|
| **Nome**            | **Descrição**                             | **Tipo** | **Domínio** |
| IDCompra            | Identificador único da compra             | Num. Sequencial natural | Gerado automaticamente |
| IDCliente           | Identificador único do cliente            | Num. Sequencial natural | Gerado automaticamente |
| NomeCliente         | Nome do cliente                           | Str |  |
| IDProduto           | Identificador único do produto            | Num. Sequencial natural | Gerado automaticamente |
| NomeProduto         | Nome do produto                           | Str |  |
| Quantidade          | Quantidade vendida                        | Num. Natural | [0..] |
| PrecVenda           | Preço de venda do produto                 | Float | [0..] |
| DataCompra          | Data da compra                            | Date | Formato YYYY-MM-DD |

### Objetivo 19: Consultar histórico de fornecimento
| Ator: Administração | Objetivo 19: Consultar histórico de fornecimento |  |  |
|---------------------|-----------------------------------------------|--|--|
| **Nome**            | **Descrição**                                 | **Tipo** | **Domínio** |
| IDFornecedor        | Identificador único do fornecedor             | Num. Sequencial natural | Gerado automaticamente |
| NomeFornecedor      | Nome do fornecedor                            | Str |  |
| IDProduto           | Identificador único do produto                | Num. Sequencial natural | Gerado automaticamente |
| Quantidade          | Quantidade fornecida                          | Num. Natural | [0..] |
| PrecoCompra         | Preço de compra do produto                    | Float | [0..] |
| DtHrEntrega         | Data e hora da entrega                        | Timestamp | Formato YYYY-MM-DD HH:MM:SS |

### Objetivo 20: Cadastrar produtos e interações
| Ator: Administração | Objetivo 20: Cadastrar produtos e interações |  |  |
|---------------------|---------------------------------------------|--|--|
| **Nome**            | **Descrição**                               | **Tipo** | **Domínio** |
| IDProduto           | Identificador único do produto              | Num. Sequencial natural | Gerado automaticamente |
| NomeProduto         | Nome do produto                             | Str |  |
| PrecVenda           | Preço de venda do produto                   | Float | [0..] |
| DescrProd           | Descrição do produto                        | Str |  |
| DtValidade          | Data de validade do produto                 | Date | Formato YYYY-MM-DD |
| IDCategoria         | Identificador único da categoria            | Num. Sequencial natural | Gerado automaticamente |
| Indicacao           | Indicação de uso do medicamento             | Str |  |
| ContraIndicacao     | Contraindicação do medicamento              | Str |  |
| IDProdutoX          | Identificador único do primeiro medicamento | Num. Sequencial natural | Gerado automaticamente |
| IDProdutoY          | Identificador único do segundo medicamento  | Num. Sequencial natural | Gerado automaticamente |
| DescrInteracaoMedicam | Descrição da interação medicamentosa      | Str |  |

### Objetivo 21: Cadastrar fornecedor
| Ator: Administração | Objetivo 21: Cadastrar fornecedor |  |  |
|---------------------|----------------------------------|--|--|
| **Nome**            | **Descrição**                    | **Tipo** | **Domínio** |
| IDFornecedor        | Identificador único do fornecedor| Num. Sequencial natural | Gerado automaticamente |
| NomeFornecedor      | Nome do fornecedor               | Str |  |
| CNPJ                | CNPJ do fornecedor               | Str | Formato 14 dígitos |
| Telefone            | Telefone do fornecedor           | Num. Natural |  |

### Objetivo 22: Consultar produtos e interações
| Ator: Administração | Objetivo 22: Consultar produtos e interações |  |  |
|---------------------|---------------------------------------------|--|--|
| **Nome**            | **Descrição**                               | **Tipo** | **Domínio** |
| IDProduto           | Identificador único do produto              | Num. Sequencial natural | Gerado automaticamente |
| NomeProduto         | Nome do produto                             | Str |  |
| PrecVenda           | Preço de venda do produto                   | Float | [0..] |
| DescrProd           | Descrição do produto                        | Str |  |
| Indicacao           | Indicação de uso do medicamento             | Str |  |
| ContraIndicacao     | Contraindicação do medicamento              | Str |  |
| IDProdutoX          | Identificador único do primeiro medicamento | Num. Sequencial natural | Gerado automaticamente |
| IDProdutoY          | Identificador único do segundo medicamento  | Num. Sequencial natural | Gerado automaticamente |
| DescrInteracaoMedicam | Descrição da interação medicamentosa      | Str |  |

## Ator: Fornecedor
### Objetivo 23: Consultar requisições da farmácia
| Ator: Fornecedor | Objetivo 23: Consultar requisições da farmácia |  |  |
|------------------|-----------------------------------------------|--|--|
| **Nome**         | **Descrição**                                 | **Tipo** | **Domínio** |
| IDRequisicao     | Identificador único da requisição             | Num. Sequencial natural | Gerado automaticamente |
| IDFornecedor     | Identificador único do fornecedor             | Num. Sequencial natural | Gerado automaticamente |
| IDProduto        | Identificador único do produto                | Num. Sequencial natural | Gerado automaticamente |
| Quantidade       | Quantidade solicitada                         | Num. Natural | [0..] |

### Objetivo 24: Obter histórico de produtos fornecidos
| Ator: Fornecedor | Objetivo 24: Obter histórico de produtos fornecidos |  |  |
|------------------|---------------------------------------------------|--|--|
| **Nome**         | **Descrição**                                     | **Tipo** | **Domínio** |
| IDFornecedor     | Identificador único do fornecedor                 | Num. Sequencial natural | Gerado automaticamente |
| IDProduto        | Identificador único do produto                    | Num. Sequencial natural | Gerado automaticamente |
| NomeProduto      | Nome do produto                                   | Str |  |
| Quantidade       | Quantidade fornecida                              | Num. Natural | [0..] |
| PrecoCompra      | Preço de compra do produto                        | Float | [0..] |

### Objetivo 25: Alterar cadastro
| Ator: Fornecedor | Objetivo 25: Alterar cadastro |  |  |
|------------------|------------------------------|--|--|
| **Nome**         | **Descrição**                | **Tipo** | **Domínio** |
| IDFornecedor     | Identificador único do fornecedor | Num. Sequencial natural | Gerado automaticamente |
| NomeFornecedor   | Nome do fornecedor           | Str |  |
| CNPJ             | CNPJ do fornecedor           | Str | Formato 14 dígitos |
| Telefone         | Telefone do fornecedor       | Num. Natural |  |
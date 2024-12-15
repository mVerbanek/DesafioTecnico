# Cadastro de Fazendas

## Descrição do Projeto
Este é um sistema desenvolvido em **Delphi 11** com o objetivo de realizar o cadastro de fazendas e gerenciar os animais associados a cada fazenda. O sistema também permite a geração de relatórios detalhados.

## Tecnologias Utilizadas
- **Linguagem**: Delphi 11
- **Banco de Dados**: Firebird 2.5
- **Componente de Relatório**: FastReport

## Configurações Necessárias

### Configuração do Banco de Dados
Para que o sistema funcione corretamente, é necessário configurar o arquivo `login.ini` para apontar o caminho do banco de dados. O arquivo deve ter o seguinte formato:

```
[Conexao]
Database=D:\Desafio\DB\EXE01.FDB
Servidor=LocalHost
Porta=3050
```

Certifique-se de ajustar o caminho `Database` para o local onde o arquivo do banco de dados (.FDB) está armazenado.
O arquivo `login.ini` deve estar no mesmo caminho do executavel

### Dependências Necessárias
1. **Biblioteca `fbclient.dll`:** A DLL do cliente Firebird deve estar no mesmo diretório do executável (`.exe`) do projeto.
2. **Componente FastReport:** Para compilar o projeto, é necessário que o componente FastReport esteja instalado no Delphi. O instalador está localizado no seguinte caminho dentro do projeto:
   ```
   \componente\fastreport
   ```

## Como Executar o Sistema
1. Certifique-se de que o arquivo `login.ini` está configurado corretamente.
2. Coloque o arquivo `fbclient.dll` no mesmo diretório do executável.
3. Execute o arquivo `.exe` do projeto.

## Estrutura do Projeto
- **/DB/**: Contém o arquivo do banco de dados (.FDB).
- **/componente/fastreport/**: Contém o instalador do componente FastReport.
- **/src/**: Contém os códigos-fonte do projeto.

## Funcionalidades
1. **Cadastro de Fazendas:**
   - Permite o registro de informações detalhadas de cada fazenda.
2. **Cadastro de Animais:**
   - Possibilidade de associar vários animais a uma fazenda.
3. **Geração de Relatórios:**
   - Relatórios detalhados sobre fazendas e seus respectivos animais.

## Requisitos de Sistema
- **Delphi 11** (para compilação do projeto)
- **Firebird 2.5** (para o banco de dados)
- **FastReport** (para a geração de relatórios)
- Sistema operacional Windows


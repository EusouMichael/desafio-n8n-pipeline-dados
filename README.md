# Automação de Pipeline de Dados com n8n

## Visão geral

Projeto desenvolvido para o desafio criativo da DIO sobre planejamento de automações com n8n a partir de prompts estruturados.

A proposta transforma a chegada de um arquivo CSV em um fluxo automatizado de ingestão, validação, controle de qualidade, persistência e comunicação.

O projeto foi estruturado como um blueprint técnico: o workflow pode ser importado no n8n e configurado com as credenciais e parâmetros do ambiente.

## Problema

Processos de ingestão de arquivos frequentemente dependem de tarefas manuais para localizar novos arquivos, conferir estrutura, identificar campos obrigatórios ausentes, detectar duplicidades, separar registros válidos e inválidos, carregar dados no banco e comunicar o resultado.

Essas etapas consomem tempo, aumentam o risco de erro operacional e dificultam a rastreabilidade.

## Solução proposta

O n8n atua como camada de orquestração:

```text
Google Drive
    |
    v
Download do CSV
    |
    v
Leitura e normalização
    |
    v
Validação de estrutura e dados
    |
    +----------------------+
    |                      |
    v                      v
Válidos                 Inválidos
    |                      |
    v                      v
PostgreSQL             Relatório
    |                      |
    +----------+-----------+
               |
               v
        Resumo com IA
               |
               v
             Gmail
```

## Tecnologias

- n8n
- Google Drive
- JavaScript
- PostgreSQL
- OpenAI
- Gmail
- CSV

## Estrutura do projeto

```text
desafio-n8n-pipeline-dados/
├── README.md
├── prompt/
│   └── prompt-final.md
├── workflow/
│   └── n8n-pipeline-dados.json
├── sql/
│   └── schema.sql
├── data/
│   └── clientes_exemplo.csv
└── docs/
    ├── arquitetura.md
    └── configuracao.md
```

## Fluxo funcional

1. Detectar um novo CSV.
2. Obter os metadados do arquivo.
3. Baixar e interpretar os dados.
4. Validar estrutura e campos obrigatórios.
5. Detectar duplicidades e inconsistências.
6. Separar registros válidos e inválidos.
7. Persistir os registros válidos no PostgreSQL.
8. Gerar um resumo agregado de qualidade com IA.
9. Preparar uma notificação operacional.
10. Enviar o resultado por e-mail.

## Qualidade e segurança

O projeto considera idempotência por identificador do arquivo, separação entre registros válidos e inválidos, registro de métricas da execução e tratamento de credenciais fora do código-fonte.

A IA deve receber preferencialmente métricas agregadas e informações de qualidade, evitando o envio desnecessário de dados pessoais.

## Arquivos principais

- [Prompt final](./prompt/prompt-final.md): prompt estruturado solicitado pelo desafio.
- [Workflow n8n](./workflow/n8n-pipeline-dados.json): blueprint da automação.
- [Schema PostgreSQL](./sql/schema.sql): estrutura de persistência.
- [CSV de exemplo](./data/clientes_exemplo.csv): dataset para teste.
- [Arquitetura](./docs/arquitetura.md): descrição técnica do fluxo.
- [Configuração](./docs/configuracao.md): orientações para preparar o ambiente.

## Importação no n8n

O arquivo `workflow/n8n-pipeline-dados.json` contém o blueprint inicial. Após a importação, os nós marcados como configuração devem ser substituídos ou ajustados para as credenciais e operações disponíveis no ambiente n8n utilizado.

O projeto não inclui credenciais, tokens ou chaves de API.

## Resultado esperado

Ao final de uma execução, o responsável deve conseguir identificar:

- arquivo processado;
- status da execução;
- quantidade total de registros;
- registros válidos;
- registros inválidos;
- duplicidades;
- principais problemas de qualidade;
- diagnóstico operacional gerado por IA.

## Objetivo do desafio

Demonstrar a capacidade de transformar uma necessidade de negócio em uma especificação de automação clara, estruturada e implementável com n8n, utilizando conceitos de integração, qualidade de dados, persistência, IA e tratamento de exceções.

## Status

Blueprint desenvolvido para demonstração e estudo. As integrações externas e credenciais precisam ser configuradas no ambiente n8n antes de uma execução real.

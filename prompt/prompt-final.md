# Prompt final — Automação de Pipeline de Dados com n8n

Atue como um especialista em n8n, automação de processos, integração de APIs e engenharia de dados.

Crie o planejamento de uma automação no n8n para realizar a validação e o processamento inicial de arquivos CSV recebidos para análise de dados.

## Objetivo

Automatizar o processo de recebimento, validação, tratamento inicial, armazenamento e comunicação dos resultados referentes a novos arquivos de dados.

## Público

Analistas de Dados, equipes de BI e profissionais responsáveis por pipelines de dados.

## Ferramentas envolvidas

- Google Drive como origem dos arquivos;
- n8n como plataforma de automação e orquestração;
- JavaScript para validações e tratamento dos dados;
- PostgreSQL para armazenamento;
- OpenAI para gerar um resumo sobre a qualidade dos dados;
- Gmail para envio das notificações.

## Fluxo desejado

1. Detectar a chegada de um novo arquivo CSV em uma pasta específica do Google Drive.
2. Baixar o arquivo para processamento.
3. Ler e interpretar os dados do CSV.
4. Validar se o arquivo possui a estrutura e os campos obrigatórios esperados.
5. Verificar valores ausentes, registros duplicados e inconsistências nos dados.
6. Separar os registros válidos dos registros inválidos.
7. Armazenar os registros válidos em uma tabela do PostgreSQL.
8. Gerar um resumo da qualidade dos dados utilizando um modelo de IA.
9. Enviar um e-mail para o responsável contendo o resultado do processamento.
10. Registrar o status da execução e eventuais erros encontrados.

## Regras e restrições

- Aceitar somente arquivos no formato CSV.
- O arquivo deve possuir os campos obrigatórios previamente definidos.
- Arquivos com estrutura inválida não devem ser carregados no PostgreSQL.
- Registros com campos obrigatórios ausentes devem ser classificados como inválidos.
- Registros duplicados devem ser identificados antes da carga.
- Registros inválidos não devem ser inseridos na tabela principal.
- O workflow deve evitar o processamento duplicado do mesmo arquivo.
- Caso ocorra um erro durante qualquer etapa, o workflow deve registrar o erro e enviar uma notificação ao responsável.
- A execução deve informar pelo menos a quantidade total de registros, registros válidos, registros inválidos, duplicidades encontradas e principais problemas identificados.
- A automação deve ser organizada de forma modular e permitir manutenção futura.

## Solicitação

Explique quais nós do n8n devem ser utilizados para construir esse workflow.

Para cada nó, informe:

1. Nome do nó;
2. Função dentro do workflow;
3. Dados recebidos;
4. Dados enviados para a próxima etapa;
5. Principais configurações necessárias.

Apresente também:

- a sequência completa dos nós;
- as condições e ramificações do workflow;
- a lógica utilizada para tratamento de erros;
- como evitar o processamento duplicado de arquivos;
- como estruturar a tabela do PostgreSQL;
- como utilizar a IA para gerar o resumo da qualidade dos dados;
- um exemplo do conteúdo da notificação enviada por e-mail.

Ao final, apresente uma visão simplificada do workflow:

Google Drive
→ Download do arquivo
→ Leitura do CSV
→ Validação
→ Tratamento
→ Registros válidos / inválidos
→ PostgreSQL
→ Análise com IA
→ Gmail

Priorize uma solução simples, segura, modular e adequada para um projeto de demonstração profissional.

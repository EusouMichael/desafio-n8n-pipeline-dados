# Configuração do ambiente

## Credenciais

Configure no n8n:

1. Google Drive OAuth2.
2. PostgreSQL.
3. Provedor de IA.
4. Gmail OAuth2.

Nunca coloque tokens, senhas ou chaves de API no JSON do workflow ou no GitHub.

## Google Drive

Crie uma pasta de entrada e informe o ID da pasta no nó correspondente.

## PostgreSQL

Execute `sql/schema.sql` antes da primeira execução.

## Campos de exemplo

O CSV de demonstração utiliza:

- customer_id
- name
- email
- city
- state

## Teste

Use `data/clientes_exemplo.csv` para validar o comportamento esperado.

O arquivo contém registros válidos, ausência de e-mail e duplicidade para demonstrar a etapa de qualidade.

## Produção

Antes de utilizar dados reais:

- configure tratamento de erros;
- valide permissões mínimas das credenciais;
- evite enviar dados pessoais para modelos de IA;
- defina política de retenção;
- habilite logs e monitoramento;
- teste idempotência e reprocessamento.

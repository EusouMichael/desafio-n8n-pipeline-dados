# Arquitetura da automação

## Entrada

Um arquivo CSV é disponibilizado em uma pasta monitorada no Google Drive. O identificador do arquivo é usado como chave de idempotência.

## Aquisição

O n8n obtém o arquivo e o disponibiliza em formato binário para a etapa de leitura.

## Parsing

O CSV é convertido em itens estruturados para que cada registro possa ser validado individualmente.

## Validação

A camada de validação verifica formato, colunas obrigatórias, campos obrigatórios, tipos e formatos esperados e duplicidades.

## Roteamento

Registros válidos seguem para persistência. Registros inválidos seguem para uma estrutura de rejeição, preservando o registro original e os motivos.

## Persistência

O PostgreSQL mantém controle dos arquivos processados, registros válidos, registros inválidos e métricas da execução.

## IA

A IA recebe somente o resumo agregado da execução. Exemplo:

```text
Arquivo: clientes_2026-09-07.csv
Total: 1000
Válidos: 962
Inválidos: 38
Duplicados: 12
Principais problemas: 21 e-mails ausentes, 17 estados inválidos
```

A saída esperada é um diagnóstico operacional curto, com destaque para riscos e recomendações.

## Comunicação

O Gmail envia uma mensagem com arquivo processado, status, volume total, válidos, inválidos, duplicidades, diagnóstico e eventual erro.

## Idempotência

Antes da carga, o workflow deve consultar `ingestion_files` pelo `file_id`. Se o arquivo já estiver como `PROCESSED`, o processamento deve ser encerrado sem inserir dados novamente.

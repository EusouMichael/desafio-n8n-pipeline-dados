-- Schema de referência para o workflow de ingestão.
-- Ajuste tipos e restrições conforme o dataset real.

CREATE SCHEMA IF NOT EXISTS data_pipeline;

CREATE TABLE IF NOT EXISTS data_pipeline.ingestion_files (
    id BIGSERIAL PRIMARY KEY,
    file_name TEXT NOT NULL,
    file_id TEXT NOT NULL UNIQUE,
    received_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    processed_at TIMESTAMPTZ,
    status TEXT NOT NULL CHECK (status IN ('RECEIVED', 'PROCESSED', 'REJECTED', 'ERROR')),
    total_records INTEGER DEFAULT 0,
    valid_records INTEGER DEFAULT 0,
    invalid_records INTEGER DEFAULT 0,
    duplicate_records INTEGER DEFAULT 0,
    error_message TEXT
);

CREATE TABLE IF NOT EXISTS data_pipeline.customer_records (
    id BIGSERIAL PRIMARY KEY,
    source_file_id TEXT NOT NULL,
    customer_id TEXT NOT NULL,
    name TEXT,
    email TEXT,
    city TEXT,
    state TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_customer_source UNIQUE (source_file_id, customer_id)
);

CREATE TABLE IF NOT EXISTS data_pipeline.invalid_records (
    id BIGSERIAL PRIMARY KEY,
    source_file_id TEXT NOT NULL,
    row_number INTEGER,
    raw_record JSONB NOT NULL,
    validation_errors JSONB NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_customer_records_source_file
    ON data_pipeline.customer_records(source_file_id);

CREATE INDEX IF NOT EXISTS idx_invalid_records_source_file
    ON data_pipeline.invalid_records(source_file_id);

CREATE TABLE IF NOT EXISTS project (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO project (name, status)
VALUES 
    ('Data Pipeline A', 'active'),
    ('ETL Workflow B', 'inactive'),
    ('Analytics Job C', 'active');

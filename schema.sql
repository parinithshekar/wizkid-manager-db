-- delete all tables, domains and functions
\c owow
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-- create tables and assign modified triggers
CREATE TABLE IF NOT EXISTS account (
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users (
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20),
    role VARCHAR(10) NOT NULL,
    phone VARCHAR(10),
    picture VARCHAR(255),
    status VARCHAR(6) NOT NULL DEFAULT 'ACTIVE',
    account_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_account_id FOREIGN KEY (account_id) REFERENCES account(id) ON DELETE CASCADE
);

CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    login_info VARCHAR(255),
    nickname VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    initial_status TEXT
);

CREATE TABLE habits (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    difficulty VARCHAR(50),
    category VARCHAR(100),
    needs_verification BOOLEAN DEFAULT FALSE
);

CREATE TABLE embeddings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    embedding vector(1536),
    text_data VARCHAR,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recommendations (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    criteria_summary TEXT,
    suggested_habits TEXT
);

CREATE TABLE monthly_reports (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    month VARCHAR(20),
    completion_rate FLOAT,
    consecutive_days INTEGER,
    top_success_habits TEXT,
    top_failed_habits TEXT
);

CREATE TABLE checklists (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    habit_id INTEGER NOT NULL REFERENCES habits(id),
    date DATE NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    performed_at TIMESTAMP,
    image_path VARCHAR(255)
);

INSERT INTO users (id, login_info, nickname)
VALUES (DEFAULT, 'example@email.com', 'example');

INSERT INTO users (id, login_info, nickname)
VALUES (DEFAULT, 'fakeaccount@email.com', 'fakename');
CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,

    city VARCHAR(100) NOT NULL,
    ward VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(10),

    UNIQUE (city, ward)
);

CREATE TABLE infra_data (
    infra_id SERIAL PRIMARY KEY,

    category VARCHAR(100) NOT NULL,
    investment_amount NUMERIC(15, 2),
    current_condition VARCHAR(100),
    last_action_date DATE,
    policy_number VARCHAR(100)
);

CREATE TABLE region_infrastructure (
    region_id INTEGER NOT NULL,
    infra_id INTEGER NOT NULL,

    PRIMARY KEY (region_id, infra_id),

    FOREIGN KEY (region_id)
        REFERENCES regions(region_id)
        ON DELETE CASCADE,

    FOREIGN KEY (infra_id)
        REFERENCES infra_data(infra_id)
        ON DELETE CASCADE
);

CREATE TABLE clusters (
    cluster_id SERIAL PRIMARY KEY,

    category VARCHAR(100) NOT NULL,
    region_id INTEGER NOT NULL,
    issue_description TEXT NOT NULL,
    cluster_status VARCHAR(50) NOT NULL DEFAULT 'active',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    FOREIGN KEY (region_id)
        REFERENCES regions(region_id)
        ON DELETE CASCADE
);

CREATE TABLE citizen_requests (
    request_id SERIAL PRIMARY KEY,

    text TEXT,
    image TEXT,
    voice TEXT,

    language VARCHAR(50),
    category VARCHAR(100),

    region_id INTEGER NOT NULL,
    cluster_id INTEGER,

    submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    FOREIGN KEY (region_id)
        REFERENCES regions(region_id)
        ON DELETE CASCADE,

    FOREIGN KEY (cluster_id)
        REFERENCES clusters(cluster_id)
        ON DELETE SET NULL
);

CREATE TABLE recommendations (
    recommendation_id SERIAL PRIMARY KEY,

    cluster_id INTEGER NOT NULL,
    recommended_action TEXT NOT NULL,
    responsible_department VARCHAR(100),
    priority VARCHAR(50) NOT NULL,

    UNIQUE (cluster_id),

    FOREIGN KEY (cluster_id)
        REFERENCES clusters(cluster_id)
        ON DELETE CASCADE
);
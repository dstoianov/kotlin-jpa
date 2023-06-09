CREATE TABLE client
(
    id   BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name VARCHAR(255)                            NOT NULL,
    CONSTRAINT PK_CLIENT PRIMARY KEY (id)
);

CREATE TABLE contact
(
    id        BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name      VARCHAR(255)                            NOT NULL,
    email     VARCHAR(255)                            NOT NULL,
    client_id BIGINT,
    CONSTRAINT PK_CONTACT PRIMARY KEY (id)
);

CREATE TABLE project
(
    id        BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name      VARCHAR(255)                            NOT NULL,
    client_id BIGINT,
    CONSTRAINT PK_PROJECT PRIMARY KEY (id)
);

ALTER TABLE contact
    ADD CONSTRAINT UC_CONTACT_EMAIL UNIQUE (email);

ALTER TABLE project
    ADD CONSTRAINT FK_PROJECT_ON_CLIENT FOREIGN KEY (client_id) REFERENCES client (id);
CREATE TABLE log
(
    id                      VARCHAR(255) NOT NULL,
    record_date             TIMESTAMP    NOT NULL,
    application_instance_id VARCHAR(255),
    domainName              VARCHAR(255),
    server_ip               VARCHAR(255),
    server_port             INTEGER,
    client_ip               VARCHAR(255),
    client_port             INTEGER,
    session_id              VARCHAR(255),
    username                VARCHAR(255),
    client_request          VARCHAR(1024),
    client_message          VARCHAR(1024),
    server_status           VARCHAR(1024),
    server_message          VARCHAR(1024),
    inbound_bytes           BIGINT,
    outbound_bytes          BIGINT,
    PRIMARY KEY (id)
);

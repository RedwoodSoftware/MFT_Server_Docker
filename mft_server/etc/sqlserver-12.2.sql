CREATE TABLE server_ksf
(
    id            VARCHAR(255)   NOT NULL,
    category      VARCHAR(255)   NOT NULL,
    section       VARCHAR(255)   NOT NULL,
    creationDate  BIGINT         NOT NULL,
    maturityLevel VARCHAR(255)   NOT NULL,
    data          VARBINARY(MAX) NOT NULL,
    PRIMARY KEY (id)
);

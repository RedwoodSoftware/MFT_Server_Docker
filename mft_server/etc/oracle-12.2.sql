CREATE TABLE server_ksf
(
    id            VARCHAR(255) NOT NULL,
    category      VARCHAR(255) NOT NULL,
    section       VARCHAR(255) NOT NULL,
    creationDate  NUMBER(19)   NOT NULL,
    maturityLevel VARCHAR(255) NOT NULL,
    data          BLOB         NOT NULL,
    PRIMARY KEY (id)
);

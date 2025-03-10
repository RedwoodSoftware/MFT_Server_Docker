CREATE TABLE domain_directory_monitor_event
(
    id          VARCHAR(255)   NOT NULL,
    domainName  VARCHAR(255)   NOT NULL,
    monitorName VARCHAR(255)   NOT NULL,
    filePath    VARCHAR(2048)  NOT NULL,
    eventDate   BIGINT,
    eventType   VARCHAR(255)   NOT NULL,
    data        VARBINARY(MAX) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE domain_usage
(
    instanceId   VARCHAR(255)   NOT NULL,
    domainName   VARCHAR(255)   NOT NULL,
    snapshotDate BIGINT         NOT NULL,
    data         VARBINARY(MAX) NOT NULL,
    signature    VARCHAR(255)   NOT NULL,
    PRIMARY KEY (instanceId, domainName, snapshotDate)
);


ALTER TABLE domain_adhoc_transfer ADD type VARCHAR(255) DEFAULT 'EMAIL';
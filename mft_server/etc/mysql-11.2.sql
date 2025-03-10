CREATE TABLE domain_directory_monitor_state
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    version    VARCHAR(255) NOT NULL,
    data       LONGBLOB   NOT NULL,
    PRIMARY KEY (name, domainName)
);

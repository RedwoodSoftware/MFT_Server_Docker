CREATE TABLE domain_trigger_template
(
    name         VARCHAR(255)   NOT NULL,
    domainName   VARCHAR(255)   NOT NULL,
    templateType VARCHAR(255)   NOT NULL,
    eventType    VARCHAR(255)   NOT NULL,
    version      VARCHAR(255)   NOT NULL,
    data         VARBINARY(MAX) NOT NULL,
    PRIMARY KEY (name, domainName)
);

ALTER TABLE domain_trigger
    ADD lastRunDate BIGINT DEFAULT NULL;

ALTER TABLE domain_directory_monitor
    ADD lastRunDate BIGINT DEFAULT NULL;
	
ALTER TABLE server_private_key ADD domainName VARCHAR(255) DEFAULT NULL;

ALTER TABLE server_certificate ADD domainName VARCHAR(255) DEFAULT NULL;

ALTER TABLE server_public_key ADD domainName VARCHAR(255) DEFAULT NULL;

ALTER TABLE server_pgp_secret_key ADD domainName VARCHAR(255) DEFAULT NULL;

ALTER TABLE server_pgp_public_key ADD domainName VARCHAR(255) DEFAULT NULL;

ALTER TABLE server_log ADD applicationInstanceId VARCHAR(255) DEFAULT NULL;	
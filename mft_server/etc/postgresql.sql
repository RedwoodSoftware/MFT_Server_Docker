CREATE TABLE server_configuration
(
    name    VARCHAR(255) NOT NULL,
    version VARCHAR(255) NOT NULL,
    data    BYTEA        NOT NULL,
    PRIMARY KEY (name)
);


CREATE TABLE domain_configuration
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    version    VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_usage
(
    instanceId   VARCHAR(255) NOT NULL,
    domainName   VARCHAR(255) NOT NULL,
    snapshotDate BIGINT       NOT NULL,
    data         BYTEA        NOT NULL,
    signature    VARCHAR(255) NOT NULL,
    PRIMARY KEY (instanceId, domainName, snapshotDate)
);


CREATE TABLE server_tag
(
    name VARCHAR(255),
    PRIMARY KEY (name)
);


CREATE TABLE domain_entity_tag
(
    name       VARCHAR(255),
    domainName VARCHAR(255),
    type       VARCHAR(50),
    tag        VARCHAR(255),
    PRIMARY KEY (name, domainName, type, tag)
);


CREATE TABLE server_private_key
(
    name                    VARCHAR(255) NOT NULL,
    keyAlgorithm            VARCHAR(50)  NOT NULL,
    keySize                 INTEGER      NOT NULL,
    certificateSerialNumber VARCHAR(1024),
    certificateBeginDate    BIGINT       NOT NULL,
    certificateEndDate      BIGINT       NOT NULL,
    certificateIssuer       VARCHAR(1024),
    certificateSubject      VARCHAR(1024),
    revoked                 INTEGER      NOT NULL,
    domainName              VARCHAR(255),
    keyData                 BYTEA        NOT NULL,
    certificateData         BYTEA        NOT NULL,
    PRIMARY KEY (name)
);


CREATE TABLE server_certificate
(
    name                    VARCHAR(255) NOT NULL,
    type                    VARCHAR(50)  NOT NULL,
    keyAlgorithm            VARCHAR(50)  NOT NULL,
    keySize                 INTEGER      NOT NULL,
    certificateSerialNumber VARCHAR(1024),
    certificateBeginDate    BIGINT       NOT NULL,
    certificateEndDate      BIGINT       NOT NULL,
    certificateIssuer       VARCHAR(1024),
    certificateSubject      VARCHAR(1024),
    revoked                 INTEGER      NOT NULL,
    domainName              VARCHAR(255),
    data                    BYTEA        NOT NULL,
    PRIMARY KEY (name, type)
);


CREATE TABLE server_public_key
(
    name         VARCHAR(255) NOT NULL,
    type         VARCHAR(50)  NOT NULL,
    keyAlgorithm VARCHAR(50)  NOT NULL,
    keySize      INTEGER      NOT NULL,
    domainName   VARCHAR(255),
    data         BYTEA        NOT NULL,
    PRIMARY KEY (name, type)
);


CREATE TABLE server_pgp_public_key
(
    name           VARCHAR(255) NOT NULL,
    keyAlgorithm   VARCHAR(50)  NOT NULL,
    keySize        INTEGER      NOT NULL,
    expirationDate BIGINT DEFAULT NULL,
    fingerprint    VARCHAR(255) NOT NULL,
    domainName     VARCHAR(255),
    data           BYTEA        NOT NULL,
    PRIMARY KEY (name)
);


CREATE TABLE server_pgp_secret_key
(
    name           VARCHAR(255) NOT NULL,
    keyAlgorithm   VARCHAR(50)  NOT NULL,
    keySize        INTEGER      NOT NULL,
    expirationDate BIGINT DEFAULT NULL,
    fingerprint    VARCHAR(255) NOT NULL,
    domainName     VARCHAR(255),
    data           BYTEA        NOT NULL,
    PRIMARY KEY (name)
);


CREATE TABLE domain_as2_message
(
    id             VARCHAR(255) NOT NULL,
    domainName     VARCHAR(255) NOT NULL,
    messageId      VARCHAR(255) NOT NULL,
    messageDate    BIGINT       NOT NULL,
    messageType    VARCHAR(20)  NOT NULL,
    direction      VARCHAR(20)  NOT NULL,
    sender         VARCHAR(255),
    recipient      VARCHAR(255),
    username       VARCHAR(255),
    tradingPartner VARCHAR(255),
    filename       VARCHAR(1024),
    receiptType    VARCHAR(20),
    status         VARCHAR(20),
    data           BYTEA        NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE domain_oftp_message
(
    id             VARCHAR(255) NOT NULL,
    domainName     VARCHAR(255) NOT NULL,
    messageDate    BIGINT       NOT NULL,
    messageType    VARCHAR(20)  NOT NULL,
    direction      VARCHAR(20)  NOT NULL,
    originator     VARCHAR(255),
    destination    VARCHAR(255),
    username       VARCHAR(255),
    tradingPartner VARCHAR(255),
    filename       VARCHAR(1024),
    fileDate       VARCHAR(20),
    status         VARCHAR(20),
    data           BYTEA        NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE domain_adhoc_transfer
(
    id         VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    account    VARCHAR(255) NOT NULL,
    type       VARCHAR(255) DEFAULT 'EMAIL',
    data       BYTEA        NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE domain_account_template
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    version    VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_account
(
    login         VARCHAR(255) NOT NULL,
    domainName    VARCHAR(255) NOT NULL,
    name          VARCHAR(255),
    owner         VARCHAR(255),
    company       VARCHAR(255),
    administrator INTEGER      NOT NULL,
    lastLoginDate BIGINT,
    version       VARCHAR(255) NOT NULL,
    data          BYTEA        NOT NULL,
    PRIMARY KEY (login, domainName)
);


CREATE TABLE domain_group
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    version    VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_account_group
(
    domainName VARCHAR(255) NOT NULL,
    login      VARCHAR(255) NOT NULL,
    groupName  VARCHAR(255) NOT NULL,
    PRIMARY KEY (domainName, login, groupName)
);


CREATE TABLE server_domain
(
    name              VARCHAR(255) NOT NULL,
    description       VARCHAR(1024),
    autoStartRequired INTEGER      NOT NULL,
    version           VARCHAR(255) NOT NULL,
    data              BYTEA        NOT NULL,
    PRIMARY KEY (name)
);


CREATE TABLE domain_self_registration
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_lost_password_challenge
(
    id             VARCHAR(255) NOT NULL,
    expirationDate BIGINT       NOT NULL,
    data           BYTEA        NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE domain_log_search
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    searchDate BIGINT       NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_dlp_rule
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    version    VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_account_quota
(
    domainName VARCHAR(255) NOT NULL,
    login      VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (domainName, login)
);


CREATE TABLE domain_trigger
(
    name        VARCHAR(255) NOT NULL,
    domainName  VARCHAR(255) NOT NULL,
    eventType   VARCHAR(255) NOT NULL,
    enabled     INTEGER      NOT NULL,
    lastRunDate BIGINT,
    version     VARCHAR(255) NOT NULL,
    data        BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_trigger_order
(
    domainName VARCHAR(255) NOT NULL,
    eventType  VARCHAR(255) NOT NULL,
    version    VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (domainName, eventType)
);


CREATE TABLE domain_trigger_template
(
    name         VARCHAR(255) NOT NULL,
    domainName   VARCHAR(255) NOT NULL,
    templateType VARCHAR(255) NOT NULL,
    eventType    VARCHAR(255) NOT NULL,
    version      VARCHAR(255) NOT NULL,
    data         BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_trigger_state
(
    id          VARCHAR(255) NOT NULL,
    domainName  VARCHAR(255) NOT NULL,
    eventId     VARCHAR(255) NOT NULL,
    triggerName VARCHAR(255) NOT NULL,
    fileName    VARCHAR(1024) DEFAULT NULL,
    status      VARCHAR(20)  NOT NULL,
    startTime   BIGINT       NOT NULL,
    endTime     BIGINT,
    runTime     INTEGER      NOT NULL,
    data        BYTEA        NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE domain_reverse_proxy
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    host       VARCHAR(255) NOT NULL,
    protocol   VARCHAR(50)  NOT NULL,
    userName   VARCHAR(255),
    version    VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_report
(
    name        VARCHAR(255) NOT NULL,
    domainName  VARCHAR(255) NOT NULL,
    reportDate  BIGINT       NOT NULL,
    description VARCHAR(1024),
    searchName  VARCHAR(255),
    version     VARCHAR(255) NOT NULL,
    data        BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_directory_monitor
(
    name               VARCHAR(255)  NOT NULL,
    domainName         VARCHAR(255)  NOT NULL,
    pathname           VARCHAR(2048) NOT NULL,
    timeout            INTEGER,
    owner              VARCHAR(255),
    monitorRecursively INTEGER       NOT NULL,
    lastRunDate        BIGINT,
    version            VARCHAR(255)  NOT NULL,
    data               BYTEA         NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_directory_monitor_state
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    version    VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_directory_monitor_event
(
    id          VARCHAR(255)  NOT NULL,
    domainName  VARCHAR(255)  NOT NULL,
    monitorName VARCHAR(255)  NOT NULL,
	tradingPartner VARCHAR(255) DEFAULT NULL,
    filePath    VARCHAR(2048) NOT NULL,
    eventDate   BIGINT,
    eventType   VARCHAR(255)  NOT NULL,
    data        BYTEA         NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE domain_drop_zone
(
    name                 VARCHAR(255)  NOT NULL,
    domainName           VARCHAR(255)  NOT NULL,
    accountName          VARCHAR(255)  NOT NULL,
    virtualZoneDirectory VARCHAR(2048) NOT NULL,
    urlBrandingName      VARCHAR(255),
    owner                VARCHAR(255),
    version              VARCHAR(255)  NOT NULL,
    data                 BYTEA         NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_web_theme
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    owner      VARCHAR(255),
    version    VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_trading_partner
(
    name       VARCHAR(255) NOT NULL,
    domainName VARCHAR(255) NOT NULL,
    company    VARCHAR(255),
    protocol   VARCHAR(255) NOT NULL,
    server     VARCHAR(255) DEFAULT NULL,
    version    VARCHAR(255) NOT NULL,
    data       BYTEA        NOT NULL,
    PRIMARY KEY (name, domainName)
);


CREATE TABLE domain_contact
(
    id         VARCHAR(255)  NOT NULL,
    domainName VARCHAR(255)  NOT NULL,
    name       VARCHAR(255)  NOT NULL,
    email      VARCHAR(1024) NOT NULL,
    company    VARCHAR(255),
    owner      VARCHAR(255),
    version    VARCHAR(255)  NOT NULL,
    data       BYTEA         NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE server_log
(
    id                    VARCHAR(255) NOT NULL,
    applicationInstanceId VARCHAR(255),
    recordDate            BIGINT       NOT NULL,
    clientHost            VARCHAR(255),
    clientPort            INTEGER      NOT NULL,
    userName              VARCHAR(255),
    domainName            VARCHAR(255),
    action                VARCHAR(255),
    description           VARCHAR(1024),
    PRIMARY KEY (id)
);


CREATE TABLE server_management_role
(
    name    VARCHAR(255) NOT NULL,
    version VARCHAR(255) NOT NULL,
    data    BYTEA        NOT NULL,
    PRIMARY KEY (name)
);


CREATE TABLE server_administrator_role
(
    administrator VARCHAR(255) NOT NULL,
    role          VARCHAR(255) NOT NULL,
    PRIMARY KEY (administrator, role)
);


CREATE TABLE server_administrator
(
    username      VARCHAR(255) NOT NULL,
    lastLoginDate BIGINT,
    version       VARCHAR(255) NOT NULL,
    data          BYTEA        NOT NULL,
    PRIMARY KEY (username)
);


CREATE TABLE server_ksf
(
    id            VARCHAR(255) NOT NULL,
    category      VARCHAR(255) NOT NULL,
    section       VARCHAR(255) NOT NULL,
    creationDate  BIGINT       NOT NULL,
    maturityLevel VARCHAR(255) NOT NULL,
    data          BYTEA        NOT NULL,
    PRIMARY KEY (id)
);

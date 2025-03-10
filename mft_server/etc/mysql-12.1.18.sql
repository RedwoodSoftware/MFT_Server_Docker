ALTER TABLE server_pgp_public_key
    ADD expirationDate BIGINT DEFAULT NULL;


ALTER TABLE server_pgp_secret_key
    ADD expirationDate BIGINT DEFAULT NULL;

ALTER TABLE server_pgp_public_key
    ADD expirationDate NUMBER(19) DEFAULT NULL;
	

ALTER TABLE server_pgp_secret_key
    ADD expirationDate NUMBER(19) DEFAULT NULL;

ALTER TABLE server_private_key ADD revoked INTEGER DEFAULT 0 NOT NULL;

ALTER TABLE server_certificate ADD revoked INTEGER DEFAULT 0 NOT NULL;


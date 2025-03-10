ALTER TABLE log ADD fake_id VARCHAR(255); 


UPDATE log SET fake_id = id;


DECLARE @table NVARCHAR(512), @sql NVARCHAR(MAX); SELECT @table = N'log'; SELECT @sql = 'ALTER TABLE ' + @table + ' DROP CONSTRAINT ' + name + ';' FROM sys.key_constraints WHERE [type] = 'PK' AND [parent_object_id] = OBJECT_ID(@table); EXEC sp_executeSQL @sql;


ALTER TABLE log DROP COLUMN id;


ALTER TABLE log ADD id VARCHAR(255) NOT NULL DEFAULT '0';


UPDATE log SET id = fake_id;


ALTER TABLE log ADD PRIMARY KEY (id);


ALTER TABLE log DROP COLUMN fake_id;


ALTER TABLE log ADD domainName VARCHAR(255);

-- two primary keys
ALTER TABLE table_name ADD PRIMARY KEY (column_1, column_2);

-- auto-incremented primary key
ALTER TABLE table_name ADD COLUMN id SERIAL PRIMARY KEY;

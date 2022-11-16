CREATE USER 'admin'@'mysqlserverhost' IDENTIFIED BY 'dapetoo';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'mysqlserverhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;


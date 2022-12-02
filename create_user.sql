CREATE USER ''@'%' IDENTIFIED BY ''; GRANT ALL PRIVILEGES ON * . * TO ''@'%';
-- CREATE USER 'admin'@'localhost' IDENTIFIED BY 'dapetoo';
-- GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
-- FLUSH PRIVILEGES;

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'dapetoo';

CREATE USER 'dapetoo'@'172.18.0.3' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'dapetoo'@'172.18.0.3' WITH GRANT OPTION;

Access denied for user 'dapetoo'@'172.18.0.3' (using password: YES)

GRANT ALL PRIVILEGES ON *.* TO 'dapetoo'@'localhost' WITH GRANT OPTION;
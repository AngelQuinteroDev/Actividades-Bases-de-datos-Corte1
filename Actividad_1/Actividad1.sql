CREATE DATABASE db_calss; 

CREATE TABLE users(
id varchar(50),
user_name varchar(50)
);

INSERT INTO users(id, username) VALUES('1', 'Pollo Asado');

SELECT * FROM users WHERE id = '1';
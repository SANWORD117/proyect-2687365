CREATE DATABASE myapp;
-- DROP database myapp;
USE myapp;

CREATE TABLE User_tbl (
user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
user_firstname VARCHAR (50) NOT NULL,
user_lastname VARCHAR (50) NOT NULL,
user_email VARCHAR (50) NOT NULL,
user_password VARBINARY (255) NOT NULL
);

INSERT INTO myapp.user_tbl (user_firstname, user_lastname, user_email, user_password) 
VALUES ( UPPER('nombres'), UPPER('apellidos'), 'buzon@correo.com',AES_ENCRYPT('password', '$2a$12$MrAPQEBGNwO1GsTKTeklN.maByQMvzL8X4nyeW6WBJL1k0IUoUb9G'));

SELECT *, CAST(AES_DECRYPT(user_password, '$2a$12$MrAPQEBGNwO1GsTKTeklN.maByQMvzL8X4nyeW6WBJL1k0IUoUb9G') AS CHAR(50)) end_data FROM user_tbl WHERE user_id = 1;

CREATE TABLE Category_tbl (
Category_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Category_name VARCHAR (50) NOT NULL
);

INSERT INTO myapp.category_tbl (category_name)
VALUES (UPPER('teclados'));

INSERT INTO myapp.category_tbl (category_name)
VALUES (UPPER('mouses'));

CREATE TABLE Product_tbl (
Product_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Product_name VARCHAR (50) ,
Product_value decimal NOT NULL,
Category_id INT NOT NULL, FOREIGN KEY(Category_id) REFERENCES Category_tbl(Category_id)
);

INSERT INTO myapp.product_tbl (product_name,product_value,Category_id)
VALUES (UPPER('teclado Logitech'), '500000', '1');


select * from user_tbl;
select * from product_tbl;
select * from category_tbl;
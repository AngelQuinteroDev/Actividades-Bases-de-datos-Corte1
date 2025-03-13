/*Realizado por: Angely Parra, Andres Cubillos y Angel Quintero */

/*Inserte las categorias en la tabla de categoria*/

INSERT INTO category(idCategory, Category_Name) VALUES (1, "Plomeria"), (2,"Metalmecánica"), (3, "Mueblería"), (4, "Otro"); 

/*Insertar dos reistros en cada Tabla  */

INSERT INTO branch(idBranch, Branch_name, Address, Manager_Name) VALUES (1, "La Estrella", "Carrera 5 # 23-65", "Angely Parra Vallenato"),
 (2, "La Luna", "Carrera 170 # 9-62", "Eduardito Cubitos"), (3, "El Sol", "Carrera 7 # 111-23", "Angel Quintero");
 
 INSERT INTO products(idProducts, Purchase_Price, Sell_Price, Product_Name) VALUES (1, 35000, 40000, "Multimetro"),
 (2, 17000, 20000, "Cautin"), (3, 200, 300, "Tornillo");
 
 INSERT INTO category_has_products(Category_idCategory, Products_idProducts) VALUES (1, 2), (2, 1), (1,3);

 
 /* Recuperar los Registros de una tabla */
 
 SELECT * FROM products;
 
 /* Recuperar un producto mediante la referencia */
 
 SELECT * FROM products WHERE idProducts = 2;
 
 /* Recupere todos los productos de una categoría*/
 
 SELECT  category_has_products.Category_idCategory, products.Product_Name
 FROM category_has_products
 INNER JOIN products ON idProducts = Products_idProducts
 WHERE category_has_products.Category_idCategory = 1;
 
 /*  Actualizar la categoria de un producto */
 
 UPDATE category_has_products SET Category_idCategory = 2 WHERE Products_idProducts = 3;
 
 /* Actualice el nombre del encargado de una surcursal */
 
 UPDATE branch SET Manager_Name = "ANGEL GABRIEL" WHERE idBranch = 3;
 
 
 /* Intente eliminar un producto y explique porque esto no es posible */
 
 DELETE FROM products WHERE idProducts = 2;
 
 
 /* No se puede eliminar porque es una foreign key, otras tablas dependen o utilizan 
 ese dato "el id del producto" es utilizado especificamente por la tabla Products_idProducts */
 
use sakila;


CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);

INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) 
VALUES 
  (1002, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', '1', NULL, 'President'),
  (1056, 'Patterson', 'Mary', 'x4611', 'mpatterso@classicmodelcars.com', '1', 1002, 'VP Sales'),
  (1076, 'Firrelli', 'Jeff', 'x9273', 'jfirrelli@classicmodelcars.com', '1', 1002, 'VP Marketing');


INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) VALUES (1077, 'Lionel Andres', 'Messi', 'x2022', NULL, '2', 1002, 'The BEST');

/*

El error que aparece es column 'email' cannot be null
Como fue anteriormentes declarado declarado, la columna email no puede ser null "`email` varchar(100) NOT NULL"

*/






UPDATE employees SET employeeNumber = employeeNumber - 20

/* se le resta 20 unidades a cada employeeNumber*/ 


UPDATE employees SET employeeNumber = employeeNumber + 20

/*
  (1056, 'Patterson', 'Mary', 'x4611', 'mpatterso@classicmodelcars.com', '1', 1002, 'VP Sales'),
  (1076, 'Firrelli', 'Jeff', 'x9273', 'jfirrelli@classicmodelcars.com', '1', 1002, 'VP Marketing');
*/ 

/*
Debido a que estos dos empleados se llevan una diferencia de 20, se  intenta adherir 20 a Patterson, no puede porque ya esta Firelli que tiene una id de 1076,
a diferencia de cuando  se resta, primero le resta a Patterson y despues a Firelli, esa es la razon que no de un error
*/










ALTER TABLE employees ADD COLUMN age INT CHECK (age >= 16 AND age <= 70);



/*
La integridad referencial en la base de datos Sakila se establece entre las tablas "film", "actor" y "film_actor". 
En la tabla intermedia "film_actor", las columnas "film_id" y "actor_id" están vinculadas a las columnas correspondientes en las tablas "film" y "actor", 
asegurando que solo se puedan agregar valores válidos que coincidan con las películas y actores existentes. 
Esto garantiza relaciones coherentes y evita la inserción de información incorrecta en la base de datos.

*/




ALTER TABLE employees
ADD COLUMN lastUpdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
ADD COLUMN lastUpdateUser VARCHAR(50);

/*para los inserts de nuevos empleados*/
DELIMITER //
CREATE TRIGGER employee_insert_trigger
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.lastUpdate = CURRENT_TIMESTAMP;
END;
//
DELIMITER ;

/*para los updates de empleados*/

DELIMITER //
CREATE TRIGGER employee_update_trigger
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.lastUpdate = CURRENT_TIMESTAMP;
END;

//
DELIMITER ;

Show TRIGGERS;







show TRIGGERS;
/*
Mostrara todos los triggers, 

Ins_film es el primer TRIGGER
*/

BEGIN     INSERT INTO film_text (film_id, title, description)         VALUES (new.film_id, new.title, new.description);   END

/*
Ins_film copia automáticamente los valores de film_id, title, y description de una fila recién insertada en otra tabla llamada film_text. 
Sirve para mantener sincronizados los datos entre las dos tablas.

upd_film es el segundo trigger que se muestra
*/
BEGIN     IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)     THEN         UPDATE film_text             SET title=new.title,                 description=new.description,                 film_id=new.film_id         WHERE film_id=old.film_id;     END IF;   END
/*
Esta se actuliza automáticamente los valores en la tabla film_text cuando se modifica una fila en otra tabla. 
Se asegura que los datos en las dos tablas esten sincronizados, reflejando los cambios realizados en la fila original en la tabla film_text.
*/

/*
del_film es el 3er trigger relacionado con film_text
*/
BEGIN     DELETE FROM film_text WHERE film_id = old.film_id;   END

/*
Borra automáticamente filas en la tabla film_text cuando se elimina una fila correspondiente en otra tabla.
 */
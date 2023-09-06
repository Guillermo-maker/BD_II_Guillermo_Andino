/* 1*/
sudo mysql -u root

CREATE USER data_analyst IDENTIFIED BY 'pepe1234';

FLUSH PRIVILEGES;

/* 2,
para este paso tambien estaba parado en el usuario root*/
GRANT SELECT, UPDATE, DELETE on sakila.* to 'data_analyst'@'%';


/* 3*/

mysql -u data_analyst -p 

use sakila;

create table peliguille (id_guille int primary key, nombre varchar (200), edad int );


ERROR 1142 (42000): CREATE command denied to user 'data_analyst'@'localhost' for table 'peliguille'

/* 4*/

UPDATE film SET title = 'HARRY POTTER' WHERE film_id = 1;

/* La pelicula que actualice fue ACADEMY DINOSAUR que pertenece al id = 1, lo actualice por la pelicula HARRY POTTER   */


/* 5 */

sudo mysql -u root

REVOKE UPDATE ON sakila.* FROM data_analyst;

/* con el siguiente comando podemos ver los permisos del usuario, y aseguararnos que UPDATE ya no este entre esos permisos */
SHOW GRANTS FOR 'data_analyst'@'%'; 

/* 6 */


mysql -u data_analyst -p 


UPDATE film SET title = 'JURASSIC PARK' WHERE film_id = 1;


ERROR 1142 (42000): UPDATE command denied to user 'data_analyst'@'localhost' for table 'film'
/* como podemos ver en el error, digital_anlyst ya no tiene los permisos para acutualizar los elementos de las base de datos sakila.*/
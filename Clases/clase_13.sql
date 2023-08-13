use sakila;


insert into customer (store_id, first_name, last_name, email, address_id, active)
 select 1, 'Juan', 'Perez', 'juan@gmail.com', Max(ad.address_id), 1
 from address ad 
 where ad.city_id in (select ci.city_id from country co, city ci
 					  WHERE co.country = "United States"
 					  And co.country_id = ci.country_id 
 					  And ci.city_id = ad.city_id );






insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id)
 select CURRENT_TIMESTAMP, ( SELECT Max(i.inventory_id)
 							 from inventory i
 							 	inner join film f using(film_id)
 							 where f.title like 'ZORRO ARK'
),
 1, NULL, (SELECT manager_staff_id 
 			from store
 			WHERE store_id = 2 
 			order by RAND()
 			LIMIT 1 );






UPDATE film SET release_year = 2001 
WHERE rating = 'NC-17';

UPDATE film SET release_year = 2004 
WHERE rating ='PG';

UPDATE film SET release_year = 2010
 WHERE rating ='R';

UPDATE film SET release_year = 2015
 WHERE rating = 'PG-13'; 					                                        






SELECT r.rental_id, r.return_date 
from film f 
	inner join inventory i using(film_id)
	inner join rental r using(inventory_id)
where r.return_date is NULL 
ORDER by r.rental_date desc limit 5;

UPDATE rental set return_date = CURRENT_TIMESTAMP where rental_id = 11496









DELETE FROM film WHERE title = 'BASIC EASY';
/*SQL Error [1451] [23000]: Cannot delete or update a parent row: a foreign key constraint fails 
(`sakila`.`film_actor`, CONSTRAINT `fk_film_actor_film` FOREIGN KEY (`film_id`) REFERENCES `film` 
(`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE)  */


/*Hay eliminar todas los registros que tienen relacion con la pelicula 'BASIC EASY'*/


DELETE from rental 
where inventory_id in (select inventory_id from inventory
   						WHERE film_id = (select film_id from film where title = 'BASIC EASY'));


delete from inventory where film_id = (select film_id from film 
									   where title = 'BASIC EASY');

DELETE from film_category where film_id = (select film_id from film 
										   where title = 'BASIC EASY');

delete from film_actor where film_id = (select film_id from film  
										WHERE title = 'BASIC EASY');



DELETE FROM film WHERE title = 'BASIC EASY'; /*luego de eliminar todos los registros relaconados, ahora podemos eliminar la pelicula 'BASIC EASY'*/





select inventory_id, film_id from inventory  
where inventory_id
not in (SELECT inventory_id from inventory 
								inner join rental using(inventory_id)
							WHERE return_date is null);   
   
/*el film_id es 1000
el inventory_id es 4580 */  

INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES (
    CURRENT_DATE(),
    4580,
    (SELECT customer_id FROM customer ORDER BY customer_id DESC LIMIT 1),
    (SELECT staff_id FROM staff WHERE store_id = (SELECT store_id FROM inventory WHERE inventory_id = 4580))
); 																			  
 																			  
 																			  
INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES (
    (SELECT customer_id FROM customer ORDER BY customer_id DESC LIMIT 1),
    (SELECT staff_id FROM staff LIMIT 1),
    (SELECT rental_id FROM rental ORDER BY rental_id DESC LIMIT 1),
    (SELECT rental_rate FROM film WHERE film_id = 400),
    CURRENT_DATE()
); 																			  
 	

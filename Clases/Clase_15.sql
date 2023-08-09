-- Active: 1691027177459@@127.0.0.1@3306@sakila
use sakila;

CREATE OR REPLACE VIEW list_of_customers AS
SELECT c.customer_id, CONCAT(c.first_name,'', c.last_name) as 'full_name', c.address_id, c.active, c.store_id, a.postal_code as 'zip_code', a.phone, c2.city, co.country
FROM customer c
inner join address a ON a.address_id = c.address_id 
inner join city c2 on c2.city_id = a.city_id 
inner join country co on co.country_id = c2.country_id ;
  
  
  
  
CREATE OR REPLACE VIEW film_details AS
SELECT f.film_id, f.title, f.description, GROUP_CONCAT(DISTINCT a.first_name, ' ', a.last_name) AS actors, c.name AS category, p.amount AS price, f.`length`, f.rating
FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN rental r ON r.rental_id = i.inventory_id
INNER JOIN staff s ON s.staff_id = r.staff_id
INNER JOIN payment p ON p.staff_id = s.staff_id
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY f.film_id, f.title, f.description, c.name, p.amount, f.`length`, f.rating;
  
    
CREATE OR REPLACE VIEW sales_by_film_category AS
SELECT c.name AS category, SUM(p.amount) AS total_rental
FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN rental r ON r.rental_id = i.inventory_id
INNER JOIN payment p ON p.rental_id = r.rental_id
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
GROUP BY c.name;
 
 
 
 
CREATE OR REPLACE VIEW actor_information AS
SELECT a.actor_id,a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
INNER JOIN film_actor fa ON fa.actor_id = a.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name;
      
    
La vista 'actor_info' obtiene informacion sobre los actores como su id, el nombre, apellido, por su lado tambiem obtiene la informacion de las peliculas en las que actuaron cada actor segun la pelicula, esto se logro gracias a la union del inner join donde relaciono las identificadores de los actores con las peliculas a traves de la tabla film_actor.   
        

"Vista Materializada" Es una tabla especial que almacena los resultados de ciertas consultas para que puedan ser accedidos de manera rápida y eficiente en lugar de tener que calcularlos nuevamente cada vez que se hace la misma pregunta. Es como tener un registro de respuestas precalculadas para agilizar el acceso a la información.

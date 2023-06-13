USE sakila;

SELECT f.title from film as f 
WHERE NOT EXISTS 
(SELECT i.film_id from inventory as i WHERE i.film_id = f.film_id);

SELECT f.title, i.inventory_id FROM film AS f 
INNER JOIN inventory i on f.film_id = i.film_id 
WHERE EXISTS (SELECT i.film_id FROM inventory as it 
WHERE it.film_id = f.film_id AND NOT EXISTS (SELECT r.inventory_id FROM rental as r WHERE inventory_id = it.inventory_id ) );    

SELECT 	c.first_name, c.last_name, s.store_id, f.title FROM customer c
INNER JOIN store s ON c.store_id = s.store_id 
INNER JOIN inventory i ON s.store_id = i.store_id 
INNER JOIN film f ON i.film_id = f.film_id 
WHERE EXISTS (SELECT r.customer_id FROM rental AS r 
WHERE c.customer_id = r.customer_id AND r.return_date IS NOT NULL);

SELECT s.store_id, sum(p.amount) AS T_Sales FROM  store AS s
INNER JOIN inventory i ON s.store_id = i.store_id 
INNER JOIN rental r ON i.inventory_id = r.inventory_id 
INNER JOIN payment p ON r.rental_id = p.rental_id GROUP BY s.store_id ;
SELECT fa.actor_id, a.first_name, a.last_name, COUNT(*) AS film FROM film_actor AS fa
INNER JOIN actor a ON fa.actor_id = a.actor_id GROUP BY fa.actor_id ORDER BY 4 DESC
SELECT a.country, COUNT(b.city)
FROM country a JOIN city b ON a.country_id = b.country_id
GROUP BY a.country ORDER BY a.country;

SELECT a.country, COUNT(b.city) 
FROM country a JOIN city b ON a.country_id = b.country_id
GROUP BY a.country HAVING COUNT(b.city) > 10
ORDER BY COUNT(b.city) DESC;

SELECT  a.first_name, a.last_name, 
(Select b.address from address b WHERE b.address_id = a.address_id) as `address`,
(Select Count(*) from rental r where a.customer_id = r.customer_id) as `quantity_rented`,
(Select sum(m.amount) from payment m where a.customer_id = m.customer_id) as `total_spent` from customer a
ORDER BY `total_spent` DESC;


SELECT n.name, AVG(f.`length`) FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category n ON fc.category_id = n.category_id GROUP BY n.name
HAVING AVG(f.`length`) > (SELECT AVG(f2.`length`) FROM film f2)
ORDER BY AVG(f.`length`) DESC;

select f.rating as 'rating', count(r.rental_id) as 'total_rentals' from film f 
join inventory i on i.film_id = f.film_id
join rental r on r.inventory_id = i.inventory_id 
group by f.rating order by 'rating';
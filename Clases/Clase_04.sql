use sakila;

Select title, special_features from film where rating='PG-13';
Select title, length "Duracion" from film;
Select title, rental_rate, replacement_cost from film where replacement_cost between 20.00 and 24.00;
Select title, rating, category_id from film, film_category where special_features="Behind the Scenes";
Select first_name, last_name, film_id from actor, film_actor where film_id=1;
SELECT country, city, address, store_id FROM country, city, address, store where store_id = 1 ;
Select f1.title, f1.rating, f2.title, f2.rating from film f1, film f2 where f1.rating = f2.rating and f1.film_id != f2.film_id;
Select store_id, first_name, last_name from inventory, staff 
where store_id = 2 ;









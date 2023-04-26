use sakila;

SELECT a1.first_name, last_name 
	from actor a1
	WHERE EXISTS (SELECT last_name 
					from actor a2
					WHERE a2.last_name = a1.last_name
					AND a2.actor_id <> a1.actor_id)
	order by last_name;
	
SELECT first_name, last_name 
	from actor
	Join film_actor 
	on actor.actor_id != film_actor.actor_id 
	join film 
	on film_actor.film_id != film.film_id
	WHERE release_year LIKE 2006;

SELECT c1.first_name, c1.last_name from customer c1
WHERE (Select COUNT(*)  
from rental r 
WHERE c1.customer_id = r.customer_id
)= 1;

SELECT c1.first_name, c1.last_name from customer c1
WHERE (Select COUNT(*)  
from rental r 
WHERE c1.customer_id = r.customer_id
)> 1;


select a1.first_name, a1.last_name from actor a1 
WHERE NOT EXISTS (select f1.title  from film f1 join film_actor fa ON f1.film_id = fa.film_id 
WHERE f1.film_id = fa.film_id 
AND  a1.actor_id = fa.actor_id 
And (f1.title = 'BETRAYED REAR' or f1.title = 'CATCH AMISTAD'));

select a1.first_name, a1.last_name from actor a1 
WHERE EXISTS  (select f1.title  from film f1 join film_actor fa ON f1.film_id = fa.film_id 
WHERE f1.film_id = fa.film_id AND a1.actor_id = fa.actor_id And f1.title = 'BETRAYED REAR')
AND NOT EXISTS (Select f1.title from film f1 inner join film_actor fa on f1.film_id = fa.film_id
WHERE f1.film_id = fa.film_id and a1.actor_id = fa.actor_id AND f1.title = 'CATCH AMISTAD');

select a1.first_name, a1.last_name from actor a1 
WHERE EXISTS  (select f1.title  from film f1 join film_actor fa ON f1.film_id = fa.film_id 
WHERE f1.film_id = fa.film_id AND a1.actor_id = fa.actor_id And f1.title = 'BETRAYED REAR')
AND EXISTS (Select f1.title from film f1 inner join film_actor fa on f1.film_id = fa.film_id
WHERE f1.film_id = fa.film_id and a1.actor_id = fa.actor_id AND f1.title = 'CATCH AMISTAD');

select a1.first_name, a1.last_name from actor a1 
WHERE NOT EXISTS (select f1.title  from film f1 join film_actor fa ON f1.film_id = fa.film_id 
WHERE f1.film_id = fa.film_id 
AND  a1.actor_id = fa.actor_id 
And (f1.title = 'BETRAYED REAR' or f1.title = 'CATCH AMISTAD'));
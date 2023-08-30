use sakila;

select a.address, a.postal_code from address a;




/* CON NOT IN 10ms*/
SELECT a.address, a.postal_code, ci.city, co.country FROM address a
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co ON ci.country_id = co.country_id
WHERE a.postal_code NOT IN ('72192', '61117', '57807');


/* CON IN 9ms*/
SELECT a.address, a.postal_code, ci.city, co.country FROM address a
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co ON ci.country_id = co.country_id
WHERE a.postal_code IN ('72192', '61117', '57807');




create INDEX PostalCode ON address(postal_code);
/* 
LUEGO DE CREAR EL INDEX:
-la primera query dio un timepo de reaccion =4ms
-la segunda query dio un timepo de reaccion =4ms 

La explicacion es que el index crea una lista.
Esta permite a la DB hacer calculos mas rapidos y menos redundantes sobre el campo al que se haya hecho el index,
este accedera directamente va al index.

*/





SELECT first_name FROM actor
ORDER BY first_name;

SELECT last_name FROM actor
ORDER BY last_name;

/* 
Las distintas latencias en el tiempo de ejecucion reside en que en:
sakila tiene precaragardo en su sistema un index para "LAST_NAME" 
pero no para "FIRST_NAME"
*/

SHOW INDEX FROM actor; 

/* 
Mostrara los index existentes
*/



SELECT description FROM film
WHERE description
LIKE "%Character%"
ORDER BY description; /* 9ms */ 


/* 
para usar MATCH y AGAINST, 
Es necesario tener un index llamado "Fulltext":
*/ 

CREATE FULLTEXT INDEX FullText_idx ON film(description);

SELECT description FROM film
WHERE MATCH(description) AGAINST("Character")
ORDER BY description; /*  5 */ 
/* 
se ve que es sustancialmente mas rapida la ejecucion
*/ 
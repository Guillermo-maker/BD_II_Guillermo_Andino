use sakila;

SELECT CONCAT(c.first_name, ' ', c.last_name) AS custoname, a.address AS custoAddress, ct.city AS custoCity FROM customer AS c
JOIN store AS s ON c.store_id = s.store_id
JOIN address AS a ON s.address_id = a.address_id
JOIN city AS ct ON a.city_id = ct.city_id
JOIN country AS co ON ct.country_id = co.country_id
WHERE co.country = 'Argentina';


SELECT f.title, l.name AS lenguage, f.rating,
    CASE
        WHEN f.rating = 'G' THEN 'All ages admitted'
        WHEN f.rating = 'PG' THEN 'Some material may not be suitable for children'
        WHEN f.rating = 'PG-13' THEN 'Some material may be inappropriate for children under 13'
        WHEN f.rating = 'R' THEN 'Under 17 requires accompanying parent or adult guardian'
        WHEN f.rating = 'NC-17' THEN 'No one 17 and under admitted'
    END AS 'Rating Text'
FROM film AS f INNER JOIN language AS l ON f.language_id = l.language_id;



SELECT f.title, f.release_year FROM film AS f
JOIN film_actor AS fa ON f.film_id = fa.film_id
JOIN actor AS a ON fa.actor_id = a.actor_id
WHERE CONCAT(LOWER(a.first_name), ' ', LOWER(a.last_name)) LIKE CONCAT('%', LOWER("JOHNNY CAGE"), '%');





SELECT f.title, r.rental_date, c.first_name AS customer_name,
    CASE
        WHEN r.return_date IS NOT NULL THEN 'Yes'
        ELSE 'No'
    END AS 'Returned'
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
INNER JOIN customer c ON r.customer_id = c.customer_id
WHERE MONTH(r.rental_date) = 5 OR MONTH(r.rental_date) = 6
ORDER BY r.rental_date;


/*
activ 5

La conversión de tipos de datos es una operación común en SQL cuando necesitas cambiar el formato o la representación de los valores en una consulta. 
En este contexto, dos funciones populares para realizar conversiones son CAST y CONVERT.

La función CAST se utiliza para convertir un valor de un tipo de datos a otro específico. Su uso principal es cambiar el tipo de datos de una columna o expresión.

La función CONVERT también se emplea para la conversión de tipos de datos, pero ofrece una funcionalidad adicional.
Además de cambiar tipos, CONVERT permite la conversión de conjuntos de caracteres, lo que te permite ajustar el juego de caracteres de los datos. 

La diferencia mas importante entre las funciones es que CONVERT puede manejar la conversión de conjuntos de caracteres, lo que significa que puedes cambiar la representación de los caracteres en una columna.
En cambio, CAST se utiliza exclusivamente para cambiar el tipo de datos de un valor.


ejemplos:
*/


/* ejemplo cast: mostrar la duración de las películas en la tabla film en minutos, pero redondeando al número entero más cercano.*/
SELECT title, 
       CAST(rental_duration AS SIGNED) AS rounded_duration_minutes
FROM film;

/* ejemplo convert: mostrar las fechas de alquiler en la tabla rental en un formato personalizado de día-mes-año.*/
SELECT rental_id, 
       CONVERT(rental_date, CHAR) AS formatted_rental_date
FROM rental;

/*
activ 6
En SQL, cuando necesitas manejar valores nulos en tus consultas, las funciones como:
NVL, ISNULL, IFNULL y COALESCE te permiten retornar un valor alternativo si una expresión es NULL.

Diferencias entre las funciones:

    NVL se utiliza en Oracle.
    ISNULL se utiliza en Microsoft SQL Server.
    IFNULL se utiliza en MySQL.
    COALESCE se utiliza en varias bases de datos, incluyendo Oracle, SQL Server y MySQL.

ejemplo ISNULL

Supongamos que deseamos mostrar información sobre los actores y su nombre completo en la tabla actor,
pero si el apellido (last_name) es nulo, queremos mostrar un valor alternativo.
*/
SELECT actor_id, 
       CONCAT(IFNULL(first_name, 'Nombre Desconocido'), ' ', IFNULL(last_name, '')) AS full_name
FROM actor;

/*

ejemplo COALESCE

Supongamos que queremos mostrar información sobre las direcciones de los clientes, pero si la dirección 2 es nula,
deseamos mostrar la dirección 1 como alternativa.

*/

SELECT customer_id,
       COALESCE(address1, address2) AS direccion_alternativa
FROM customer;

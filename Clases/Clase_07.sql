use sakila;

SELECT f1.title, f1.rating, f1.length from film f1
WHERE length = (select min(length) from film);

SELECT f1.title from film f1
WHERE length < ALL (select min(length) from film);

SELECT customer.customer_id, 
       first_name, 
       last_name, 
       MIN(amount) min_amount 
  FROM customer, payment 
 WHERE customer.customer_id = payment.customer_id 
 GROUP BY customer_id, first_name, last_name 
 ORDER BY min_amount DESC;

SELECT customer.customer_id, 
       first_name, 
       last_name, 
       MIN(amount) min_amount,
       MAX(amount) max_amount 
  FROM customer, payment 
 WHERE customer.customer_id = payment.customer_id 
 GROUP BY customer_id, first_name, last_name 
 ORDER BY min_amount DESC;
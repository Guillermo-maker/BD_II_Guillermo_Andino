use sakila;


DROP FUNCTION IF EXISTS get_film_count;
DELIMITER //
CREATE FUNCTION get_film_count(FILMNAME VARCHAR(255), STORE_ID INT) RETURNS INT READS SQL DATA

BEGIN 
	DECLARE film_count INT;
	SELECT
	    COUNT(*) INTO film_count
	FROM inventory i
	    JOIN film f ON i.film_id = f.film_id
	WHERE (
	        f.film_id = filmname
	        OR f.title = filmname
	    )
	    AND i.store_id = store_id;
	RETURN film_count;
	END
//
DELIMITER ;

SELECT get_film_count(4, 1);


DROP PROCEDURE IF EXISTS get_country_customers;
DELIMITER //
CREATE PROCEDURE get_country_customers(IN country_name VARCHAR(50), OUT customer_list VARCHAR(255))

BEGIN
    /* HAY QUE DECLARAR LAS VARIABLES*/
    DECLARE done INT DEFAULT 0;
    DECLARE first_name_customer VARCHAR(200);
    DECLARE last_name_customer VARCHAR(200);
    DECLARE full_name_customer VARCHAR(200);

    /*AVERIGUAR LOS CLIENTES SEGUN EL PAIS*/
    DECLARE cur CURSOR FOR
        SELECT first_name AS first_name_customer, last_name AS last_name_customer
        FROM customer cu
            JOIN `address` ad ON cu.address_id = ad.address_id
            JOIN city ci ON ad.city_id = ci.city_id
            JOIN country co ON ci.country_id = co.country_id
        WHERE co.country = country_name;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    SET customer_list = '';
    OPEN cur;
    
    /*CREAR EL LOOP PARA OBTENER Y GUARDAR A LOS CLIENTES PARA LUEGO MOSTRARLOS*/
    read_loop: LOOP
        FETCH cur INTO first_name_customer, last_name_customer;
        
        /*TERMINAR EL LOOP CUANDO YA NO SE ENCUENTRE CLIENTES*/
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET full_name_customer = CONCAT(first_name_customer, ' ', last_name_customer);
        
        IF customer_list = '' THEN
            SET customer_list = full_name_customer;
        ELSE
            SET customer_list = CONCAT(customer_list, '; ', full_name_customer);
        END IF;
    END LOOP;
    
    CLOSE cur;
END;
//
DELIMITER ;

CALL get_country_customers('VILLA ALLENDE', @output_list);
SELECT @output_list;

/*

La función "inventory_in_stock" determina si un artículo de inventario está disponible en función de los alquileres asociados, devolviendo un valor verdadero o falso.

Por otro lado, el procedimiento "film_in_stock" permite verificar la disponibilidad de una película en una tienda específica según los parámetros proporcionados (film_id, store_id). 
Además de indicar si está en stock, también devuelve la cantidad de copias disponibles.

*/
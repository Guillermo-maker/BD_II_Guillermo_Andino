create database Clase_03;
use Clase_03;

create table country (country_id int primary key, country varchar (50), last_update date);

INSERT INTO country (country_id, country, last_update) VALUES (1, 'United States', '2010-01-1');
INSERT INTO country (country_id, country, last_update) VALUES (2, 'México', '2022-03-15');
INSERT INTO country (country_id, country, last_update) VALUES (3, 'Argentina', '2023-03-15');
INSERT INTO country (country_id, country, last_update) VALUES (4, 'Chile', '2022-01-01');
INSERT INTO country (country_id, country, last_update) VALUES (5, 'Colombia', '2021-02-04');




create table city (city_id int primary key, city varchar (50), country_id int, foreign key (country_id) references country (country_id), last_update date);

INSERT INTO city (city_id, city, country_id, last_update) VALUES (1, 'Madrid', 1, '2022-01-15');
INSERT INTO city (city_id, city, country_id, last_update) VALUES (2, 'Sinaloa', 2, '2022-01-15');
INSERT INTO city (city_id, city, country_id, last_update) VALUES (3, 'Cordoba', 3, '2022-01-15');
INSERT INTO city (city_id, city, country_id, last_update) VALUES (4, 'Viña del Mar', 4, '2022-01-15');
INSERT INTO city (city_id, city, country_id, last_update) VALUES (5, 'Bogota', 5, '2022-01-15');

create table address (address_id int primary key, address varchar (50), address2 varchar (50), district varchar (50), city_id int, foreign key (city_id) references city(city_id), postal_code varchar (50), phone varchar (50), location varchar (50), last_update date);

INSERT INTO address (address_id, address, address2, district, city_id, postal_code, phone, location, last_update) VALUES (1, 'Calle Gran Vía', NULL, 'Centro', 1, '28013', '+34 91 123 45 67', NULL, '2022-01-15');
INSERT INTO address (address_id, address, address2, district, city_id, postal_code, phone, location, last_update) VALUES (2, 'Arroyo negra', NULL, 'Centro', 2, '5000', '+54 351 695 12554', NULL, '2022-01-15');
INSERT INTO address (address_id, address, address2, district, city_id, postal_code, phone, location, last_update) VALUES (3, 'Huallil', NULL, 'Centro', 3, '2000', '+54 351 695 6564', NULL, '2022-01-15');
INSERT INTO address (address_id, address, address2, district, city_id, postal_code, phone, location, last_update) VALUES (4, 'Agua sacha', NULL, 'Centro', 4, '4000', '+54 351 695 4228', NULL, '2022-01-15');
INSERT INTO address (address_id, address, address2, district, city_id, postal_code, phone, location, last_update) VALUES (5, 'Viracocha', NULL, 'Centro', 5, '6000', '+54 351 695 15115', NULL, '2022-01-15');

create table store (store_id int primary key, manager_staff_id int, address_id int, foreign key (address_id) references address(address_id), last_update date);

INSERT INTO store (store_id, manager_staff_id, address_id, last_update) VALUES (1, 1, 1, '2022-01-15');
INSERT INTO store (store_id, manager_staff_id, address_id, last_update) VALUES (2, 2, 2, '2022-01-15');
INSERT INTO store (store_id, manager_staff_id, address_id, last_update) VALUES (3, 3, 3, '2022-01-15');
INSERT INTO store (store_id, manager_staff_id, address_id, last_update) VALUES (4, 4, 4, '2022-01-15');
INSERT INTO store (store_id, manager_staff_id, address_id, last_update) VALUES (5, 5, 5, '2022-01-15');

create table staff ( staff_id int primary key, first_name varchar (50), last_name varchar (50), address_id int, foreign key (address_id) references address(address_id), picture boolean, email varchar (50), store_id int, foreign key (store_id) references store(store_id), active boolean, username varchar (50), password varchar(50), last_update date);

INSERT INTO staff (staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, password, last_update) VALUES (1, 'Juan', 'Pérez', 1, true, 'juan.perez@example.com', 1, true, 'juanperez', 'password123', '2022-01-15');
INSERT INTO staff (staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, password, last_update) VALUES (2, 'María', 'García', 2, true, 'maria.garcia@example.com', 2, true, 'mariagarcia', 'password123', '2022-01-15');
INSERT INTO staff (staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, password, last_update) VALUES (3, 'Pedro', 'Sánchez', 3, true, 'pedro.sanchez@example.com', 3, true, 'pedrosanchez', 'password123', '2022-01-15');
INSERT INTO staff (staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, password, last_update) VALUES (4, 'Ana', 'Martínez', 4, true, 'ana.martinez@example.com', 4, true, 'anamartinez', 'password123', '2022-01-15');
INSERT INTO staff (staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, password, last_update) VALUES (5, 'Pablo', 'González', 5, true, 'pablo.gonzalez@example.com', 5, true, 'pablogonzalez', 'password123', '2022-01-15');


create table customer(customer_id int primary key, store_id int, foreign key (store_id) references store(store_id), first_name varchar (50), last_name varchar (50),email varchar (50),address_id int, foreign key (address_id) references address(address_id),active boolean, create_date date, last_update date);
INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update) VALUES (1, 2, 'John', 'Doe', 'johndoe@example.com', 1, true, '2023-04-08', '2023-04-08');
INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update) VALUES (2, 2, 'Jane', 'Doe', 'janedoe@example.com', 2, true, '2023-04-08', '2023-04-08');
INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update) VALUES (3, 3, 'Alice', 'Smith', 'alicesmith@example.com', 3, true, '2023-04-08', '2023-04-08');
INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update) VALUES (4, 4, 'Bob', 'Johnson', 'bobjohnson@example.com', 4, true, '2023-04-08', '2023-04-08');
INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update) VALUES (5, 5, 'Emily', 'Williams', 'emilywilliams@example.com', 5, true, '2023-04-08', '2023-04-08');


create table language( language_id int primary key, name varchar (50), last_update date);

INSERT INTO language (language_id, name, last_update) VALUES (1, 'English', '2023-04-08');
INSERT INTO language (language_id, name, last_update) VALUES (2, 'Spanish', '2023-04-08');
INSERT INTO language (language_id, name, last_update) VALUES (3, 'French', '2023-04-08');
INSERT INTO language (language_id, name, last_update) VALUES (4, 'German', '2023-04-08');
INSERT INTO language (language_id, name, last_update) VALUES (5, 'Italian', '2023-04-08');

create table film( film_id int primary key, title varchar (50), description varchar (200), release_year date, language_id int, foreign key (language_id) references language(language_id), original_language_id int, rental_duration int, rental_rate int, length int, replacement_cost int, rating varchar (200), special_feactures varchar(100), last_update date);

INSERT INTO film (film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_feactures, last_update) VALUES (1, 'ZOOLANDER FICTION', 'I love this film so funny.', '2002-01-7', 1, NULL, 7, 2.99, 142, 19.99, 'PG-13', 'Deleted Scenes,Behind the Scenes', '2023-04-08');
INSERT INTO film (film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_feactures, last_update) VALUES (2, 'The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', '1972-03-24', 1, NULL, 7, 2.99, 175, 18.99, 'R', 'Deleted Scenes', '2023-04-08');
INSERT INTO film (film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_feactures, last_update) VALUES (3, 'The Dark Knight', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', '2008-07-18', 1, NULL, 5, 3.99, 152, 21.99, 'PG-13', 'Behind the Scenes', '2023-04-08');
INSERT INTO film (film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_feactures, last_update) VALUES (4, 'The Lord of the Rings: The Fellowship of the Ring', 'A meek hobbit of the Shire and eight companions set out on a journey to Mount Doom to destroy the One Ring and the dark lord Sauron.', '2001-12-19', 1, NULL, 7, 2.99, 178, 24.99, 'PG-13', 'Behind the Scenes', '2023-04-08');
INSERT INTO film (film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_feactures, last_update) VALUES (5, 'Forrest Gump', 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other history unfold through the perspective of an Alabama man with an IQ of 75.', '1994-07-06', 1, NULL, 5, 3.99, 142, 14.99, 'PG-13', 'Deleted Scenes,Behind the Scenes', '2023-04-08');

create table inventory ( inventory_id int primary key, film_id int, foreign key (film_id) references film(film_id),store_id int, foreign key (store_id) references store(store_id), last_update date);

INSERT INTO inventory (inventory_id, film_id, store_id, last_update) VALUES (1, 1, 1, '2023-04-08');
INSERT INTO inventory (inventory_id, film_id, store_id, last_update) VALUES (2, 2, 2, '2023-04-08');
INSERT INTO inventory (inventory_id, film_id, store_id, last_update) VALUES (3, 3, 3, '2023-04-08');
INSERT INTO inventory (inventory_id, film_id, store_id, last_update) VALUES (4, 4, 4, '2023-04-08');
INSERT INTO inventory (inventory_id, film_id, store_id, last_update) VALUES (5, 5, 5, '2023-04-08');

create table rental( rental_id int primary key, rental date, inventory_id int, foreign key (inventory_id) references inventory(inventory_id), customer_id int, foreign key (customer_id) references customer(customer_id), return_date date, staff_id int, foreign key (staff_id) references staff(staff_id), last_update date);

INSERT INTO rental (rental_id, rental, inventory_id, customer_id, staff_id, last_update) VALUES (1, '2023-04-08', 1, 1, 1, '2023-04-08');
INSERT INTO rental (rental_id, rental, inventory_id, customer_id, staff_id, last_update) VALUES (2, '2023-04-08', 2, 2, 2, '2023-04-08');
INSERT INTO rental (rental_id, rental, inventory_id, customer_id, staff_id, last_update) VALUES (3, '2023-04-07', 3, 3, 3, '2023-04-07');
INSERT INTO rental (rental_id, rental, inventory_id, customer_id, staff_id, last_update) VALUES (4, '2023-04-06', 4, 4, 4, '2023-04-06');
INSERT INTO rental (rental_id, rental, inventory_id, customer_id, staff_id, last_update) VALUES (5, '2023-04-05', 5, 5, 5, '2023-04-05');

create table payment( payment_id int primary key,customer_id int, foreign key (customer_id) references customer(customer_id),staff_id int, foreign key (staff_id) references staff(staff_id), rental_id int, foreign key (rental_id) references rental(rental_id), amount int, payment date, last_update date);

INSERT INTO payment(payment_id, customer_id, staff_id, rental_id, amount, payment, last_update) VALUES (1, 1, 1, 1, 10.99, '2023-04-08', '2023-04-08');
INSERT INTO payment(payment_id, customer_id, staff_id, rental_id, amount, payment, last_update) VALUES (2, 2, 2, 2, 9.99, '2023-04-07', '2023-04-07');
INSERT INTO payment(payment_id, customer_id, staff_id, rental_id, amount, payment, last_update) VALUES (3, 3, 3, 3, 7.99, '2023-04-06', '2023-04-06');
INSERT INTO payment(payment_id, customer_id, staff_id, rental_id, amount, payment, last_update) VALUES (4, 4, 4, 4, 5.99, '2023-04-05', '2023-04-05');
INSERT INTO payment(payment_id, customer_id, staff_id, rental_id, amount, payment, last_update) VALUES (5, 5, 4, 5, 3.99, '2023-04-04', '2023-04-04');

create table category (category_id int primary key, name varchar (50), last_update date);

INSERT INTO category (category_id, name, last_update) VALUES (1, 'Comedy', '2023-04-08');
INSERT INTO category (category_id, name, last_update) VALUES (2, 'Drama', '2023-04-08');
INSERT INTO category (category_id, name, last_update) VALUES (3, 'Action', '2023-04-08');
INSERT INTO category (category_id, name, last_update) VALUES (4, 'Fantasy', '2023-04-08');
INSERT INTO category (category_id, name, last_update) VALUES (5, 'Sci-Fi', '2023-04-08');


create table actor (actor_id int primary key, first_name varchar (50), last_name varchar (50), last_update date);

INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES (1, 'Ben', 'Stiller', '2022-04-08');
INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES (2, 'Al', 'Pacino', '2022-04-08');
INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES (3, 'Christian', 'Bale', '2022-04-08');
INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES (4, 'Elijah', 'Wood', '2022-04-08');
INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES (5, 'Tom', 'Hanks', '2022-04-08');



create table film_category( film_category_id int primary key, film_id int, foreign key (film_id) references film(film_id), category_id int, foreign key (category_id) references category(category_id), last_update date);

INSERT INTO film_category (film_category_id, film_id, category_id, last_update) VALUES (1, 1, 1, '2023-04-08');
INSERT INTO film_category (film_category_id, film_id, category_id, last_update) VALUES (2, 2, 2, '2023-04-08');
INSERT INTO film_category (film_category_id, film_id, category_id, last_update) VALUES (3, 3, 3, '2023-04-08');
INSERT INTO film_category (film_category_id, film_id, category_id, last_update) VALUES (4, 4, 4, '2023-04-08');
INSERT INTO film_category (film_category_id, film_id, category_id, last_update) VALUES (5, 5, 5, '2023-04-08');

create table film_actor( film_actor int primary key, film_id int, foreign key (film_id) references film(film_id),actor_id int, foreign key (actor_id) references actor(actor_id), last_update date);

INSERT INTO film_actor (film_actor, film_id, actor_id, last_update) VALUES (1, 1, 1, '2023-04-08');

INSERT INTO film_actor (film_actor,  film_id, actor_id, last_update) VALUES (2, 2, 2, '2023-04-08');

INSERT INTO film_actor (film_actor, film_id, actor_id, last_update) VALUES (3, 3, 3, '2023-04-08');

INSERT INTO film_actor (film_actor, film_id, actor_id, last_update) VALUES (4, 4, 4, '2023-04-08');

INSERT INTO film_actor (film_actor, film_id, actor_id, last_update) VALUES (5, 5, 5, '2023-04-08');



Select title, special_feactures from film where rating='PG-13';
Select title, length "Duracion" from film;
Select title, rental_rate, replacement_cost from film where replacement_cost between 20.00 and 24.00;
Select title, rating, category_id from film, film_category where special_feactures="Behind the Scenes";
Select first_name, last_name, film_id from actor, film_actor where film_id=1;
SELECT country, city, address, store_id FROM country, city, address, store where store_id = 1 ;
Select title, rating from film where rating='PG-13' limit 2;
Select store_id, first_name, last_name from inventory, staff where store_id = 2 ;









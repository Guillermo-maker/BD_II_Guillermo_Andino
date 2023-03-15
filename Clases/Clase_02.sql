create database imdb;
use imdb;

create table film (film_id int primary key, title varchar (30), description varchar(100) , release_year date);
create table actor (actor_id int primary key, first_name varchar (50), last_name varchar (50));
create table film_actor( film_actor int primary key, actor_id int, film_id int);


alter table film add last_update date;
alter table actor add last_update date;
alter table film_actor add foreign key (film_id) references film(film_id);
alter table film_actor add foreign key (actor_id) references actor(actor_id);

insert into film (film_id,title,description,release_year,last_update) values (1,"Top Gun","Action",'1986/01/1','1999/01/01');
insert into film (film_id,title,description,release_year,last_update) values (2,"Oceans eleven","Action",'2000/01/1','2004/01/01');
insert into film (film_id,title,description,release_year,last_update) values (3,"5ast","Action",'2010/01/1','2011/01/01');

insert into actor (actor_id, first_name, last_name,last_update) values (1,"Tom","Cruse",'1986/01/1');
insert into actor (actor_id, first_name, last_name,last_update) values (2,"George","Clooney",'1966/01/1');
insert into actor (actor_id, first_name, last_name,last_update) values (3,"Vin","Diesel",'1976/01/1');

insert into film_actor(film_actor, actor_id, film_id ) values (1,1,1);
insert into film_actor(film_actor, actor_id, film_id ) values (2,2,2);
insert into film_actor(film_actor, actor_id, film_id ) values (3,3,3);


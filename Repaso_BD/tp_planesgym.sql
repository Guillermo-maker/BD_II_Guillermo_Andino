create database GymFitness;
use GymFitness;

create table sede(id_sede int primary key, nombre varchar (30));
create table tipo_ejercicio(id_tipo int primary key, ejercicio varchar(30));
create table registro(id_registro int primary key, pesa int, cant_rep int, cant_series int );
create table sesiones(id_sesion int primary key,nombre varchar (30));
create table ejercicio (id_ejercicio int primary key, cant_reps int, cant_series int, id_sesion int , constraint id_s foreign key(id_sesion) references sesiones(id_sesion), id_registro int, constraint id_r foreign key (id_registro) references registro(id_registro));


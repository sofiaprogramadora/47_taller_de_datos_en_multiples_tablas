


CREATE DATABASE database_SQL_new;
\c database_sql_new


CREATE TABLE equipos(
id serial primary key,
name varchar(40)
);


CREATE TABLE jugadores(
id serial primary key,
name varchar(40)
);


CREATE TABLE tabla_intermedia(
	id serial primary key,
	jugadores integer references jugadores(id),
	equipo integer references equipos(id)
);


INSERT INTO jugadores(name) SELECT 'Alexis';
INSERT INTO jugadores(name) SELECT 'Arturo';
INSERT INTO jugadores(name) SELECT 'Pitbull';
INSERT INTO jugadores(name) SELECT 'Guillermo';
INSERT INTO jugadores(name) SELECT 'Jens';


INSERT INTO equipos(name) SELECT 'Winners';
INSERT INTO equipos(name) SELECT 'Losers';
INSERT INTO equipos(name) SELECT 'Tigers';
INSERT INTO equipos(name) SELECT 'Cheetas';
INSERT INTO equipos(name) SELECT 'Bulldogs';


SELECT COUNT(jugadores.id) AS jugadores, equipos.name AS equipo FROM jugadores
INNER JOIN tabla_intermedia ON tabla_intermedia.jugadores = jugadores.id
INNER JOIN equipos ON equipos.id = tabla_intermedia.equipo
GROUP BY equipos.name, jugadores.id;


SELECT equipos.name
FROM equipos
where equipos.id 
NOT in(
	SELECT distinct(tabla_intermedia.equipo)
	FROM tabla_intermedia
);
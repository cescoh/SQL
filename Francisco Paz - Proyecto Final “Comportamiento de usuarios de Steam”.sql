-- CREACION DE LA BD DE PROYECTO COMPORTAMIENTO DE USUARIOS STEAM.
DROP SCHEMA IF EXISTS USERSBEHAVIOUR;
CREATE SCHEMA IF NOT EXISTS USERSBEHAVIOUR;
USE USERSBEHAVIOUR;

-- CREACION DE TABLA COUNTRY
CREATE TABLE IF NOT EXISTS country(
id_country INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
country VARCHAR(200) NOT NULL
);

-- CREACION DE TABLA PEGI
CREATE TABLE IF NOT EXISTS pegi(
id_pegi INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
pegi VARCHAR(200) NOT NULL
);

-- CREACION DE TABLA GENRE
CREATE TABLE IF NOT EXISTS genre(
id_genre INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
genre VARCHAR(100) NOT NULL
);

-- CREACION DE TABLA DEVELOPER
CREATE TABLE IF NOT EXISTS developer(
id_developer INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
developer VARCHAR(200) NOT NULL
);

-- CREACION DE TABLA REVIEW
CREATE TABLE IF NOT EXISTS review(
id_review INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
review VARCHAR(200) NOT NULL
);

-- CREACION DE TABLA LANGUAGES
CREATE TABLE IF NOT EXISTS languages(
id_languages INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
languages VARCHAR(200) NOT NULL
);

-- CREACION DE TABLA IDENTITY
CREATE TABLE IF NOT EXISTS identity(
id_user INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
surname VARCHAR(200) NOT NULL,
name VARCHAR(200) NOT NULL,
age VARCHAR(200) NOT NULL,
email VARCHAR(200) NOT NULL,
id_country INT NOT NULL,
FOREIGN KEY(id_country) REFERENCES country(id_country)
);

-- CREACION DE TABLA SELLER
CREATE TABLE IF NOT EXISTS seller(
id_seller INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(200) NOT NULL,
lastname VARCHAR(200) NOT NULL,
email VARCHAR(200) NOT NULL,
age INT NOT NULL,
id_country INT NOT NULL,
FOREIGN KEY(id_country) REFERENCES country(id_country)
);

-- CREACION DE TABLA DATASET_GAMES
CREATE TABLE IF NOT EXISTS dataset_games(
id_game INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_developer INT NOT NULL,
id_review INT NOT NULL,
id_languages INT NOT NULL,
id_genre INT NOT NULL,
id_pegi INT NOT NULL,
game_title VARCHAR(200) NOT NULL,
release_date DATETIME NOT NULL,
game_details VARCHAR(200),
achievements INT,
original_price decimal(18,2),
discount_price decimal(18,2),
FOREIGN KEY(id_developer) REFERENCES developer(id_developer),
FOREIGN KEY(id_review) REFERENCES review(id_review),
FOREIGN KEY(id_languages) REFERENCES languages(id_languages),
FOREIGN KEY(id_genre) REFERENCES genre(id_genre),
FOREIGN KEY(id_pegi) REFERENCES pegi(id_pegi)
);

-- CREACION DE TABLA SALES
CREATE TABLE IF NOT EXISTS sales(
id_sale INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_game INT NOT NULL,
units INT NOT NULL,
id_user INT NOT NULL,
id_seller INT NOT NULL,
sale_date DATETIME NOT NULL,
FOREIGN KEY(id_game) REFERENCES dataset_games(id_game),
FOREIGN KEY(id_user) REFERENCES identity(id_user),
FOREIGN KEY(id_seller) REFERENCES seller(id_seller)
);
-- CREACION DE TABLA DATASET_BEHAVIOUR
CREATE TABLE IF NOT EXISTS dataset_behaviour(
id_behaviour INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_user INT NOT NULL,
id_game INT NOT NULL,
hours_dedicated decimal(18,2),
FOREIGN KEY (id_user) REFERENCES identity(id_user),
FOREIGN KEY (id_game) REFERENCES dataset_games(id_game)
);

-- CREACION DE TABLA BITACORA PARA USUARIOS NUEVOS/EDITADOS/ELIMINADOS

drop table if exists new_users;
CREATE TABLE new_users(
id_action int primary key AUTO_INCREMENT,
id_user int,
name varchar(100),
surname varchar(100),
action varchar(100),
dtime datetime,
admin varchar(100)
);

-- INSERCION DE REGISTROS EN RESPECTIVAS TABLAS
INSERT INTO country (id_country, country) VALUES
(NULL, "ARGENTINA"),
(NULL, "FRANCIA"),
(NULL, "BRASIL"),
(NULL, "INGLATERRA"),
(NULL, "SUECIA"),
(NULL, "ALEMANIA"),
(NULL, "CHILE"),
(NULL, "ESTADOS UNIDOS"),
(NULL, "ESPAÑA"),
(NULL, "PORTUGAL"),
(NULL, "JAPON");

INSERT INTO pegi (id_pegi, pegi) VALUES
(NULL, "pegi 3"),
(NULL, "pegi 7"),
(NULL, "pegi 12"),
(NULL, "pegi 16"),
(NULL, "pegi 18");

INSERT INTO genre (id_genre, genre) VALUES
(NULL, "Action"),
(NULL, "Adventure"),
(NULL, "Casual"),
(NULL, "Free to Play"),
(NULL, "Indie"),
(NULL, "RPG"),
(NULL, "Racing"),
(NULL, "Simulation"),
(NULL, "Sports"),
(NULL, "RTS");

INSERT INTO developer (id_developer, developer) VALUES
(NULL, "Valve"),
(NULL, "Blizzard"),
(NULL, "Activision"),
(NULL, "Microsoft"),
(NULL, "Codemasters"),
(NULL, "Remedy enternainment"),
(NULL, "Nintendo"),
(NULL, "Sony"),
(NULL, "EA Sports"),
(NULL, "Bohemia interactive"),
(NULL, "Rockstar");

INSERT INTO review (id_review, review) VALUES
(NULL, "Mixed"),
(NULL, "Mostly Negative"),
(NULL, "Mostly Positive"),
(NULL, "Negative"),
(NULL, "Overwhelmingly Negative"),
(NULL, "Overwhelmingly Positive"),
(NULL, "Positive"),
(NULL, "Very Negative"),
(NULL, "Very Positive");

INSERT INTO languages (id_languages, languages) VALUES
(NULL, "English"),
(NULL, "French"),
(NULL, "German"),
(NULL, "Italian"),
(NULL, "Spanish"),
(NULL, "Russian"),
(NULL, "Portuguese"),
(NULL, "Polish"),
(NULL, "Dutch"),
(NULL, "Japanese"),
(NULL, "Corean");

INSERT INTO identity (id_user, surname, name, age, email, id_country) VALUES
(NULL, "AGUILERA", "DIMAS", 18,"DIMASFRANCE@gmail.com", 7),
(NULL,	"AGUILERA MERINO","DIMAS",43,"DIMASFRANCE@gmail.com",1),
(NULL,	"BLANCO FONTANET","DAVID",65,"DAVIDSPAIN@gmail.com",3),
(NULL,	"BARALDES COMAS","ANA INES",24,"ANA INESSPAIN@gmail.com",4),
(NULL,	"ZAMBUDIO FIGULS","IVAN",75,"IVANSPAIN@gmail.com",2),
(NULL,	"BADIA TORNE","LAURA",19,"LAURAITALY@gmail.com",5),
(NULL,	"ARNAU MORENO","MARTA",21,"MARTAITALY@gmail.com",6),
(NULL,	"ABADIAS MASANA","ABEL",37,"ABELCHINA@gmail.com",8),
(NULL,	"CASAS ANDRES","BERTA",10,"BERTAFRANCE@gmail.com",9),
(NULL,	"LOPEZ GARRIGASSAIT","MARIO",27,"MARIOUNITED-KINDOM@gmail.com",10);

INSERT INTO seller (id_seller, name, lastname, email, age, id_country) VALUES
(NULL,"Leesa","Lindenblatt","LeesaLindenblatt@gmail.com",39,7),
(NULL,"Damian","Quenby","DamianQuenby@gmail.com",29,5),
(NULL,"Pablo","Le Fleming","PabloLe Fleming@gmail.com",50,7),
(NULL,"Urbanus","Sayles","UrbanusSayles@gmail.com",24,4),
(NULL,"Eddie","Matyatin","EddieMatyatin@gmail.com",34,2),
(NULL,"Yalonda","Densell","YalondaDensell@gmail.com",48,7),
(NULL,"Bartlet","Hatherell","BartletHatherell@gmail.com",26,9),
(NULL,"Alica","Salvadori","AlicaSalvadori@gmail.com",46,9),
(NULL,"Zabrina","Calrow","ZabrinaCalrow@gmail.com",43,6),
(NULL,"Aigneis","Rosenau","AigneisRosenau@gmail.com",21,9);

INSERT INTO dataset_games(id_game,id_developer,id_review,id_languages,id_genre,id_pegi,game_title,release_date,game_details,achievements,original_price,discount_price) VALUES
(NULL,9,2,1,6,4,"Counter-Strike GO",'2021-09-05',"Single-player,Steam Achievements,Steam Trading Cards",1,9.99,5),
(NULL,1,7,7,5,4,"DOTA 2",'2022-12-22',"Single-player",30,72.74,7),
(NULL,9,3,9,8,2,"WARCRAFT 3",'2021-05-07',"Single-player,Partial Controller Support",30,9.99,3),
(NULL,7,4,2,4,4,"Max Payne",'2022-07-23',"Single-player,Partial Controller Support",30,4.99,5),
(NULL,6,3,5,5,5,"DIRT 3",'2021-01-30',"Single-player,Partial Controller Support",30,2.99,2),
(NULL,7,4,6,3,1,"League of Legends",'2021-12-27',"Single-player,Partial Controller Support",30,4.99,8),
(NULL,6,7,8,6,2,"Counter-Strike 1.6",'2022-08-06',"Single-player,Partial Controller Support",30,4.99,3),
(NULL,9,3,9,3,1,"Shadow Warrior (Classic)",'2022-08-03',"Single-player,Multi-player,Partial Controller Support",30,9.99,9),
(NULL,6,4,7,2,2,"Eradicator",'2022-04-21',"Single-player",30,55.92,2),
(NULL,6,6,2,5,1,"Limbo",'2022-01-27',"Single-player",30,9.99,6);

INSERT INTO sales (id_sale,id_game,units,id_user,id_seller,sale_date) VALUES
(NULL,6,3,2,7,'2023-09-16'),
(NULL,8,2,1,6,'2022-02-21'),
(NULL,3,1,7,3,'2023-01-19'),
(NULL,4,4,3,1,'2023-03-30'),
(NULL,2,1,4,7,'2023-01-15'),
(NULL,7,3,8,2,'2023-12-17'),
(NULL,5,2,2,1,'2023-09-14'),
(NULL,7,4,7,7,'2022-07-16'),
(NULL,5,2,9,6,'2022-07-18'),
(NULL,8,4,5,1,'2022-05-14');

INSERT INTO dataset_behaviour(id_behaviour,id_user,id_game,hours_dedicated) VALUES
(NULL,6,1,8),
(NULL,4,5,10),
(NULL,7,7,9),
(NULL,3,5,3),
(NULL,7,4,7),
(NULL,8,1,6),
(NULL,7,6,13),
(NULL,4,2,12),
(NULL,4,4,8),
(NULL,2,1,6);

-- VISTAS GENERADAS:

-- VISTA DE TITULO, FECHA DE LANZAMIENTO Y PRECIO ORIGINAL
CREATE VIEW games_info AS
SELECT game_title, release_date, original_price
FROM dataset_games;

select * from games_info;

-- TOP 10 JUEGOS MAS CAROS
CREATE VIEW top_10_expensive_games AS
SELECT id_game, id_developer, id_review, id_languages, id_genre, id_pegi, game_title, release_date, game_details, achievements, original_price, discount_price
FROM dataset_games
ORDER BY original_price DESC
LIMIT 10;

select * from top_10_expensive_games;

-- JUEGOS MAS VENDIDOS

CREATE VIEW top_selling_games AS
SELECT id_game, SUM(units) AS total_units_sold
FROM sales
GROUP BY id_game
ORDER BY total_units_sold DESC;

select * from top_selling_games;

-- TOP 5 USUARIOS QUE MAS COMPRARON

CREATE VIEW top_users AS
SELECT u.surname, u.name, SUM(s.units) as total_units
FROM sales s
JOIN identity u ON s.id_user = u.id_user
GROUP BY s.id_user
ORDER BY total_units DESC
LIMIT 5;

select * from top_users;

-- TOP 3 VENDEDORES

CREATE VIEW top_sellers AS
SELECT s.id_seller, s.name, s.lastname, SUM(sl.units) AS total_units_sold
FROM seller s
JOIN sales sl ON s.id_seller = sl.id_seller
GROUP BY s.id_seller
ORDER BY total_units_sold DESC
LIMIT 3;

SELECT * from top_sellers;
-- FUNCIONES

-- FUNCION PARA CONTAR CLIENTES POR ID DE PAIS
DELIMITER //
CREATE FUNCTION buscarClientes(country INT)
RETURNS INT
DETERMINISTIC
BEGIN
RETURN (SELECT COUNT(*) FROM identity WHERE country = id_country);
END //

select buscarClientes(5) as CantidadPorID;
-- FUNCION PARA MOSTRAR RANGO ETARIO 
drop function if exists MostraRetario;

DELIMITER //
CREATE FUNCTION MostraRetario(Rango INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
CASE 
when Rango<11 then
	return 'Niñez';
when rango>=11 and rango<18 then
	return 'adolescencia';
when rango>=18 and rango<59 then
	return 'adultez';
when rango>=59 then
	return 'vejez';
end case;
END //

SELECT id_seller, name, lastname, MostraRetario(age) from seller;
SELECT id_user, surname, name, MostraRetario(age) as RangoEtario FROM identity;

-- STORE PROCEDURES

-- SP DE ORDENAMIENTO DE TABLA CON PRIMER CAMPO, CON EL SEGUNDO CAMPO (DANDO CUALQUIER VALOR ENTRE '') SE ORDENARA DE MANERA DESCENDENTE
-- CASO CONTRARIO, SI NO PUSIERA NINGUN VALOR (SOLO COMILLAS) QUEDARIA COMO VIENE POR DEFECTO EN VALOR ASCENDENTE
DELIMITER ??
CREATE PROCEDURE `orden_param` (IN field CHAR(20), IN param2 VARCHAR(20))
BEGIN
IF field <> '' THEN
		SET @game_order = concat('ORDER BY ', field);
    else
		SET @game_order = '';
    END IF;
IF param2 <> '' THEN
SET @game_order2 = ' DESC';
else
SET @game_order2 = '';
END IF;
    SET @clausula = concat('SELECT * FROM dataset_games ', @game_order, @game_order2);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END ??

CALL orden_param('game_title','');

-- ACTUALIZAR PRECIO DE MANERA PORCENTUAL EN LA TABLA DE DATASET_GAMES DONDE SE ENCUENTRAN LOS VALORES
DELIMITER &&
CREATE PROCEDURE `actualizarPrecio` (IN field decimal(5,2))
BEGIN
IF field <> '' THEN
	set @game_order = concat('SET original_price = original_price * ', field);
    else
    SET @game_order= '';
    END IF;
set @clausula = concat('UPDATE dataset_games ', @game_order);
PREPARE runSQL FROM @clausula;
EXECUTE runSQL;
DEALLOCATE PREPARE runSQL;
END &&
-- SI QUISIERA POR EJEMPLO ACTUALIZAR EL PRECIO ORIGINAL UN 10% LLAMARIA AL SP CON EL VALOR 1.1 EJEMPLO:
CALL actualizarPrecio(1.1);


-- TRIGGER DE INSERCION DE USUARIO EN TABLA IDENTITY
drop trigger if exists `tr_add_new_user`;
DELIMITER $$
CREATE TRIGGER `tr_add_new_user`
AFTER INSERT ON `identity`
FOR EACH ROW
BEGIN
INSERT INTO `new_users` (id_user, name, surname, action, dtime, admin) VALUES (NEW.id_user, NEW.name, NEW.surname,'INSERT', NOW(), USER());
END $$
DELIMITER ;

INSERT INTO identity VALUES (NULL,'cecilia','mulero',33,'cecim@mail.com',5);
select * FROM identity ORDER BY id_user DESC;

select * FROM new_users;


-- TRIGGER ACTUALIZACION USUARIO EN TABLA IDENTITY
drop trigger if exists tr_update_user;
DELIMITER $$
CREATE TRIGGER `tr_update_user`
BEFORE UPDATE ON `identity`
FOR EACH ROW
BEGIN
INSERT INTO `new_users` (id_user, name, surname, action, dtime, admin) VALUES (NEW.id_user, NEW.name, NEW.surname, 'UPDATE', NOW(), USER());
END $$
DELIMITER ;

UPDATE identity set email = 'ejemplo@ejemplo.com' where id_user = 7;
select * FROM new_users;

-- TRIGGER ELIMINACION DE USUARIO EN TABLA IDENTITY
drop trigger if exists tr_delete_user;
DELIMITER $$
CREATE TRIGGER `tr_delete_user`
AFTER DELETE ON `identity`
FOR EACH ROW
BEGIN
INSERT INTO `new_users` (id_user, name, surname, action, dtime,admin) VALUES (OLD.id_user, OLD.name, OLD.surname,'DELETE', NOW(), user());
END $$
DELIMITER ;

DELETE FROM identity where id_user = 10;
select * FROM new_users;

-- ALTA DE USUARIOS

-- creacion de usuario 1
drop user if exists usuario1@localhost;
create user usuario1@localhost identified by 'pass123word';

-- creacion de usuario 2
drop user if exists usuario2@localhost;
create user usuario2@localhost identified by 'word123pass';

-- se le otorga al usuario 1 permiso de seleccion, insercion y actualizacion de datos. Sin permiso para borrar
GRANT SELECT, INSERT, UPDATE ON usersbehaviour.* to usuario1@localhost;

-- se le otorga permisos solo de lectura al usuario 2
GRANT SELECT ON usersbehaviour.* to usuario2@localhost;

-- SENTENCIAS DEL SUBLENGUAJE TCL
-- SE INICIA LA TRANSACCION INSERTANDO UN LENGUAJE MAS EN LA TABLA LANGUAGES, SE COMMITEA Y SE CONSULTA PARA CORROBORAR.

START TRANSACTION;
INSERT INTO LANGUAGES (id_languages, languages)
VALUES (NULL,'Czech');
COMMIT;
SELECT * FROM LANGUAGES;

-- SE INICIA LA TRANSACCION INSERTANDO UN LENGUAGE, PERO SE HACE RROLLBACK, SE CONSULTA LA TABLA PARA CORROBORAR EL ROLLBACK.
START TRANSACTION;
INSERT INTO LANGUAGES (id_languages, languages)
VALUES (NULL,'Mandarin');
rollback;
SELECT * FROM LANGUAGES;

-- SE INICIA LA TRANSACCION PARA INSERTAR DATOS DE UNA VENTA EN LA TABLA SALES, SE COMMITEA Y SE CONSULTA LA TABLA PARA CORROBORAR.

START TRANSACTION;
INSERT INTO sales (id_sale, id_game, units, id_user, id_seller, sale_date)
VALUES(NULL, 3, 1,5,1,'2023-05-16');
COMMIT;
SELECT * FROM sales ORDER BY id_sale DESC;
-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 26 Octobre 2017 à 13:53
-- Version du serveur :  5.7.19-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `st_tech_db`
--

-- --------------------------------------------------------

/* Drop, creation et utilisation de la BDD st_tech_db */

DROP DATABASE IF EXISTS st_tech_db;
CREATE DATABASE st_tech_db;
USE st_tech_db;

/*creation et structure de la table planete */

CREATE TABLE `planete` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` VARCHAR(255) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creation et structure de la table `atelier`
--

CREATE TABLE `atelier` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `planete_id` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `image` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `image` VARCHAR(255) NOT NULL,
    `atelier_id` INT NOT NULL
);

ALTER TABLE atelier
ADD FOREIGN KEY (planete_id) REFERENCES planete(id);

ALTER TABLE image
ADD FOREIGN KEY (atelier_id) REFERENCES atelier(id);

INSERT INTO planete (`name`, `image`) VALUES
("atelierrobotique", 'planete1.png'),
("atelierscientifique", 'planete2.png'),
("artfabrique", 'planete3.png'),
("gouternumérique", 'planete4.png'),
("vacancesdigitales", 'planete5.png'),
("laboado", 'planete6.png');

INSERT INTO atelier (`name`, `description`, `planete_id`) VALUES 
  ('atelierrobotique', "Les engrenages, les mouvements programmés, les Lego Mindstorm ou les EV3 n’auront plus de secrets pour vos enfants ! Ils pourront construire, assembler et créer des robots de toutes pièces !", 1),
  ('atelierscientifique', "Ici c'est le lieu de la science, l'expérimentation, la découverte, et de l'approche ludique et créative. Cette année, la matière et le vivant sont à l’honneur. ", 2),
  ('artfabrique', "Si tu es bricoleur, Saint-Ex te propose un espace de fabrication et de construction de prototypes et petits objets. Les outils : Imprimante 3D, Découpe laser, plotter de découpe, tricodeur, brodeuse
  et petits outillages. ", 3),
  ('gouternumérique', "A Saint-Ex, les enfants peuvent participer à des ateliers créatifs et ludiques autour des nouvelles technologies. C'est très amusant, et tu peux découvrir par exemple : la création de toupies, la robotique, la création de bijoux, ou même réaliser des jeux de société !", 4),
  ('vacancesdigitales', "L'école du numérique te propose des ateliers créatifs destinés aux enfants autour des outils numériques, sous forme de stage. Les thèmes sont renouvelés à chaque fois. C'est super sympa et il y a pleins de choses à découvrir ! Des jeux vidéo, des bijoux numériques, de la robotique, et même du light painting ! ", 5),
  ('laboado', "Au laboado, tu peux t'immerger pendant 1 heure pour tester la réalité virtuelle avec nos 2 HTC Vive !", 6)
;

INSERT INTO image (image, atelier_id) VALUES 
  ('atelier_robotique1.jpg', 1),
  ('atelier_robotique2.jpg', 1),
  ('atelier_scientifique1.jpeg', 2),
  ('atelier_scientifique2.jpg', 2),
  ('atelier_scientifique3.jpeg', 2),
  ('fab_lab1.jpeg', 3),
  ('fab_lab2.jpeg', 3),
  ('fab_lab3.jpeg', 3),
  ('fab_lab4.jpeg', 3),
  ('gouter_numerique1.jpg', 4),
  ('gouter_numerique2.JPG', 4),
  ('gouter_numerique3.JPG', 4),
  ('gouter_numerique4.jpg', 4),
  ('gouter_numerique5.JPG', 4),
  ('vacances_digitales1.JPG', 5),
  ('vacances_digitales2.jpeg', 5),
  ('vacances_digitales3.JPG', 5),
  ('vacances_digitales4.jpeg', 5),
  ('laboado1.jpg', 6),
  ('laboado2.jpg', 6)
;

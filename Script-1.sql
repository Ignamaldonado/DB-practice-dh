/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS notes_db;
CREATE DATABASE `notes_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */
USE notes_db

-- notes_db.users definition

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` VALUES
(1, 'Dario Lopilato', 'elpibe@gmail.com'),
(2, 'Agustin Conde', 'tuki@gmail.com'),
(3, 'DUKI MODODIABLO', 'dukissj@gmail.com'),
(4, 'el papu', 'elpapu123@gmail.com'),
(5, 'Harry compota', 'hogwarts666@gmail.com'),
(6, 'El naruto', 'narutito@gmail.com'),
(7, 'cosme fulanito', 'sidney444@gmail.com'),
(8, 'Martin Perez', 'kcyo@gmail.com'),
(9, 'Estoy Cansado', 'quiero.dormir@gmail.com'),
(10, 'Elmas kpo', 'nosemeocurre@gmail.com');

-- notes_db.notes definition

DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `noteid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`noteid`),
  KEY `notes_FK` (`user_id`),
  CONSTRAINT `notes_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `notes` VALUES 
 (1, 'Pinto escribir algo', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2/3/2020', '7/5/2021', 1),
 (2, 'Las ventajas de aprender a codear', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '12/25/2021', '1/1/2022', 3),
 (3, 'Saquenme de Argentina porfa', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '12/25/2021', '1/1/2022', 5),
 (4, 'Ya no se que poner', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', '3/4/2019', '5/7/2020', 2),
 (5, 'Tengo fundido el cerebro', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '11/11/2021', '11/11/2021', 4),
 (6, 'Me parece que no es por ahi', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '9/11/2011', '3/23/2019', 8),
 (7, 'Aprender base de datos es complicado', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '7/12/2022', '3/21/2021', 10),
 (8, 'Pero bueno, hay que meterle garra', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '4/12/2021', '5/2/2021', 9),
 (9, 'Unas ganas de vacaciones', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '12/21/2020', '4/4/2020', 6),
 (10, 'El ultimo titulo', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '6/9/2019', '11/11/2021', 7);

-- notes_db.user_note definition

DROP TABLE IF EXISTS `user_note`;
CREATE TABLE `user_note` (
  `user_noteid` int(11) NOT NULL AUTO_INCREMENT,
  `note_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lastEditDate` date DEFAULT NULL,
  PRIMARY KEY (`user_noteid`),
  KEY `user_note_FK` (`user_id`),
  KEY `user_note_FK_1` (`note_id`),
  CONSTRAINT `user_note_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`),
  CONSTRAINT `user_note_FK_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`noteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user_note` VALUES 
(1,3,3),
(2,1,5),
(3,2,6),
(4,1,4),
(5,7,7),
(6,8,8),
(7,2,3),
(8,10,10),
(9,10,6),
(10,1,1);

-- notes_db.note_category definition

DROP TABLE IF EXISTS `note_category`;
CREATE TABLE `note_category` (
  `note_categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  PRIMARY KEY (`note_categoryid`),
  KEY `note_category_FK` (`note_id`),
  KEY `note_category_FK_1` (`category_id`),
  CONSTRAINT `note_category_FK` FOREIGN KEY (`note_id`) REFERENCES `notes` (`noteid`),
  CONSTRAINT `note_category_FK_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `note_category` VALUES 
(1,3,3),
(2,2,5),
(3,2,2),
(4,1,4),
(5,8,7),
(6,8,8),
(7,9,9),
(8,10,10),
(9,10,6),
(10,1,1);

-- notes_db.category definition

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `category` VALUES 
(1, 'Videojuegos'),
(2, 'Esports'),
(3, 'Deportes'),
(4, 'Politica'),
(5, 'Random'),
(6, 'Anime'),
(7, 'Codeo'),
(8, 'Ciudadania'),
(9, 'Escolar'),
(10, 'KCYO');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: image_shopping
-- ------------------------------------------------------
-- Server version	5.7.9-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (0,0,'Astract'),(1,0,'My universe'),(2,2,'Aminal picture'),(3,4,'My landscape'),(4,4,'The sky'),(5,1,'Fucking good picture'),(6,6,'dad'),(7,19,'Evil');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (18,3,3,123456789,1),(18,9,7,123456789,1),(18,11,9,123123,1),(19,9,7,123123,1),(20,3,3,123456,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (0,'Landscape','Mountain',3,3,'/Image/0.jpg',100,12,4,5,1),(1,'Landscape','Fall',4,3,'/Image/1.jpg',50,5,3,5,0),(2,'Abstract','Blue & Green',4,4,'/Image/2.jpg',10,10,3,0,0),(3,'Abstract','Green',3,4,'/Image/3.jpg',20,14,4,0,1),(4,'Landscape','Mountain',4,5,'/Image/4.jpg',50,6,5,5,0),(5,'Landscape','Mountain2',1,4,'/Image/5.jpg',30,4,5,5,0),(6,'Landscape','Ocean',4,5,'/Image/6.jpg',20,6,5,3,0),(7,'Landscape','Lúa',4,4,'/Image/7.jpg',30,5,4,3,0),(8,'Landscape','Băng',4,5,'/Image/8.jpg',50,5,5,3,0),(9,'Animal','Snake',7,6,'/Image/9.jpg',30,37,4,2,1),(10,'Animal','Lion',8,5,'/Image/10.jpg',50,5,5,2,0),(11,'Abstract','Sony',9,4,'/Image/11.jpg',40,4,4,1,1),(12,'Universe','Space',9,5,'/Image/12.jpg',100,5,5,1,0),(13,'Animal','Eagle',9,5,'/Image/13.jpg',50,5,5,2,1),(14,'Landscape','Beach',4,0,'/Image/14.jpg',0,3,2,3,0),(15,'Sky','Moon',4,5,'/Image/15.jpg',0,5,2,4,1),(16,'Universe','Moon',4,5,'/Image/16.jpg',10,13,5,1,1),(17,'Universe','Space2',8,0,'/Image/17.jpg',5,5,1,1,0),(18,'Sky','Sky',4,3,'/Image/18.jpg',20,5,4,4,1);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (6,0),(3,2),(6,3),(20,3),(6,9),(20,9),(6,11),(6,16);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (0,6,1,'Violent content',0),(1,6,9,'Violent content',0),(2,6,15,'Violent content',2);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'duy','1234','Bùi Minh Duy','razerduy@gmail.com','01655102844','Whitehouse',3),(1,'thuan','1234','Trần Lê Thái Thuận','abcxyz@gmail.com','12389091290',NULL,3),(2,'nctphuc','1234','Nguyễn Cao Thiên Phúc','nctp.1209@gmail.com','0916640015','1/2/9 D3, P25, QBT, TPHCM',3),(3,'user1','456789','User1','asdfgh@gmail.com','120391824908',NULL,2),(4,'user2','123456','User2','uiophjkl@gmail.com','123908901823',NULL,2),(5,'userunactive','123456','UserUnactive','zxcvbnm@gmail.com','sdfhjdsjij@gmail.com',NULL,1),(6,'yugi','123456','yugioh','duy@gmail.com','12318464986','dgdfgdgds',2),(7,'user8','456789','dsfsjn','duy230895@gmail.com','123456789','gfg',2),(8,'user9','123456','tháº¡ch','kyuzokz@gmail.com','123456789','gdgdgdsfg',2),(9,'user10','123','name','email','123456','gdfgsd',2),(10,'uer20','123','dfgdsg','gdsgds','1513135','gdsfgds',2),(11,'zxcv','123','t','t','1','u',2),(12,'cv','1','i','g','2','h',2),(13,'cvb','1','p','j','3','f',2),(14,'bncn','1','o','g','5','yh',2),(15,'gdsfgds','1','u','k','4','hf',2),(16,'fgfsd','1','l','i','5','fgh',2),(17,'gg','1','k','o','6','hf',2),(18,'user12','123456','Tôn','kyuzokz@gmail.com','123456789','dfgnsjkgnsjkd',2),(19,'razer','123456','duy','duy230895@gmail.com','123456789','123456789',2),(20,'user30','123456','Bùi Minh Duy','duy230895@gmail.com','123456789','abcdefgh',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-06 21:35:57

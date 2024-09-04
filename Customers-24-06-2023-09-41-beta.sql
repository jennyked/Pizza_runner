-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(35) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Catharine Rolfson','birdie34@example.com','1-600-118-8290x825'),(2,'Zoila Kihn','blaze.marvin@example.net','(050)126-9037'),(3,'Dr. Gerard Dickinson Jr.','tavares05@example.net','175-871-0179x41129'),(4,'Alison Sauer','summer.heathcote@example.org','(673)421-6517'),(5,'Mr. Kristoffer Prosacco','mario53@example.net','1-595-006-5430x15978'),(6,'Kristy Block','eschiller@example.com','1-972-174-1093x522'),(7,'Jackson Corkery','roger61@example.org','105-043-0861'),(8,'Dr. Glenna Hilll','liana.franecki@example.org','874.440.3810x663'),(9,'Patricia Bins IV','terence72@example.net','033-887-2992x021'),(10,'Jane Schiller PhD','sophia19@example.com','1-706-408-0957'),(11,'Prof. Mustafa Kerluke V','arnold.klocko@example.com','(137)127-1913x1881'),(12,'Eve Becker','heffertz@example.net','656-745-9954x41385'),(13,'Beatrice Kuphal','blick.emory@example.org','1-442-625-3413x56965'),(14,'Mr. Randy Beier','mlubowitz@example.net','+48(2)2656870527'),(15,'Lelia Kreiger','richmond.reichert@example.com','927-138-9236'),(16,'Dr. Golda Ernser IV','mauricio34@example.net','+78(6)9456750853'),(17,'Martine Reichert Sr.','santos78@example.com','1-525-301-6752x171'),(18,'Mr. Demario Senger PhD','xander.corkery@example.org','(442)874-4462x5938'),(19,'Esmeralda Gorczany','buckridge.adolf@example.net','093.233.5643'),(20,'Gillian Cummerata','autumn.koss@example.net','(847)382-2124x226'),(21,'Cyrus Lehner V','kautzer.jordy@example.org','236-736-6326x779'),(22,'Mrs. Vallie Bode','abbigail.kovacek@example.com','663.275.5592x93043'),(23,'Dr. Pearlie Lemke','lind.effie@example.com','925-475-8157'),(24,'Prof. Nikko Bogan IV','mara.dietrich@example.net','1-025-405-5747x854'),(25,'Luella Howell','armani.grant@example.com','553.030.7404'),(26,'Herbert Von','shyanne.feil@example.org','1-192-462-6960x6216'),(27,'Dr. Weston Streich MD','hgoodwin@example.com','1-835-827-2606x994'),(28,'Claudie Grady II','ldare@example.net','168-988-0219x3329'),(29,'Zechariah Wintheiser','weffertz@example.org','696-316-0704'),(30,'Prof. Maverick Lebsack MD','vhuel@example.com','1-824-108-6638x7146'),(31,'Sedrick Labadie','yhowe@example.com','1-947-988-5827x087'),(32,'Amara Kiehn','kris.zelma@example.com','(100)519-1815x6524'),(33,'Prof. Audrey Langosh PhD','turcotte.sim@example.net','649-990-2718'),(34,'Kamryn Abernathy','prince.willms@example.org','05352780448'),(35,'Roman Harvey','alisa35@example.net','04608223998'),(36,'Malachi Bergstrom PhD','chelsey61@example.com','(957)029-4220'),(37,'Fannie Gislason','angel.frami@example.net','1-148-003-6533x9519'),(38,'Bernadine Ritchie','alex70@example.com','161-488-2869x2409'),(39,'Paris Jakubowski PhD','plangosh@example.net','1-299-336-8474x845'),(40,'Carter Fay','huels.neoma@example.com','241-762-0856'),(41,'Prof. Roberto Bruen','welch.georgette@example.org','663-051-0220'),(42,'Derek Kessler','haley.madisen@example.com','09592669017'),(43,'Dr. Kane Hamill Jr.','aliya14@example.org','948-639-3908'),(44,'Kayla Marquardt II','cummerata.jenifer@example.net','(906)229-5471x76262'),(45,'Sydni Morar','loberbrunner@example.net','504.722.2359x100'),(46,'Dr. Jakayla Christiansen','bette.quitzon@example.net','1-121-749-6584x7983'),(47,'Prof. Hank Conroy','beatty.elnora@example.org','(463)325-5715'),(48,'Mr. Narciso Huels MD','joannie20@example.com','1-290-963-0287'),(49,'Randy Tillman','dejah.schiller@example.net','06560285603'),(50,'Mr. Davin Casper','bergstrom.ova@example.org','02309699448'),(51,'Mrs. Effie Quitzon II','mjaskolski@example.net','359-951-0274x7327'),(52,'Mrs. Zaria Haag DVM','prince64@example.com','707.960.5289'),(53,'Laverne Beer','roberto.littel@example.net','801.859.2567'),(54,'Fermin Medhurst','bauch.sheridan@example.net','880.716.8350x666'),(55,'Kiara Hartmann DVM','allene.king@example.org','587.262.9446'),(56,'Prof. Regan Beatty II','dickens.raul@example.org','242.815.0928x477'),(57,'Albertha Weissnat Jr.','theresia41@example.com','930-781-3860x818'),(58,'Oleta Bosco','dennis.quitzon@example.net','762.617.6083x94700'),(59,'Earl Kassulke','ernest01@example.org','823-983-4340x411'),(60,'Gloria Cruickshank','xstracke@example.org','1-339-765-3658x80958'),(61,'Mr. Jakob Lind','arch76@example.com','05749307835'),(62,'Dr. Onie Bednar MD','alene.wisoky@example.net','(330)084-3841x4098'),(63,'Mrs. Ardith Green','ruthie82@example.org','491.892.2893'),(64,'Miss Ressie Pacocha','foster35@example.org','+57(2)0973310601'),(65,'Prof. Josefa Crona MD','nola.west@example.org','07335424815'),(66,'Prof. Amari Graham','emely.bergnaum@example.net','796-668-1227'),(67,'Noel Greenholt DVM','sschowalter@example.org','1-926-621-3221x3728'),(68,'Aylin Predovic','vwehner@example.net','235.589.8301x0011'),(69,'Emelia Schuster','bschumm@example.com','033.734.4707x73284'),(70,'Melisa Weissnat IV','josianne06@example.org','00253094198'),(71,'Mozelle Dach','mathew65@example.net','08078407930'),(72,'Lily Green PhD','ukeeling@example.com','1-177-976-1556x7531'),(73,'Brendan Grimes','emmett.wunsch@example.com','(977)524-0854x007'),(74,'Lourdes Ebert','yparker@example.com','607-862-3260x394'),(75,'Dr. Clementina Marks IV','marlee45@example.org','05128393985'),(76,'Wilburn Hartmann','tomas.grimes@example.org','06301337899'),(77,'Mr. Lew Daugherty','andre65@example.net','1-445-743-6352x21173'),(78,'Libby Lakin','windler.jaqueline@example.net','(141)381-2886'),(79,'Rickie Hand','oma.bergnaum@example.com','488-888-9703x1646'),(80,'Ova Rath','hagenes.roscoe@example.org','988-867-2731'),(81,'Lavonne Haley','rutherford.jeff@example.org','278-459-9585x371'),(82,'Else Paucek','hhickle@example.org','(702)045-0051x92605'),(83,'Burdette Mann IV','freddie.mcdermott@example.org','638-305-2972x81757'),(84,'Jamey Aufderhar','katheryn15@example.com','823.778.1383x4992'),(85,'Prof. Hermann Reynolds IV','ken.dibbert@example.com','+52(4)3261879230'),(86,'Dr. Nova Spencer','abbott.rose@example.net','+34(4)0126457805'),(87,'Dr. Calista Kunde I','bergnaum.audie@example.net','(447)890-2951x8305'),(88,'Magdalen Rodriguez V','shana.klocko@example.net','936-509-7934x6872'),(89,'Stella Rice','krajcik.vernon@example.com','1-501-202-3237'),(90,'Alta Mohr I','wilkinson.eula@example.org','+95(3)0405802610'),(91,'Francisco Cruickshank','vleannon@example.com','343-362-2984x650'),(92,'Eliseo Krajcik','lindsay08@example.net','(318)203-9541x30716'),(93,'Dario Frami','qconn@example.net','013-025-1629x23700'),(94,'Dr. Abel Champlin','mcrooks@example.org','1-360-065-0991'),(95,'Ally Koelpin V','tjenkins@example.com','1-869-115-3351x59443'),(96,'Harry Bins','hhettinger@example.com','623-539-8695'),(97,'Gabriel Cronin','hosea33@example.net','04261046751'),(98,'Eulalia Jerde','enrique.ledner@example.org','264-889-6909x306'),(99,'Mr. Keagan Dickinson','hyman71@example.net','1-275-735-6640'),(100,'Dr. Santiago Kuhlman','harvey.jannie@example.net','+11(8)0888633616');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-24  9:41:31

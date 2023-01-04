CREATE DATABASE  IF NOT EXISTS `european_soccer` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `european_soccer`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: european_soccer
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('admin00001','admin_josh','123hola'),('admin00002','admin_tony','9080hello'),('admin00003','admin_david','pineapple2'),('admin00004','admin_susan','pencil80'),('admin00005','admin_john','admin50'),('admin00006','admin_pepper','fingers3'),('admin00007','admin_jen','hawaii50'),('admin00008','admin_steve','general'),('admin00009','admin_irina','jeff'),('admin00010','admin_stepehen','yessir');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_games`
--

DROP TABLE IF EXISTS `archive_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive_games` (
  `game_id` varchar(100) NOT NULL,
  `team_1` varchar(100) DEFAULT NULL,
  `team_2` varchar(100) DEFAULT NULL,
  `goals_team_1` varchar(100) DEFAULT NULL,
  `goals_team_2` varchar(100) DEFAULT NULL,
  `date_played` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `t1_fk` (`team_1`),
  KEY `t2_fk` (`team_2`),
  CONSTRAINT `t1_fk` FOREIGN KEY (`team_1`) REFERENCES `teams` (`team_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t2_fk` FOREIGN KEY (`team_2`) REFERENCES `teams` (`team_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_games`
--

LOCK TABLES `archive_games` WRITE;
/*!40000 ALTER TABLE `archive_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` varchar(100) NOT NULL,
  `coach_first_name` varchar(100) DEFAULT NULL,
  `coach_last_name` varchar(100) DEFAULT NULL,
  `num_sacks` int DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES ('coach00001','Koldo ','Alvarez',3),('coach00002','Luc ','Holtz',0),('coach00003','Didier','Deschamps',0),('coach00004','Fernando','Santos',0),('coach00005','Janne ','Andersson',0),('coach00006','Roberto ','Martinez',0),('coach00007','Gareth','Southgate',0),('coach00008','Markku ','Kanerva',0),('coach00009','Zlatko','Dalic',0),('coach00010','Franco','Foda',0),('coach00011','Franco','Varrella',0),('coach00012','Roberto','Mancini',0),('coach00013','Marco','Rossi',0),('coach00014','Julio Cesar ','Ribas',0),('coach00015','Jaroslav ','Silhavy',0),('coach00016','Matjaz ','Kek',0),('coach00017','Edoardo','Reja',0),('coach00018','Steve','Clarke',0),('coach00019','John','Schip',0),('coach00020','Luis','Enrique',0),('coach00021','Mirel ','Radoi',0),('coach00022','Hakan ','Ericson',0),('coach00023','Devis ','Mangia',0),('coach00024','Dainis ','Kazakevics',0),('coach00025','Joaquin ','Caparros',0),('coach00026','Stephen ','Kenny',0),('coach00027','Ian ','Baraclough',0),('coach00028','Kasper','Hjulmand',0),('coach00029','Gianni ','De Biasi',0),('coach00030','Willibald ','Ruttensteiner',0),('coach00031','Stefan','Tarkovic',0),('coach00032','Rob','Page',0),('coach00033','Martin ','Stocklasa',0),('coach00034','Stale','Solbakken',0),('coach00035','Talgat ','Baysufinov',0),('coach00036','Arnar ','Vioarsson',0),('coach00037','Miodrag ','Radulovic',0),('coach00038','Thomas','Haberli',0),('coach00039','Yasen','Petrov',0),('coach00040','Ivaylo','Petev',0),('coach00041','Paulo ','Sousa',0),('coach00042','Roberto ','Bordin',0),('coach00043','Willy ','Sagnol',0),('coach00044','Nikos','Kostenoglou',0),('coach00045','Dragan','Stojkovic',0),('coach00046','Valeri','Karpin',0),('coach00047','Georgi ','Kondratiev',0),('coach00048','Hansi ','Flick',0),('coach00049','Blagoja ','Milevski',0),('coach00050','Louis ','Van Gaal',0),('coach00051','Murat','Yakin',0),('coach00052','Oleksandr ','Petrakov',0),('coach00053','Valdas ','Ivanauskas',0),('coach00054','Stefan ','Kuntz',0),('coach00055','Josep','Guardiola',0);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fans`
--

DROP TABLE IF EXISTS `fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fans` (
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) NOT NULL,
  `vote_player` varchar(100) DEFAULT NULL,
  `vote_league` varchar(100) DEFAULT NULL,
  `vote_team` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `p_fk` (`vote_player`),
  KEY `l_fk` (`vote_league`),
  KEY `t_fk` (`vote_team`),
  CONSTRAINT `l_fk` FOREIGN KEY (`vote_league`) REFERENCES `leagues` (`league_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `p_fk` FOREIGN KEY (`vote_player`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_fk` FOREIGN KEY (`vote_team`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fans`
--

LOCK TABLES `fans` WRITE;
/*!40000 ALTER TABLE `fans` DISABLE KEYS */;
INSERT INTO `fans` VALUES ('fan00001','ghost_boy1','122378','p00001','l00003','team00006'),('fan00002','girl47','uruguay','p00001','l00002','team00001'),('fan00003','pinetree','olora','p00010','l00001','team00001'),('fan00004','davidhsu','time7','p00001','l00001','team00001'),('fan00005','whitehair','pear5','p00001','l00002','team00001'),('fan00006','winter6','apple6','p00001','l00001','team00001'),('fan00007','melon9','bannana9','p00001','l00001','team00001'),('fan00008','chairs','pinneapple7','p00001','l00001','team00001'),('fan00009','ponytailandco','irvine9','p00001','l00001','team00001'),('fan00010','steveandmaddy','numbert','p00001','l00001','team00001'),('fan00011','masks40','albert','p00001','l00001','team00001'),('fan00012','numbers10','eistein','p00001','l00001','team00001'),('fan00013','essay60','koreanboy','p00001','l00001','team00001'),('fan00014','macbookpro','halo90','p00001','l00001','team00001'),('fan00015','generalstuff','codwarzone','p00001','l00001','team00001'),('fan00016','starwars','yorusucks','p00001','l00001','team00001'),('fan00017','toystory7','imtired','p00001','l00001','team00001'),('fan00018','mrpencils','troll80','p00001','l00001','team00001'),('fan00019','iphone90','france??','p00001','l00001','team00001'),('fan00020','samsung17','napoleon40','p00030','l00001','team00001'),('fan00021','crashlanding','bonaparte:','p00001','l00001','team00001'),('fan00022','blueeyedtroll','bedtimestory','p00001','l00001','team00001'),('fan00023','funtime3','peterpan','p00001','l00001','team00001'),('fan00024','redred4','notpasspassword','p00001','l00001','team00001'),('fan00025','blondie5','timeflies','p00001','l00001','team00001'),('fan00026','adminnot','rockandroll','p00001','l00001','team00001'),('fan00027','pencilcase0','acdccircuit','p00001','l00001','team00001'),('fan00028','getters','skimask','p00001','l00001','team00001'),('fan00029','javascript','eyeglasses','p00001','l00001','team00001'),('fan00030','wednesday','essential5','p00010','l00001','team00001'),('fan00031','reactor90','buuutterr','p00001','l00001','team00001'),('fan00032','nuclearpower','sadness8','p00001','l00001','team00001'),('fan00033','fusiontime','electrical00','p00001','l00001','team00001'),('fan00034','uranium98','applewatch?','p00001','l00001','team00001'),('fan00035','hydrogenbond','table87','p00001','l00001','team00001'),('fan00036','jamesbond','blackvan','p00001','l00001','team00001'),('fan00037','jamesrodrigues','bostonredsoxs','p00001','l00001','team00001'),('fan00038','notevaagustar','bigboy6','p00001','l00001','team00001'),('fan00039','lavelapuerca','bagpack99','p00001','l00001','team00001'),('fan00040','sweaterweather','headphones!','p00001','l00001','team00020'),('fan00041','exitsign','doralaexploradora','p00001','l00001','team00001'),('fan00042','bottles4','cheese','p00001','l00001','team00001'),('fan00043','summer5','briecheese','p00001','l00001','team00001'),('fan00044','whiteboard','vietnam5','p00001','l00001','team00001'),('fan00045','extendedessay','airpodpro','p00001','l00001','team00001'),('fan00046','texting77','smartwater','p00001','l00001','team00001'),('fan00047','redhead9','kpopandcity','p00001','l00001','team00001'),('fan00048','building6','cumbiacheta','p00001','l00001','team00001'),('fan00049','curryhub','waterpark','p00001','l00001','team00001'),('fan00050','database88','88rising','p00001','l00001','team00001');
/*!40000 ALTER TABLE `fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `game_id` varchar(100) NOT NULL,
  `team_1` varchar(100) DEFAULT NULL,
  `team_2` varchar(100) DEFAULT NULL,
  `goals_team_1` int DEFAULT NULL,
  `goals_team_2` int DEFAULT NULL,
  `date_played` date DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `team1_fk` (`team_1`),
  KEY `team2_fk` (`team_2`),
  CONSTRAINT `team1_fk` FOREIGN KEY (`team_1`) REFERENCES `teams` (`team_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `team2_fk` FOREIGN KEY (`team_2`) REFERENCES `teams` (`team_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES ('g00001','team00001','team00002',1,1,'2008-08-17'),('g00002','team00002','team00004',0,0,'2008-08-18'),('g00003','team00003','team00004',0,3,'2008-08-19'),('g00004','team00004','team00003',5,0,'2008-08-20'),('g00005','team00005','team00001',1,3,'2008-08-21'),('g00006','team00006','team00008',1,1,'2008-08-22'),('g00007','team00007','team00009',2,2,'2008-08-23'),('g00008','team00008','team00010',1,2,'2008-08-24'),('g00009','team00009','team00006',1,0,'2008-08-25'),('g00010','team00010','team00009',4,1,'2008-08-26'),('g00011','team00011','team00015',1,2,'2008-08-27'),('g00012','team00012','team00014',0,2,'2008-08-28'),('g00013','team00013','team00014',0,0,'2008-08-29'),('g00014','team00014','team00011',2,2,'2008-08-30'),('g00015','team00015','team00011',1,2,'2008-08-31'),('g00016','team00016','team00019',0,1,'2008-09-01'),('g00017','team00017','team00019',1,3,'2008-09-02'),('g00018','team00018','team00020',1,3,'2008-09-03'),('g00019','team00019','team00018',2,3,'2008-09-04'),('g00020','team00020','team00017',0,0,'2008-09-05'),('g00021','team00021','team00025',2,2,'2008-09-06'),('g00022','team00022','team00023',2,0,'2008-09-07'),('g00023','team00023','team00025',1,1,'2008-09-08'),('g00024','team00024','team00023',1,2,'2008-09-09'),('g00025','team00025','team00022',0,0,'2008-09-10'),('g00026','team00026','team00028',1,0,'2008-09-11'),('g00027','team00027','team00030',1,3,'2008-09-12'),('g00028','team00028','team00030',1,1,'2008-09-13'),('g00029','team00029','team00028',1,1,'2008-09-14'),('g00030','team00030','team00029',2,2,'2008-09-15'),('g00031','team00031','team00032',1,1,'2008-09-16'),('g00032','team00032','team00035',1,0,'2008-09-17'),('g00033','team00033','team00035',0,0,'2008-09-18'),('g00034','team00034','team00031',2,1,'2008-09-19'),('g00035','team00035','team00034',3,0,'2008-09-20'),('g00036','team00036','team00038',3,2,'2008-09-21'),('g00037','team00037','team00039',2,0,'2008-09-22'),('g00038','team00038','team00039',3,1,'2008-09-23'),('g00039','team00039','team00037',1,2,'2008-09-24'),('g00040','team00040','team00037',3,2,'2008-09-25'),('g00041','team00041','team00043',2,1,'2008-09-26'),('g00042','team00042','team00045',2,3,'2008-09-27'),('g00043','team00043','team00045',2,2,'2008-09-28'),('g00044','team00044','team00043',1,0,'2008-09-29'),('g00045','team00045','team00042',0,2,'2008-09-30'),('g00046','team00046','team00048',3,0,'2008-10-01'),('g00047','team00047','team00049',3,2,'2008-10-02'),('g00048','team00048','team00049',4,2,'2008-10-03'),('g00049','team00049','team00046',4,0,'2008-10-04'),('g00050','team00050','team00049',0,2,'2008-10-05'),('g00051','team00051','team00054',0,0,'2008-10-06'),('g00052','team00052','team00055',2,0,'2008-10-07'),('g00053','team00053','team00055',3,3,'2008-10-08'),('g00054','team00054','team00053',2,1,'2008-10-09'),('g00055','team00055','team00054',5,1,'2008-10-10'),('g00056','team00001','team00002',1,2,'2008-10-11'),('g00057','team00002','team00005',5,2,'2008-10-12'),('g00058','team00003','team00005',1,2,'2008-10-13'),('g00059','team00004','team00002',3,1,'2008-10-14'),('g00060','team00005','team00004',2,0,'2008-10-15'),('g00061','team00006','team00008',1,0,'2008-10-16'),('g00062','team00007','team00010',3,1,'2008-10-17'),('g00063','team00008','team00010',3,0,'2008-10-18'),('g00064','team00009','team00008',1,4,'2008-10-19'),('g00065','team00010','team00006',1,0,'2008-10-20'),('g00066','team00011','team00014',2,1,'2008-10-21'),('g00067','team00012','team00013',1,1,'2008-10-22'),('g00068','team00013','team00015',1,1,'2008-10-23'),('g00069','team00014','team00012',2,1,'2008-10-24'),('g00070','team00015','team00014',0,3,'2008-10-25'),('g00071','team00016','team00018',2,1,'2008-10-26'),('g00072','team00017','team00018',1,2,'2008-10-27'),('g00073','team00018','team00020',2,0,'2008-10-28'),('g00074','team00019','team00017',2,1,'2008-10-29'),('g00075','team00020','team00017',2,2,'2008-10-30'),('g00076','team00021','team00023',2,0,'2008-10-31'),('g00077','team00022','team00023',4,3,'2008-11-01'),('g00078','team00023','team00024',2,2,'2008-11-02'),('g00079','team00024','team00021',5,1,'2008-11-03'),('g00080','team00025','team00021',0,0,'2008-11-04'),('g00081','team00026','team00029',2,0,'2008-11-05'),('g00082','team00027','team00029',4,1,'2008-11-06'),('g00083','team00028','team00030',2,1,'2008-11-07'),('g00084','team00029','team00028',1,2,'2008-11-08'),('g00085','team00030','team00027',1,2,'2008-11-09'),('g00086','team00031','team00034',3,2,'2008-11-10'),('g00087','team00032','team00033',3,0,'2008-11-11'),('g00088','team00033','team00035',2,1,'2008-11-12'),('g00089','team00034','team00033',1,1,'2008-11-13'),('g00090','team00035','team00033',1,2,'2008-11-14'),('g00091','team00036','team00037',3,1,'2008-11-15'),('g00092','team00037','team00039',1,2,'2008-11-16'),('g00093','team00038','team00039',0,1,'2008-11-17'),('g00094','team00039','team00038',2,0,'2008-11-18'),('g00095','team00040','team00039',3,1,'2008-11-19'),('g00096','team00041','team00043',2,1,'2008-11-20'),('g00097','team00042','team00043',2,2,'2008-11-21'),('g00098','team00043','team00044',0,1,'2008-11-22'),('g00099','team00044','team00041',0,1,'2008-11-23'),('g00100','team00045','team00042',2,0,'2008-11-24'),('g00101','team00046','team00047',2,2,'2008-11-25'),('g00102','team00047','team00050',3,0,'2008-11-26'),('g00103','team00048','team00049',3,1,'2008-11-27'),('g00104','team00049','team00046',1,0,'2008-11-28'),('g00105','team00050','team00047',4,1,'2008-11-29'),('g00106','team00051','team00052',3,1,'2008-11-30'),('g00107','team00052','team00055',2,1,'2008-12-01'),('g00108','team00053','team00054',1,1,'2008-12-02'),('g00109','team00054','team00053',1,3,'2008-12-03'),('g00110','team00055','team00053',1,2,'2008-12-04'),('g00111','team00001','team00002',1,1,'2008-12-05'),('g00112','team00002','team00004',2,5,'2008-12-06'),('g00113','team00003','team00004',0,2,'2008-12-07'),('g00114','team00004','team00001',1,1,'2008-12-08'),('g00115','team00005','team00004',3,0,'2008-12-09'),('g00116','team00006','team00007',3,1,'2008-12-10'),('g00117','team00007','team00008',2,1,'2008-12-11'),('g00118','team00008','team00010',0,2,'2008-12-12'),('g00119','team00009','team00008',0,2,'2008-12-13'),('g00120','team00010','team00007',3,2,'2008-12-14'),('g00121','team00011','team00014',1,2,'2008-12-15'),('g00122','team00012','team00013',2,2,'2008-12-16'),('g00123','team00013','team00015',1,0,'2008-12-17'),('g00124','team00014','team00013',1,5,'2008-12-18'),('g00125','team00015','team00013',2,0,'2008-12-19'),('g00126','team00016','team00017',2,2,'2008-12-20'),('g00127','team00017','team00018',0,1,'2008-12-21'),('g00128','team00018','team00019',0,2,'2008-12-22'),('g00129','team00019','team00016',1,1,'2008-12-23'),('g00130','team00020','team00016',3,3,'2008-12-24'),('g00131','team00021','team00023',1,0,'2008-12-25'),('g00132','team00022','team00023',2,1,'2008-12-26'),('g00133','team00023','team00025',1,1,'2008-12-27'),('g00134','team00024','team00021',4,0,'2008-12-28'),('g00135','team00025','team00023',0,0,'2008-12-29'),('g00136','team00026','team00027',1,1,'2008-12-30'),('g00137','team00027','team00028',4,2,'2008-12-31'),('g00138','team00028','team00030',3,2,'2009-01-01'),('g00139','team00029','team00027',0,6,'2009-01-02'),('g00140','team00030','team00028',1,1,'2009-01-03'),('g00141','team00031','team00033',0,0,'2009-01-04'),('g00142','team00032','team00035',1,2,'2009-01-05'),('g00143','team00033','team00035',1,1,'2009-01-06'),('g00144','team00034','team00031',1,3,'2009-01-07'),('g00145','team00035','team00032',1,1,'2009-01-08'),('g00146','team00036','team00038',2,1,'2009-01-09'),('g00147','team00037','team00038',3,0,'2009-01-10'),('g00148','team00038','team00039',4,0,'2009-01-11'),('g00149','team00039','team00036',0,1,'2009-01-12'),('g00150','team00040','team00037',2,1,'2009-01-13'),('g00151','team00041','team00044',3,0,'2009-01-14'),('g00152','team00042','team00045',4,0,'2009-01-15'),('g00153','team00043','team00045',1,1,'2009-01-16'),('g00154','team00044','team00042',1,3,'2009-01-17'),('g00155','team00045','team00042',0,1,'2009-01-18'),('g00156','team00046','team00047',2,0,'2009-01-19'),('g00157','team00047','team00049',2,3,'2009-01-20'),('g00158','team00048','team00050',4,3,'2009-01-21'),('g00159','team00049','team00046',0,1,'2009-01-22'),('g00160','team00050','team00046',2,0,'2009-01-23'),('g00161','team00051','team00053',2,0,'2009-01-24'),('g00162','team00052','team00054',0,0,'2009-01-25'),('g00163','team00053','team00055',2,1,'2009-01-26'),('g00164','team00054','team00053',2,0,'2009-01-27'),('g00165','team00055','team00053',2,0,'2009-01-28'),('g00166','team00001','team00003',0,0,'2009-01-29'),('g00167','team00002','team00005',1,0,'2009-01-30'),('g00168','team00003','team00004',1,4,'2009-01-31'),('g00169','team00004','team00002',0,0,'2009-02-01'),('g00170','team00005','team00004',1,0,'2009-02-02'),('g00171','team00006','team00007',1,2,'2009-02-03'),('g00172','team00007','team00010',2,3,'2009-02-04'),('g00173','team00008','team00010',1,0,'2009-02-05'),('g00174','team00009','team00006',1,0,'2009-02-06'),('g00175','team00010','team00009',0,2,'2009-02-07'),('g00176','team00011','team00014',3,1,'2009-02-08'),('g00177','team00012','team00015',1,0,'2009-02-09'),('g00178','team00013','team00015',0,1,'2009-02-10'),('g00179','team00014','team00012',3,0,'2009-02-11'),('g00180','team00015','team00011',2,0,'2009-02-12'),('g00181','team00016','team00019',0,0,'2009-02-13'),('g00182','team00017','team00018',3,2,'2009-02-14'),('g00183','team00018','team00020',2,1,'2009-02-15'),('g00184','team00019','team00017',3,1,'2009-02-16'),('g00185','team00020','team00016',1,1,'2009-02-17'),('g00186','team00021','team00023',0,1,'2009-02-18'),('g00187','team00022','team00025',1,1,'2009-02-19'),('g00188','team00023','team00025',1,4,'2009-02-20'),('g00189','team00024','team00023',3,1,'2009-02-21'),('g00190','team00025','team00023',1,0,'2009-02-22'),('g00191','team00026','team00027',1,0,'2009-02-23'),('g00192','team00027','team00028',1,2,'2009-02-24'),('g00193','team00028','team00030',1,0,'2009-02-25'),('g00194','team00029','team00028',1,2,'2009-02-26'),('g00195','team00030','team00027',0,1,'2009-02-27'),('g00196','team00031','team00033',1,0,'2009-02-28'),('g00197','team00032','team00034',4,1,'2009-03-01'),('g00198','team00033','team00034',2,0,'2009-03-02'),('g00199','team00034','team00033',4,0,'2009-03-03'),('g00200','team00035','team00031',1,0,'2009-03-04'),('g00201','team00036','team00037',2,1,'2009-03-05'),('g00202','team00037','team00040',2,0,'2009-03-06'),('g00203','team00038','team00040',1,2,'2009-03-07'),('g00204','team00039','team00037',0,2,'2009-03-08'),('g00205','team00040','team00038',1,1,'2009-03-09'),('g00206','team00041','team00042',1,4,'2009-03-10'),('g00207','team00042','team00043',1,0,'2009-03-11'),('g00208','team00043','team00044',0,1,'2009-03-12'),('g00209','team00044','team00042',0,3,'2009-03-13'),('g00210','team00045','team00042',3,2,'2009-03-14'),('g00211','team00046','team00048',3,1,'2009-03-15'),('g00212','team00047','team00050',0,1,'2009-03-16'),('g00213','team00048','team00049',2,2,'2009-03-17'),('g00214','team00049','team00048',3,1,'2009-03-18'),('g00215','team00050','team00049',5,1,'2009-03-19'),('g00216','team00051','team00053',1,0,'2009-03-20'),('g00217','team00052','team00054',2,0,'2009-03-21'),('g00218','team00053','team00054',1,2,'2009-03-22'),('g00219','team00054','team00052',1,0,'2009-03-23'),('g00220','team00055','team00051',1,3,'2009-03-24'),('g00221','team00001','team00003',4,0,'2009-03-25'),('g00222','team00002','team00004',4,1,'2009-03-26'),('g00223','team00003','team00005',3,0,'2009-03-27'),('g00224','team00004','team00001',2,2,'2009-03-28'),('g00225','team00005','team00003',0,2,'2009-03-29'),('g00226','team00006','team00009',1,1,'2009-03-30'),('g00227','team00007','team00009',0,0,'2009-03-31'),('g00228','team00008','team00010',0,0,'2009-04-01'),('g00229','team00009','team00006',2,1,'2009-04-02'),('g00230','team00010','team00007',2,1,'2009-04-03'),('g00231','team00011','team00012',2,3,'2009-04-04'),('g00232','team00012','team00014',1,0,'2009-04-05'),('g00233','team00013','team00014',0,1,'2009-04-06'),('g00234','team00014','team00012',3,1,'2009-04-07'),('g00235','team00015','team00013',2,0,'2009-04-08'),('g00236','team00016','team00019',3,0,'2009-04-09'),('g00237','team00017','team00019',0,2,'2009-04-10'),('g00238','team00018','team00019',0,2,'2009-04-11'),('g00239','team00019','team00018',0,2,'2009-04-12'),('g00240','team00020','team00018',3,1,'2009-04-13'),('g00241','team00021','team00024',3,1,'2009-04-14'),('g00242','team00022','team00025',1,1,'2009-04-15'),('g00243','team00023','team00025',2,1,'2009-04-16'),('g00244','team00024','team00021',0,2,'2009-04-17'),('g00245','team00025','team00024',0,1,'2009-04-18'),('g00246','team00026','team00027',3,0,'2009-04-19'),('g00247','team00027','team00030',1,2,'2009-04-20'),('g00248','team00028','team00029',1,2,'2009-04-21'),('g00249','team00029','team00027',3,0,'2009-04-22'),('g00250','team00030','team00026',4,1,'2009-04-23'),('g00251','team00031','team00034',1,3,'2009-04-24'),('g00252','team00032','team00033',1,0,'2009-04-25'),('g00253','team00033','team00034',1,1,'2009-04-26'),('g00254','team00034','team00031',2,0,'2009-04-27'),('g00255','team00035','team00033',1,2,'2009-04-28'),('g00256','team00036','team00037',1,3,'2009-04-29'),('g00257','team00037','team00040',3,2,'2009-04-30'),('g00258','team00038','team00039',1,1,'2009-05-01'),('g00259','team00039','team00036',0,0,'2009-05-02'),('g00260','team00040','team00039',4,2,'2009-05-03'),('g00261','team00041','team00043',3,0,'2009-05-04'),('g00262','team00042','team00043',2,0,'2009-05-05'),('g00263','team00043','team00044',0,1,'2009-05-06'),('g00264','team00044','team00042',1,0,'2009-05-07'),('g00265','team00045','team00041',1,2,'2009-05-08'),('g00266','team00046','team00047',2,0,'2009-05-09'),('g00267','team00047','team00048',0,1,'2009-05-10'),('g00268','team00048','team00050',1,0,'2009-05-11'),('g00269','team00049','team00046',0,1,'2009-05-12'),('g00270','team00050','team00046',0,0,'2009-05-13'),('g00271','team00051','team00052',2,0,'2009-05-14'),('g00272','team00052','team00053',2,1,'2009-05-15'),('g00273','team00053','team00054',2,0,'2009-05-16'),('g00274','team00054','team00051',1,0,'2009-05-17'),('g00275','team00055','team00053',1,2,'2009-05-18'),('g00276','team00001','team00002',1,1,'2009-05-19'),('g00277','team00002','team00003',4,1,'2009-05-20'),('g00278','team00003','team00005',1,2,'2009-05-21'),('g00279','team00004','team00001',2,2,'2009-05-22'),('g00280','team00005','team00001',2,1,'2009-05-23'),('g00281','team00006','team00009',2,1,'2009-05-24'),('g00282','team00007','team00010',1,1,'2009-05-25'),('g00283','team00008','team00009',4,1,'2009-05-26'),('g00284','team00009','team00008',1,1,'2009-05-27'),('g00285','team00010','team00006',0,1,'2009-05-28'),('g00286','team00011','team00013',0,0,'2009-05-29'),('g00287','team00012','team00015',2,1,'2009-05-30'),('g00288','team00013','team00015',3,2,'2009-05-31'),('g00289','team00014','team00012',3,1,'2009-06-01'),('g00290','team00015','team00012',2,1,'2009-06-02'),('g00291','team00016','team00017',4,0,'2009-06-03'),('g00292','team00017','team00018',2,0,'2009-06-04'),('g00293','team00018','team00020',2,4,'2009-06-05'),('g00294','team00019','team00017',1,3,'2009-06-06'),('g00295','team00020','team00016',2,0,'2009-06-07'),('g00296','team00021','team00023',0,1,'2009-06-08'),('g00297','team00022','team00023',1,2,'2009-06-09'),('g00298','team00023','team00024',7,1,'2009-06-10'),('g00299','team00024','team00022',0,0,'2009-06-11'),('g00300','team00025','team00023',0,0,'2009-06-12'),('g00301','team00026','team00028',1,1,'2009-06-13'),('g00302','team00027','team00029',1,2,'2009-06-14'),('g00303','team00028','team00030',3,0,'2009-06-15'),('g00304','team00029','team00028',0,3,'2009-06-16'),('g00305','team00030','team00026',2,2,'2009-06-17'),('g00306','team00031','team00033',4,1,'2009-06-18'),('g00307','team00032','team00033',2,2,'2009-06-19'),('g00308','team00033','team00035',1,2,'2009-06-20'),('g00309','team00034','team00032',1,3,'2009-06-21'),('g00310','team00035','team00032',1,1,'2009-06-22'),('g00311','team00036','team00038',0,2,'2009-06-23'),('g00312','team00037','team00040',4,1,'2009-06-24'),('g00313','team00038','team00039',1,1,'2009-06-25'),('g00314','team00039','team00038',4,2,'2009-06-26'),('g00315','team00040','team00037',1,0,'2009-06-27'),('g00316','team00041','team00042',1,2,'2009-06-28'),('g00317','team00042','team00044',3,3,'2009-06-29'),('g00318','team00043','team00044',2,0,'2009-06-30'),('g00319','team00044','team00041',3,2,'2009-07-01'),('g00320','team00045','team00044',3,1,'2009-07-02'),('g00321','team00046','team00049',1,0,'2009-07-03'),('g00322','team00047','team00050',2,0,'2009-07-04'),('g00323','team00048','team00050',1,2,'2009-07-05'),('g00324','team00049','team00048',4,0,'2009-07-06'),('g00325','team00050','team00047',1,1,'2009-07-07'),('g00326','team00051','team00054',2,0,'2009-07-08'),('g00327','team00052','team00054',2,0,'2009-07-09'),('g00328','team00053','team00054',1,1,'2009-07-10'),('g00329','team00054','team00051',1,2,'2009-07-11'),('g00330','team00055','team00053',1,1,'2009-07-12'),('g00331','team00001','team00003',1,1,'2009-07-13'),('g00332','team00002','team00005',0,2,'2009-07-14'),('g00333','team00003','team00005',0,2,'2009-07-15'),('g00334','team00004','team00002',2,3,'2009-07-16'),('g00335','team00005','team00003',1,0,'2009-07-17'),('g00336','team00006','team00008',2,0,'2009-07-18'),('g00337','team00007','team00009',2,0,'2009-07-19'),('g00338','team00008','team00009',2,2,'2009-07-20'),('g00339','team00009','team00007',0,1,'2009-07-21'),('g00340','team00010','team00009',2,0,'2009-07-22'),('g00341','team00011','team00014',2,2,'2009-07-23'),('g00342','team00012','team00013',3,1,'2009-07-24'),('g00343','team00013','team00014',0,2,'2009-07-25'),('g00344','team00014','team00013',0,2,'2009-07-26'),('g00345','team00015','team00012',2,1,'2009-07-27'),('g00346','team00016','team00017',0,0,'2009-07-28'),('g00347','team00017','team00018',2,0,'2009-07-29'),('g00348','team00018','team00019',4,1,'2009-07-30'),('g00349','team00019','team00017',1,2,'2009-07-31'),('g00350','team00020','team00016',3,1,'2009-08-01'),('g00700','team00006','team00009',1,3,'2021-12-04');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leagues` (
  `league_id` varchar(100) NOT NULL,
  `league_name` varchar(100) DEFAULT NULL,
  `league_country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`league_id`),
  UNIQUE KEY `league_name` (`league_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES ('l00001','Jupiler Pro League','Belgium'),('l00002','Premier League','England'),('l00003','Ligue 1','France'),('l00004','Bundesliga','Germany'),('l00005','Serie A','Italy'),('l00006','Eredivisie','Netherlands'),('l00007','Ekstraklasa','Poland'),('l00008','Primeira Liga','Portugal'),('l00009','Scottish Premiership','Scotland'),('l00010','LIGA BBVA','Spain'),('l00011','Swiss Challenge League','Switzerland');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` varchar(100) NOT NULL,
  `player_first_name` varchar(100) DEFAULT NULL,
  `player_last_name` varchar(100) DEFAULT NULL,
  `player_age` int DEFAULT NULL,
  `player_position` varchar(100) DEFAULT NULL,
  `current_team` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `team_fk` (`current_team`),
  CONSTRAINT `team_fk` FOREIGN KEY (`current_team`) REFERENCES `teams` (`team_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('p00001','Aaron','Appindangoye',30,'goalkeeper',NULL),('p00002','Aaron','Cresswell',22,'goalkeeper','team00002'),('p00003','Aaron','Doran',35,'goalkeeper','team00003'),('p00004','Aaron','Galindo',19,'goalkeeper','team00004'),('p00005','Aaron','Hughes',29,'goalkeeper','team00005'),('p00006','Aaron','Hunt',28,'goalkeeper','team00006'),('p00007','Aaron','Kuhl',32,'goalkeeper','team00007'),('p00008','Aaron','Lennon',35,'goalkeeper','team00008'),('p00009','Aaron','Lennox',22,'goalkeeper','team00009'),('p00010','Aaron','Meijers',32,'goalkeeper','team00010'),('p00011','Aaron','Mokoena',24,'goalkeeper','team00011'),('p00012','Aaron','Mooy',27,'goalkeeper','team00012'),('p00013','Aaron','Muirhead',29,'goalkeeper','team00013'),('p00014','Aaron','Niguez',24,'goalkeeper','team00014'),('p00015','Aaron','Ramsey',19,'goalkeeper','team00015'),('p00016','Aaron','Splaine',33,'goalkeeper','team00016'),('p00017','Aaron','Taylor-Sinclair',35,'goalkeeper','team00017'),('p00018','Aaron','Wilbraham',21,'goalkeeper','team00018'),('p00019','Aatif','Chahechouhe',27,'goalkeeper','team00019'),('p00020','Abasse','Ba',27,'goalkeeper','team00020'),('p00021','Abdelaziz','Barrada',27,'goalkeeper','team00021'),('p00022','Abdelfettah','Boukhriss',30,'goalkeeper','team00022'),('p00023','Abdelhamid','El Kaoutari',30,'goalkeeper','team00023'),('p00024','Abdelkader','Ghezzal',35,'goalkeeper','team00024'),('p00025','Abdellah','Zoubir',31,'goalkeeper','team00025'),('p00026','Abdelmajid','Oulmers',19,'goalkeeper','team00026'),('p00027','Abdelmalek','Cherrad',35,'goalkeeper','team00027'),('p00028','Abdelmalek','El Hasnaoui',21,'goalkeeper','team00028'),('p00029','Abdelouahed','Chakhsi',22,'goalkeeper','team00029'),('p00030','Abderrazak','Jadid',30,'goalkeeper','team00030'),('p00031','Abdeslam','Ouaddou',23,'goalkeeper','team00031'),('p00032','Abdessalam','Benjelloun',27,'goalkeeper','team00032'),('p00033','Abdou','Diallo',21,'goalkeeper','team00033'),('p00034','Abdou','Traore',32,'goalkeeper','team00034'),('p00035','Abdoul','Ba',26,'goalkeeper','team00035'),('p00036','Abdoul','Karim ',33,'goalkeeper','team00036'),('p00037','Abdoul','Razzagui Camara',29,'goalkeeper','team00037'),('p00038','Abdoulay','Konko',30,'goalkeeper','team00038'),('p00039','Abdoulaye','Ba',26,'goalkeeper','team00039'),('p00040','Abdoulaye','Bamba',28,'goalkeeper','team00040'),('p00041','Abdoulaye','Diaby',34,'goalkeeper','team00041'),('p00042','Abdoulaye','Diallo Sadio',31,'goalkeeper','team00042'),('p00043','Abdoulaye','Diallo Tetteh',29,'goalkeeper','team00043'),('p00044','Abdoulaye','Doucoure',23,'goalkeeper','team00044'),('p00045','Abdoulaye','Faye',35,'goalkeeper','team00045'),('p00046','Abdoulaye','Keita',33,'goalkeeper','team00046'),('p00047','Abdoulaye','Meite',35,'goalkeeper','team00047'),('p00048','Abdoulaye','Toure',19,'goalkeeper','team00048'),('p00049','Abdoulwahid','Sissoko',34,'goalkeeper','team00049'),('p00050','Abdourahman','Dampha',23,'goalkeeper','team00050'),('p00051','Abdul','Aziz',27,'goalkeeper','team00051'),('p00052','Abdul','Majeed',30,'goalkeeper','team00052'),('p00053','Abdul','Osman',31,'goalkeeper','team00053'),('p00054','Abdul','Rahman',31,'goalkeeper','team00054'),('p00055','Abdul-Yakinu','Iddi',19,'goalkeeper','team00055'),('p00056','Abdulkader','Keita',26,'defender','team00001'),('p00057','Abdulla','Fatadi',26,'defender','team00001'),('p00058','Abdullah','Al Hafith',20,'defender','team00001'),('p00059','Abdullah','Omar',20,'defender','team00001'),('p00060','Abdullahi','Shehu',20,'defender','team00002'),('p00061','Abel','Aguilar',27,'defender','team00002'),('p00062','Abel','Gomez',24,'defender','team00002'),('p00063','Abel','Hernandez',19,'defender','team00002'),('p00064','Abel','Issa',35,'defender','team00003'),('p00065','Abel','Khaled',28,'defender','team00003'),('p00066','Abel','Tamata',29,'defender','team00003'),('p00067','Abel','Damia',34,'defender','team00003'),('p00068','Abella','Perez',31,'defender','team00004'),('p00069','Abiola','Dauda',24,'defender','team00004'),('p00070','Abou','Diaby',26,'defender','team00004'),('p00071','Aboubacar','Tandia',23,'defender','team00004'),('p00072','Aboubakar','Kamara',24,'defender','team00005'),('p00073','Aboubakar','Oumarou',23,'defender','team00005'),('p00074','Abraham','Gonzalez',34,'defender','team00005'),('p00075','Abraham','Guie',26,'defender','team00005'),('p00076','Abraham','Kudemor',20,'defender','team00006'),('p00077','Abraham','Minero',22,'defender','team00006'),('p00078','Abraham','Paz',23,'defender','team00006'),('p00079','Achille','Coser',33,'defender','team00006'),('p00080','Achille','Emana',33,'defender','team00007'),('p00081','Achille','Vaarnold',20,'defender','team00007'),('p00082','Achmed','Ahahaoui',24,'defender','team00007'),('p00083','Achraf','Lazaar',21,'defender','team00007'),('p00084','Aco','Stojkov',24,'defender','team00008'),('p00085','Adailton','Cruz',24,'defender','team00008'),('p00086','Adailton','Gneki',27,'defender','team00008'),('p00087','Adalberto','Penaranda',34,'defender','team00008'),('p00088','Adam','Armstrong',29,'defender','team00009'),('p00089','Adam','Banas',19,'defender','team00009'),('p00090','Adam','Bodzek',28,'defender','team00009'),('p00091','Adam','Bogdan',28,'defender','team00009'),('p00092','Adam','Brown',31,'defender','team00010'),('p00093','Adam','Buksa',32,'defender','team00010'),('p00094','Adam','Campbell',27,'defender','team00010'),('p00095','Adam','Collin',35,'defender','team00010'),('p00096','Adam','Cummins',20,'defender','team00011'),('p00097','Adam','Danch',35,'defender','team00011'),('p00098','Adam','Deja',19,'defender','team00011'),('p00099','Adam','Drury',19,'defender','team00011'),('p00100','Adam','Drury',23,'defender','team00012'),('p00101','Adam','Duda',28,'defender','team00012'),('p00102','Adam','Dzwigala',35,'defender','team00012'),('p00103','Adam','Federici',19,'defender','team00012'),('p00104','Adam','Fraczczak',28,'defender','team00013'),('p00105','Adam','Gyurcso',32,'defender','team00013'),('p00106','Adam','Hammill',28,'defender','team00013'),('p00107','Adam','Henley',23,'defender','team00013'),('p00108','Adam','Hlousek',23,'defender','team00014'),('p00109','Adam','Johnson',32,'defender','team00014'),('p00110','Adam','King',24,'defender','team00014'),('p00111','Adam','Kokoszka',20,'defender','team00014'),('p00112','Adam','Lallana',21,'defender','team00015'),('p00113','Adam','Le Fondre',28,'defender','team00015'),('p00114','Adam','Maher',34,'defender','team00015'),('p00115','Adam','Marciniak',25,'defender','team00015'),('p00116','Adam','Marusic',32,'defender','team00016'),('p00117','Adam','Masina',28,'defender','team00016'),('p00118','Adam','Matthews',32,'defender','team00016'),('p00119','Adam','Matuschyk',22,'defender','team00016'),('p00120','Adam','Mojta',24,'defender','team00017'),('p00121','Adam','Morgan',22,'defender','team00017'),('p00122','Adam','Nemec',24,'defender','team00017'),('p00123','Adam','Ounas',24,'defender','team00017'),('p00124','Adam','Pazio',31,'defender','team00018'),('p00125','Adam','Pinter',25,'defender','team00018'),('p00126','Adam','Rooney',32,'defender','team00018'),('p00127','Adam','Ryczkowski',33,'defender','team00018'),('p00128','Adam','Sarota',25,'defender','team00019'),('p00129','Adam','Smith',27,'defender','team00019'),('p00130','Adam','Szalai',22,'defender','team00019'),('p00131','Adam','Taggart',27,'defender','team00019'),('p00132','Adam','Vass',29,'defender','team00020'),('p00133','Adam','Waszkiewicz',29,'defender','team00020'),('p00134','Adama','Baba',35,'defender','team00020'),('p00135','Adama','Coulibaly',22,'defender','team00020'),('p00136','Adama','Francois',34,'defender','team00021'),('p00137','Adama','Soumaoro',27,'defender','team00021'),('p00138','Adama','Traore',25,'defender','team00021'),('p00139','Adama','Traore',32,'defender','team00021'),('p00140','Adamo','Coulibaly',20,'defender','team00022'),('p00141','Adel','Taarabt',19,'defender','team00022'),('p00142','Adem','Ljajic',33,'defender','team00022'),('p00143','Aderlan','Santos',29,'defender','team00022'),('p00144','Aderlan','Calello',28,'defender','team00023'),('p00145','Adil','Auassar',22,'defender','team00023'),('p00146','Adil','Chihi',32,'defender','team00023'),('p00147','Adil','Hermach',28,'defender','team00023'),('p00148','Adil','Rami',21,'defender','team00024'),('p00149','Adil','Ramzi',34,'defender','team00024'),('p00150','Adilson','Waris',27,'defender','team00024'),('p00151','Adis','Jahovic',29,'defender','team00024'),('p00152','Adlene','Guedioura',33,'defender','team00025'),('p00153','Admir','Aganovic',30,'defender','team00025'),('p00154','Admir','Mehmedi',28,'defender','team00025'),('p00155','Adnan','Alisic',20,'defender','team00025'),('p00156','Adnan','Custovic',31,'defender','team00026'),('p00157','Adnan','Januzaj',25,'defender','team00026'),('p00158','Adnan','Mravac',31,'defender','team00026'),('p00159','Adnane','Tighadouini',27,'defender','team00026'),('p00160','Adrian','Basta',27,'defender','team00027'),('p00161','Adrian','Blad',26,'defender','team00027'),('p00162','Adrian','Chomiuk',26,'defender','team00027'),('p00163','Adrian','Colunga',29,'defender','team00027'),('p00164','Adrian','Cristea',20,'defender','team00028'),('p00165','Adrian','Daniel',35,'defender','team00028'),('p00166','Adrian','Embarba',28,'defender','team00028'),('p00167','Adrian','Gonzalez',19,'defender','team00028'),('p00168','Adrian','Gunino',19,'defender','team00029'),('p00169','Adrian','Klepczynski',28,'defender','team00029'),('p00170','Adrian','Lopez',32,'defender','team00029'),('p00171','Adrian','Mariappa',32,'defender','team00029'),('p00172','Adrian','Marin',21,'defender','team00030'),('p00173','Adrian','Mrowiec',24,'defender','team00030'),('p00174','Adrian','Mutu',34,'defender','team00030'),('p00175','Adrian','Nikci',20,'defender','team00030'),('p00176','Adrian','Paluchowski',23,'defender','team00031'),('p00177','Adrian','Rakowski',27,'defender','team00031'),('p00178','Adrian','Ramos',34,'defender','team00031'),('p00179','Adrian','Ricardo',32,'defender','team00031'),('p00180','Adrian','Ricchiuti',35,'defender','team00032'),('p00181','Adrian','Sardinero',30,'defender','team00032'),('p00182','Adrian','Stoian',28,'defender','team00032'),('p00183','Adrian','Winter',24,'defender','team00032'),('p00184','Adrian','Centurion',31,'defender','team00033'),('p00185','Adriano','De Pierro',34,'defender','team00033'),('p00186','Adriano','Facchini',31,'defender','team00033'),('p00187','Adriano','Ferreira',31,'defender','team00033'),('p00188','Adriano','Jose',27,'defender','team00034'),('p00189','Adriano','Pereira',20,'defender','team00034'),('p00190','Adriano','Russo',35,'defender','team00034'),('p00191','Adriano','Pinto',22,'defender','team00034'),('p00192','Adriano','Silva',22,'defender','team00035'),('p00193','Adriano','Lara',19,'defender','team00035'),('p00194','Adriano','Hsu',30,'defender','team00035'),('p00195','Adrien','Goni',20,'defender','team00035'),('p00196','Adrien','Hunou',32,'defender','team00036'),('p00197','Adrien','Rabiot',19,'defender','team00036'),('p00198','Adrien','Rawyler',33,'defender','team00036'),('p00199','Adrien','Regattin',34,'defender','team00036'),('p00200','Adrien','Silva',26,'defender','team00037'),('p00201','Adrien','Thomasson',23,'defender','team00037'),('p00202','Adrien','Trebel',23,'defender','team00037'),('p00203','Adryan','Corpa',24,'defender','team00037'),('p00204','Afonso','Alves',23,'defender','team00038'),('p00205','Afonso','Koka',31,'defender','team00038'),('p00206','Afriyie','Acquah',20,'defender','team00038'),('p00207','Ager','Aketxe',25,'defender','team00038'),('p00208','Agim','Ibraimi',27,'defender','team00039'),('p00209','Agon','Mehmeti',30,'defender','team00039'),('p00210','Agustin','Vuletich',23,'defender','team00039'),('p00211','Ahmed','Ammi',19,'defender','team00039'),('p00212','Ahmed','Apimah',28,'defender','team00040'),('p00213','Ahmed','El Messaoudi',23,'defender','team00040'),('p00214','Ahmed','El Mohamady',31,'defender','team00040'),('p00215','Ahmed','Hamoudi',31,'defender','team00040'),('p00216','Ahmed','Hassan',32,'defender','team00041'),('p00217','Ahmed','Hegazy',21,'defender','team00041'),('p00218','Ahmed','Kantari',25,'defender','team00041'),('p00219','Ahmed','Kashi',24,'defender','team00041'),('p00220','Ahmed','Musa',28,'defender','team00042'),('p00221','Ahmed','Saied',35,'defender','team00042'),('p00222','Ahmed','Samir',29,'defender','team00042'),('p00223','Ahmed','Soukouna',25,'defender','team00042'),('p00224','Ahmet','Ozcan',31,'defender','team00043'),('p00225','Aidan','Connolly',28,'defender','team00043'),('p00226','Aidan','Nesbitt',25,'defender','team00043'),('p00227','Aiden','Chippendale',19,'defender','team00043'),('p00228','Aiden','McGeady',33,'defender','team00044'),('p00229','Aimo','Stefano',24,'defender','team00044'),('p00230','Airam','Cabrera',32,'defender','team00044'),('p00231','Airton','Barusso',32,'defender','team00044'),('p00232','Aislan','Diana',31,'defender','team00045'),('p00233','Aissa','Laidouni',29,'defender','team00045'),('p00234','Aissa','Mandi',23,'defender','team00045'),('p00235','Aitor','Nunez',33,'defender','team00045'),('p00236','Aitor','Ocio',23,'defender','team00046'),('p00237','Aiyegbeni','Yakubu',31,'defender','team00046'),('p00238','Akaki','Gogia',25,'defender','team00046'),('p00239','Akihiro','Ienaga',29,'defender','team00046'),('p00240','Akoete','Eninful',23,'defender','team00047'),('p00241','Akos','Buzsaky',25,'defender','team00047'),('p00242','Akpo','Sodje',33,'defender','team00047'),('p00243','Akwetey','Mensah',31,'defender','team00047'),('p00244','Alaeddine','Yahia',34,'defender','team00048'),('p00245','Alain','Cantareil',32,'defender','team00048'),('p00246','Alain','Nef',26,'defender','team00048'),('p00247','Alain','Pierre',30,'defender','team00048'),('p00248','Alain','Rochat',27,'defender','team00049'),('p00249','Alain','Schultz',30,'defender','team00049'),('p00250','Alain','Traore',23,'defender','team00049'),('p00251','Alain','Wiss',32,'defender','team00049'),('p00252','Alan','Combe',31,'defender','team00050'),('p00253','Alan','Gow',34,'defender','team00050'),('p00254','Alan','Haydock',22,'defender','team00050'),('p00255','Alan','Henrique',28,'defender','team00050'),('p00256','Alan','Hutton',34,'defender','team00051'),('p00257','Alan','Kardec',22,'defender','team00051'),('p00258','Alan','Mannus',20,'defender','team00051'),('p00259','Alan','Martin',25,'defender','team00051'),('p00260','Alan','Maybury',20,'defender','team00052'),('p00261','Alan','O\'Brien',34,'defender','team00052'),('p00262','Alan','Schons',35,'defender','team00052'),('p00263','Alan','Smith',20,'defender','team00052'),('p00264','Alan','Tate',24,'defender','team00053'),('p00265','Alan','Uryga',31,'defender','team00053'),('p00266','Alan','Mendy',23,'defender','team00053'),('p00267','Alassane','Diallo',29,'defender','team00053'),('p00268','Alassane','Plea',31,'defender','team00054'),('p00269','Alassane','Tambe',35,'defender','team00054'),('p00270','Alassane','Toure',32,'defender','team00054'),('p00271','Alban','Joinel',26,'defender','team00054'),('p00272','Alban','Lafont',31,'defender','team00055'),('p00273','Alban','Meha',23,'defender','team00055'),('p00274','Alban','Pnishi',23,'defender','team00055'),('p00275','Albano','Benjamin',24,'defender','team00055'),('p00276','Albert','Baning',29,'midfielder','team00001'),('p00277','Albert','Bunjaku',30,'midfielder','team00001'),('p00278','Albert','Crusat',34,'midfielder','team00001'),('p00279','Albert','Meyong',27,'midfielder','team00001'),('p00280','Albert','Rafetraniaina',26,'midfielder','team00002'),('p00281','Albert','Riera',19,'midfielder','team00002'),('p00282','Albert','Rusnak',24,'midfielder','team00002'),('p00283','Albert','Streit',21,'midfielder','team00002'),('p00284','Alberto','Aquilani',32,'midfielder','team00003'),('p00285','Alberto','Botia',28,'midfielder','team00003'),('p00286','Alberto','Brignoli',22,'midfielder','team00003'),('p00287','Alberto','Bueno',31,'midfielder','team00003'),('p00288','Alberto','Cifuentes',19,'midfielder','team00004'),('p00289','Alberto','De',27,'midfielder','team00004'),('p00290','Alberto','Fontana',29,'midfielder','team00004'),('p00291','Alberto','Frison',23,'midfielder','team00004'),('p00292','Alberto','Garcia',28,'midfielder','team00005'),('p00293','Alberto','Gilardino',22,'midfielder','team00005'),('p00294','Alberto','Giuliatto',35,'midfielder','team00005'),('p00295','Alberto','Grassi',33,'midfielder','team00005'),('p00296','Alberto','Guitian',29,'midfielder','team00006'),('p00297','Alberto','Lopo',30,'midfielder','team00006'),('p00298','Alberto','Luque',30,'midfielder','team00006'),('p00299','Alberto','Maria',27,'midfielder','team00006'),('p00300','Alberto','Moreno',29,'midfielder','team00007'),('p00301','Alberto','Paloschi',24,'midfielder','team00007'),('p00302','Alberto','Pelagotti',33,'midfielder','team00007'),('p00303','Alberto','Perea',32,'midfielder','team00007'),('p00304','Alberto','Pomini',29,'midfielder','team00008'),('p00305','Alberto','Regazzoni',35,'midfielder','team00008'),('p00306','Alberto','Rey',34,'midfielder','team00008'),('p00307','Alberto','Rivera',20,'midfielder','team00008'),('p00308','Alberto','Rodriguez',25,'midfielder','team00009'),('p00309','Alberto','Zapater',21,'midfielder','team00009'),('p00310','Albian','Ajeti',25,'midfielder','team00009'),('p00311','Albin','Ebondo',24,'midfielder','team00009'),('p00312','Albin','Ekdal',26,'midfielder','team00010'),('p00313','Albion','Avdijaj',26,'midfielder','team00010'),('p00314','Aldair','Burrosia',19,'midfielder','team00010'),('p00315','Aldin','Turkes',30,'midfielder','team00010'),('p00316','Aldo','Angoula',24,'midfielder','team00011'),('p00317','Aldo','Kalulu',23,'midfielder','team00011'),('p00318','Aldo','Pedro',28,'midfielder','team00011'),('p00319','Aleandro','Rosi',21,'midfielder','team00011'),('p00320','Alec','Luyckx',19,'midfielder','team00012'),('p00321','Alef','Duscher',32,'midfielder','team00012'),('p00322','Aleix','Vidal',30,'midfielder','team00012'),('p00323','Alejandro','Alfaro',26,'midfielder','team00012'),('p00324','Alejandro','Alonso',34,'midfielder','team00013'),('p00325','Alejandro','Arribas',35,'midfielder','team00013'),('p00326','Alejandro','Bedoya',19,'midfielder','team00013'),('p00327','Alejandro','Bergantinos',19,'midfielder','team00013'),('p00328','Alejandro','Daro',24,'midfielder','team00014'),('p00329','Alejandro','Dominguez',33,'midfielder','team00014'),('p00330','Alejandro','Faurlin',29,'midfielder','team00014'),('p00331','Alejandro','Galvez',23,'midfielder','team00014'),('p00332','Alejandro','Gonzalez',24,'midfielder','team00015'),('p00333','Alejandro','Grimaldo',21,'midfielder','team00015'),('p00334','Alejandro','Martinuccio',30,'midfielder','team00015'),('p00335','Alejandro','Pozuelo',35,'midfielder','team00015'),('p00336','Aleksandar','Bjelica',29,'midfielder','team00016'),('p00337','Aleksandar','Cavric',27,'midfielder','team00016'),('p00338','Aleksandar','Damcevski',21,'midfielder','team00016'),('p00339','Aleksandar','Ignjovski',29,'midfielder','team00016'),('p00340','Aleksandar','Kolarov',28,'midfielder','team00017'),('p00341','Aleksandar','Kovacevic',21,'midfielder','team00017'),('p00342','Aleksandar','Lukovic',32,'midfielder','team00017'),('p00343','Aleksandar','Miljkovic',29,'midfielder','team00017'),('p00344','Aleksandar','Mitreski',34,'midfielder','team00018'),('p00345','Aleksandar','Mitrovic',35,'midfielder','team00018'),('p00346','Aleksandar','Pantic',31,'midfielder','team00018'),('p00347','Aleksandar','Pesic',33,'midfielder','team00018'),('p00348','Aleksandar','Prijovic',31,'midfielder','team00019'),('p00349','Aleksandar','Rankovic',31,'midfielder','team00019'),('p00350','Aleksandar','Stevanovic',22,'midfielder','team00019'),('p00351','Aleksandar','Todorovski',19,'midfielder','team00019'),('p00352','Aleksandar','Tonev',19,'midfielder','team00020'),('p00353','Aleksandar','Trajkovski',27,'midfielder','team00020'),('p00354','Aleksandar','Vasoski',20,'midfielder','team00020'),('p00355','Aleksander','Jagiello',22,'midfielder','team00020'),('p00356','Aleksander','Kwiek',21,'midfielder','team00021'),('p00357','Aleksander','Radosavljevic',19,'midfielder','team00021'),('p00358','Aleksander','Seliga',23,'midfielder','team00021'),('p00359','Aleksandr','Hleb',22,'midfielder','team00021'),('p00360','Aleksandrs','Fertovs',19,'midfielder','team00022'),('p00361','Aleksei','Kangaskolkka',33,'midfielder','team00022'),('p00362','Alen','Halilovic',28,'midfielder','team00022'),('p00363','Alen','Melunovic',25,'midfielder','team00022'),('p00364','Alen','Stevanovic',25,'midfielder','team00023'),('p00365','Alesandro','Cordaro',25,'midfielder','team00023'),('p00366','Alessandro','Agostini',28,'midfielder','team00023'),('p00367','Alessandro','Bernardini',35,'midfielder','team00023'),('p00368','Alessandro','Budel',19,'midfielder','team00024'),('p00369','Alessandro','Carrozza',24,'midfielder','team00024'),('p00370','Alessandro','Cerigioni',29,'midfielder','team00024'),('p00371','Alessandro','Ciarrocchi',28,'midfielder','team00024'),('p00372','Alessandro','Crescenzi',30,'midfielder','team00025'),('p00373','Alessandro','Damen',20,'midfielder','team00025'),('p00374','Alessandro','Del Piero',25,'midfielder','team00025'),('p00375','Alessandro','Diamanti',34,'midfielder','team00025'),('p00376','Alessandro','Florenzi',21,'midfielder','team00026'),('p00377','Alessandro','Frara',23,'midfielder','team00026'),('p00378','Alessandro','Gamberini',27,'midfielder','team00026'),('p00379','Alessandro','Gazzi',32,'midfielder','team00026'),('p00380','Alessandro','Grandoni',32,'midfielder','team00027'),('p00381','Alessandro','Iacobucci',33,'midfielder','team00027'),('p00382','Alessandro','Iandoli',32,'midfielder','team00027'),('p00383','Alessandro','Lambrughi',19,'midfielder','team00027'),('p00384','Alessandro','Longhi',28,'midfielder','team00028'),('p00385','Alessandro','Lucarelli',19,'midfielder','team00028'),('p00386','Alessandro','Mangiarrati',26,'midfielder','team00028'),('p00387','Alessandro','Matri',22,'midfielder','team00028'),('p00388','Alessandro','Nesta',19,'midfielder','team00029'),('p00389','Alessandro','Parisi',32,'midfielder','team00029'),('p00390','Alessandro','Piu',24,'midfielder','team00029'),('p00391','Alessandro','Potenza',31,'midfielder','team00029'),('p00392','Alessandro','Riedle',24,'midfielder','team00030'),('p00393','Alessandro','Rosina',30,'midfielder','team00030'),('p00394','Alessandro','Schoepf',32,'midfielder','team00030'),('p00395','Alessandro','Sgrigna',35,'midfielder','team00030'),('p00396','Alessio','Cerci',23,'midfielder','team00031'),('p00397','Alessio','Cragno',21,'midfielder','team00031'),('p00398','Alessio','Da Cruz',23,'midfielder','team00031'),('p00399','Alessio','Manzoni',32,'midfielder','team00031'),('p00400','Alessio','Romagnoli',34,'midfielder','team00032'),('p00401','Alessio','Scarpi',25,'midfielder','team00032'),('p00402','Alessio','Sestu',25,'midfielder','team00032'),('p00403','Alex','Baptiste',19,'midfielder','team00032'),('p00404','Alex','Bruce',19,'midfielder','team00033'),('p00405','Alex','Bruno',22,'midfielder','team00033'),('p00406','Alex','Bruno',34,'midfielder','team00033'),('p00407','Alex','Calderoni',19,'midfielder','team00033'),('p00408','Alex','Cooper',26,'midfielder','team00034'),('p00409','Alex','Fernandez',32,'midfielder','team00034'),('p00410','Alex','Ferrari',30,'midfielder','team00034'),('p00411','Alex','Goncalves',24,'midfielder','team00034'),('p00412','Alex','Harris',20,'midfielder','team00035'),('p00413','Alex','Henshall',27,'midfielder','team00035'),('p00414','Alex','Iwobi',32,'midfielder','team00035'),('p00415','Alex','Kacaniklic',21,'midfielder','team00035'),('p00416','Alex','Kakuba',34,'midfielder','team00036'),('p00417','Alex','Keddie',28,'midfielder','team00036'),('p00418','Alex','Lopez',19,'midfielder','team00036'),('p00419','Alex','MacDonald',27,'midfielder','team00036'),('p00420','Alex','Manninger',19,'midfielder','team00037'),('p00421','Alex','Martinez',22,'midfielder','team00037'),('p00422','Alex','McCarthy',32,'midfielder','team00037'),('p00423','Alex','Menendez',19,'midfielder','team00037'),('p00424','Alex','Neil',22,'midfielder','team00038'),('p00425','Alex','Oxlade-Chamberlain',25,'midfielder','team00038'),('p00426','Alex','Pearce',22,'midfielder','team00038'),('p00427','Alex','Perez',30,'midfielder','team00038'),('p00428','Alex','Pinardi',33,'midfielder','team00039'),('p00429','Alex','Portillo',29,'midfielder','team00039'),('p00430','Alex','Sandro',30,'midfielder','team00039'),('p00431','Alex','Schalk',24,'midfielder','team00039'),('p00432','Alex','Silva',19,'midfielder','team00040'),('p00433','Alex','Soares',23,'midfielder','team00040'),('p00434','Alex','Song',35,'midfielder','team00040'),('p00435','Alex','Telles',22,'midfielder','team00040'),('p00436','Alex','Valentini',30,'midfielder','team00041'),('p00437','Alex','Von Schwedler',30,'midfielder','team00041'),('p00438','Alex','Gomez',33,'midfielder','team00041'),('p00439','Alex','Garcia',19,'midfielder','team00041'),('p00440','Alex','Alonso',24,'midfielder','team00042'),('p00441','Alexander','Bannink',27,'midfielder','team00042'),('p00442','Alexander','Baumjohann',23,'midfielder','team00042'),('p00443','Alexander','Buettner',22,'midfielder','team00042'),('p00444','Alexander','Bugera',34,'midfielder','team00043'),('p00445','Alexander','Corryn',26,'midfielder','team00043'),('p00446','Alexander','Cristovao',29,'midfielder','team00043'),('p00447','Alexander','Djiku',25,'midfielder','team00043'),('p00448','Alexander','Dragovic',33,'midfielder','team00044'),('p00449','Alexander','Esswein',22,'midfielder','team00044'),('p00450','Alexander','Farnerud',27,'midfielder','team00044'),('p00451','Alexander','Fransson',27,'midfielder','team00044'),('p00452','Alexander','Frei',30,'midfielder','team00045'),('p00453','Alexander','Gerndt',22,'midfielder','team00045'),('p00454','Alexander','Gonzalez',25,'midfielder','team00045'),('p00455','Alexander','Hack',19,'midfielder','team00045'),('p00456','Alexander','Iashvili',32,'midfielder','team00046'),('p00457','Alexander','Laas',34,'midfielder','team00046'),('p00458','Alexander','Madlung',30,'midfielder','team00046'),('p00459','Alexander','Mathisen',30,'midfielder','team00046'),('p00460','Alexander','Meier',33,'midfielder','team00047'),('p00461','Alexander','Merkel',34,'midfielder','team00047'),('p00462','Alexander','Milosevic',33,'midfielder','team00047'),('p00463','Alexander','Ring',19,'midfielder','team00047'),('p00464','Alexander','Scholz',23,'midfielder','team00048'),('p00465','Alexander','Schwolow',35,'midfielder','team00048'),('p00466','Alexander','Soerloth',33,'midfielder','team00048'),('p00467','Alexander','Stephan',27,'midfielder','team00048'),('p00468','Alexander','Tettey',33,'midfielder','team00049'),('p00469','Alexandr','Kerzhakov',19,'midfielder','team00049'),('p00470','Alexandre','Alphonse',30,'midfielder','team00049'),('p00471','Alexandre','Azevedo',21,'midfielder','team00049'),('p00472','Alexandre','Barthe',27,'midfielder','team00050'),('p00473','Alexandre','Bonnet',24,'midfielder','team00050'),('p00474','Alexandre','Coeff',27,'midfielder','team00050'),('p00475','Alexandre','Cuvillier',27,'midfielder','team00050'),('p00476','Alexandre','D\'Acol',23,'midfielder','team00051'),('p00477','Alexandre','Di Gregorio',33,'midfielder','team00051'),('p00478','Alexandre','Geijo',27,'midfielder','team00051'),('p00479','Alexandre','Hauw',29,'midfielder','team00051'),('p00480','Alexandre','Lacazette',33,'midfielder','team00052'),('p00481','Alexandre','Letellier',28,'midfielder','team00052'),('p00482','Alexandre','Licata',22,'midfielder','team00052'),('p00483','Alexandre','Mendy',32,'midfielder','team00052'),('p00484','Alexandre','Pasche',20,'midfielder','team00053'),('p00485','Alexandre','Pato',33,'midfielder','team00053'),('p00486','Alexandre','Quennoz',35,'midfielder','team00053'),('p00487','Alexandre','Raineau',35,'midfielder','team00053'),('p00488','Alexandre','Silva',26,'midfielder','team00054'),('p00489','Alexandros','Tziolis',27,'midfielder','team00054'),('p00490','Alexandros','Tzorvas',35,'midfielder','team00054'),('p00491','Alexandru','Maxim',28,'midfielder','team00054'),('p00492','Alexei','Jr Eremenko',24,'midfielder','team00055'),('p00493','Alexi','Peuget',28,'midfielder','team00055'),('p00494','Alexis','Alegue',26,'midfielder','team00055'),('p00495','Alexis','Blin',23,'midfielder','team00055'),('p00496','Alexis','De Sart',21,'striker','team00001'),('p00497','Alexis','Norambuena',21,'striker','team00001'),('p00498','Alexis','Rolin',21,'striker','team00002'),('p00499','Alexis','Sanchez',29,'striker','team00002'),('p00500','Alexis','Thebaux',26,'striker','team00003'),('p00501','Alexis','Bella',28,'striker','team00003'),('p00502','Alexy','Bosetti',19,'striker','team00004'),('p00503','Alfonso','Artabe',22,'striker','team00004'),('p00504','Alfonso','De Lucia',33,'striker','team00005'),('p00505','Alfonso','Pedraza',29,'striker','team00005'),('p00506','Alfonso','Taira',33,'striker','team00006'),('p00507','Alfred','Duncan',24,'striker','team00006'),('p00508','Alfred','Finnbogason',35,'striker','team00007'),('p00509','Alfred','N\'Diaye',35,'striker','team00007'),('p00510','Alfredo','Morales',20,'striker','team00008'),('p00511','Alfredo','Ortuno',21,'striker','team00008'),('p00512','Alharbi','El Jadeyaoui',33,'striker','team00009'),('p00513','Alhassan','Wakaso',22,'striker','team00009'),('p00514','Alhassane','Bangoura',26,'striker','team00010'),('p00515','Alhassane','Keita',32,'striker','team00010'),('p00516','Alhassane','Keita',33,'striker','team00011'),('p00517','Ali','Adnan',19,'striker','team00011'),('p00518','Ali','Ahamada',19,'striker','team00012'),('p00519','Ali','Al-Habsi',30,'striker','team00012'),('p00520','Ali','Boussaboun',23,'striker','team00013'),('p00521','Ali','Ghazal',24,'striker','team00013'),('p00522','Ali','M\'Madi',23,'striker','team00014'),('p00523','Ali','Messaoud',25,'striker','team00014'),('p00524','Ali','Yasar',31,'striker','team00015'),('p00525','Alim','Oezturk',23,'striker','team00015'),('p00526','Aliou','Dia',28,'striker','team00016'),('p00527','Alioun','Fall',19,'striker','team00016'),('p00528','Alireza','Haghighi',23,'striker','team00017'),('p00529','Alireza','Jahanbakhsh',28,'striker','team00017'),('p00530','Alistair','Crawford',27,'striker','team00018'),('p00531','Aljaz','Struna',22,'striker','team00018'),('p00532','Alje','Schut',30,'striker','team00019'),('p00533','Allan','McGregor',19,'striker','team00019'),('p00534','Allan','Nyom',31,'striker','team00020'),('p00535','Allan','Russell',29,'striker','team00020'),('p00536','Allan','Saint-Maximin',25,'striker','team00021'),('p00537','Allan','Elandi',21,'striker','team00021'),('p00538','Allan','Oliveira',22,'striker','team00022'),('p00539','Almamy','Toure',20,'striker','team00022'),('p00540','Almeida','Anderson',35,'striker','team00023'),('p00541','Almeida','Borges',20,'striker','team00023'),('p00542','Almen','Abdi',19,'striker','team00024'),('p00543','Almog','Cohen',27,'striker','team00024'),('p00544','Alois','Confais',30,'striker','team00025'),('p00545','Alou','Diarra',19,'striker','team00025'),('p00546','Aloys','Nong',32,'striker','team00026'),('p00547','Alpaslan','Ozturk',24,'striker','team00026'),('p00548','Alphonse','Areola',22,'striker','team00027'),('p00549','Alphousseyni','Keita',24,'striker','team00027'),('p00550','Altin','Lala',30,'striker','team00028'),('p00551','Alvarinho','Leandro',24,'striker','team00028'),('p00552','Alvaro','Ampuero',23,'striker','team00029'),('p00553','Alvaro','Anton',29,'striker','team00029'),('p00554','Alvaro','Arbeloa',23,'striker','team00030'),('p00555','Alvaro','Arroyo',31,'striker','team00030'),('p00556','Alvaro','Cejudo',23,'striker','team00031'),('p00557','Alvaro','Dominguez',34,'striker','team00031'),('p00558','Alvaro','Dominguez',35,'striker','team00032'),('p00559','Alvaro','Fernandez',23,'striker','team00032'),('p00560','Alvaro','Garcia',34,'striker','team00033'),('p00561','Alvaro','Gimenez',20,'striker','team00033'),('p00562','Alvaro','Gonzalez',33,'striker','team00034'),('p00563','Alvaro','Soberon',32,'striker','team00034'),('p00564','Alvaro','Medran',26,'striker','team00035'),('p00565','Alvaro','Mejia',28,'striker','team00035'),('p00566','Alvaro','Morata',22,'striker','team00036'),('p00567','Alvaro','Negredo',26,'striker','team00036'),('p00568','Alvaro','Pereira',28,'striker','team00037'),('p00569','Alvaro','Rubio',33,'striker','team00037'),('p00570','Alvaro','Saborio',29,'striker','team00038'),('p00571','Alvaro','Santos',29,'striker','team00038'),('p00572','Alvaro','Vadillo',19,'striker','team00039'),('p00573','Alvaro','Vazquez',22,'striker','team00039'),('p00574','Alves','Justino',23,'striker','team00040'),('p00575','Aly','Cissokho',28,'striker','team00040'),('p00576','Aly','Ndom',32,'striker','team00041'),('p00577','Amad','Al Hosni',34,'striker','team00041'),('p00578','Amadou','Alassane',23,'striker','team00042'),('p00579','Amadou','Diawara',35,'striker','team00042'),('p00580','Amadou','Sidibe',30,'striker','team00043'),('p00581','Amadou','Soukouna',20,'striker','team00043'),('p00582','Amara','Baby',29,'striker','team00044'),('p00583','Amauri','Elandi',25,'striker','team00044'),('p00584','Amaury','Bischoff',23,'striker','team00045'),('p00585','Amdy','Faye',25,'striker','team00045'),('p00586','Amidio','Balde',22,'striker','team00046'),('p00587','Amidu','Salifu',29,'striker','team00046'),('p00588','Amilton','Ruz',26,'striker','team00047'),('p00589','Amin','Affane',24,'striker','team00047'),('p00590','Amin','Younes',20,'striker','team00048'),('p00591','Amine','Linganzi',24,'striker','team00048'),('p00592','Amine','Mohamed',23,'striker','team00049'),('p00593','Amir','Abrashi',35,'striker','team00049'),('p00594','Amir','Spahic',26,'striker','team00050'),('p00595','Ammar','Jemal',35,'striker','team00050'),('p00596','Amoreirinha','Chermiti',20,'striker','team00051'),('p00597','Amos','Youga',33,'striker','team00051'),('p00598','Amr','Zaki',26,'striker','team00052'),('p00599','Anaitz','Arbilla',34,'striker','team00052'),('p00600','Anas','Tahiri',35,'striker','team00053'),('p00601','Anass','Achahbar',20,'striker','team00053'),('p00602','Anastasios','Donis',22,'striker','team00054'),('p00603','Anatole','Ngamukol',19,'striker','team00054'),('p00604','Anatoli','Tymoschuk',29,'striker','team00055'),('p00605','Anotonia','Bermudas',30,'striker','team00055'),('p00606','Angel','Lopez',33,'midfielder',NULL),('p00607','Angel','Manuel Vivar Dorado',28,'defender',NULL),('p00608','Angel','Montoro  ',30,'goalkeeper',NULL),('p00609','Angel','Rangel  ',30,'striker',NULL),('p00610','Angel','Rodriguez  ',31,'midfielder',NULL),('p00611','Angel','Trujillo  ',30,'defender',NULL),('p00612','Angelo','da Costa ',33,'goalkeeper',NULL),('p00613','Angelo','Martha  ',26,'striker',NULL),('p00614','Angelo','Obinze Ogbonna ',26,'midfielder',NULL),('p00615','Angelo','Palombo  ',20,'defender',NULL),('p00616','Angelo','Raso  ',24,'goalkeeper',NULL),('p00617','Angelo','Marcos',31,'striker',NULL),('p00618','Angelos','Basinas  ',23,'midfielder',NULL),('p00619','Angelos','Charisteas  ',19,'defender',NULL),('p00620','Anibal','Capela  ',34,'goalkeeper',NULL),('p00621','Anice','Badri  ',26,'striker',NULL),('p00622','Anilton','Basmi',34,'midfielder',NULL),('p00623','Anis','Ben-Hatira  ',30,'defender',NULL),('p00624','Anouar','Kali  ',30,'goalkeeper',NULL),('p00625','Anour','Hadouir  ',32,'striker',NULL),('p00626','Anselmo','Pulisic',24,'midfielder',NULL),('p00627','Anselmo','Angelos',25,'defender',NULL),('p00628','Anselmo','Castro',22,'goalkeeper',NULL),('p00629','Anssi','Jaakkola  ',27,'striker',NULL),('p00630','Ante','Puljic  ',29,'midfielder',NULL),('p00631','Ante','Rebic  ',32,'defender',NULL),('p00632','Ante','Vukusic  ',24,'goalkeeper',NULL),('p00633','Anther','Yahia  ',24,'striker',NULL),('p00634','Anthony','Andreu  ',24,'midfielder',NULL),('p00635','Anthony','Annan  ',22,'defender',NULL),('p00636','Anthony','Bentem  ',35,'goalkeeper',NULL),('p00637','Anthony','Biekman  ',23,'striker',NULL),('p00638','Anthony','Deroin  ',23,'midfielder',NULL),('p00639','Anthony','Favre  ',34,'defender',NULL),('p00640','Anthony','Forde  ',20,'goalkeeper',NULL),('p00641','Anthony','Gardner  ',26,'striker',NULL),('p00642','Anthony','Knockaert  ',25,'midfielder',NULL),('p00643','Anthony','Le Tallec ',35,'defender',NULL),('p00644','Anthony','Limbombe  ',31,'goalkeeper',NULL),('p00645','Anthony','Lippini  ',26,'striker',NULL),('p00646','Anthony','Lopes  ',31,'midfielder',NULL),('p00647','Anthony','Loustallot  ',20,'defender',NULL),('p00648','Anthony','Lurling  ',21,'goalkeeper',NULL),('p00649','Anthony','Martial  ',19,'striker',NULL),('p00650','Anthony','McMahon  ',35,'midfielder',NULL),('p00651','Anthony','Mfa Meuzi ',28,'defender',NULL),('p00652','Anthony','Modeste  ',26,'goalkeeper',NULL),('p00653','Anthony','Moris  ',26,'striker',NULL),('p00654','Anthony','Mounier  ',29,'midfielder',NULL),('p00655','Anthony','Obodai  ',20,'defender',NULL),('p00656','Anthony','Pilkington  ',34,'goalkeeper',NULL),('p00657','Anthony','Portier  ',31,'striker',NULL),('p00658','Anthony','Reveillere  ',21,'midfielder',NULL),('p00659','Anthony','Ribelin  ',22,'defender',NULL),('p00660','Anthony','Sauthier  ',28,'goalkeeper',NULL),('p00661','Anthony','Seric  ',31,'striker',NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` varchar(100) NOT NULL,
  `team_name` varchar(100) DEFAULT NULL,
  `team_coach` varchar(100) DEFAULT NULL,
  `team_league` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_name` (`team_name`),
  KEY `coach_fk` (`team_coach`),
  KEY `c_league_fk` (`team_league`),
  CONSTRAINT `c_league_fk` FOREIGN KEY (`team_league`) REFERENCES `leagues` (`league_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `coach_fk` FOREIGN KEY (`team_coach`) REFERENCES `coaches` (`coach_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('team00001','Club Brugge KV',NULL,'l00001'),('team00002','R.S.C. Aderlecht','coach00002','l00001'),('team00003','Royal Antwerp F.C.','coach00003','l00001'),('team00004','Standard de Liege','coach00004','l00001'),('team00005','Royale Union Saint-Gilloise','coach00005','l00001'),('team00006','Manchester United F.C.','coach00006','l00002'),('team00007','Liverpool F.C.','coach00007','l00002'),('team00008','Chelsea F.C.','coach00008','l00002'),('team00009','Manchester City F.C.','coach00009','l00002'),('team00010','Arsenal F.C.','coach00010','l00002'),('team00011','Paris Saint-Germain F.C.','coach00011','l00003'),('team00012','Olympique Lyonnais','coach00012','l00003'),('team00013','AS Saint-Etienne','coach00013','l00003'),('team00014','AS Monaco','coach00014','l00003'),('team00015','Olympique de Marseille','coach00015','l00003'),('team00016','Borussia Dortmund','coach00016','l00004'),('team00017','RB Leipzig','coach00017','l00004'),('team00018','FC Bayern Munich','coach00018','l00004'),('team00019','FC Augsburg','coach00019','l00004'),('team00020','SV Werder Bremen','coach00020','l00004'),('team00021','A.C. Milan','coach00021','l00005'),('team00022','Inter Milan','coach00022','l00005'),('team00023','Juventus F.C.','coach00023','l00005'),('team00024','S.S. Lazio','coach00024','l00005'),('team00025','A.S. Roma','coach00025','l00005'),('team00026','AFC Ajax ','coach00026','l00006'),('team00027','PSV Eindhoven','coach00027','l00006'),('team00028','AZ Alkmaar','coach00028','l00006'),('team00029','FC Utrecht','coach00029','l00006'),('team00030','SC Heerenveen','coach00030','l00006'),('team00031','Lech Poznan','coach00031','l00007'),('team00032','Wisla Krakow','coach00032','l00007'),('team00033','Lechia Gdasnk','coach00033','l00007'),('team00034','Pogon Szczecin','coach00034','l00007'),('team00035','Jagiellonia Bialystok','coach00035','l00007'),('team00036','S.L. Benfica','coach00036','l00008'),('team00037','Sporting CP','coach00037','l00008'),('team00038','FC Porto','coach00038','l00008'),('team00039','S.C. Braga ','coach00039','l00008'),('team00040','C.D. Santa Clara','coach00040','l00008'),('team00041','Celtic F.C.','coach00041','l00009'),('team00042','Ranger F.C.','coach00042','l00009'),('team00043','Dundee United F.C.','coach00043','l00009'),('team00044','Hibernian F.C. ','coach00044','l00009'),('team00045','Aberdeen F.C.','coach00045','l00009'),('team00046','FC Barcelona','coach00046','l00010'),('team00047','Atletico de Madrid','coach00047','l00010'),('team00048','Real Madrid','coach00048','l00010'),('team00049','Real Sociedad','coach00049','l00010'),('team00050','Sevilla FC','coach00050','l00010'),('team00051','FC Aarau','coach00051','l00011'),('team00052','Wil','coach00052','l00011'),('team00053','Thun','coach00053','l00011'),('team00054','FC Vaduz','coach00054','l00011'),('team00055','Winterthur','coach00055','l00011');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sack_trigger` AFTER UPDATE ON `teams` FOR EACH ROW begin
	set @num = (select num_sacks from coaches where coach_id = old.team_coach);
	if (new.team_coach is null) then
		update coaches 
        set num_sacks = @num + 1
        where coach_id = old.team_coach;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transfer_market`
--

DROP TABLE IF EXISTS `transfer_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_market` (
  `player_id` varchar(100) NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  CONSTRAINT `player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_market`
--

LOCK TABLES `transfer_market` WRITE;
/*!40000 ALTER TABLE `transfer_market` DISABLE KEYS */;
INSERT INTO `transfer_market` VALUES ('p00001',10000),('p00606',1192890),('p00607',1347289),('p00608',1446956),('p00609',1152039),('p00610',1300972),('p00611',1029298),('p00612',1269344),('p00613',1190565),('p00614',1397502),('p00615',1473579),('p00616',1259763),('p00617',1146784),('p00618',1364087),('p00619',1505297),('p00620',1662317),('p00621',1249964),('p00622',1011753),('p00623',1306371),('p00624',1454630),('p00625',1512984),('p00626',1550529),('p00627',1076534),('p00628',1180881),('p00629',1436403),('p00630',1206742),('p00631',1394175),('p00632',1439999),('p00633',1370770),('p00634',1588439),('p00635',1038127),('p00636',1626236),('p00637',1258855),('p00638',1235063),('p00639',1310890),('p00640',1325883),('p00641',1583018),('p00642',1616245),('p00643',1643153),('p00644',1269535),('p00645',1578054),('p00646',1176127),('p00647',1531011),('p00648',1162473),('p00649',1301795),('p00650',1413348),('p00651',1595053),('p00652',1136504),('p00653',1386299),('p00654',1669299),('p00655',1350190),('p00656',1421866),('p00657',1653500),('p00658',1436288),('p00659',1417874),('p00660',1497335),('p00661',1150963);
/*!40000 ALTER TABLE `transfer_market` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `move_into_market` AFTER INSERT ON `transfer_market` FOR EACH ROW begin
	update players set current_team = null where player_id = new.player_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'european_soccer'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `end_cycle` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `end_cycle` ON SCHEDULE AT '2022-01-10 08:00:00' ON COMPLETION PRESERVE ENABLE DO begin
		insert into archive_games select * from games;
        delete from games;
	end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'european_soccer'
--
/*!50003 DROP FUNCTION IF EXISTS `best_league_chance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `best_league_chance`(lname varchar(100)) RETURNS decimal(5,5)
    READS SQL DATA
    DETERMINISTIC
begin
	declare prob decimal(5, 5);
	declare vote_casted int;
    set vote_casted = (select count(*) from fans where vote_league is not null);
    select (count(*) / vote_casted) into prob from fans where 
		vote_league = (select league_id from leagues where league_name = lname); 
    return prob;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `best_player_chance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `best_player_chance`(pid varchar(100)) RETURNS decimal(5,5)
    READS SQL DATA
    DETERMINISTIC
begin
	declare prob decimal(5, 5);
	declare vote_casted int;
    set vote_casted = (select count(*) from fans where vote_player is not null);
    select (count(*) / vote_casted) into prob from fans where vote_player = pid; 
    return prob;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `best_team_chance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `best_team_chance`(teamname varchar(100)) RETURNS decimal(5,5)
    READS SQL DATA
    DETERMINISTIC
begin
	declare prob decimal(5, 5);
	declare vote_casted int;
    set vote_casted = (select count(*) from fans where vote_team is not null);
    select (count(*) / vote_casted) into prob from fans where 
		vote_team = (select team_id from teams where team_name = teamname); 
    return prob;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `compare_teams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `compare_teams`(t1 varchar(100), t2 varchar(100)) RETURNS varchar(100) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
begin
	declare prob1 decimal(5, 5);
    declare prob2 decimal(5, 5);
    
    set @t1num1 = (select count(*) from games where team_1 = (select team_id from teams where team_name = t1));
    set @t1num2 = (select count(*) from games where team_2 = (select team_id from teams where team_name = t1));
    set @t2num1 = (select count(*) from games where team_1 = (select team_id from teams where team_name = t2));
    set @t2num2 = (select count(*) from games where team_2 = (select team_id from teams where team_name = t2));
    
    with wt1 as (select game_id from games where team_1 = (select team_id from teams where team_name = t1) 
				and goals_team_1 > goals_team_2
				union
				select game_id from games where team_2 = (select team_id from teams where team_name = t1) 
                and goals_team_2 > goals_team_1)
	select (count(game_id) / (@t1num1 + @t1num2)) into prob1 from wt1;
    
    with wt2 as (select game_id from games where team_1 = (select team_id from teams where team_name = t2) 
				and goals_team_1 > goals_team_2
				union
				select game_id from games where team_2 = (select team_id from teams where team_name = t2) 
                and goals_team_2 > goals_team_1)
	select (count(game_id) / (@t2num1 + @t2num2)) into prob2 from wt2;
    
    if (prob1 > prob2) then
		return t1;
	elseif (prob2 > prob1) then
		return t2;
	else return 'equal chances';
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `win_probability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `win_probability`(teamname varchar(100)) RETURNS decimal(5,5)
    READS SQL DATA
    DETERMINISTIC
begin 
	declare prob decimal(5, 5);
    declare num01 int;
    declare num02 int;
    set num01 = (select count(*) from games where team_1 = (select team_id from teams where team_name = teamname));
    set num02 = (select count(*) from games where team_2 = (select team_id from teams where team_name = teamname));
    with 
        won as (select game_id from games where team_1 = (select team_id from teams where team_name = teamname) 
				and goals_team_1 > goals_team_2
				union
				select game_id from games where team_2 = (select team_id from teams where team_name = teamname) 
                and goals_team_2 > goals_team_1)
	select (count(game_id) / (num01 + num02)) into prob from won;
    return prob;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adminlogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adminlogin`()
begin
	select user_name, user_password from admins; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admins_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admins_select`()
begin
	select * from admins;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ag_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ag_select`()
begin
	select * from archive_games;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buy`(in playerid varchar(100), in teamname varchar(100))
begin
	delete from transfer_market where player_id = playerid;
	update players set 
		current_team = (select team_id from teams where team_name = teamname) where player_id = playerid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `coaches_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `coaches_select`()
begin
	select * from coaches;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `current_sacked` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `current_sacked`()
begin
	select * from coaches where not exists (select team_coach from teams where team_coach = coach_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_fan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_fan`(fid varchar(100))
begin
	delete from fans where user_id = fid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fans_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fans_select`()
begin
	select * from fans;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `games_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `games_select`()
begin
	select * from games;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getfanid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getfanid`(username varchar(100))
begin
	select user_id from fans where user_name = username;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_game`(gid varchar(100), t1 varchar(100), t2 varchar(100), goal1 int, goal2 int)
begin
	declare te1 VARCHAR(100);
    declare te2 varchar(100);
    select team_id into te1 from teams where team_name = t1;
    select team_id into te2 from teams where team_name = t2;
	insert into games values (gid, te1, te2, goal1, goal2, CURRENT_DATE);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_player`(pid varchar(100), pf varchar(100), pl varchar(100), pa int, pos varchar(100), ct varchar(100))
begin
	declare tnm varchar(100);
    select team_id into tnm from teams where team_name = ct;
	insert into players values (pid, pf, pl, pa, pos, tnm);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_team`(tid varchar(100), tn varchar(100), tc varchar(100), tl varchar(100))
begin
	declare tlc varchar(100);
    select league_id into tlc from leagues where league_name = tl;
	insert into teams values (tid, tn, tc, tlc);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `leagues_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leagues_select`()
begin
	select * from leagues;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `league_teams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `league_teams`(l_name varchar(100))
begin
	select team_id, team_name from teams where 
    team_league = (select league_id from leagues where league_name = l_name);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `players_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `players_select`()
begin
	select * from players;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `roster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `roster`(t_name varchar(100))
begin  
	select player_id, player_first_name, player_last_name, player_position 
	from players where current_team = (select team_id from teams where team_name = t_name) 
    order by player_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sack` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sack`(teamname varchar(1000))
begin 
	update teams set team_coach = null where team_name = teamname;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `standings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `standings`(l_name varchar(100))
begin
	with 
	-- gets a table with all the leagues's games
	base_table as 
		(select distinct g.* from games g join (select team_id from teams where 
		team_league = (select league_id from leagues where league_name = l_name)) as t 
        on (team_1 = team_id or team_2 = team_id)),
	-- goals scored per team
	wins as 
		(select team_1 team, count(team_1) w from 
        (select team_1 from base_table where goals_team_1 > goals_team_2
		union all
		select team_2 from base_table where goals_team_2 > goals_team_1) 
        as r1 group by team_1),
	-- loses per team
    loses as 
		(select team_1 team, count(team_1) l from 
        (select team_1 from base_table where goals_team_1 < goals_team_2
		union all
		select team_2 from base_table where goals_team_2 < goals_team_1) 
        as r2 group by team_1),
	-- draws per team
	draws as 
		(select team_1 team, count(team_1) d from 
        (select team_1 from base_table where goals_team_1 = goals_team_2
		union all
		select team_2 from base_table where goals_team_2 = goals_team_1) 
        as r3 group by team_1),
	rankings as 
		(select team, wins.w wins, loses.l loses, draws.d draws 
        from wins join loses using (team) join draws using (team))
	select team, team_name, wins, loses, draws 
    from rankings join teams on team = team_id order by wins desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `teams_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `teams_select`()
begin
	select * from teams;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tm_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tm_select`()
begin
	select t.player_id, player_first_name, player_last_name, price from 
	players inner join transfer_market as t using (player_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top10_league_votes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `top10_league_votes`()
begin 
	select ROW_NUMBER() OVER(ORDER BY votes desc) ranking, league_name, ifnull(votes, 0) votes from 
		(select vote_league, count(vote_league) votes from fans group by vote_league) as t 
				right join leagues on league_id = vote_league limit 10;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top10_player_votes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `top10_player_votes`()
begin 
	select ROW_NUMBER() OVER(ORDER BY votes desc) ranking, concat(concat(player_first_name,' '),
		player_last_name) name, team_name, ifnull(votes, 0) votes from (select vote_player, 
			count(vote_player) votes from fans group by vote_player) as t right join players 
				on player_id = vote_player join teams on team_id = current_team limit 10;  
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top10_teams_votes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `top10_teams_votes`()
begin
	select ROW_NUMBER() OVER(ORDER BY votes desc) ranking, team_name, league_name, 
		ifnull(votes, 0) votes from (select vote_team, count(vote_team) votes from fans 
			group by vote_team) as t right join teams on team_id = vote_team join leagues on 
				league_id = team_league limit 10;  
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `transfer`(in pid varchar(100), in price int)
begin 
    insert into transfer_market values (pid, price);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userandpass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userandpass`()
begin
	select user_name, user_password from fans; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vote_for_league` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `vote_for_league`(in lname varchar(100), in fid varchar(100))
begin 
	update fans set vote_league = (select league_id from leagues where league_name = lname) where user_id = fid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vote_for_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `vote_for_player`(in pid varchar(100), in fid varchar(100))
begin
	update fans set vote_player = pid where user_id = fid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vote_for_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `vote_for_team`(in tname varchar(100), in fid varchar(100))
begin
	update fans set vote_team = (select team_id from teams where team_name = tname) where user_id = fid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-09 17:24:52

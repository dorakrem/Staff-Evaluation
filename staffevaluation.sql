-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: staffevaluation
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `username` varchar(12) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `ADMINUSR` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('iosifzax'),('mairypap'),('marzax'),('xristanag');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antikeim`
--

DROP TABLE IF EXISTS `antikeim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antikeim` (
  `title` varchar(36) NOT NULL,
  `descr` tinytext,
  `belongs_to` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `ANTIKEIM` (`belongs_to`),
  CONSTRAINT `ANTIKEIM` FOREIGN KEY (`belongs_to`) REFERENCES `antikeim` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antikeim`
--

LOCK TABLES `antikeim` WRITE;
/*!40000 ALTER TABLE `antikeim` DISABLE KEYS */;
INSERT INTO `antikeim` VALUES ('2D','Level two element, child of Graphics','Graphics'),('3D','Level two element, child of Graphics','Graphics'),('AI','Level one element, child of Computer Science','Computer Science'),('Algorithms','Level one element, child of Computer Science','Computer Science'),('Animation','Level two element, child of Graphics','Graphics'),('Complexity and Efficiency','Level two element, child of Algorithms','Algorithms'),('Computer Science','Root element, no more general antikeim',NULL),('Data structures','Level two element, child of Algorithms','Algorithms'),('Databases','Level one element, child of Computer Science','Computer Science'),('Device connectivity','Level two element, child of Networking','Networking'),('Graphics','Level one element, child of Computer Science','Computer Science'),('Information Retieval','Level three element, child of NLP','NLP'),('Language analysis',' Level three element, child of NLP','NLP'),('Machine Learning','Level one element,child of AI','AI'),('Mobile Apps','Level two element, child of Programming','Programming'),('Network setup and maintainance','Level two element, child of Networking','Networking'),('Networking','Level one element, child of Computer Science','Computer Science'),('NLP','Level two element, child of AI','AI'),('NoSQL DBs','Level two element, child of Databases','Databases'),('Object-Oriented DBs','Level two element, child of Databases','Databases'),('Programming','Level one element, child of Computer Science','Computer Science'),('Relational DBs','Level two element, child of Databases','Databases'),('Robotics','Level two element, child of AI','AI'),('Web Programming','Level two element, child of Programming','Programming');
/*!40000 ALTER TABLE `antikeim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `AFM` char(9) NOT NULL,
  `DOY` varchar(15) DEFAULT NULL,
  `name` varchar(35) NOT NULL DEFAULT 'unknown',
  `phone` bigint NOT NULL,
  `street` varchar(15) NOT NULL,
  `num` tinyint DEFAULT NULL,
  `city` varchar(15) NOT NULL DEFAULT 'unknown',
  `country` varchar(15) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`AFM`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('023451232','A Patras','Typology Ltd',2610231452,'Korinthou',56,'Patra','Greece'),('023453344','C Patras','EXPENDITURE Ltd',2610256321,'Maizonos',123,'Patra','Greece'),('05694712','A Athinwn','Electrical A.A.',2100202022,'Kifisias',26,'Athina','Greece'),('123432211','A Geraka','SoftSol A.E.',2103452133,'Ahepa',44,'Athina','Greece'),('18765549','C Peiraia','Unigram',2610678900,'Korinthou',97,'Aigio','Greece'),('23122345','SF 1234 BG','SocialSc',3200123451,'General Sklevi',35,'Sofia','Bulgaria'),('561234561','GS 35321 L','InCodeWeTrust',1242345612,'Oxford',12,'London','United Kingdom'),('97833111','C Athinwn','Universal',2107827632,'Pelopos',92,'Athina','Greece');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cannotchangefieldsofcompany` BEFORE UPDATE ON `company` FOR EACH ROW BEGIN
IF(NEW.AFM <> OLD.AFM OR NEW.DOY <> OLD.DOY OR NEW.name <> OLD.name) THEN
SET NEW.AFM=OLD.AFM;
SET NEW.DOY=OLD.DOY;
SET NEW.name=OLD.name;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree` (
  `titlos` varchar(50) NOT NULL,
  `idryma` varchar(40) NOT NULL,
  `bathmida` enum('LYKEIO','UNIV','MASTER','PHD') DEFAULT NULL,
  PRIMARY KEY (`titlos`,`idryma`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES ('Advanced Rendering Techniques','Delft University of Technology','MASTER'),('Artificial Intelligence',' Cambrigde University','MASTER'),('Big Data and Analytics',' Imperial College London','MASTER'),('Big Data Structures and Algorithms','Technical University of Denmark','MASTER'),('Computer and Infromatics Eng.',' Patras University','UNIV'),('Computer Science and Engineering','Delft University of Technology','UNIV'),('Computer Science Dipl.','Lancster University','UNIV'),('Computer Vision and Modelling','Princeton University','MASTER'),('Data Science Bachelor','Eindhoven University of Technology','UNIV'),('Electrical and Computer Eng.','Metsovio Polytexneio','UNIV'),('Lysium certificate','2nd Lysium of Aigaleo','LYKEIO'),('NLP related high efficiency algorithms','Patras University','PHD'),('PDEng Data Science','Eindhoven University of Technology','PHD');
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `username` varchar(12) NOT NULL,
  `exp_years` tinyint DEFAULT NULL,
  `bio` text,
  `sistatikes` varchar(35) NOT NULL,
  `certificates` varchar(35) NOT NULL,
  `awards` varchar(35) NOT NULL,
  `firm` char(9) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `EMPLCOMP` (`firm`),
  CONSTRAINT `EMPLCOMP` FOREIGN KEY (`firm`) REFERENCES `company` (`AFM`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EMPLUSR` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('abrown',4,'bio2','sistatikes2','certificates2','awards2','023451232'),('cleogeo',6,'bio5','sistatikes5','certificates5','awards5','561234561'),('elenineo',2,'bio3','sistatikes3','certificates3','awards3','123432211'),('jennyk',2,'bio9','sistatikes9','certificates9','awards9','023451232'),('kwstasneo',1,'bio4','sistatikes4','certificates4','awards4','18765549'),('liagourma',1,'bio11','sistatikes11','certificates11','awards11','18765549'),('lionarF',8,'bio7','sistatikes7','certificates7','awards7','05694712'),('miltH',9,'bio10','sistatikes10','certificates10','awards10','123432211'),('mnikol',3,'bio1','sistatikes1','certificates1','awards1','023453344'),('msmith',12,'bio8','sistatikes8','certificates8','awards8','023453344'),('niktsakon',5,'bio12','sistatikes12','certificates12','awards12','123432211'),('zazahir23',1,'bio6','sistatikes6','certificates6','awards6','23122345');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertinginto_employee` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN


IF(NEW.username IN (SELECT username FROM employee))
THEN
INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'NO','INSERT','employee');

ELSE
 INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'YES','INSERT','employee');
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updatingtable_employee` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
 
IF(NEW.username=OLD.username AND NEW.exp_years=OLD.exp_years AND NEW.bio=OLD.bio AND NEW.sistatikes=OLD.sistatikes AND NEW.certificates=OLD.certificates 
AND OLD.awards=NEW.awards AND OLD.firm=NEW.firm) THEN

 
INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'NO','UPDATE','employee');

ELSE
INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'YES','UPDATE','employee');
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deletingfrom_employee` BEFORE DELETE ON `employee` FOR EACH ROW BEGIN

IF(OLD.username NOT IN (SELECT username FROM employee)) THEN

INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'NO','DELETE','employee');

ELSE
INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'YES','DELETE','employee');
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluation` (
  `emplusername` varchar(12) NOT NULL,
  `evalusername` varchar(12) NOT NULL,
  `jobid` int NOT NULL,
  `aksiologisi1` enum('0','1','2','3','4') DEFAULT NULL,
  `aksiologisi2` enum('0','1','2','3','4') DEFAULT NULL,
  `aksiologisi3` enum('0','1','2') DEFAULT NULL,
  `comments` varchar(255) NOT NULL,
  `eval_id` int NOT NULL,
  KEY `EVL_EMP` (`emplusername`),
  KEY `EVAL_EVL` (`evalusername`),
  KEY `EVAL_JOB` (`jobid`),
  CONSTRAINT `EVAL_EVL` FOREIGN KEY (`evalusername`) REFERENCES `evaluator` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EVAL_JOB` FOREIGN KEY (`jobid`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EVL_EMP` FOREIGN KEY (`emplusername`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation`
--

LOCK TABLES `evaluation` WRITE;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
INSERT INTO `evaluation` VALUES ('mnikol','hlgeor',1,'4','3','1','good',20),('mnikol','vlasster',111,'1',NULL,NULL,'not good',21),('abrown','akisgoud',456,'2','3','2','good',22),('abrown','hlgeor',1,NULL,'3','1','good',23),('elenineo','efstang',789,'2','4','2','good',24),('elenineo','adonkab',123,'1',NULL,'0','not good',25),('kwstasneo','dionkok',321,'3','2','0','good',26),('kwstasneo','swtirzan',654,NULL,'4','2','good',27),('cleogeo','hlgeor',987,'4','4','2','good',28),('cleogeo','vlasster',147,'3',NULL,'1','not good',29),('zazahir23','akisgoud',258,'4','0','0','not good',30),('zazahir23','efstang',369,NULL,NULL,'2','not good',31),('lionarF','adonkab',963,'2','2','2','good',32),('lionarF','hlgeor',1,'3','1',NULL,'not good',33),('liagourma','vlasster',111,'4','4','2','good',34),('liagourma','akisgoud',456,'1','2',NULL,'not good',35),('msmith','efstang',789,'4','1','1','good',36),('msmith','adonkab',123,NULL,'2',NULL,'not good',37),('jennyk','dionkok',321,'2','4','2','good',38),('jennyk','swtirzan',654,NULL,'4','2','good',39),('miltH','akisgoud',456,'4','3','2','good',40),('miltH','adonkab',963,NULL,'3','2','good',41);
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SumOfEvaluations` AFTER INSERT ON `evaluation` FOR EACH ROW BEGIN
   SET @eval_1 = NEW.aksiologisi1;
   SET @eval_2 = NEW.aksiologisi2;
   SET @eval_3 = NEW.aksiologisi3;
   
IF(@eval_1 <> '' AND @eval_2 <> '' AND @eval_3 <> '') THEN
   
SET @sum = @eval_1 + @eval_2 + @eval_3;


INSERT INTO evaluationresult
VALUES (NEW.eval_id,NEW.emplusername,NEW.jobid,@sum,NEW.comments);
END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `evaluationresult`
--

DROP TABLE IF EXISTS `evaluationresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluationresult` (
  `EvId` int NOT NULL,
  `empl_usrname` varchar(12) NOT NULL,
  `job_id` int NOT NULL,
  `grade` int NOT NULL,
  `comments` varchar(255) NOT NULL,
  PRIMARY KEY (`EvId`,`empl_usrname`),
  KEY `EMPL_EVALR` (`empl_usrname`),
  KEY `JOB_EVALR` (`job_id`),
  CONSTRAINT `EMPL_EVALR` FOREIGN KEY (`empl_usrname`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `JOB_EVALR` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluationresult`
--

LOCK TABLES `evaluationresult` WRITE;
/*!40000 ALTER TABLE `evaluationresult` DISABLE KEYS */;
INSERT INTO `evaluationresult` VALUES (20,'mnikol',1,8,'good'),(22,'abrown',456,7,'good'),(24,'elenineo',789,8,'good'),(26,'kwstasneo',321,5,'good'),(28,'cleogeo',987,10,'good'),(30,'zazahir23',258,4,'not good'),(32,'lionarF',963,6,'good'),(34,'liagourma',111,10,'good'),(36,'msmith',789,6,'good'),(38,'jennyk',321,8,'good'),(40,'miltH',456,9,'good');
/*!40000 ALTER TABLE `evaluationresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluator`
--

DROP TABLE IF EXISTS `evaluator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluator` (
  `username` varchar(12) NOT NULL,
  `exp_years` tinyint DEFAULT NULL,
  `firm` char(9) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `EVALCMP` (`firm`),
  CONSTRAINT `EVALCMP` FOREIGN KEY (`firm`) REFERENCES `company` (`AFM`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EVALUSR` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluator`
--

LOCK TABLES `evaluator` WRITE;
/*!40000 ALTER TABLE `evaluator` DISABLE KEYS */;
INSERT INTO `evaluator` VALUES ('adonkab',5,'561234561'),('akisgoud',11,'123432211'),('dionkok',1,'23122345'),('efstang',3,'18765549'),('elefasla',6,'123432211'),('hlgeor',10,'18765549'),('swtirzan',7,'05694712'),('vlasster',8,'023451232');
/*!40000 ALTER TABLE `evaluator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_degree`
--

DROP TABLE IF EXISTS `has_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has_degree` (
  `degr_title` varchar(50) NOT NULL,
  `degr_idryma` varchar(40) NOT NULL,
  `empl_username` varchar(12) NOT NULL,
  `etos` year DEFAULT NULL,
  `grade` float(3,1) DEFAULT NULL,
  PRIMARY KEY (`degr_title`,`degr_idryma`,`empl_username`),
  KEY `HASEMPL` (`empl_username`),
  CONSTRAINT `HASDEGR` FOREIGN KEY (`degr_title`, `degr_idryma`) REFERENCES `degree` (`titlos`, `idryma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `HASEMPL` FOREIGN KEY (`empl_username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_degree`
--

LOCK TABLES `has_degree` WRITE;
/*!40000 ALTER TABLE `has_degree` DISABLE KEYS */;
INSERT INTO `has_degree` VALUES ('Artificial Intelligence',' Cambrigde University','zazahir23',2008,8.0),('Big Data and Analytics',' Imperial College London','jennyk',2006,8.0),('Big Data Structures and Algorithms','Technical University of Denmark','miltH',2008,8.2),('Computer and Infromatics Eng.',' Patras University','cleogeo',2003,8.6),('Computer Science and Engineering','Delft University of Technology','mnikol',2000,8.2),('Computer Science Dipl.','Lancster University','liagourma',2001,8.4),('Computer Vision and Modelling','Princeton University','jennyk',2006,7.4),('Computer Vision and Modelling','Princeton University','kwstasneo',2001,8.5),('Data Science Bachelor','Eindhoven University of Technology','jennyk',2004,9.2),('Electrical and Computer Eng.','Metsovio Polytexneio','kwstasneo',1998,7.6),('Lysium certificate','2nd Lysium of Aigaleo','mnikol',1999,19.2),('NLP related high efficiency algorithms','Patras University','liagourma',2013,9.0),('PDEng Data Science','Eindhoven University of Technology','elenineo',2006,9.0);
/*!40000 ALTER TABLE `has_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL,
  `start_date` date NOT NULL,
  `salary` float(6,1) DEFAULT NULL,
  `position` varchar(40) DEFAULT NULL,
  `edra` varchar(45) DEFAULT NULL,
  `evaluator` varchar(12) NOT NULL,
  `announce_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `submission_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `JOBEVLTR` (`evaluator`),
  CONSTRAINT `JOBEVLTR` FOREIGN KEY (`evaluator`) REFERENCES `evaluator` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'2019-01-01',1800.0,'data analyst','Patra, Greece','hlgeor','2018-07-13 10:00:00','2018-12-20'),(111,'2019-02-01',1450.0,'web programmer','Patra, Greece','vlasster','2018-07-13 11:00:00','2019-01-10'),(123,'2019-03-01',2100.0,'Graphics designer','Peiraias, Greece','adonkab','2018-10-10 00:00:00','2019-02-01'),(147,'2019-05-01',1850.0,'DB expert','Athina, Greece','vlasster','2018-11-20 00:00:00','2019-04-12'),(258,'2019-04-01',2100.0,'AI expert','Sofia, Bulgaria','akisgoud','2018-11-21 00:00:00','2019-03-10'),(272,'2018-07-22',2389.0,'ML expert','Thessaloniki,Greece','hlgeor','2021-02-11 20:52:56','2019-10-29'),(321,'0201-03-01',2300.0,'Visualization expert','Peiraias, Greece','dionkok','2018-10-20 00:00:00','2019-01-10'),(369,'2019-02-01',2600.0,'Algorithmic efficiency expert','Sofia, Bulgaria','efstang','2018-11-01 00:00:00','2019-01-16'),(456,'2019-02-01',2100.0,'mobile app developer','Patra, Greece','akisgoud','2018-10-24 12:00:00','2018-01-12'),(654,'2019-05-01',1850.0,'web and mobile app programmer','Athina, Greece','swtirzan','2018-11-20 00:00:00','2019-04-12'),(789,'2018-12-25',2700.0,'NLP expert','Peiraias, Greece','efstang','2018-10-10 00:00:00','2018-11-10'),(963,'2019-03-01',2800.0,'web and media programmer','Oxford, London','adonkab','2018-11-01 00:00:00','2019-01-03'),(987,'2019-05-01',1600.0,'graphics expert','Athina, Greece','hlgeor','2018-11-20 00:00:00','2019-04-12');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inserting_intojob` BEFORE INSERT ON `job` FOR EACH ROW BEGIN

IF(NEW.id IN (SELECT id FROM job))
THEN
INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'NO','INSERT','job');

ELSE
 INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'YES','INSERT','job');
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updatingtable_job` BEFORE UPDATE ON `job` FOR EACH ROW BEGIN



IF(NEW.id=OLD.id AND NEW.start_date=OLD.start_date AND NEW.salary=OLD.salary AND NEW.position=OLD.position AND OLD.edra=NEW.edra AND OLD.evaluator=NEW.evaluator 
AND NEW.announce_date=OLD.announce_date AND NEW.submission_date=OLD.submission_date)  THEN


INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'NO','UPDATE','job');

ELSE
INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'YES','UPDATE','job');

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deletingfrom_job` BEFORE DELETE ON `job` FOR EACH ROW BEGIN

IF(OLD.id NOT IN (SELECT id FROM job)) THEN
INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'NO','DELETE','job');

ELSE
INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'YES','DELETE','job');

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `employee` varchar(12) NOT NULL,
  `lang` set('EN','FR','SP','GR') NOT NULL,
  PRIMARY KEY (`employee`,`lang`),
  CONSTRAINT `EMPLLANG` FOREIGN KEY (`employee`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES ('abrown','EN,GR'),('cleogeo','FR,GR'),('elenineo','EN,FR'),('jennyk','SP,GR'),('kwstasneo','EN,GR'),('liagourma','FR'),('lionarF','EN,GR'),('miltH','EN,GR'),('mnikol','EN,SP,GR'),('msmith','EN,FR,SP,GR'),('zazahir23','EN,FR,SP');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `username_xrhsth` varchar(12) DEFAULT NULL,
  `Date_time` datetime DEFAULT NULL,
  `ektelesi` enum('YES','NO') NOT NULL,
  `typeofaction` varchar(10) NOT NULL,
  `table_name` varchar(25) NOT NULL,
  KEY `LOG_USER` (`username_xrhsth`),
  CONSTRAINT `LOG_USER` FOREIGN KEY (`username_xrhsth`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (NULL,'2021-01-24 16:02:05','YES','UPDATE','job'),(NULL,'2021-01-24 16:07:17','NO','UPDATE','job'),(NULL,'2021-01-24 16:22:32','YES','UPDATE','employee'),(NULL,'2021-01-24 16:23:53','NO','UPDATE','employee'),(NULL,'2021-01-24 16:35:01','YES','UPDATE','requestsevaluation'),(NULL,'2021-01-24 16:35:42','NO','UPDATE','requestsevaluation'),(NULL,'2021-01-24 17:05:54','YES','UPDATE','job'),(NULL,'2021-01-24 19:54:03','YES','UPDATE','employee'),(NULL,'2021-01-24 22:29:40','YES','UPDATE','job'),(NULL,'2021-01-24 22:29:40','YES','UPDATE','job'),(NULL,'2021-01-24 22:36:07','YES','UPDATE','job'),(NULL,'2021-01-24 22:36:37','YES','UPDATE','job'),(NULL,'2021-01-24 23:27:29','YES','UPDATE','job'),('nikipap','2021-01-24 23:47:23','YES','UPDATE','job'),(NULL,'2021-01-24 23:52:21','YES','UPDATE','employee'),('nikipap','2021-01-24 23:53:53','NO','UPDATE','employee'),('nikipap','2021-01-24 23:54:04','YES','UPDATE','employee'),(NULL,'2021-01-26 00:11:10','YES','UPDATE','job'),(NULL,'2021-01-26 00:12:10','YES','UPDATE','job'),('elenineo','2021-01-26 01:09:19','YES','UPDATE','employee'),('elenineo','2021-01-26 01:11:22','YES','UPDATE','employee'),(NULL,'2021-01-26 12:12:16','YES','UPDATE','employee'),(NULL,'2021-01-26 12:13:16','YES','UPDATE','employee'),('hlgeor','2021-01-26 14:28:06','YES','INSERT','requestsevaluation'),('hlgeor','2021-01-26 14:28:48','YES','INSERT','requestsevaluation'),('hlgeor','2021-01-26 14:29:00','NO','INSERT','requestsevaluation'),('hlgeor','2021-01-27 17:18:52','YES','UPDATE','job'),('hlgeor','2021-01-27 17:19:41','YES','UPDATE','job'),(NULL,'2021-01-27 17:33:05','YES','UPDATE','job'),(NULL,'2021-01-27 17:33:30','YES','UPDATE','job'),(NULL,'2021-01-27 18:49:07','YES','UPDATE','employee'),(NULL,'2021-01-27 18:49:11','NO','UPDATE','employee'),(NULL,'2021-01-27 18:49:43','YES','UPDATE','employee'),(NULL,'2021-01-27 18:53:57','NO','INSERT','requestsevaluation'),(NULL,'2021-01-27 18:57:38','NO','INSERT','requestsevaluation'),(NULL,'2021-01-27 18:57:43','NO','INSERT','requestsevaluation'),(NULL,'2021-01-27 19:01:55','NO','INSERT','requestsevaluation'),(NULL,'2021-01-27 19:08:32','YES','INSERT','requestsevaluation'),(NULL,'2021-01-28 01:25:00','YES','INSERT','employee'),(NULL,'2021-01-29 02:48:37','YES','INSERT','job'),(NULL,'2021-02-11 17:57:17','YES','UPDATE','job'),(NULL,'2021-02-11 18:04:41','YES','UPDATE','job'),(NULL,'2021-02-11 18:08:08','YES','UPDATE','job'),(NULL,'2021-02-11 18:41:07','YES','UPDATE','job'),(NULL,'2021-02-11 20:52:56','YES','UPDATE','job'),(NULL,'2021-02-12 00:05:11','YES','UPDATE','employee'),(NULL,'2021-02-12 00:06:05','YES','UPDATE','employee'),('elenineo','2021-02-12 00:10:42','YES','UPDATE','job'),('elenineo','2021-02-12 00:11:03','YES','UPDATE','job'),(NULL,'2021-02-12 00:14:41','YES','UPDATE','employee'),(NULL,'2021-02-12 00:15:10','YES','UPDATE','employee'),('elenineo','2021-02-12 00:18:15','YES','UPDATE','employee'),('elenineo','2021-02-12 00:18:48','YES','UPDATE','employee');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `managerUsername` varchar(12) NOT NULL,
  `exp_years` tinyint DEFAULT NULL,
  `firm` char(9) NOT NULL,
  PRIMARY KEY (`managerUsername`),
  KEY `MANAGERCMP` (`firm`),
  CONSTRAINT `MANAGERCMP` FOREIGN KEY (`firm`) REFERENCES `company` (`AFM`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MANAGERUSR` FOREIGN KEY (`managerUsername`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('lolapol',4,'561234561'),('nikipap',6,'18765549'),('nikospap',2,'023453344'),('panxrist',5,'023451232'),('ptolkor',5,'05694712'),('stavroskost',9,'23122345'),('Theoxrist',1,'123432211'),('vasmitr',3,'561234561');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `needs`
--

DROP TABLE IF EXISTS `needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `needs` (
  `job_id` int NOT NULL,
  `antikeim_title` varchar(36) NOT NULL,
  PRIMARY KEY (`job_id`,`antikeim_title`),
  KEY `NEEDSANTIK` (`antikeim_title`),
  CONSTRAINT `JOBNEEDS` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NEEDSANTIK` FOREIGN KEY (`antikeim_title`) REFERENCES `antikeim` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `needs`
--

LOCK TABLES `needs` WRITE;
/*!40000 ALTER TABLE `needs` DISABLE KEYS */;
INSERT INTO `needs` VALUES (258,'2D'),(963,'3D'),(123,'AI'),(456,'AI'),(1,'Algorithms'),(147,'Algorithms'),(654,'Algorithms'),(111,'Animation'),(789,'Animation'),(789,'Complexity and Efficiency'),(1,'Databases'),(963,'Databases'),(321,'Graphics'),(654,'Graphics'),(272,'Machine Learning'),(147,'Mobile Apps'),(369,'Mobile Apps'),(456,'Mobile Apps'),(321,'NLP'),(963,'NoSQL DBs'),(111,'Programming'),(987,'Programming'),(258,'Web Programming'),(456,'Web Programming'),(987,'Web Programming');
/*!40000 ALTER TABLE `needs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `empl` varchar(12) NOT NULL,
  `num` tinyint NOT NULL,
  `descr` text NOT NULL,
  `url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`empl`,`num`),
  CONSTRAINT `PROJEMPL` FOREIGN KEY (`empl`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('elenineo',1,'Essential Cheat Sheets for deep learning and machine learning researchers','https://github.com/elenineo/cheatsheets-ai'),('elenineo',2,'Python sample codes for robotics algorithms.','https://github.com/elenineo/PythonRobotics'),('jennyk',1,'HTML5 Mobile App UI templates created using Intel App Framework.','https://github.com/jenny/appframework-templates'),('jennyk',2,'Mobile Version of Travel sample App using Couchbase Lite 2.0.','https://github.com/jenny/mobile-travel-sample'),('jennyk',3,'Appium Demo App with clearly defined Page Object Pattern for React Native Mobile App. Test Language - Javascript.','https://github.com/jenny/Appium-Page-Object-Model-Demo'),('miltH',1,'WebGL2 powered geospatial visualization layers. offers an extensive catalog of pre-packaged visualization \"layers\", including ScatterplotLayer, ArcLayer, TextLayer, GeoJsonLayer, etc. The input to a layer is usually an array of JSON objects. Each layer offers highly-flexible API to customize how the data should be rendered.','https://github.com/milti/deck.gl'),('miltH',2,'Messy datasets? Missing values? missingno provides a small toolset of flexible and easy-to-use missing data visualizations and utilities that allows a quick visual summary of the completeness (or lack thereof) of the dataset.','https://github.com/milti/missingno'),('miltH',3,'Repository to track the progress in Natural Language Processing (NLP), including the datasets and the current state-of-the-art for the most common NLP tasks','https://github.com/milti/NLP-progress'),('miltH',4,'Supporting Rapid Prototyping with a Toolkit (incl. Datasets and Neural Network Layers)','https://github.com/milti/PyTorch-NLP'),('mnikol',1,'Minimal examples of data structures and algorithms in Python','https://github.com/mnikol/algorithms'),('mnikol',2,'Interactive Online Platform that Visualizes Algorithms from Code','https://github.com/mnikol/algorithm-visualizer'),('mnikol',3,'Repository which contains links and resources on different topics of Computer Science','https://github.com/mnikol/AlgoWiki'),('zazahir23',1,'Go Graphics - 2D rendering in Go with a simple API.','https://github.com/mob@s/gg'),('zazahir23',2,'Draco is a library for compressing and decompressing 3D geometric meshes and point clouds. It is intended to improve the storage and transmission of 3D graphics.','https://github.com/mob@s/draco'),('zazahir23',3,'Data Discovery and Lineage for Big Data Ecosystem.','https://github.com/linkedin/WhereHows');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `manag_username` varchar(12) NOT NULL,
  `evaluat_username` varchar(12) NOT NULL,
  `id_job` int NOT NULL,
  PRIMARY KEY (`manag_username`,`evaluat_username`,`id_job`),
  KEY `PROM_EVAL` (`evaluat_username`),
  KEY `PROM_JO` (`id_job`),
  CONSTRAINT `PROM_EVAL` FOREIGN KEY (`evaluat_username`) REFERENCES `evaluator` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PROM_JO` FOREIGN KEY (`id_job`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PROM_MANAG` FOREIGN KEY (`manag_username`) REFERENCES `manager` (`managerUsername`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES ('nikospap','hlgeor',1),('panxrist','vlasster',111),('vasmitr','dionkok',123),('nikipap','hlgeor',272),('nikipap','efstang',369),('ptolkor','akisgoud',456),('nikipap','swtirzan',654),('Theoxrist','efstang',789),('stavroskost','adonkab',963);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestsevaluation`
--

DROP TABLE IF EXISTS `requestsevaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestsevaluation` (
  `empl_usrname` varchar(12) NOT NULL,
  `job_id` int NOT NULL,
  PRIMARY KEY (`empl_usrname`,`job_id`),
  KEY `EVALJ` (`job_id`),
  CONSTRAINT `EVALEMPLOY` FOREIGN KEY (`empl_usrname`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EVALJ` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestsevaluation`
--

LOCK TABLES `requestsevaluation` WRITE;
/*!40000 ALTER TABLE `requestsevaluation` DISABLE KEYS */;
INSERT INTO `requestsevaluation` VALUES ('abrown',1),('lionarF',1),('mnikol',111),('elenineo',123),('msmith',123),('cleogeo',147),('zazahir23',369),('liagourma',456),('jennyk',654),('kwstasneo',654),('miltH',963);
/*!40000 ALTER TABLE `requestsevaluation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertinginto_requestsevaluation` BEFORE INSERT ON `requestsevaluation` FOR EACH ROW BEGIN

IF(NEW.empl_usrname IN (SELECT empl_usrname FROM requestsevaluation) AND NEW.job_id IN (SELECT job_id FROM requestsevaluation) )

THEN
INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'NO','INSERT','requestsevaluation');

ELSE
 INSERT INTO log
VALUES(@useronoma,CURRENT_TIMESTAMP,'YES','INSERT','requestsevaluation');
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updatingtable_requestsevaluation` BEFORE UPDATE ON `requestsevaluation` FOR EACH ROW BEGIN

IF(NEW.empl_usrname=OLD.empl_usrname AND NEW.job_id=OLD.job_id) THEN

INSERT INTO log
VALUES(@useronoma ,CURRENT_TIMESTAMP,'NO','UPDATE','requestsevaluation');

ELSE
INSERT INTO log
VALUES(@useronoma ,CURRENT_TIMESTAMP,'YES','UPDATE','requestsevaluation');
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deletingfrom_requestsevaluation` BEFORE DELETE ON `requestsevaluation` FOR EACH ROW BEGIN

IF(OLD.empl_usrname AND OLD.job_id NOT IN (SELECT empl_usrname FROM requestsevaluation)) THEN
INSERT INTO log
VALUES(@useronoma ,CURRENT_TIMESTAMP,'NO','DELETE','requestsevaluation');

ELSE
INSERT INTO log
VALUES(@useronoma ,CURRENT_TIMESTAMP,'YES','DELETE','requestsevaluation');

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `requestspromotion`
--

DROP TABLE IF EXISTS `requestspromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestspromotion` (
  `emplo_username` varchar(12) NOT NULL,
  `jobID` int NOT NULL,
  PRIMARY KEY (`emplo_username`,`jobID`),
  KEY `EVALJOB` (`jobID`),
  CONSTRAINT `EVALEMPLO` FOREIGN KEY (`emplo_username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EVALJOB` FOREIGN KEY (`jobID`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestspromotion`
--

LOCK TABLES `requestspromotion` WRITE;
/*!40000 ALTER TABLE `requestspromotion` DISABLE KEYS */;
INSERT INTO `requestspromotion` VALUES ('cleogeo',1),('elenineo',1),('abrown',111),('elenineo',111),('elenineo',123),('elenineo',456),('mnikol',456),('elenineo',654),('elenineo',789),('elenineo',963);
/*!40000 ALTER TABLE `requestspromotion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `applyingforjob_promotion` BEFORE INSERT ON `requestspromotion` FOR EACH ROW BEGIN

  IF NEW.job_id NOT IN (SELECT id_job FROM promotion WHERE id_job=NEW.job_id)
  THEN 
          SIGNAL SQLSTATE VALUE '45000'
  SET MESSAGE_TEXT = 'There is no promotion for this job.';
  

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(12) NOT NULL,
  `password` varchar(10) DEFAULT NULL,
  `name` varchar(25) NOT NULL DEFAULT 'unknown',
  `surname` varchar(35) NOT NULL DEFAULT 'unknown',
  `reg_date` datetime DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=greek;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('abrown','w1lcoxon','Andrew','McBrown','2018-01-27 16:02:56','andrewbr@yahoo.com'),('adonkab','kab78','Adonis','Kabouris','2010-01-01 10:16:20','adon@mail.gr'),('akisgoud','we341','Akis','Goudis','2008-06-17 13:15:00','ak@hotmail.com'),('cleogeo','upL34r','Cleomenis','Georgiadis','2018-02-13 12:23:34','cleom17@gmail.com'),('dionkok','67kok','Dionisios','Kokkinakis','2000-02-12 16:00:41','dionk@hotmail.com'),('efstang','ef38','Efstathios','Anagnwstakis','2006-05-14 15:20:59','anagef@yahoo.gr'),('elefasla','555','Eleftheria','Aslanoglou','2021-01-28 00:47:56','eleftheria@yahoo.gr'),('elenineo','369','Eleni','Neofytou','2016-01-06 14:50:00','neofytoue@gmail.com'),('hlgeor','hlias90','Hlias','Georgiadis','2003-02-12 12:00:21','hl20@mail.com'),('iosifzax','543','Iosif','Zaxariou','2007-01-08 11:00:00','zaxar@mail.com'),('jennyk','k555','Jenny','Kiriakou','2013-03-20 20:21:00','jenkir@gmail.com'),('kwstasneo','2149','Neofytos','Kwstas','2005-03-14 16:10:00','neofytos@gmail.com'),('liagourma','sionpass','Maria','Liagkoumi','2018-05-22 17:03:01','mliagkr@gmail.com'),('lionarF','erg2378','Freddy','Lionar','2018-10-07 20:09:10','Lionarfre@ezra.co.uk'),('lolapol','wait1','Lola','Politi','2021-01-28 00:24:58','lolapol@gmail.com'),('mairypap','646','Mairy','Papas','2006-12-05 14:05:00','mapapado@yahoo.com'),('marzax','348','Maria','Zaxariou','2011-02-20 17:00:00','zaxarm@mail.com'),('miltH','milto95','Miltiadis','Hristidis','2019-07-22 16:51:32','miltiadis@yahoo.com'),('mnikol','m@n0lis','Manolis','Nikopoloulos','2017-11-08 21:07:12','nikolp@gmail.com'),('msmith','lol123','Mike','Smith','2014-02-01 17:00:00','msmith@hotmail.com'),('nikipap','343','Niki','Papadopoulou','2010-04-03 14:00:00','papadopoulou@gmail.com'),('nikospap','1123','Nikos','Papadopoulos','1992-10-02 12:00:00','papadop@gmail.com'),('niktsakon','n1k@s','Nikitas','Tsakonas','2021-01-28 01:25:00','nikitastsak@hotmail.com'),('panxrist','112','Panagioths','Xristopoulos','1995-05-20 14:00:00','xristo@mail.com'),('ptolkor','222','Ptolemaios','Koromilas','2003-05-16 14:10:00','koromilas@yahoo.com'),('stavroskost','166','Stavros','Kostopoulos','2004-09-25 09:00:00','kostopoulos@hotmail.com'),('swtirzan','swt235','Swtiris','Zanos','2007-03-12 18:05:30','swtiris@yahoo.com'),('Theoxrist','253','Theodwra','Xristou','2001-11-12 12:21:00','theodxristo@gmail.com'),('vasmitr','515','Vasiliki','Dimitriou','2009-02-20 13:00:00','dimitr@hotmail.com'),('vlasster','sterr','Vlassis','Stergiou','2005-12-25 14:20:00','stervl@gmail.gr'),('xristanag','764','Xristina','Anagnwstopoulou','2011-09-01 10:00:00','anagnos@hotmail.gr'),('zazahir23','zoolhger','Ahmet','Mobasher-Hirs','2017-05-11 14:08:23','ahmetTech@yahoo.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `usercannotchangefields` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN
IF (@useronoma IN (SELECT managerUsername FROM manager)) THEN
SET NEW.username=OLD.username;
SET NEW.name=OLD.name;
SET NEW.surname=OLD.surname;

SET NEW.reg_date=OLD.reg_date;

ELSEIF(@useronoma IN (SELECT username FROM evaluator)) THEN
SET NEW.username=OLD.username;

ELSEIF(@useronoma IN (SELECT username FROM employee)) THEN
SET NEW.email=OLD.email;

SET NEW.username=OLD.username;
SET NEW.name=OLD.name;
SET NEW.surname=OLD.surname;
SET NEW.reg_date=OLD.reg_date;

ELSEIF(@useronoma IN (SELECT username FROM administrator)) THEN
SET NEW.username=OLD.username;


END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'staffevaluation'
--
/*!50003 DROP PROCEDURE IF EXISTS `admininsert_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admininsert_employee`(IN e_username varchar(12),IN e_password varchar(10),IN e_name varchar(25),IN e_surname varchar(35) ,IN e_email varchar(30),IN e_exp_years INT,IN  e_bio text,IN  e_sistatikes varchar(35),IN e_certificates varchar(35),IN e_awards varchar(35),IN e_firm char(9))
BEGIN
INSERT INTO user 
VALUES(e_username,e_password,e_name,e_surname,CURRENT_TIMESTAMP,e_email);
INSERT INTO employee
VALUES(e_username,e_exp_years,e_bio,e_sistatikes,e_certificates,e_awards,e_firm);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admininsert_evaluator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admininsert_evaluator`(IN eval_username varchar(12),IN eval_password varchar(10),IN eval_name varchar(25),IN eval_surname varchar(35) ,IN eval_email varchar(30),IN eval_exp_years INT,IN eval_firm char(9))
BEGIN
INSERT INTO user 
VALUES(eval_username,eval_password,eval_name,eval_surname,CURRENT_TIMESTAMP,eval_email);
INSERT INTO evaluator
VALUES(eval_username,eval_exp_years,eval_firm);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admininsert_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admininsert_manager`(IN man_username varchar(12),IN password varchar(10),IN name varchar(25),IN surname varchar(35) ,IN email varchar(30),IN exp_years INT,IN firm char(9))
BEGIN
 INSERT INTO user 
VALUES(man_username,password,name,surname,CURRENT_TIMESTAMP,email);
INSERT INTO manager
VALUES(man_username,exp_years,firm);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `aitiseis_aksiologiseis_evaluatorOfEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aitiseis_aksiologiseis_evaluatorOfEmployee`(IN Name varchar(25), IN SurName varchar(35))
BEGIN

DECLARE Username VARCHAR(12);
SELECT username INTO Username FROM user WHERE user.name=Name AND user.surname=SurName;

IF(Username NOT IN (SELECT empl_usrname FROM requestsevaluation) AND Username NOT IN (SELECT emplo_username FROM requestspromotion)) THEN
SELECT 'There are no evaluation and promotion requests for this employee.';

ELSE 
SELECT 'Evaluation requests:';
SELECT empl_usrname,job_id FROM requestsevaluation INNER JOIN employee ON employee.username=empl_usrname 
INNER JOIN user ON user.username=employee.username WHERE user.name=Name AND user.surname=SurName;
SELECT 'Promotion requests:';
SELECT emplo_username,jobID FROM requestspromotion INNER JOIN employee ON employee.username=emplo_username 
INNER JOIN user ON user.username=employee.username WHERE user.name=Name AND user.surname=SurName;
END IF;

IF(Username NOT IN (SELECT empl_usrname FROM evaluationresult)) THEN
SELECT 'This employee hasnt been fully evaluated.';

ELSE
SELECT EvId,empl_usrname,job_id,grade,comments FROM evaluationresult INNER JOIN employee ON employee.username=empl_usrname 
INNER JOIN user ON user.username=employee.username WHERE user.name=Name AND user.surname=SurName;

SELECT evalusername FROM evaluation INNER JOIN employee ON employee.username=emplusername 
INNER JOIN user ON user.username=employee.username WHERE user.name=Name AND user.surname=SurName; 

END IF;


IF(Username NOT IN (SELECT emplusername FROM evaluation)) THEN
SELECT 'This employee hasnt been evaluated at all.';

ELSE 

SELECT 'Aksiologisi se ekseliksi.'; 
SELECT emplusername,evalusername,jobid,aksiologisi1,aksiologisi2,aksiologisi3,comments,eval_id  FROM evaluation INNER JOIN employee ON employee.username=emplusername 
INNER JOIN user ON user.username=employee.username WHERE user.name=Name AND user.surname=SurName AND (aksiologisi1 IS NULL OR aksiologisi2 IS NULL OR aksiologisi3 IS NULL); 

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `allaksestoixeiaemployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `allaksestoixeiaemployee`(IN manager_user varchar(12),IN emplusername varchar(12),IN sistat varchar(35),IN certific varchar(35),IN vraveia varchar(35))
BEGIN 
call emfanisefakeloemployee(manager_user);
UPDATE employee set sistatikes = sistat, certificates = certific , awards= vraveia WHERE employee.username=emplusername;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `blepeifakelo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `blepeifakelo`(IN employeeusername varchar(12))
BEGIN 
SELECT employee.username,exp_years,bio,sistatikes,certificates,awards,firm FROM employee INNER JOIN user ON user.username=employee.username WHERE user.username=employeeusername;
SELECT username,password,name,surname,reg_date,email FROM user  WHERE user.username=employeeusername;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `emfaniseapotelesmataston_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `emfaniseapotelesmataston_manager`(IN managusername varchar(12))
BEGIN
SELECT EvId,empl_usrname,job_id,grade,comments FROM evaluationresult INNER JOIN employee ON username=empl_usrname INNER JOIN company ON AFM=employee.firm 
INNER JOIN manager ON manager.firm=AFM WHERE managerUsername=managusername;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `emfanisefakeloemployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `emfanisefakeloemployee`(IN user_manager varchar(12))
BEGIN
DECLARE compan char(9);
SELECT firm INTO compan FROM manager WHERE managerUsername=user_manager;
SELECT * from employee WHERE employee.firm =compan;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `emfanise_averagevathmo_anaevaluator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `emfanise_averagevathmo_anaevaluator`(IN manag_uname varchar(12))
BEGIN
DECLARE average_vathmos INT;
DECLARE aksiologitis varchar(12);
DECLARE finished_flag INT;

DECLARE evalcursor CURSOR FOR SELECT evalusername FROM evaluation INNER JOIN evaluator ON evaluator.username=evalusername INNER JOIN company ON AFM=evaluator.firm 
INNER JOIN manager ON manager.firm=AFM WHERE managerUsername=manag_uname;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished_flag=1;
OPEN evalcursor;
SET finished_flag=0;


REPEAT 
  FETCH evalcursor INTO aksiologitis;
  IF(finished_flag=0) THEN 
          Select evalusername,(SUM(aksiologisi1+aksiologisi2+aksiologisi3)/COUNT(aksiologitis)) as AverageGrade
from evaluation where evalusername=aksiologitis group by aksiologitis;
  END IF;
       UNTIL (finished_flag=1)
       END REPEAT;
       CLOSE evalcursor;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `evaluator_seejobpromotions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `evaluator_seejobpromotions`(IN eval_username varchar(12))
BEGIN
DECLARE etaireia char(9);
SELECT firm INTO etaireia  FROM evaluator WHERE evaluator.username=eval_username;
SELECT id,start_date,salary,position,edra,evaluator,announce_date,submission_date FROM job INNER JOIN evaluator ON evaluator.username=evaluator WHERE firm=etaireia AND id IN (SELECT id_job from promotion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `evaluator_updatejobpromotion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `evaluator_updatejobpromotion`(IN PJid int,IN pjstart_date date,IN pjsalary float,IN pjposition varchar(40),IN pjedra varchar(45),IN eval_username varchar(12) ,IN pjsubmission_date date)
BEGIN

UPDATE job SET start_date=pjstart_date ,salary=pjsalary, position=pjposition, edra=pjedra, announce_date=CURRENT_TIMESTAMP, submission_date=pjsubmission_date WHERE id=PJid  AND evaluator=eval_username;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertjobpromotion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertjobpromotion`(IN id int,IN start_date date,IN salary float,IN position varchar(40),IN edra varchar(45),IN eval_username varchar(12) ,IN submission_date date,IN antikeim_title varchar(36))
BEGIN
DECLARE etaireia char(9);
DECLARE manager varchar(12);
SELECT firm INTO etaireia FROM evaluator WHERE evaluator.username=eval_username;
SELECT managerUsername into manager from manager where firm=etaireia;

INSERT INTO job
VALUES(id,start_date,salary,position,edra,eval_username,CURRENT_TIMESTAMP,submission_date);
INSERT INTO promotion
VALUES(manager,eval_username,id);
INSERT INTO needs
VALUES(id,antikeim_title);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jobsinevaluatorscompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsinevaluatorscompany`(IN eval_username varchar(12))
BEGIN
DECLARE etairia char(9);
SELECT firm INTO etairia FROM evaluator WHERE username=eval_username;
SELECT id,start_date,salary,position,edra,evaluator,announce_date,submission_date FROM job INNER JOIN evaluator ON evaluator.username=evaluator WHERE firm=etairia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `oristikopoihmenes_aksiologhseis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `oristikopoihmenes_aksiologhseis`(IN kwdikos_job INT(4))
BEGIN


DECLARE COUNTER INT;

SELECT COUNT(*) INTO COUNTER from evaluation where jobid=kwdikos_job AND (aksiologisi1 IS NULL OR aksiologisi2 IS NULL OR aksiologisi3 IS NULL);

IF (kwdikos_job NOT IN (SELECT job_id FROM evaluationresult)) THEN
SELECT 'Den iparxei aksiologisi gia auth thn thesh.';
ELSE 
SELECT 'Oristikopoihmenoi pinakes.';
SELECT * FROM evaluationresult WHERE job_id=kwdikos_job ORDER BY grade DESC;
END IF;

IF(kwdikos_job IN(SELECT jobid FROM evaluation WHERE (aksiologisi1 IS  NULL OR aksiologisi2 IS  NULL OR aksiologisi3 IS NULL)))
 THEN
SELECT * FROM evaluation WHERE jobid=kwdikos_job AND (aksiologisi1 IS NULL OR aksiologisi2 IS NULL OR aksiologisi3 IS NULL) ORDER BY aksiologisi1,aksiologisi2,aksiologisi3 DESC;

ELSE
SELECT 'Den iparxoyn aksiologiseis se ekseliksi gia ayth thn thesi.';
END IF;

IF(COUNTER >0 ) THEN
SELECT 'Aksiologisi se ekseliksi...ekremmoun aitiseis';
SELECT COUNTER;

ELSE
SELECT 'Den uparxoun upopshfioi';

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paretousername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paretousername`(IN usernamexrhsth varchar(12))
BEGIN
 SET @useronoma=usernamexrhsth;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `requestforjob_promotion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `requestforjob_promotion`(IN username_employee varchar(12),IN id_thesispromotion INT)
BEGIN
IF( username_employee NOT IN (SELECT emplo_username FROM requestspromotion WHERE jobID=id_thesispromotion) AND id_thesispromotion NOT IN(SELECT jobID FROM requestspromotion WHERE emplo_username= username_employee )) THEN
INSERT INTO requestspromotion
VALUES(username_employee,id_thesispromotion);
ELSE 
SELECT 'You have requested for this job.';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showrequestcount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `showrequestcount`(IN thesi_ergasias INT)
BEGIN 
SELECT 'No. of Evaluation Requests';
SELECT COUNT(empl_usrname) AS 'No. of Evaluation Requests' FROM requestsevaluation WHERE job_id=thesi_ergasias;
SELECT 'No. of Promotion Requests';
SELECT COUNT(emplo_username) AS 'No. of Promotion Requests' FROM requestspromotion WHERE jobID=thesi_ergasias;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `syndesicompanyupdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `syndesicompanyupdate`(IN usernamemanager varchar(12),IN phonecmp bigint,IN streetcmp varchar(15),IN numcmp INT,IN citycmp varchar(15),IN countrycmp varchar(15))
BEGIN

DECLARE etairia char(9);
SELECT firm INTO etairia FROM manager WHERE managerUsername=usernamemanager;
UPDATE company SET phone =  phonecmp ,  street =  streetcmp , num =  numcmp , city=citycmp,  country = countrycmp
WHERE AFM=etairia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `syndesimisthos_manager1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `syndesimisthos_manager1`(IN username_manag varchar(12),IN idjob INT,IN salary_job float)
BEGIN
DECLARE Job INT(4);
SELECT id_job INTO Job FROM promotion INNER JOIN manager ON manag_username=managerUsername WHERE managerUsername=username_manag AND id_job=idjob ;

UPDATE job SET salary = salary_job WHERE id=Job;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TelikeskaiOristikopoihmenes_aksiologiseis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TelikeskaiOristikopoihmenes_aksiologiseis`(IN id_thesis INT, IN evaluator_name varchar(12))
BEGIN
DECLARE grade1 INT;
DECLARE grade2 INT;
DECLARE grade3 INT;
DECLARE finishedFlag INT;
DECLARE gcursor CURSOR FOR SELECT aksiologisi1,aksiologisi2,aksiologisi3 
FROM evaluation WHERE jobid=id_thesis AND evalusername=evaluator_name;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN gcursor;
SET finishedFlag=0;

IF(id_thesis NOT IN (SELECT jobid FROM evaluation WHERE jobid=id_thesis )) THEN
SELECT 'There is no evaluation for this job.';
END IF;

IF(evaluator_name NOT IN (SELECT evalusername FROM evaluation WHERE evalusername=evaluator_name )) THEN
SELECT 'There is no evaluation for this job.';
END IF;

REPEAT 
  FETCH gcursor INTO grade1,grade2,grade3;
  IF(finishedFlag=0) THEN

IF(grade1 IS NULL OR grade2 IS NULL OR grade3 IS NULL) THEN
SELECT 'Den iparxoun bathmoi kai stis 3 faseis aksiologisis';
SELECT * FROM evaluation WHERE jobid=id_thesis AND evalusername=evaluator_name AND (aksiologisi1 IS NULL OR aksiologisi2 IS NULL OR aksiologisi3 IS NULL);
          ELSE 
SELECT 'TELIKH KAI ORISTIKOPOIHMENH AKSIOLOGISI';

SELECT * FROM evaluationresult WHERE job_id IN (SELECT jobid FROM evaluation WHERE jobid=id_thesis AND evalusername=evaluator_name 
AND (aksiologisi1 <>'' AND aksiologisi2 <>'' OR aksiologisi3 <>''));
 
 END IF;
        
  END IF;
UNTIL (finishedFlag=1)
END REPEAT;
CLOSE gcursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatejobs_youhaveannounced` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatejobs_youhaveannounced`(IN Jid int,IN jstart_date date,IN jsalary float,IN jposition varchar(40),IN jedra varchar(45),IN eval_username varchar(12) ,IN jsubmission_date date)
BEGIN
UPDATE job SET start_date=jstart_date ,salary=jsalary, position=jposition, edra=jedra, announce_date=CURRENT_TIMESTAMP, submission_date=jsubmission_date WHERE id=Jid  AND evaluator=eval_username;
END ;;
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

-- Dump completed on 2021-02-13 13:08:17

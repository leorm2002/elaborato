-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: elaborato
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `accessori`
--

DROP TABLE IF EXISTS `accessori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessori` (
  `id_accessorio` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(200) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_accessorio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessori`
--

LOCK TABLES `accessori` WRITE;
/*!40000 ALTER TABLE `accessori` DISABLE KEYS */;
INSERT INTO `accessori` VALUES (1,'volante in pelle','volante');
/*!40000 ALTER TABLE `accessori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoveicolo_cliente`
--

DROP TABLE IF EXISTS `autoveicolo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoveicolo_cliente` (
  `id_auto` int NOT NULL AUTO_INCREMENT,
  `targa` varchar(45) DEFAULT NULL,
  `n_telaio` varchar(45) DEFAULT NULL,
  `anno` varchar(45) DEFAULT NULL,
  `proprietario` int DEFAULT NULL,
  PRIMARY KEY (`id_auto`),
  KEY `proprietario_idx` (`proprietario`),
  CONSTRAINT `proprietario` FOREIGN KEY (`proprietario`) REFERENCES `clienti` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoveicolo_cliente`
--

LOCK TABLES `autoveicolo_cliente` WRITE;
/*!40000 ALTER TABLE `autoveicolo_cliente` DISABLE KEYS */;
INSERT INTO `autoveicolo_cliente` VALUES (1,'aa123bb','234242','2010',4),(2,'dd333cc','434334','2020',4);
/*!40000 ALTER TABLE `autoveicolo_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_prenota_intervento`
--

DROP TABLE IF EXISTS `cliente_prenota_intervento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_prenota_intervento` (
  `codice_intervento` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_officina` int NOT NULL,
  `id_intervento` int NOT NULL,
  `costo` float DEFAULT NULL,
  `stato` varchar(45) DEFAULT NULL,
  `giorno` date DEFAULT NULL,
  `auto` int NOT NULL,
  PRIMARY KEY (`codice_intervento`,`id_cliente`,`id_officina`,`id_intervento`),
  KEY `intervento_idx` (`codice_intervento`),
  KEY `cliente_idx` (`id_cliente`),
  KEY `officina_idx` (`id_officina`),
  KEY `intervento_idx1` (`id_intervento`),
  KEY `auto_idx` (`auto`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_prenota_intervento`
--

LOCK TABLES `cliente_prenota_intervento` WRITE;
/*!40000 ALTER TABLE `cliente_prenota_intervento` DISABLE KEYS */;
INSERT INTO `cliente_prenota_intervento` VALUES (21,4,1,1,NULL,NULL,'2020-05-22',1),(27,4,1,1,NULL,NULL,'2020-05-22',1),(30,4,1,1,NULL,NULL,'2020-05-22',1),(31,4,1,1,NULL,NULL,'2020-05-22',1),(32,4,1,1,NULL,NULL,'2020-05-22',1),(35,4,1,1,NULL,NULL,'2020-05-05',1),(40,4,1,1,NULL,NULL,'2020-05-22',1),(43,5,1,1,NULL,NULL,'2021-05-26',2);
/*!40000 ALTER TABLE `cliente_prenota_intervento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `pwd` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'nome','cong','tel','mail@a.com','leo'),(2,'leonardo','naddei','329488840','nadd@gmail.com','pbkdf2:sha256:150000$ykzPbP8E$16a6f7ca2d66dffd33fb72811a25694afd3c643f6a2f5d8aa8272d53887ba5a5'),(3,'leo','leo','lll','a@gmail.com','pbkdf2:sha256:150000$y0CllMNu$a3109208f706bcf85a8a5d0a8cfd06e3b0e52a308c574b74864a32a494ab6117'),(4,'leonardo','naddei','ninin','prova@gmail.com','pbkdf2:sha256:150000$NYrJhATD$2311ecd8122e9fcc0a799320b066bf3be2aec2b13ae4fe22ca64c87528c7d55e'),(5,'BUBUBU','BUBUBU','BUBUB','123@gmail.com','pbkdf2:sha256:150000$lfjX7bln$87ab10698c01004041f1af2b3fd1c73d1c4bb59d195d6b56a22abc720b977330'),(6,'bhbibib','buibuibuibiu','buibiubub','123@123.123','pbkdf2:sha256:150000$ufoiQ1Ss$24f778fb4767601e3b88c075914a60e43b0b6e36539ed73d5ce192d8387eb4d7'),(7,'eff','fef','fef','ihninii@gmail.com','pbkdf2:sha256:150000$2ysTKwZ7$9d342107bdbc84d5a4d3495604733cf6015498e99811b0988937d5b6fdff4a90');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendente_richiede_pezzo`
--

DROP TABLE IF EXISTS `dipendente_richiede_pezzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipendente_richiede_pezzo` (
  `id_dip` int NOT NULL,
  `id_pezzo` int NOT NULL,
  `codice_intervento` int NOT NULL,
  `qunatità` int DEFAULT NULL,
  PRIMARY KEY (`id_dip`,`id_pezzo`,`codice_intervento`),
  KEY `pezzo_idx` (`id_pezzo`),
  KEY `codice_intervento_idx` (`codice_intervento`),
  CONSTRAINT `codice_intervento` FOREIGN KEY (`codice_intervento`) REFERENCES `cliente_prenota_intervento` (`codice_intervento`),
  CONSTRAINT `dipendente` FOREIGN KEY (`id_dip`) REFERENCES `dipendenti` (`id_dipendente`),
  CONSTRAINT `pezzo` FOREIGN KEY (`id_pezzo`) REFERENCES `pezzi_ricambio` (`id_pezzo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendente_richiede_pezzo`
--

LOCK TABLES `dipendente_richiede_pezzo` WRITE;
/*!40000 ALTER TABLE `dipendente_richiede_pezzo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dipendente_richiede_pezzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendenti`
--

DROP TABLE IF EXISTS `dipendenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipendenti` (
  `id_dipendente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `cf` varchar(45) DEFAULT NULL,
  `ruolo` varchar(45) DEFAULT NULL,
  `pwd` varchar(200) DEFAULT NULL,
  `officina` int DEFAULT NULL,
  PRIMARY KEY (`id_dipendente`),
  KEY `off_idx` (`officina`),
  CONSTRAINT `off` FOREIGN KEY (`officina`) REFERENCES `officine` (`codice_officina`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendenti`
--

LOCK TABLES `dipendenti` WRITE;
/*!40000 ALTER TABLE `dipendenti` DISABLE KEYS */;
INSERT INTO `dipendenti` VALUES (1,'pinco','pallo','sv','v','pbkdf2:sha256:150000$ufoiQ1Ss$24f778fb4767601e3b88c075914a60e43b0b6e36539ed73d5ce192d8387eb4d7',1);
/*!40000 ALTER TABLE `dipendenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officina_offre_servizi`
--

DROP TABLE IF EXISTS `officina_offre_servizi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officina_offre_servizi` (
  `id_officina` int NOT NULL,
  `id_servizio` int NOT NULL,
  `tempo_impiegato` int DEFAULT NULL,
  `costo` float DEFAULT NULL,
  PRIMARY KEY (`id_officina`,`id_servizio`),
  KEY `id_servizio_idx` (`id_servizio`),
  CONSTRAINT `id_servizio` FOREIGN KEY (`id_servizio`) REFERENCES `servizi` (`id_servizio`),
  CONSTRAINT `officina` FOREIGN KEY (`id_officina`) REFERENCES `officine` (`codice_officina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officina_offre_servizi`
--

LOCK TABLES `officina_offre_servizi` WRITE;
/*!40000 ALTER TABLE `officina_offre_servizi` DISABLE KEYS */;
INSERT INTO `officina_offre_servizi` VALUES (1,1,2,55),(2,1,2,60);
/*!40000 ALTER TABLE `officina_offre_servizi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officina_possiede_pezzi`
--

DROP TABLE IF EXISTS `officina_possiede_pezzi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officina_possiede_pezzi` (
  `id_officina` int NOT NULL,
  `id_pezzo` int NOT NULL,
  `quantità` int DEFAULT NULL,
  `costo` float DEFAULT NULL,
  PRIMARY KEY (`id_officina`,`id_pezzo`),
  KEY `id_pezzo_idx` (`id_pezzo`),
  CONSTRAINT `id_officina` FOREIGN KEY (`id_officina`) REFERENCES `officine` (`codice_officina`),
  CONSTRAINT `id_pezzo` FOREIGN KEY (`id_pezzo`) REFERENCES `pezzi_ricambio` (`id_pezzo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officina_possiede_pezzi`
--

LOCK TABLES `officina_possiede_pezzi` WRITE;
/*!40000 ALTER TABLE `officina_possiede_pezzi` DISABLE KEYS */;
INSERT INTO `officina_possiede_pezzi` VALUES (1,1,1,100),(1,2,3,100),(1,3,1,1),(1,4,12,12),(1,6,12,12),(2,1,4,120);
/*!40000 ALTER TABLE `officina_possiede_pezzi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officina_vende_accessori`
--

DROP TABLE IF EXISTS `officina_vende_accessori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officina_vende_accessori` (
  `id_officina` int NOT NULL,
  `id_accessorio` int NOT NULL,
  `quantità` int DEFAULT NULL,
  `costo` float DEFAULT NULL,
  PRIMARY KEY (`id_officina`,`id_accessorio`),
  KEY `accessorio_idx` (`id_accessorio`),
  CONSTRAINT `accessorio` FOREIGN KEY (`id_accessorio`) REFERENCES `accessori` (`id_accessorio`),
  CONSTRAINT `officine` FOREIGN KEY (`id_officina`) REFERENCES `officine` (`codice_officina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officina_vende_accessori`
--

LOCK TABLES `officina_vende_accessori` WRITE;
/*!40000 ALTER TABLE `officina_vende_accessori` DISABLE KEYS */;
INSERT INTO `officina_vende_accessori` VALUES (1,1,2,10),(2,1,5,9);
/*!40000 ALTER TABLE `officina_vende_accessori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officine`
--

DROP TABLE IF EXISTS `officine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officine` (
  `codice_officina` int NOT NULL AUTO_INCREMENT,
  `denominazione` varchar(45) DEFAULT NULL,
  `indirizzo` varchar(45) DEFAULT NULL,
  `centrale` tinyint DEFAULT NULL,
  `regione` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codice_officina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officine`
--

LOCK TABLES `officine` WRITE;
/*!40000 ALTER TABLE `officine` DISABLE KEYS */;
INSERT INTO `officine` VALUES (1,'officina iiinin','ia ninin',0,'emilia romagna'),(2,'ininini','ininin',0,'emilia romagna');
/*!40000 ALTER TABLE `officine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pezzi_ricambio`
--

DROP TABLE IF EXISTS `pezzi_ricambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pezzi_ricambio` (
  `id_pezzo` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(200) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pezzo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pezzi_ricambio`
--

LOCK TABLES `pezzi_ricambio` WRITE;
/*!40000 ALTER TABLE `pezzi_ricambio` DISABLE KEYS */;
INSERT INTO `pezzi_ricambio` VALUES (1,'frizione ninnin','frizione'),(2,'motore 123','motore'),(3,'vdvsd','sdvsd'),(4,'dwd','dwd'),(5,'c','c'),(6,'fefe','ffefe'),(7,'sccsc','cscsc'),(8,'eee','pezzo 1'),(9,'feeef','vff'),(10,'r','r');
/*!40000 ALTER TABLE `pezzi_ricambio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servizi`
--

DROP TABLE IF EXISTS `servizi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servizi` (
  `id_servizio` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(200) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_servizio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servizi`
--

LOCK TABLES `servizi` WRITE;
/*!40000 ALTER TABLE `servizi` DISABLE KEYS */;
INSERT INTO `servizi` VALUES (1,'pilizia auto','pulizia');
/*!40000 ALTER TABLE `servizi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'elaborato'
--
/*!50003 DROP FUNCTION IF EXISTS `aggiungi_ricambio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `aggiungi_ricambio`(f_nome varchar(45), f_descrizione varchar(45)) RETURNS int
    DETERMINISTIC
BEGIN
  insert into pezzi_ricambio
        (
            nome,
            descrizione
            
        )
        values
        (
            f_nome,
            f_descrizione
        );
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `client_mail_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `client_mail_exist`(c_mail varchar(45)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
RETURN EXISTS(SELECT mail FROM clienti where mail = c_mail);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `dip_code_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `dip_code_exist`(d_code int) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
RETURN EXISTS(SELECT id_dipendente FROM dipendenti where id_dipendente = d_code);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_delete_pezzo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_delete_pezzo`(f_id int) RETURNS int
    DETERMINISTIC
BEGIN
DELETE FROM `pezzi_ricambio` where id_pezzo = f_id;
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_client_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_client_password`(
	f_mail varchar(45)
) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
RETURN (SELECT pwd FROM clienti
where mail= f_mail);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_dip_officina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_dip_officina`(
	d_code int
) RETURNS int
    DETERMINISTIC
BEGIN
RETURN (SELECT officina FROM dipendenti where id_dipendente= d_code);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_dip_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_dip_password`(
	d_code int
) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
RETURN (SELECT pwd FROM dipendenti where id_dipendente= d_code);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_id_from_mail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_id_from_mail`(c_mail varchar(45)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
RETURN (SELECT id_cliente FROM clienti where mail = c_mail);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `insert_ricambio_officina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `insert_ricambio_officina`(
f_id_off int, f_id_p int, f_q int, p float

) RETURNS int
    DETERMINISTIC
BEGIN
insert into officina_possiede_pezzi
(id_officina, id_pezzo,quantità, costo)
values
(f_id_off,f_id_p ,f_q,p);
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `officina_centrale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `officina_centrale`(
id_off int) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
RETURN EXISTS(
	SELECT centrale FROM officine
	where codice_officina = id_off and centrale =1
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_appuntamenti_officina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_appuntamenti_officina`(
	IN sp_id_off int
)
BEGIN
SELECT giorno as giorno_intervento,auto,servizi.nome as nome_intervento, autoveicolo_cliente.targa FROM cliente_prenota_intervento
left join (officine, servizi, autoveicolo_cliente)
on (autoveicolo_cliente.id_auto = cliente_prenota_intervento.auto and  servizi.id_servizio = cliente_prenota_intervento.id_intervento and officine.codice_officina = cliente_prenota_intervento.id_officina )
where giorno >= DATE(NOW()) and cliente_prenota_intervento.id_officina = sp_id_off;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_appuntamenti_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_appuntamenti_utente`(
	IN sp_id_cliente int
)
BEGIN
SELECT giorno as giorno_intervento,auto,servizi.nome as nome_intervento, officine.denominazione as nome_officina, autoveicolo_cliente.targa FROM cliente_prenota_intervento
left join (officine, servizi, autoveicolo_cliente)
on (autoveicolo_cliente.id_auto = cliente_prenota_intervento.auto and  servizi.id_servizio = cliente_prenota_intervento.id_intervento and officine.codice_officina = cliente_prenota_intervento.id_officina )
where giorno >= DATE(NOW()) and id_cliente = sp_id_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_cars_byOwner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_cars_byOwner`(
IN proprietario int)
BEGIN
SELECT id_auto, targa FROM autoveicolo_cliente
where proprietario = proprietario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_dettaglio_accessorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dettaglio_accessorio`(
IN sp_id_acc int
)
BEGIN
SELECT nome, descrizione,quantità,costo, denominazione FROM 
accessori left join (officina_vende_accessori, officine) ON
(accessori.id_accessorio = officina_vende_accessori.id_accessorio and officina_vende_accessori.id_officina = officine.codice_officina)
where accessori.id_accessorio = sp_id_acc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_dettaglio_intervento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dettaglio_intervento`(IN sp_id_p int
)
BEGIN

SELECT nome, descrizione,tempo_impiegato,costo, denominazione,servizi.id_servizio,officine.codice_officina FROM 
servizi left join (officina_offre_servizi, officine) ON
(servizi.id_servizio = officina_offre_servizi.id_servizio and officina_offre_servizi.id_officina = officine.codice_officina)
where servizi.id_servizio = sp_id_p;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_dettaglio_pezzo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dettaglio_pezzo`(IN sp_id_p int
)
BEGIN

SELECT nome, descrizione,quantità,costo, denominazione FROM 
pezzi_ricambio left join (officina_possiede_pezzi, officine) ON
(pezzi_ricambio.id_pezzo = officina_possiede_pezzi.id_pezzo and officina_possiede_pezzi.id_officina = officine.codice_officina)
where pezzi_ricambio.id_pezzo = sp_id_p;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_elenco_accessori` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_elenco_accessori`()
BEGIN
	SELECT id_accessorio, nome,descrizione FROM accessori;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_elenco_acessori` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_elenco_acessori`()
BEGIN
	SELECT id_accessorio, nome,descrizione FROM accessori;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_elenco_interventi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_elenco_interventi`()
BEGIN
SELECT nome, descrizione,id_servizio FROM elaborato.servizi;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_elenco_ricambi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_elenco_ricambi`()
BEGIN
	SELECT id_pezzo, nome,descrizione FROM pezzi_ricambio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_pezzi_non_officina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pezzi_non_officina`(
in sp_id_off int)
BEGIN
SELECT nome, descrizione, id_pezzo FROM pezzi_ricambio
where id_pezzo not in (
select id_pezzo from officina_possiede_pezzi
where id_officina = sp_id_off
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_pezzi_officina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pezzi_officina`(in sp_id_officina int)
BEGIN
SELECT nome, descrizione, quantità,costo FROM officina_possiede_pezzi
left join pezzi_ricambio
on officina_possiede_pezzi.id_pezzo = pezzi_ricambio.id_pezzo
where id_officina= sp_id_officina;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_aggiungi_accessorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_aggiungi_accessorio`(
			IN sp_nome varchar(45),
			IN sp_descrizione varchar(200)
)
BEGIN
   insert into accessori
        (
            nome,
            descrizione
            
        )
        values
        (
            sp_nome,
            sp_descrizione
        );
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_aggiungi_ricambio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_aggiungi_ricambio`(
			IN sp_nome varchar(45),
			IN sp_descrizione varchar(200)
)
BEGIN
   insert into pezzi_ricambio
        (
            nome,
            descrizione
            
        )
        values
        (
            sp_nome,
            sp_descrizione
        );
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_aggiungi_servizio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_aggiungi_servizio`(
			IN sp_nome varchar(45),
			IN sp_descrizione varchar(200)
)
BEGIN
   insert into servizi
        (
            nome,
            descrizione
            
        )
        values
        (
            sp_nome,
            sp_descrizione
        );
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_createClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createClient`(
			IN c_nome varchar(45),
			IN c_cognome varchar(45),
            IN c_tel varchar(45),
            IN c_mail varchar(45),
            IN c_pwd varchar(200)
)
BEGIN
   IF ( select exists (select 1 from clienti where mail = c_mail) ) THEN
     
        select 'Username Exists !!';
     
    ELSE
     
        insert into clienti
        (
            nome,
            cognome,
            tel,
            mail,
            pwd
        )
        values
        (
            c_nome,
            c_cognome,
            c_tel,
            c_mail,
            c_pwd
        );
     
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_crea_officina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crea_officina`(
			IN sp_denominazione varchar(45),
			IN sp_indirizzo varchar(45),
            IN sp_centrale bool,
            IN sp_regione varchar(45)
)
BEGIN
   insert into officine
        (
            denominazione,
            indirizzo,
            centrale,
            regione
            
        )
        values
        (
            sp_denominazione,
            sp_indirizzo,
            sp_centrale,
            sp_regione
        );
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_crea_prenotazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crea_prenotazione`(
IN sp_id_cliente int,
IN sp_id_officina int,
IN sp_id_intervento int,
IN sp_giorno date,
IN sp_id_auto int
)
BEGIN
insert into 
cliente_prenota_intervento (id_cliente,id_officina,id_intervento,giorno, auto) 
values (sp_id_cliente,sp_id_officina,sp_id_intervento,sp_giorno,sp_id_auto);
select * from cliente_prenota_intervento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_pezzo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_pezzo`(in sp_id int)
BEGIN
DELETE FROM `pezzi_ricambio` where id_pezzo = sp_id;
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

-- Dump completed on 2021-05-27  0:06:24

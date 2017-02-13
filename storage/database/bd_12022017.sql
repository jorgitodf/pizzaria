CREATE DATABASE  IF NOT EXISTS `pizzaria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pizzaria`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzaria
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `tb_bairro`
--

DROP TABLE IF EXISTS `tb_bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_bairro` (
  `id_bairro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_bairro` varchar(100) NOT NULL,
  `fk_id_cidade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_bairro`),
  KEY `fk_tb_bairro_tb_cidade1_idx` (`fk_id_cidade`),
  CONSTRAINT `fk_tb_bairro_tb_cidade1` FOREIGN KEY (`fk_id_cidade`) REFERENCES `tb_cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bairro`
--

LOCK TABLES `tb_bairro` WRITE;
/*!40000 ALTER TABLE `tb_bairro` DISABLE KEYS */;
INSERT INTO `tb_bairro` VALUES (1,'Arapoanga',1),(2,'Santa Maria',1),(3,'Águas Claras',1),(4,'Ceilândia',1),(5,'Núcleo Bandeirante',1),(6,'Octogonal',1),(7,'Asa Norte',1),(8,'Asa Sul',1),(9,'São Sebastião',1),(10,'Brazlândia',1),(11,'Candangolândia',1),(12,'Gama',1),(13,'Cruzeiro Velho',1),(14,'Crizeiro Novo',1),(15,'Lago Sul',1),(16,'Lago Norte',1),(17,'Sobradinho II',1),(18,'Recanto da Emas',1),(19,'Riacho Fundo',1),(20,'Riacho Fundo II',1),(21,'Taguatinga',1),(22,'Guará 1',1),(23,'Guará 2',1),(24,'Paranoá',1),(25,'Itapoã',1),(26,'Graja do Torto',1),(27,'Vicente Pires',1),(28,'SMPW',1),(29,'Sudoeste',1),(30,'Sobradinho I',1);
/*!40000 ALTER TABLE `tb_bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria` (
  `id_categoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cidade`
--

DROP TABLE IF EXISTS `tb_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cidade` (
  `id_cidade` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_cidade` varchar(100) NOT NULL,
  `fk_id_uf` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `fk_tb_cidade_tb_uf1_idx` (`fk_id_uf`),
  CONSTRAINT `fk_tb_cidade_tb_uf1` FOREIGN KEY (`fk_id_uf`) REFERENCES `tb_uf` (`id_uf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=854 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cidade`
--

LOCK TABLES `tb_cidade` WRITE;
/*!40000 ALTER TABLE `tb_cidade` DISABLE KEYS */;
INSERT INTO `tb_cidade` VALUES (1,'Brasília',7),(2,'Abadia dos Dourados',13),(3,'Abaeté',13),(4,'Abre-Campo',13),(5,'Acaiaca',13),(6,'Açucena',13),(7,'Água Boa',13),(8,'Água Comprida',13),(9,'Aguanil',13),(10,'Águas Formosas',13),(11,'Águas Vermelhas',13),(12,'Aimorés',13),(13,'Aiuruoca',13),(14,'Alagoa',13),(15,'Albertina',13),(16,'Além Paraíba',13),(17,'Alfenas',13),(18,'Alfredo Vasconcelos',13),(19,'Almenara',13),(20,'Alpercata',13),(21,'Alpinópolis',13),(22,'Alterosa',13),(23,'Alto Caparaó',13),(24,'Alto Jequitibá',13),(25,'Alto Rio Doce',13),(26,'Alvarenga',13),(27,'Alvinópolis',13),(28,'Alvorada de Minas',13),(29,'Amparo da Serra',13),(30,'Andradas',13),(31,'Andrelândia',13),(32,'Angelândia',13),(33,'Antônio Carlos',13),(34,'Antônio Dias',13),(35,'Antônio Prado de Minas',13),(36,'Araçaí',13),(37,'Aracitaba',13),(38,'Araçuaí',13),(39,'Araguari',13),(40,'Arantina',13),(41,'Araponga',13),(42,'Araporã',13),(43,'Arapuá',13),(44,'Araújos',13),(45,'Araxá',13),(46,'Arceburgo',13),(47,'Arcos',13),(48,'Areado',13),(49,'Argirita',13),(50,'Aricanduva',13),(51,'Arinos',13),(52,'Astolfo Dutra',13),(53,'Ataléia',13),(54,'Augusto de Lima',13),(55,'Baependi',13),(56,'Baldim',13),(57,'Bambuí',13),(58,'Bandeira',13),(59,'Bandeira do Sul',13),(60,'Barão de Cocais',13),(61,'Barão de Monte Alto',13),(62,'Barbacena',13),(63,'Barra Longa',13),(64,'Barroso',13),(65,'Bela Vista de Minas',13),(66,'Belmiro Braga',13),(67,'Belo Horizonte',13),(68,'Belo Oriente',13),(69,'Belo Vale',13),(70,'Berilo',13),(71,'Berizal',13),(72,'Bertópolis',13),(73,'Betim',13),(74,'Bias Fortes',13),(75,'Bicas',13),(76,'Biquinhas',13),(77,'Boa Esperança',13),(78,'Bocaina de Minas',13),(79,'Bocaiuva',13),(80,'Bom Despacho',13),(81,'Bom Jardim de Minas',13),(82,'Bom Jesus da Penha',13),(83,'Bom Jesus do Amparo',13),(84,'Bom Jesus do Galho',13),(85,'Bom Repouso',13),(86,'Bom Sucesso',13),(87,'Bonfim',13),(88,'Bonfinópolis de Minas',13),(89,'Bonito de Minas',13),(90,'Borda da Mata',13),(91,'Botelhos',13),(92,'Botumirim',13),(93,'Brás Pires',13),(94,'Brasilândia de Minas',13),(95,'Brasília de Minas',13),(96,'Brazópolis',13),(97,'Braúnas',13),(98,'Brumadinho',13),(99,'Bueno Brandão',13),(100,'Buenópolis',13),(101,'Bugre',13),(102,'Buritis',13),(103,'Buritizeiro',13),(104,'Cabeceira Grande',13),(105,'Cabo Verde',13),(106,'Cachoeira da Prata',13),(107,'Cachoeira de Minas',13),(108,'Cachoeira de Pajeú',13),(109,'Cachoeira Dourada',13),(110,'Caetanópolis',13),(111,'Caeté',13),(112,'Caiana',13),(113,'Cajuri',13),(114,'Caldas',13),(115,'Camacho',13),(116,'Camanducaia',13),(117,'Cambuí',13),(118,'Cambuquira',13),(119,'Campanário',13),(120,'Campanha',13),(121,'Campestre',13),(122,'Campina Verde',13),(123,'Campo Azul',13),(124,'Campo Belo',13),(125,'Campo do Meio',13),(126,'Campo Florido',13),(127,'Campos Altos',13),(128,'Campos Gerais',13),(129,'Cana Verde',13),(130,'Canaã',13),(131,'Canápolis',13),(132,'Candeias',13),(133,'Cantagalo',13),(134,'Caparaó',13),(135,'Capela Nova',13),(136,'Capelinha',13),(137,'Capetinga',13),(138,'Capim Branco',13),(139,'Capinópolis',13),(140,'Capitão Andrade',13),(141,'Capitão Enéas',13),(142,'Capitólio',13),(143,'Caputira',13),(144,'Caraí',13),(145,'Caranaíba',13),(146,'Carandaí',13),(147,'Carangola',13),(148,'Caratinga',13),(149,'Carbonita',13),(150,'Careaçu',13),(151,'Carlos Chagas',13),(152,'Carmésia',13),(153,'Carmo da Cachoeira',13),(154,'Carmo da Mata',13),(155,'Carmo de Minas',13),(156,'Carmo do Cajuru',13),(157,'Carmo do Paranaíba',13),(158,'Carmo do Rio Claro',13),(159,'Carmópolis de Minas',13),(160,'Carneirinho',13),(161,'Carrancas',13),(162,'Carvalhópolis',13),(163,'Carvalhos',13),(164,'Casa Grande',13),(165,'Cascalho Rico',13),(166,'Cássia',13),(167,'Cataguases',13),(168,'Catas Altas',13),(169,'Catas Altas da Noruega',13),(170,'Catuji',13),(171,'Catuti',13),(172,'Caxambu',13),(173,'Cedro do Abaeté',13),(174,'Central de Minas',13),(175,'Centralina',13),(176,'Chácara',13),(177,'Chalé',13),(178,'Chapada do Norte',13),(179,'Chapada Gaúcha',13),(180,'Chiador',13),(181,'Cipotânea',13),(182,'Claraval',13),(183,'Claro dos Poções',13),(184,'Cláudio',13),(185,'Coimbra',13),(186,'Coluna',13),(187,'Comendador Gomes',13),(188,'Comercinho',13),(189,'Conceição da Aparecida',13),(190,'Conceição da Barra de Minas',13),(191,'Conceição das Alagoas',13),(192,'Conceição das Pedras',13),(193,'Conceição de Ipanema',13),(194,'Conceição do Mato Dentro',13),(195,'Conceição do Pará',13),(196,'Conceição do Rio Verde',13),(197,'Conceição dos Ouros',13),(198,'Cônego Marinho',13),(199,'Confins',13),(200,'Congonhal',13),(201,'Congonhas',13),(202,'Congonhas do Norte',13),(203,'Conquista',13),(204,'Conselheiro Lafaiete',13),(205,'Conselheiro Pena',13),(206,'Consolação',13),(207,'Contagem',13),(208,'Coqueiral',13),(209,'Coração de Jesus',13),(210,'Cordisburgo',13),(211,'Cordislândia',13),(212,'Corinto',13),(213,'Coroaci',13),(214,'Coromandel',13),(215,'Coronel Fabriciano',13),(216,'Coronel Murta',13),(217,'Coronel Pacheco',13),(218,'Coronel Xavier Chaves',13),(219,'Córrego Danta',13),(220,'Córrego do Bom Jesus',13),(221,'Córrego Fundo',13),(222,'Córrego Novo',13),(223,'Couto de Magalhães de Minas',13),(224,'Crisólita',13),(225,'Cristais',13),(226,'Cristália',13),(227,'Cristiano Otoni',13),(228,'Cristina',13),(229,'Crucilândia',13),(230,'Cruzeiro da Fortaleza',13),(231,'Cruzília',13),(232,'Cuparaque',13),(233,'Curral de Dentro',13),(234,'Curvelo',13),(235,'Datas',13),(236,'Delfim Moreira',13),(237,'Delfinópolis',13),(238,'Delta',13),(239,'Descoberto',13),(240,'Desterro de Entre Rios',13),(241,'Desterro do Melo',13),(242,'Diamantina',13),(243,'Diogo de Vasconcelos',13),(244,'Dionísio',13),(245,'Divinésia',13),(246,'Divino',13),(247,'Divino das Laranjeiras',13),(248,'Divinolândia de Minas',13),(249,'Divinópolis',13),(250,'Divisa Alegre',13),(251,'Divisa Nova',13),(252,'Divisópolis',13),(253,'Dom Bosco',13),(254,'Dom Cavati',13),(255,'Dom Joaquim',13),(256,'Dom Silvério',13),(257,'Dom Viçoso',13),(258,'Dona Eusébia',13),(259,'Dores de Campos',13),(260,'Dores de Guanhães',13),(261,'Dores do Indaiá',13),(262,'Dores do Turvo',13),(263,'Doresópolis',13),(264,'Douradoquara',13),(265,'Durandé',13),(266,'Elói Mendes',13),(267,'Engenheiro Caldas',13),(268,'Engenheiro Navarro',13),(269,'Entre Folhas',13),(270,'Entre Rios de Minas',13),(271,'Ervália',13),(272,'Esmeraldas',13),(273,'Espera Feliz',13),(274,'Espinosa',13),(275,'Espírito Santo do Dourado',13),(276,'Estiva',13),(277,'Estrela Dalva',13),(278,'Estrela do Indaiá',13),(279,'Estrela do Sul',13),(280,'Eugenópolis',13),(281,'Ewbank da Câmara',13),(282,'Extrema',13),(283,'Fama',13),(284,'Faria Lemos',13),(285,'Felício dos Santos',13),(286,'Felisburgo',13),(287,'Felixlândia',13),(288,'Fernandes Tourinho',13),(289,'Ferros',13),(290,'Fervedouro',13),(291,'Florestal',13),(292,'Formiga',13),(293,'Formoso',13),(294,'Fortaleza de Minas',13),(295,'Fortuna de Minas',13),(296,'Francisco Badaró',13),(297,'Francisco Dumont',13),(298,'Francisco Sá',13),(299,'Franciscópolis',13),(300,'Frei Gaspar',13),(301,'Frei Inocêncio',13),(302,'Frei Lagonegro',13),(303,'Fronteira',13),(304,'Fronteira dos Vales',13),(305,'Fruta de Leite',13),(306,'Frutal',13),(307,'Funilândia',13),(308,'Galileia',13),(309,'Gameleiras',13),(310,'Glaucilândia',13),(311,'Goiabeira',13),(312,'Goianá',13),(313,'Gonçalves',13),(314,'Gonzaga',13),(315,'Gouveia',13),(316,'Governador Valadares',13),(317,'Grão Mogol',13),(318,'Grupiara',13),(319,'Guanhães',13),(320,'Guapé',13),(321,'Guaraciaba',13),(322,'Guaraciama',13),(323,'Guaranésia',13),(324,'Guarani',13),(325,'Guarará',13),(326,'Guarda-Mor',13),(327,'Guaxupé',13),(328,'Guidoval',13),(329,'Guimarânia',13),(330,'Guiricema',13),(331,'Gurinhatã',13),(332,'Heliodora',13),(333,'Iapu',13),(334,'Ibertioga',13),(335,'Ibiá',13),(336,'Ibiaí',13),(337,'Ibiracatu',13),(338,'Ibiraci',13),(339,'Ibirité',13),(340,'Ibitiúra de Minas',13),(341,'Ibituruna',13),(342,'Icaraí de Minas',13),(343,'Igarapé',13),(344,'Igaratinga',13),(345,'Iguatama',13),(346,'Ijaci',13),(347,'Ilicínea',13),(348,'Imbé de Minas',13),(349,'Inconfidentes',13),(350,'Indaiabira',13),(351,'Indianópolis',13),(352,'Ingaí',13),(353,'Inhapim',13),(354,'Inhaúma',13),(355,'Inimutaba',13),(356,'Ipaba',13),(357,'Ipanema',13),(358,'Ipatinga',13),(359,'Ipiaçu',13),(360,'Ipuiúna',13),(361,'Iraí de Minas',13),(362,'Itabira',13),(363,'Itabirinha',13),(364,'Itabirito',13),(365,'Itacambira',13),(366,'Itacarambi',13),(367,'Itaguara',13),(368,'Itaipé',13),(369,'Itajubá',13),(370,'Itamarandiba',13),(371,'Itamarati de Minas',13),(372,'Itambacuri',13),(373,'Itambé do Mato Dentro',13),(374,'Itamogi',13),(375,'Itamonte',13),(376,'Itanhandu',13),(377,'Itanhomi',13),(378,'Itaobim',13),(379,'Itapagipe',13),(380,'Itapecerica',13),(381,'Itapeva',13),(382,'Itatiaiuçu',13),(383,'Itaú de Minas',13),(384,'Itaúna',13),(385,'Itaverava',13),(386,'Itinga',13),(387,'Itueta',13),(388,'Ituiutaba',13),(389,'Itumirim',13),(390,'Iturama',13),(391,'Itutinga',13),(392,'Jaboticatubas',13),(393,'Jacinto',13),(394,'Jacuí',13),(395,'Jacutinga',13),(396,'Jaguaraçu',13),(397,'Jaíba',13),(398,'Jampruca',13),(399,'Janaúba',13),(400,'Januária',13),(401,'Japaraíba',13),(402,'Japonvar',13),(403,'Jeceaba',13),(404,'Jenipapo de Minas',13),(405,'Jequeri',13),(406,'Jequitaí',13),(407,'Jequitibá',13),(408,'Jequitinhonha',13),(409,'Jesuânia',13),(410,'Joaíma',13),(411,'Joanésia',13),(412,'João Monlevade',13),(413,'João Pinheiro',13),(414,'Joaquim Felício',13),(415,'Jordânia',13),(416,'José Gonçalves de Minas',13),(417,'José Raydan',13),(418,'Josenópolis',13),(419,'Juatuba',13),(420,'Juiz de Fora',13),(421,'Juramento',13),(422,'Juruaia',13),(423,'Juvenília',13),(424,'Ladainha',13),(425,'Lagamar',13),(426,'Lagoa da Prata',13),(427,'Lagoa dos Patos',13),(428,'Lagoa Dourada',13),(429,'Lagoa Formosa',13),(430,'Lagoa Grande',13),(431,'Lagoa Santa',13),(432,'Lajinha',13),(433,'Lambari',13),(434,'Lamim',13),(435,'Laranjal',13),(436,'Lassance',13),(437,'Lavras',13),(438,'Leandro Ferreira',13),(439,'Leme do Prado',13),(440,'Leopoldina',13),(441,'Liberdade',13),(442,'Lima Duarte',13),(443,'Limeira do Oeste',13),(444,'Lontra',13),(445,'Luisburgo',13),(446,'Luislândia',13),(447,'Luminárias',13),(448,'Luz',13),(449,'Machacalis',13),(450,'Machado',13),(451,'Madre de Deus de Minas',13),(452,'Malacacheta',13),(453,'Mamonas',13),(454,'Manga',13),(455,'Manhuaçu',13),(456,'Manhumirim',13),(457,'Mantena',13),(458,'Mar de Espanha',13),(459,'Maravilhas',13),(460,'Maria da Fé',13),(461,'Mariana',13),(462,'Marilac',13),(463,'Mário Campos',13),(464,'Maripá de Minas',13),(465,'Marliéria',13),(466,'Marmelópolis',13),(467,'Martinho Campos',13),(468,'Martins Soares',13),(469,'Mata Verde',13),(470,'Materlândia',13),(471,'Mateus Leme',13),(472,'Mathias Lobato',13),(473,'Matias Barbosa',13),(474,'Matias Cardoso',13),(475,'Matipó',13),(476,'Mato Verde',13),(477,'Matozinhos',13),(478,'Matutina',13),(479,'Medeiros',13),(480,'Medina',13),(481,'Mendes Pimentel',13),(482,'Mercês',13),(483,'Mesquita',13),(484,'Minas Novas',13),(485,'Minduri',13),(486,'Mirabela',13),(487,'Miradouro',13),(488,'Miraí',13),(489,'Miravânia',13),(490,'Moeda',13),(491,'Moema',13),(492,'Monjolos',13),(493,'Monsenhor Paulo',13),(494,'Montalvânia',13),(495,'Monte Alegre de Minas',13),(496,'Monte Azul',13),(497,'Monte Belo',13),(498,'Monte Carmelo',13),(499,'Monte Formoso',13),(500,'Monte Santo de Minas',13),(501,'Monte Sião',13),(502,'Montes Claros',13),(503,'Montezuma',13),(504,'Morada Nova de Minas',13),(505,'Morro da Garça',13),(506,'Morro do Pilar',13),(507,'Munhoz',13),(508,'Muriaé',13),(509,'Mutum',13),(510,'Muzambinho',13),(511,'Nacip Raydan',13),(512,'Nanuque',13),(513,'Naque',13),(514,'Natalândia',13),(515,'Natércia',13),(516,'Nazareno',13),(517,'Nepomuceno',13),(518,'Ninheira',13),(519,'Nova Belém',13),(520,'Nova Era',13),(521,'Nova Lima',13),(522,'Nova Módica',13),(523,'Nova Ponte',13),(524,'Nova Porteirinha',13),(525,'Nova Resende',13),(526,'Nova Serrana',13),(527,'Nova União',13),(528,'Novo Cruzeiro',13),(529,'Novo Oriente de Minas',13),(530,'Novorizonte',13),(531,'Olaria',13),(532,'Olhos-D´Água',13),(533,'Olímpio Noronha',13),(534,'Oliveira',13),(535,'Oliveira Fortes',13),(536,'Onça de Pitangui',13),(537,'Oratórios',13),(538,'Orizânia',13),(539,'Ouro Branco',13),(540,'Ouro Fino',13),(541,'Ouro Preto',13),(542,'Ouro Verde de Minas',13),(543,'Padre Carvalho',13),(544,'Padre Paraíso',13),(545,'Pai Pedro',13),(546,'Paineiras',13),(547,'Pains',13),(548,'Paiva',13),(549,'Palma',13),(550,'Palmópolis',13),(551,'Papagaios',13),(552,'Pará de Minas',13),(553,'Paracatu',13),(554,'Paraguaçu',13),(555,'Paraisópolis',13),(556,'Paraopeba',13),(557,'Passa-Quatro',13),(558,'Passa Tempo',13),(559,'Passabém',13),(560,'Passa-Vinte',13),(561,'Passos',13),(562,'Patis',13),(563,'Patos de Minas',13),(564,'Patrocínio',13),(565,'Patrocínio do Muriaé',13),(566,'Paula Cândido',13),(567,'Paulistas',13),(568,'Pavão',13),(569,'Peçanha',13),(570,'Pedra Azul',13),(571,'Pedra Bonita',13),(572,'Pedra do Anta',13),(573,'Pedra do Indaiá',13),(574,'Pedra Dourada',13),(575,'Pedralva',13),(576,'Pedras de Maria da Cruz',13),(577,'Pedrinópolis',13),(578,'Pedro Leopoldo',13),(579,'Pedro Teixeira',13),(580,'Pequeri',13),(581,'Pequi',13),(582,'Perdigão',13),(583,'Perdizes',13),(584,'Perdões',13),(585,'Periquito',13),(586,'Pescador',13),(587,'Piau',13),(588,'Piedade de Caratinga',13),(589,'Piedade de Ponte Nova',13),(590,'Piedade do Rio Grande',13),(591,'Piedade dos Gerais',13),(592,'Pimenta',13),(593,'Pingo-D´Água',13),(594,'Pintópolis',13),(595,'Piracema',13),(596,'Pirajuba',13),(597,'Piranga',13),(598,'Piranguçu',13),(599,'Piranguinho',13),(600,'Pirapetinga',13),(601,'Pirapora',13),(602,'Piraúba',13),(603,'Pitangui',13),(604,'Piumhi',13),(605,'Planura',13),(606,'Poço Fundo',13),(607,'Poços de Caldas',13),(608,'Pocrane',13),(609,'Pompéu',13),(610,'Ponte Nova',13),(611,'Ponto Chique',13),(612,'Ponto dos Volantes',13),(613,'Porteirinha',13),(614,'Porto Firme',13),(615,'Poté',13),(616,'Pouso Alegre',13),(617,'Pouso Alto',13),(618,'Prados',13),(619,'Prata',13),(620,'Pratápolis',13),(621,'Pratinha',13),(622,'Presidente Bernardes',13),(623,'Presidente Juscelino',13),(624,'Presidente Kubitschek',13),(625,'Presidente Olegário',13),(626,'Prudente de Morais',13),(627,'Quartel Geral',13),(628,'Queluzito',13),(629,'Raposos',13),(630,'Raul Soares',13),(631,'Recreio',13),(632,'Reduto',13),(633,'Resende Costa',13),(634,'Resplendor',13),(635,'Ressaquinha',13),(636,'Riachinho',13),(637,'Riacho dos Machados',13),(638,'Ribeirão das Neves',13),(639,'Ribeirão Vermelho',13),(640,'Rio Acima',13),(641,'Rio Casca',13),(642,'Rio do Prado',13),(643,'Rio Doce',13),(644,'Rio Espera',13),(645,'Rio Manso',13),(646,'Rio Novo',13),(647,'Rio Paranaíba',13),(648,'Rio Pardo de Minas',13),(649,'Rio Piracicaba',13),(650,'Rio Pomba',13),(651,'Rio Preto',13),(652,'Rio Vermelho',13),(653,'Ritápolis',13),(654,'Rochedo de Minas',13),(655,'Rodeiro',13),(656,'Romaria',13),(657,'Rosário da Limeira',13),(658,'Rubelita',13),(659,'Rubim',13),(660,'Sabará',13),(661,'Sabinópolis',13),(662,'Sacramento',13),(663,'Salinas',13),(664,'Salto da Divisa',13),(665,'Santa Bárbara',13),(666,'Santa Bárbara do Leste',13),(667,'Santa Bárbara do Monte Verde',13),(668,'Santa Bárbara do Tugúrio',13),(669,'Santa Cruz de Minas',13),(670,'Santa Cruz de Salinas',13),(671,'Santa Cruz do Escalvado',13),(672,'Santa Efigênia de Minas',13),(673,'Santa Fé de Minas',13),(674,'Santa Helena de Minas',13),(675,'Santa Juliana',13),(676,'Santa Luzia',13),(677,'Santa Margarida',13),(678,'Santa Maria de Itabira',13),(679,'Santa Maria do Salto',13),(680,'Santa Maria do Suaçuí',13),(681,'Santa Rita de Caldas',13),(682,'Santa Rita de Ibitipoca',13),(683,'Santa Rita de Jacutinga',13),(684,'Santa Rita de Minas',13),(685,'Santa Rita do Itueto',13),(686,'Santa Rita do Sapucaí',13),(687,'Santa Rosa da Serra',13),(688,'Santa Vitória',13),(689,'Santana da Vargem',13),(690,'Santana de Cataguases',13),(691,'Santana de Pirapama',13),(692,'Santana do Deserto',13),(693,'Santana do Garambéu',13),(694,'Santana do Jacaré',13),(695,'Santana do Manhuaçu',13),(696,'Santana do Paraíso',13),(697,'Santana do Riacho',13),(698,'Santana dos Montes',13),(699,'Santo Antônio do Amparo',13),(700,'Santo Antônio do Aventureiro',13),(701,'Santo Antônio do Grama',13),(702,'Santo Antônio do Itambé',13),(703,'Santo Antônio do Jacinto',13),(704,'Santo Antônio do Monte',13),(705,'Santo Antônio do Retiro',13),(706,'Santo Antônio do Rio Abaixo',13),(707,'Santo Hipólito',13),(708,'Santos Dumont',13),(709,'São Bento Abade',13),(710,'São Brás do Suaçuí',13),(711,'São Domingos das Dores',13),(712,'São Domingos do Prata',13),(713,'São Félix de Minas',13),(714,'São Francisco',13),(715,'São Francisco de Paula',13),(716,'São Francisco de Sales',13),(717,'São Francisco do Glória',13),(718,'São Geraldo',13),(719,'São Geraldo da Piedade',13),(720,'São Geraldo do Baixio',13),(721,'São Gonçalo do Abaeté',13),(722,'São Gonçalo do Pará',13),(723,'São Gonçalo do Rio Abaixo',13),(724,'São Gonçalo do Rio Preto',13),(725,'São Gonçalo do Sapucaí',13),(726,'São Gotardo',13),(727,'São João Batista do Glória',13),(728,'São João da Lagoa',13),(729,'São João da Mata',13),(730,'São João da Ponte',13),(731,'São João das Missões',13),(732,'São João del-Rei',13),(733,'São João do Manhuaçu',13),(734,'São João do Manteninha',13),(735,'São João do Oriente',13),(736,'São João do Pacuí',13),(737,'São João do Paraíso',13),(738,'São João Evangelista',13),(739,'São João Nepomuceno',13),(740,'São Joaquim de Bicas',13),(741,'São José da Barra',13),(742,'São José da Lapa',13),(743,'São José da Safira',13),(744,'São José da Varginha',13),(745,'São José do Alegre',13),(746,'São José do Divino',13),(747,'São José do Goiabal',13),(748,'São José do Jacuri',13),(749,'São José do Mantimento',13),(750,'São Lourenço',13),(751,'São Miguel do Anta',13),(752,'São Pedro da União',13),(753,'São Pedro do Suaçuí',13),(754,'São Pedro dos Ferros',13),(755,'São Romão',13),(756,'São Roque de Minas',13),(757,'São Sebastião da Bela Vista',13),(758,'São Sebastião da Vargem Alegre',13),(759,'São Sebastião do Anta',13),(760,'São Sebastião do Maranhão',13),(761,'São Sebastião do Oeste',13),(762,'São Sebastião do Paraíso',13),(763,'São Sebastião do Rio Preto',13),(764,'São Sebastião do Rio Verde',13),(765,'São Thomé das Letras',13),(766,'São Tiago',13),(767,'São Tomás de Aquino',13),(768,'São Vicente de Minas',13),(769,'Sapucaí-Mirim',13),(770,'Sardoá',13),(771,'Sarzedo',13),(772,'Sem-Peixe',13),(773,'Senador Amaral',13),(774,'Senador Cortes',13),(775,'Senador Firmino',13),(776,'Senador José Bento',13),(777,'Senador Modestino Gonçalves',13),(778,'Senhora de Oliveira',13),(779,'Senhora do Porto',13),(780,'Senhora dos Remédios',13),(781,'Sericita',13),(782,'Seritinga',13),(783,'Serra Azul de Minas',13),(784,'Serra da Saudade',13),(785,'Serra do Salitre',13),(786,'Serra dos Aimorés',13),(787,'Serrania',13),(788,'Serranópolis de Minas',13),(789,'Serranos',13),(790,'Serro',13),(791,'Sete Lagoas',13),(792,'Setubinha',13),(793,'Silveirânia',13),(794,'Silvianópolis',13),(795,'Simão Pereira',13),(796,'Simonésia',13),(797,'Sobrália',13),(798,'Soledade de Minas',13),(799,'Tabuleiro',13),(800,'Taiobeiras',13),(801,'Taparuba',13),(802,'Tapira',13),(803,'Tapiraí',13),(804,'Taquaraçu de Minas',13),(805,'Tarumirim',13),(806,'Teixeiras',13),(807,'Teófilo Otoni',13),(808,'Timóteo',13),(809,'Tiradentes',13),(810,'Tiros',13),(811,'Tocantins',13),(812,'Tocos do Moji',13),(813,'Toledo',13),(814,'Tombos',13),(815,'Três Corações',13),(816,'Três Marias',13),(817,'Três Pontas',13),(818,'Tumiritinga',13),(819,'Tupaciguara',13),(820,'Turmalina',13),(821,'Turvolândia',13),(822,'Ubá',13),(823,'Ubaí',13),(824,'Ubaporanga',13),(825,'Uberaba',13),(826,'Uberlândia',13),(827,'Umburatiba',13),(828,'Unaí',13),(829,'União de Minas',13),(830,'Uruana de Minas',13),(831,'Urucânia',13),(832,'Urucuia',13),(833,'Vargem Alegre',13),(834,'Vargem Bonita',13),(835,'Vargem Grande do Rio Pardo',13),(836,'Varginha',13),(837,'Varjão de Minas',13),(838,'Várzea da Palma',13),(839,'Varzelândia',13),(840,'Vazante',13),(841,'Verdelândia',13),(842,'Veredinha',13),(843,'Veríssimo',13),(844,'Vermelho Novo',13),(845,'Vespasiano',13),(846,'Viçosa',13),(847,'Vieiras',13),(848,'Virgem da Lapa',13),(849,'Virgínia',13),(850,'Virginópolis',13),(851,'Virgolândia',13),(852,'Visconde do Rio Branco',13),(853,'Volta Grande',13);
/*!40000 ALTER TABLE `tb_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cpf` bigint(11) unsigned zerofill DEFAULT NULL,
  `tipo_cliente` enum('Cliente','Admin','Func') NOT NULL DEFAULT 'Cliente',
  `nome_completo` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(220) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `fk_id_permissao_grupo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_tb_cliente_tb_permissao_grupo1_idx` (`fk_id_permissao_grupo`),
  CONSTRAINT `fk_tb_cliente_tb_permissao_grupo1` FOREIGN KEY (`fk_id_permissao_grupo`) REFERENCES `tb_permissao_grupo` (`id_permissao_grupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (6,NULL,'Cliente','Jorgito da Silva Paiva',NULL,'jspaiva.1977@gmail.com','$2a$08$Cf1f11ePArKlBJomM0F6a.IxU0M3gvPpr/DHek8nUTRUAhCaK23c.','2017-02-11 08:22:16',1),(7,NULL,'Cliente','Sergio Loroza',NULL,'sergio@gmail.com','$2a$08$Cf1f11ePArKlBJomM0F6a.IxU0M3gvPpr/DHek8nUTRUAhCaK23c.','2017-02-11 10:24:56',2);
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_endereco` (
  `id_endereco` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `complemento` varchar(90) NOT NULL,
  `numero` varchar(12) NOT NULL,
  `cep` bigint(8) unsigned zerofill NOT NULL,
  `fk_id_bairro` int(10) unsigned NOT NULL,
  `fk_id_logradouro` smallint(5) unsigned NOT NULL,
  `fk_id_cliente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `fk_tb_endereco_tb_bairro1_idx` (`fk_id_bairro`) USING BTREE,
  KEY `fk_tb_endereco_tb_logradouro1_idx` (`fk_id_logradouro`) USING BTREE,
  KEY `fk_tb_endereco_tb_cliente1_idx` (`fk_id_cliente`) USING BTREE,
  CONSTRAINT `fk_tb_endereco_tb_bairro1` FOREIGN KEY (`fk_id_bairro`) REFERENCES `tb_bairro` (`id_bairro`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_endereco_tb_cliente1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_endereco_tb_logradouro1` FOREIGN KEY (`fk_id_logradouro`) REFERENCES `tb_logradouro` (`id_logradouro`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` VALUES (2,'16 Conjunto A Casa','19',73050161,30,25,6);
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_historico_produto`
--

DROP TABLE IF EXISTS `tb_historico_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_historico_produto` (
  `id_historico_produto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acao` varchar(160) NOT NULL,
  `data_Acao` datetime NOT NULL,
  `fk_id_produto` int(10) unsigned NOT NULL,
  `fk_id_cliente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_historico_produto`),
  KEY `fk_tb_historico_produto_tb_produto1_idx` (`fk_id_produto`),
  KEY `fk_tb_historico_produto_tb_cliente1_idx` (`fk_id_cliente`),
  CONSTRAINT `fk_tb_historico_produto_tb_cliente1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_historico_produto_tb_produto1` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_historico_produto`
--

LOCK TABLES `tb_historico_produto` WRITE;
/*!40000 ALTER TABLE `tb_historico_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_historico_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_itens_pedido`
--

DROP TABLE IF EXISTS `tb_itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_itens_pedido` (
  `id_itens_pedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantidade` mediumint(3) unsigned NOT NULL,
  `valor_unitario` decimal(6,2) NOT NULL,
  `fk_id_pedido` int(8) unsigned zerofill NOT NULL,
  `fk_id_produto` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_itens_pedido`),
  KEY `fk_tb_itens_pedido_tb_pedido_idx` (`fk_id_pedido`) USING BTREE,
  KEY `fk_tb_itens_pedido_tb_produto_idx` (`fk_id_produto`) USING BTREE,
  CONSTRAINT `fk_tb_itens_pedido_tb_pedido` FOREIGN KEY (`fk_id_pedido`) REFERENCES `tb_pedido` (`id_pedido`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_itens_pedido_tb_produto` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produto` (`id_produto`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_itens_pedido`
--

LOCK TABLES `tb_itens_pedido` WRITE;
/*!40000 ALTER TABLE `tb_itens_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_logradouro`
--

DROP TABLE IF EXISTS `tb_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_logradouro` (
  `id_logradouro` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nome_logradouro` varchar(100) NOT NULL,
  PRIMARY KEY (`id_logradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_logradouro`
--

LOCK TABLES `tb_logradouro` WRITE;
/*!40000 ALTER TABLE `tb_logradouro` DISABLE KEYS */;
INSERT INTO `tb_logradouro` VALUES (1,'Alameda'),(2,'Avenida'),(3,'Beco'),(4,'Boulevard'),(5,'Caminho'),(6,'Cais'),(7,'Campo'),(8,'Condomínio'),(9,'Escada'),(10,'Estrada'),(11,'Favela'),(12,'Fazenda'),(13,'Floresta'),(14,'Ilha'),(15,'Jardim'),(16,'Ladeira'),(17,'Largo'),(18,'Loteamento'),(19,'Lugar'),(20,'Morro'),(21,'Parque'),(22,'Passeio'),(23,'Praia'),(24,'Praça'),(25,'Quadra'),(26,'Recanto'),(27,'Rodovia'),(28,'Rua'),(29,'Setor'),(30,'Servidão'),(31,'Travessa'),(32,'Via'),(33,'Vila');
/*!40000 ALTER TABLE `tb_logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pedido` (
  `id_pedido` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `data_pedido` datetime NOT NULL,
  `valor_total` varchar(45) NOT NULL,
  `tempo_entrega` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_id_cliente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_tb_pedido_tb_cliente1_idx` (`fk_id_cliente`),
  CONSTRAINT `fk_tb_pedido_tb_cliente1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido`
--

LOCK TABLES `tb_pedido` WRITE;
/*!40000 ALTER TABLE `tb_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permissao_grupo`
--

DROP TABLE IF EXISTS `tb_permissao_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permissao_grupo` (
  `id_permissao_grupo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_grupo` varchar(90) DEFAULT NULL,
  `parametros` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_permissao_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permissao_grupo`
--

LOCK TABLES `tb_permissao_grupo` WRITE;
/*!40000 ALTER TABLE `tb_permissao_grupo` DISABLE KEYS */;
INSERT INTO `tb_permissao_grupo` VALUES (1,'Admin','1'),(2,'Cliente','2'),(10,'Teste 69','2,6');
/*!40000 ALTER TABLE `tb_permissao_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permissao_parametros`
--

DROP TABLE IF EXISTS `tb_permissao_parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permissao_parametros` (
  `id_permissao_parametros` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_parametro` varchar(100) NOT NULL,
  PRIMARY KEY (`id_permissao_parametros`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permissao_parametros`
--

LOCK TABLES `tb_permissao_parametros` WRITE;
/*!40000 ALTER TABLE `tb_permissao_parametros` DISABLE KEYS */;
INSERT INTO `tb_permissao_parametros` VALUES (1,'completo'),(2,'cliente'),(6,'funcionario');
/*!40000 ALTER TABLE `tb_permissao_parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_produto` (
  `id_produto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(70) NOT NULL,
  `descricao` text NOT NULL,
  `volume` varchar(10) DEFAULT NULL,
  `tamanho` enum('P','M','G') DEFAULT NULL,
  `preco_compra` decimal(8,2) NOT NULL,
  `qtd_estoque` mediumint(4) unsigned DEFAULT NULL,
  `valor` decimal(8,2) NOT NULL,
  `fk_id_categoria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_tb_produto_tb_categoria1_idx` (`fk_id_categoria`),
  CONSTRAINT `fk_tb_produto_tb_categoria1` FOREIGN KEY (`fk_id_categoria`) REFERENCES `tb_categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_status`
--

DROP TABLE IF EXISTS `tb_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_status` (
  `id_status` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_status` varchar(70) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_status`
--

LOCK TABLES `tb_status` WRITE;
/*!40000 ALTER TABLE `tb_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_status_pedido`
--

DROP TABLE IF EXISTS `tb_status_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_status_pedido` (
  `id_status_pedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_status` datetime NOT NULL,
  `fk_id_pedido` int(8) unsigned zerofill NOT NULL,
  `fk_id_status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_status_pedido`),
  KEY `fk_tb_status_pedido_tb_pedido1_idx` (`fk_id_pedido`),
  KEY `fk_tb_status_pedido_tb_status1_idx` (`fk_id_status`),
  CONSTRAINT `fk_tb_status_pedido_tb_pedido1` FOREIGN KEY (`fk_id_pedido`) REFERENCES `tb_pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_status_pedido_tb_status1` FOREIGN KEY (`fk_id_status`) REFERENCES `tb_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_status_pedido`
--

LOCK TABLES `tb_status_pedido` WRITE;
/*!40000 ALTER TABLE `tb_status_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_status_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone`
--

DROP TABLE IF EXISTS `tb_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_telefone` (
  `id_telefone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `telefone_celular` bigint(11) unsigned NOT NULL,
  `telefone_fixo` bigint(10) DEFAULT NULL,
  `fk_id_cliente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `fk_tb_contato_tb_cliente_idx` (`fk_id_cliente`),
  CONSTRAINT `fk_tb_contato_tb_cliente` FOREIGN KEY (`fk_id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone`
--

LOCK TABLES `tb_telefone` WRITE;
/*!40000 ALTER TABLE `tb_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_uf`
--

DROP TABLE IF EXISTS `tb_uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_uf` (
  `id_uf` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `sigla_uf` char(2) NOT NULL,
  PRIMARY KEY (`id_uf`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_uf`
--

LOCK TABLES `tb_uf` WRITE;
/*!40000 ALTER TABLE `tb_uf` DISABLE KEYS */;
INSERT INTO `tb_uf` VALUES (1,'AC'),(2,'AL'),(3,'AP'),(4,'AM'),(5,'BA'),(6,'CE'),(7,'DF'),(8,'ES'),(9,'GO'),(10,'MA'),(11,'MT'),(12,'MS'),(13,'MG'),(14,'PR'),(15,'PB'),(16,'PA'),(17,'PE'),(18,'PI'),(19,'RJ'),(20,'RN'),(21,'RS'),(22,'RO'),(23,'RR'),(24,'SC'),(25,'SE'),(26,'SP'),(27,'TO');
/*!40000 ALTER TABLE `tb_uf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-12 23:54:48

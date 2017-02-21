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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bairro`
--

LOCK TABLES `tb_bairro` WRITE;
/*!40000 ALTER TABLE `tb_bairro` DISABLE KEYS */;
INSERT INTO `tb_bairro` VALUES (1,'Arapoanga',1),(2,'Santa Maria',1),(3,'Águas Claras',1),(4,'Ceilândia',1),(5,'Núcleo Bandeirante',1),(6,'Octogonal',1),(7,'Asa Norte',1),(8,'Asa Sul',1),(9,'São Sebastião',1),(10,'Brazlândia',1),(11,'Candangolândia',1),(12,'Gama',1),(13,'Cruzeiro Velho',1),(14,'Crizeiro Novo',1),(15,'Lago Sul',1),(16,'Lago Norte',1),(17,'Sobradinho II',1),(18,'Recanto da Emas',1),(19,'Riacho Fundo',1),(20,'Riacho Fundo II',1),(21,'Taguatinga',1),(22,'Guará 1',1),(23,'Guará 2',1),(24,'Paranoá',1),(25,'Itapoã',1),(26,'Graja do Torto',1),(27,'Vicente Pires',1),(28,'SMPW',1),(29,'Sudoeste',1),(30,'Sobradinho I',1),(34,'Planaltina',1);
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
  `categoria` varchar(60) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'Todos'),(2,'Pizzas Especiais'),(3,'Pizzas Clássicas'),(4,'Pizzas Tradicionais'),(5,'Bebidas'),(6,'Crepes'),(7,'Promoções'),(8,'Sanduiches');
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
) ENGINE=InnoDB AUTO_INCREMENT=1903 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cidade`
--

LOCK TABLES `tb_cidade` WRITE;
/*!40000 ALTER TABLE `tb_cidade` DISABLE KEYS */;
INSERT INTO `tb_cidade` VALUES (1,'Brasília',7),(2,'Abadia dos Dourados',13),(3,'Abaeté',13),(4,'Abre-Campo',13),(5,'Acaiaca',13),(6,'Açucena',13),(7,'Água Boa',13),(8,'Água Comprida',13),(9,'Aguanil',13),(10,'Águas Formosas',13),(11,'Águas Vermelhas',13),(12,'Aimorés',13),(13,'Aiuruoca',13),(14,'Alagoa',13),(15,'Albertina',13),(16,'Além Paraíba',13),(17,'Alfenas',13),(18,'Alfredo Vasconcelos',13),(19,'Almenara',13),(20,'Alpercata',13),(21,'Alpinópolis',13),(22,'Alterosa',13),(23,'Alto Caparaó',13),(24,'Alto Jequitibá',13),(25,'Alto Rio Doce',13),(26,'Alvarenga',13),(27,'Alvinópolis',13),(28,'Alvorada de Minas',13),(29,'Amparo da Serra',13),(30,'Andradas',13),(31,'Andrelândia',13),(32,'Angelândia',13),(33,'Antônio Carlos',13),(34,'Antônio Dias',13),(35,'Antônio Prado de Minas',13),(36,'Araçaí',13),(37,'Aracitaba',13),(38,'Araçuaí',13),(39,'Araguari',13),(40,'Arantina',13),(41,'Araponga',13),(42,'Araporã',13),(43,'Arapuá',13),(44,'Araújos',13),(45,'Araxá',13),(46,'Arceburgo',13),(47,'Arcos',13),(48,'Areado',13),(49,'Argirita',13),(50,'Aricanduva',13),(51,'Arinos',13),(52,'Astolfo Dutra',13),(53,'Ataléia',13),(54,'Augusto de Lima',13),(55,'Baependi',13),(56,'Baldim',13),(57,'Bambuí',13),(58,'Bandeira',13),(59,'Bandeira do Sul',13),(60,'Barão de Cocais',13),(61,'Barão de Monte Alto',13),(62,'Barbacena',13),(63,'Barra Longa',13),(64,'Barroso',13),(65,'Bela Vista de Minas',13),(66,'Belmiro Braga',13),(67,'Belo Horizonte',13),(68,'Belo Oriente',13),(69,'Belo Vale',13),(70,'Berilo',13),(71,'Berizal',13),(72,'Bertópolis',13),(73,'Betim',13),(74,'Bias Fortes',13),(75,'Bicas',13),(76,'Biquinhas',13),(77,'Boa Esperança',13),(78,'Bocaina de Minas',13),(79,'Bocaiuva',13),(80,'Bom Despacho',13),(81,'Bom Jardim de Minas',13),(82,'Bom Jesus da Penha',13),(83,'Bom Jesus do Amparo',13),(84,'Bom Jesus do Galho',13),(85,'Bom Repouso',13),(86,'Bom Sucesso',13),(87,'Bonfim',13),(88,'Bonfinópolis de Minas',13),(89,'Bonito de Minas',13),(90,'Borda da Mata',13),(91,'Botelhos',13),(92,'Botumirim',13),(93,'Brás Pires',13),(94,'Brasilândia de Minas',13),(95,'Brasília de Minas',13),(96,'Brazópolis',13),(97,'Braúnas',13),(98,'Brumadinho',13),(99,'Bueno Brandão',13),(100,'Buenópolis',13),(101,'Bugre',13),(102,'Buritis',13),(103,'Buritizeiro',13),(104,'Cabeceira Grande',13),(105,'Cabo Verde',13),(106,'Cachoeira da Prata',13),(107,'Cachoeira de Minas',13),(108,'Cachoeira de Pajeú',13),(109,'Cachoeira Dourada',13),(110,'Caetanópolis',13),(111,'Caeté',13),(112,'Caiana',13),(113,'Cajuri',13),(114,'Caldas',13),(115,'Camacho',13),(116,'Camanducaia',13),(117,'Cambuí',13),(118,'Cambuquira',13),(119,'Campanário',13),(120,'Campanha',13),(121,'Campestre',13),(122,'Campina Verde',13),(123,'Campo Azul',13),(124,'Campo Belo',13),(125,'Campo do Meio',13),(126,'Campo Florido',13),(127,'Campos Altos',13),(128,'Campos Gerais',13),(129,'Cana Verde',13),(130,'Canaã',13),(131,'Canápolis',13),(132,'Candeias',13),(133,'Cantagalo',13),(134,'Caparaó',13),(135,'Capela Nova',13),(136,'Capelinha',13),(137,'Capetinga',13),(138,'Capim Branco',13),(139,'Capinópolis',13),(140,'Capitão Andrade',13),(141,'Capitão Enéas',13),(142,'Capitólio',13),(143,'Caputira',13),(144,'Caraí',13),(145,'Caranaíba',13),(146,'Carandaí',13),(147,'Carangola',13),(148,'Caratinga',13),(149,'Carbonita',13),(150,'Careaçu',13),(151,'Carlos Chagas',13),(152,'Carmésia',13),(153,'Carmo da Cachoeira',13),(154,'Carmo da Mata',13),(155,'Carmo de Minas',13),(156,'Carmo do Cajuru',13),(157,'Carmo do Paranaíba',13),(158,'Carmo do Rio Claro',13),(159,'Carmópolis de Minas',13),(160,'Carneirinho',13),(161,'Carrancas',13),(162,'Carvalhópolis',13),(163,'Carvalhos',13),(164,'Casa Grande',13),(165,'Cascalho Rico',13),(166,'Cássia',13),(167,'Cataguases',13),(168,'Catas Altas',13),(169,'Catas Altas da Noruega',13),(170,'Catuji',13),(171,'Catuti',13),(172,'Caxambu',13),(173,'Cedro do Abaeté',13),(174,'Central de Minas',13),(175,'Centralina',13),(176,'Chácara',13),(177,'Chalé',13),(178,'Chapada do Norte',13),(179,'Chapada Gaúcha',13),(180,'Chiador',13),(181,'Cipotânea',13),(182,'Claraval',13),(183,'Claro dos Poções',13),(184,'Cláudio',13),(185,'Coimbra',13),(186,'Coluna',13),(187,'Comendador Gomes',13),(188,'Comercinho',13),(189,'Conceição da Aparecida',13),(190,'Conceição da Barra de Minas',13),(191,'Conceição das Alagoas',13),(192,'Conceição das Pedras',13),(193,'Conceição de Ipanema',13),(194,'Conceição do Mato Dentro',13),(195,'Conceição do Pará',13),(196,'Conceição do Rio Verde',13),(197,'Conceição dos Ouros',13),(198,'Cônego Marinho',13),(199,'Confins',13),(200,'Congonhal',13),(201,'Congonhas',13),(202,'Congonhas do Norte',13),(203,'Conquista',13),(204,'Conselheiro Lafaiete',13),(205,'Conselheiro Pena',13),(206,'Consolação',13),(207,'Contagem',13),(208,'Coqueiral',13),(209,'Coração de Jesus',13),(210,'Cordisburgo',13),(211,'Cordislândia',13),(212,'Corinto',13),(213,'Coroaci',13),(214,'Coromandel',13),(215,'Coronel Fabriciano',13),(216,'Coronel Murta',13),(217,'Coronel Pacheco',13),(218,'Coronel Xavier Chaves',13),(219,'Córrego Danta',13),(220,'Córrego do Bom Jesus',13),(221,'Córrego Fundo',13),(222,'Córrego Novo',13),(223,'Couto de Magalhães de Minas',13),(224,'Crisólita',13),(225,'Cristais',13),(226,'Cristália',13),(227,'Cristiano Otoni',13),(228,'Cristina',13),(229,'Crucilândia',13),(230,'Cruzeiro da Fortaleza',13),(231,'Cruzília',13),(232,'Cuparaque',13),(233,'Curral de Dentro',13),(234,'Curvelo',13),(235,'Datas',13),(236,'Delfim Moreira',13),(237,'Delfinópolis',13),(238,'Delta',13),(239,'Descoberto',13),(240,'Desterro de Entre Rios',13),(241,'Desterro do Melo',13),(242,'Diamantina',13),(243,'Diogo de Vasconcelos',13),(244,'Dionísio',13),(245,'Divinésia',13),(246,'Divino',13),(247,'Divino das Laranjeiras',13),(248,'Divinolândia de Minas',13),(249,'Divinópolis',13),(250,'Divisa Alegre',13),(251,'Divisa Nova',13),(252,'Divisópolis',13),(253,'Dom Bosco',13),(254,'Dom Cavati',13),(255,'Dom Joaquim',13),(256,'Dom Silvério',13),(257,'Dom Viçoso',13),(258,'Dona Eusébia',13),(259,'Dores de Campos',13),(260,'Dores de Guanhães',13),(261,'Dores do Indaiá',13),(262,'Dores do Turvo',13),(263,'Doresópolis',13),(264,'Douradoquara',13),(265,'Durandé',13),(266,'Elói Mendes',13),(267,'Engenheiro Caldas',13),(268,'Engenheiro Navarro',13),(269,'Entre Folhas',13),(270,'Entre Rios de Minas',13),(271,'Ervália',13),(272,'Esmeraldas',13),(273,'Espera Feliz',13),(274,'Espinosa',13),(275,'Espírito Santo do Dourado',13),(276,'Estiva',13),(277,'Estrela Dalva',13),(278,'Estrela do Indaiá',13),(279,'Estrela do Sul',13),(280,'Eugenópolis',13),(281,'Ewbank da Câmara',13),(282,'Extrema',13),(283,'Fama',13),(284,'Faria Lemos',13),(285,'Felício dos Santos',13),(286,'Felisburgo',13),(287,'Felixlândia',13),(288,'Fernandes Tourinho',13),(289,'Ferros',13),(290,'Fervedouro',13),(291,'Florestal',13),(292,'Formiga',13),(293,'Formoso',13),(294,'Fortaleza de Minas',13),(295,'Fortuna de Minas',13),(296,'Francisco Badaró',13),(297,'Francisco Dumont',13),(298,'Francisco Sá',13),(299,'Franciscópolis',13),(300,'Frei Gaspar',13),(301,'Frei Inocêncio',13),(302,'Frei Lagonegro',13),(303,'Fronteira',13),(304,'Fronteira dos Vales',13),(305,'Fruta de Leite',13),(306,'Frutal',13),(307,'Funilândia',13),(308,'Galileia',13),(309,'Gameleiras',13),(310,'Glaucilândia',13),(311,'Goiabeira',13),(312,'Goianá',13),(313,'Gonçalves',13),(314,'Gonzaga',13),(315,'Gouveia',13),(316,'Governador Valadares',13),(317,'Grão Mogol',13),(318,'Grupiara',13),(319,'Guanhães',13),(320,'Guapé',13),(321,'Guaraciaba',13),(322,'Guaraciama',13),(323,'Guaranésia',13),(324,'Guarani',13),(325,'Guarará',13),(326,'Guarda-Mor',13),(327,'Guaxupé',13),(328,'Guidoval',13),(329,'Guimarânia',13),(330,'Guiricema',13),(331,'Gurinhatã',13),(332,'Heliodora',13),(333,'Iapu',13),(334,'Ibertioga',13),(335,'Ibiá',13),(336,'Ibiaí',13),(337,'Ibiracatu',13),(338,'Ibiraci',13),(339,'Ibirité',13),(340,'Ibitiúra de Minas',13),(341,'Ibituruna',13),(342,'Icaraí de Minas',13),(343,'Igarapé',13),(344,'Igaratinga',13),(345,'Iguatama',13),(346,'Ijaci',13),(347,'Ilicínea',13),(348,'Imbé de Minas',13),(349,'Inconfidentes',13),(350,'Indaiabira',13),(351,'Indianópolis',13),(352,'Ingaí',13),(353,'Inhapim',13),(354,'Inhaúma',13),(355,'Inimutaba',13),(356,'Ipaba',13),(357,'Ipanema',13),(358,'Ipatinga',13),(359,'Ipiaçu',13),(360,'Ipuiúna',13),(361,'Iraí de Minas',13),(362,'Itabira',13),(363,'Itabirinha',13),(364,'Itabirito',13),(365,'Itacambira',13),(366,'Itacarambi',13),(367,'Itaguara',13),(368,'Itaipé',13),(369,'Itajubá',13),(370,'Itamarandiba',13),(371,'Itamarati de Minas',13),(372,'Itambacuri',13),(373,'Itambé do Mato Dentro',13),(374,'Itamogi',13),(375,'Itamonte',13),(376,'Itanhandu',13),(377,'Itanhomi',13),(378,'Itaobim',13),(379,'Itapagipe',13),(380,'Itapecerica',13),(381,'Itapeva',13),(382,'Itatiaiuçu',13),(383,'Itaú de Minas',13),(384,'Itaúna',13),(385,'Itaverava',13),(386,'Itinga',13),(387,'Itueta',13),(388,'Ituiutaba',13),(389,'Itumirim',13),(390,'Iturama',13),(391,'Itutinga',13),(392,'Jaboticatubas',13),(393,'Jacinto',13),(394,'Jacuí',13),(395,'Jacutinga',13),(396,'Jaguaraçu',13),(397,'Jaíba',13),(398,'Jampruca',13),(399,'Janaúba',13),(400,'Januária',13),(401,'Japaraíba',13),(402,'Japonvar',13),(403,'Jeceaba',13),(404,'Jenipapo de Minas',13),(405,'Jequeri',13),(406,'Jequitaí',13),(407,'Jequitibá',13),(408,'Jequitinhonha',13),(409,'Jesuânia',13),(410,'Joaíma',13),(411,'Joanésia',13),(412,'João Monlevade',13),(413,'João Pinheiro',13),(414,'Joaquim Felício',13),(415,'Jordânia',13),(416,'José Gonçalves de Minas',13),(417,'José Raydan',13),(418,'Josenópolis',13),(419,'Juatuba',13),(420,'Juiz de Fora',13),(421,'Juramento',13),(422,'Juruaia',13),(423,'Juvenília',13),(424,'Ladainha',13),(425,'Lagamar',13),(426,'Lagoa da Prata',13),(427,'Lagoa dos Patos',13),(428,'Lagoa Dourada',13),(429,'Lagoa Formosa',13),(430,'Lagoa Grande',13),(431,'Lagoa Santa',13),(432,'Lajinha',13),(433,'Lambari',13),(434,'Lamim',13),(435,'Laranjal',13),(436,'Lassance',13),(437,'Lavras',13),(438,'Leandro Ferreira',13),(439,'Leme do Prado',13),(440,'Leopoldina',13),(441,'Liberdade',13),(442,'Lima Duarte',13),(443,'Limeira do Oeste',13),(444,'Lontra',13),(445,'Luisburgo',13),(446,'Luislândia',13),(447,'Luminárias',13),(448,'Luz',13),(449,'Machacalis',13),(450,'Machado',13),(451,'Madre de Deus de Minas',13),(452,'Malacacheta',13),(453,'Mamonas',13),(454,'Manga',13),(455,'Manhuaçu',13),(456,'Manhumirim',13),(457,'Mantena',13),(458,'Mar de Espanha',13),(459,'Maravilhas',13),(460,'Maria da Fé',13),(461,'Mariana',13),(462,'Marilac',13),(463,'Mário Campos',13),(464,'Maripá de Minas',13),(465,'Marliéria',13),(466,'Marmelópolis',13),(467,'Martinho Campos',13),(468,'Martins Soares',13),(469,'Mata Verde',13),(470,'Materlândia',13),(471,'Mateus Leme',13),(472,'Mathias Lobato',13),(473,'Matias Barbosa',13),(474,'Matias Cardoso',13),(475,'Matipó',13),(476,'Mato Verde',13),(477,'Matozinhos',13),(478,'Matutina',13),(479,'Medeiros',13),(480,'Medina',13),(481,'Mendes Pimentel',13),(482,'Mercês',13),(483,'Mesquita',13),(484,'Minas Novas',13),(485,'Minduri',13),(486,'Mirabela',13),(487,'Miradouro',13),(488,'Miraí',13),(489,'Miravânia',13),(490,'Moeda',13),(491,'Moema',13),(492,'Monjolos',13),(493,'Monsenhor Paulo',13),(494,'Montalvânia',13),(495,'Monte Alegre de Minas',13),(496,'Monte Azul',13),(497,'Monte Belo',13),(498,'Monte Carmelo',13),(499,'Monte Formoso',13),(500,'Monte Santo de Minas',13),(501,'Monte Sião',13),(502,'Montes Claros',13),(503,'Montezuma',13),(504,'Morada Nova de Minas',13),(505,'Morro da Garça',13),(506,'Morro do Pilar',13),(507,'Munhoz',13),(508,'Muriaé',13),(509,'Mutum',13),(510,'Muzambinho',13),(511,'Nacip Raydan',13),(512,'Nanuque',13),(513,'Naque',13),(514,'Natalândia',13),(515,'Natércia',13),(516,'Nazareno',13),(517,'Nepomuceno',13),(518,'Ninheira',13),(519,'Nova Belém',13),(520,'Nova Era',13),(521,'Nova Lima',13),(522,'Nova Módica',13),(523,'Nova Ponte',13),(524,'Nova Porteirinha',13),(525,'Nova Resende',13),(526,'Nova Serrana',13),(527,'Nova União',13),(528,'Novo Cruzeiro',13),(529,'Novo Oriente de Minas',13),(530,'Novorizonte',13),(531,'Olaria',13),(532,'Olhos-D´Água',13),(533,'Olímpio Noronha',13),(534,'Oliveira',13),(535,'Oliveira Fortes',13),(536,'Onça de Pitangui',13),(537,'Oratórios',13),(538,'Orizânia',13),(539,'Ouro Branco',13),(540,'Ouro Fino',13),(541,'Ouro Preto',13),(542,'Ouro Verde de Minas',13),(543,'Padre Carvalho',13),(544,'Padre Paraíso',13),(545,'Pai Pedro',13),(546,'Paineiras',13),(547,'Pains',13),(548,'Paiva',13),(549,'Palma',13),(550,'Palmópolis',13),(551,'Papagaios',13),(552,'Pará de Minas',13),(553,'Paracatu',13),(554,'Paraguaçu',13),(555,'Paraisópolis',13),(556,'Paraopeba',13),(557,'Passa-Quatro',13),(558,'Passa Tempo',13),(559,'Passabém',13),(560,'Passa-Vinte',13),(561,'Passos',13),(562,'Patis',13),(563,'Patos de Minas',13),(564,'Patrocínio',13),(565,'Patrocínio do Muriaé',13),(566,'Paula Cândido',13),(567,'Paulistas',13),(568,'Pavão',13),(569,'Peçanha',13),(570,'Pedra Azul',13),(571,'Pedra Bonita',13),(572,'Pedra do Anta',13),(573,'Pedra do Indaiá',13),(574,'Pedra Dourada',13),(575,'Pedralva',13),(576,'Pedras de Maria da Cruz',13),(577,'Pedrinópolis',13),(578,'Pedro Leopoldo',13),(579,'Pedro Teixeira',13),(580,'Pequeri',13),(581,'Pequi',13),(582,'Perdigão',13),(583,'Perdizes',13),(584,'Perdões',13),(585,'Periquito',13),(586,'Pescador',13),(587,'Piau',13),(588,'Piedade de Caratinga',13),(589,'Piedade de Ponte Nova',13),(590,'Piedade do Rio Grande',13),(591,'Piedade dos Gerais',13),(592,'Pimenta',13),(593,'Pingo-D´Água',13),(594,'Pintópolis',13),(595,'Piracema',13),(596,'Pirajuba',13),(597,'Piranga',13),(598,'Piranguçu',13),(599,'Piranguinho',13),(600,'Pirapetinga',13),(601,'Pirapora',13),(602,'Piraúba',13),(603,'Pitangui',13),(604,'Piumhi',13),(605,'Planura',13),(606,'Poço Fundo',13),(607,'Poços de Caldas',13),(608,'Pocrane',13),(609,'Pompéu',13),(610,'Ponte Nova',13),(611,'Ponto Chique',13),(612,'Ponto dos Volantes',13),(613,'Porteirinha',13),(614,'Porto Firme',13),(615,'Poté',13),(616,'Pouso Alegre',13),(617,'Pouso Alto',13),(618,'Prados',13),(619,'Prata',13),(620,'Pratápolis',13),(621,'Pratinha',13),(622,'Presidente Bernardes',13),(623,'Presidente Juscelino',13),(624,'Presidente Kubitschek',13),(625,'Presidente Olegário',13),(626,'Prudente de Morais',13),(627,'Quartel Geral',13),(628,'Queluzito',13),(629,'Raposos',13),(630,'Raul Soares',13),(631,'Recreio',13),(632,'Reduto',13),(633,'Resende Costa',13),(634,'Resplendor',13),(635,'Ressaquinha',13),(636,'Riachinho',13),(637,'Riacho dos Machados',13),(638,'Ribeirão das Neves',13),(639,'Ribeirão Vermelho',13),(640,'Rio Acima',13),(641,'Rio Casca',13),(642,'Rio do Prado',13),(643,'Rio Doce',13),(644,'Rio Espera',13),(645,'Rio Manso',13),(646,'Rio Novo',13),(647,'Rio Paranaíba',13),(648,'Rio Pardo de Minas',13),(649,'Rio Piracicaba',13),(650,'Rio Pomba',13),(651,'Rio Preto',13),(652,'Rio Vermelho',13),(653,'Ritápolis',13),(654,'Rochedo de Minas',13),(655,'Rodeiro',13),(656,'Romaria',13),(657,'Rosário da Limeira',13),(658,'Rubelita',13),(659,'Rubim',13),(660,'Sabará',13),(661,'Sabinópolis',13),(662,'Sacramento',13),(663,'Salinas',13),(664,'Salto da Divisa',13),(665,'Santa Bárbara',13),(666,'Santa Bárbara do Leste',13),(667,'Santa Bárbara do Monte Verde',13),(668,'Santa Bárbara do Tugúrio',13),(669,'Santa Cruz de Minas',13),(670,'Santa Cruz de Salinas',13),(671,'Santa Cruz do Escalvado',13),(672,'Santa Efigênia de Minas',13),(673,'Santa Fé de Minas',13),(674,'Santa Helena de Minas',13),(675,'Santa Juliana',13),(676,'Santa Luzia',13),(677,'Santa Margarida',13),(678,'Santa Maria de Itabira',13),(679,'Santa Maria do Salto',13),(680,'Santa Maria do Suaçuí',13),(681,'Santa Rita de Caldas',13),(682,'Santa Rita de Ibitipoca',13),(683,'Santa Rita de Jacutinga',13),(684,'Santa Rita de Minas',13),(685,'Santa Rita do Itueto',13),(686,'Santa Rita do Sapucaí',13),(687,'Santa Rosa da Serra',13),(688,'Santa Vitória',13),(689,'Santana da Vargem',13),(690,'Santana de Cataguases',13),(691,'Santana de Pirapama',13),(692,'Santana do Deserto',13),(693,'Santana do Garambéu',13),(694,'Santana do Jacaré',13),(695,'Santana do Manhuaçu',13),(696,'Santana do Paraíso',13),(697,'Santana do Riacho',13),(698,'Santana dos Montes',13),(699,'Santo Antônio do Amparo',13),(700,'Santo Antônio do Aventureiro',13),(701,'Santo Antônio do Grama',13),(702,'Santo Antônio do Itambé',13),(703,'Santo Antônio do Jacinto',13),(704,'Santo Antônio do Monte',13),(705,'Santo Antônio do Retiro',13),(706,'Santo Antônio do Rio Abaixo',13),(707,'Santo Hipólito',13),(708,'Santos Dumont',13),(709,'São Bento Abade',13),(710,'São Brás do Suaçuí',13),(711,'São Domingos das Dores',13),(712,'São Domingos do Prata',13),(713,'São Félix de Minas',13),(714,'São Francisco',13),(715,'São Francisco de Paula',13),(716,'São Francisco de Sales',13),(717,'São Francisco do Glória',13),(718,'São Geraldo',13),(719,'São Geraldo da Piedade',13),(720,'São Geraldo do Baixio',13),(721,'São Gonçalo do Abaeté',13),(722,'São Gonçalo do Pará',13),(723,'São Gonçalo do Rio Abaixo',13),(724,'São Gonçalo do Rio Preto',13),(725,'São Gonçalo do Sapucaí',13),(726,'São Gotardo',13),(727,'São João Batista do Glória',13),(728,'São João da Lagoa',13),(729,'São João da Mata',13),(730,'São João da Ponte',13),(731,'São João das Missões',13),(732,'São João del-Rei',13),(733,'São João do Manhuaçu',13),(734,'São João do Manteninha',13),(735,'São João do Oriente',13),(736,'São João do Pacuí',13),(737,'São João do Paraíso',13),(738,'São João Evangelista',13),(739,'São João Nepomuceno',13),(740,'São Joaquim de Bicas',13),(741,'São José da Barra',13),(742,'São José da Lapa',13),(743,'São José da Safira',13),(744,'São José da Varginha',13),(745,'São José do Alegre',13),(746,'São José do Divino',13),(747,'São José do Goiabal',13),(748,'São José do Jacuri',13),(749,'São José do Mantimento',13),(750,'São Lourenço',13),(751,'São Miguel do Anta',13),(752,'São Pedro da União',13),(753,'São Pedro do Suaçuí',13),(754,'São Pedro dos Ferros',13),(755,'São Romão',13),(756,'São Roque de Minas',13),(757,'São Sebastião da Bela Vista',13),(758,'São Sebastião da Vargem Alegre',13),(759,'São Sebastião do Anta',13),(760,'São Sebastião do Maranhão',13),(761,'São Sebastião do Oeste',13),(762,'São Sebastião do Paraíso',13),(763,'São Sebastião do Rio Preto',13),(764,'São Sebastião do Rio Verde',13),(765,'São Thomé das Letras',13),(766,'São Tiago',13),(767,'São Tomás de Aquino',13),(768,'São Vicente de Minas',13),(769,'Sapucaí-Mirim',13),(770,'Sardoá',13),(771,'Sarzedo',13),(772,'Sem-Peixe',13),(773,'Senador Amaral',13),(774,'Senador Cortes',13),(775,'Senador Firmino',13),(776,'Senador José Bento',13),(777,'Senador Modestino Gonçalves',13),(778,'Senhora de Oliveira',13),(779,'Senhora do Porto',13),(780,'Senhora dos Remédios',13),(781,'Sericita',13),(782,'Seritinga',13),(783,'Serra Azul de Minas',13),(784,'Serra da Saudade',13),(785,'Serra do Salitre',13),(786,'Serra dos Aimorés',13),(787,'Serrania',13),(788,'Serranópolis de Minas',13),(789,'Serranos',13),(790,'Serro',13),(791,'Sete Lagoas',13),(792,'Setubinha',13),(793,'Silveirânia',13),(794,'Silvianópolis',13),(795,'Simão Pereira',13),(796,'Simonésia',13),(797,'Sobrália',13),(798,'Soledade de Minas',13),(799,'Tabuleiro',13),(800,'Taiobeiras',13),(801,'Taparuba',13),(802,'Tapira',13),(803,'Tapiraí',13),(804,'Taquaraçu de Minas',13),(805,'Tarumirim',13),(806,'Teixeiras',13),(807,'Teófilo Otoni',13),(808,'Timóteo',13),(809,'Tiradentes',13),(810,'Tiros',13),(811,'Tocantins',13),(812,'Tocos do Moji',13),(813,'Toledo',13),(814,'Tombos',13),(815,'Três Corações',13),(816,'Três Marias',13),(817,'Três Pontas',13),(818,'Tumiritinga',13),(819,'Tupaciguara',13),(820,'Turmalina',13),(821,'Turvolândia',13),(822,'Ubá',13),(823,'Ubaí',13),(824,'Ubaporanga',13),(825,'Uberaba',13),(826,'Uberlândia',13),(827,'Umburatiba',13),(828,'Unaí',13),(829,'União de Minas',13),(830,'Uruana de Minas',13),(831,'Urucânia',13),(832,'Urucuia',13),(833,'Vargem Alegre',13),(834,'Vargem Bonita',13),(835,'Vargem Grande do Rio Pardo',13),(836,'Varginha',13),(837,'Varjão de Minas',13),(838,'Várzea da Palma',13),(839,'Varzelândia',13),(840,'Vazante',13),(841,'Verdelândia',13),(842,'Veredinha',13),(843,'Veríssimo',13),(844,'Vermelho Novo',13),(845,'Vespasiano',13),(846,'Viçosa',13),(847,'Vieiras',13),(848,'Virgem da Lapa',13),(849,'Virgínia',13),(850,'Virginópolis',13),(851,'Virgolândia',13),(852,'Visconde do Rio Branco',13),(853,'Volta Grande',13),(854,'Abadia de Goiás',9),(855,'Abadiânia',9),(856,'Acreúna',9),(857,'Adelândia',9),(858,'Água Fria de Goiás',9),(859,'Água Limpa',9),(860,'Águas Lindas de Goiás',9),(861,'Alexânia',9),(862,'Aloândia',9),(863,'Alto Horizonte',9),(864,'Alto Paraíso de Goiás',9),(865,'Alvorada do Norte',9),(866,'Amaralina',9),(867,'Americano do Brasil',9),(868,'Amorinópolis',9),(869,'Anápolis',9),(870,'Anhanguera',9),(871,'Anicuns',9),(872,'Aparecida de Goiânia',9),(873,'Aparecida do Rio Doce',9),(874,'Aporé',9),(875,'Araçu',9),(876,'Aragarças',9),(877,'Aragoiânia',9),(878,'Araguapaz',9),(879,'Arenópolis',9),(880,'Aruanã',9),(881,'Aurilândia',9),(882,'Avelinópolis',9),(883,'Baliza',9),(884,'Barro Alto',9),(885,'Bela Vista de Goiás',9),(886,'Bom Jardim de Goiás',9),(887,'Bom Jesus de Goiás',9),(888,'Bonfinópolis',9),(889,'Bonópolis',9),(890,'Brazabrantes',9),(891,'Britânia',9),(892,'Buriti Alegre',9),(893,'Buriti de Goiás',9),(894,'Buritinópolis',9),(895,'Cabeceiras',9),(896,'Cachoeira Alta',9),(897,'Cachoeira de Goiás',9),(898,'Cachoeira Dourada',9),(899,'Caçu',9),(900,'Caiapônia',9),(901,'Caldas Novas',9),(902,'Caldazinha',9),(903,'Campestre de Goiás',9),(904,'Campinaçu',9),(905,'Campinorte',9),(906,'Campo Alegre de Goiás',9),(907,'Campo Limpo de Goiás',9),(908,'Campos Belos',9),(909,'Campos Verdes',9),(910,'Carmo do Rio Verde',9),(911,'Castelândia',9),(912,'Catalão',9),(913,'Caturaí',9),(914,'Cavalcante',9),(915,'Ceres',9),(916,'Cezarina',9),(917,'Chapadão do Céu',9),(918,'Cidade Ocidental',9),(919,'Cocalzinho de Goiás',9),(920,'Colinas do Sul',9),(921,'Córrego do Ouro',9),(922,'Corumbá de Goiás',9),(923,'Corumbaíba',9),(924,'Cristalina',9),(925,'Cristianópolis',9),(926,'Crixás',9),(927,'Cromínia',9),(928,'Cumari',9),(929,'Damianópolis',9),(930,'Damolândia',9),(931,'Davinópolis',9),(932,'Diorama',9),(933,'Divinópolis de Goiás',9),(934,'Doverlândia',9),(935,'Edealina',9),(936,'Edéia',9),(937,'Estrela do Norte',9),(938,'Faina',9),(939,'Fazenda Nova',9),(940,'Firminópolis',9),(941,'Flores de Goiás',9),(942,'Formosa',9),(943,'Formoso',9),(944,'Gameleira de Goiás',9),(945,'Goianápolis',9),(946,'Goiandira',9),(947,'Goianésia',9),(948,'Goiânia',9),(949,'Goianira',9),(950,'Goiás',9),(951,'Goiatuba',9),(952,'Gouvelândia',9),(953,'Guapó',9),(954,'Guaraíta',9),(955,'Guarani de Goiás',9),(956,'Guarinos',9),(957,'Heitoraí',9),(958,'Hidrolândia',9),(959,'Hidrolina',9),(960,'Iaciara',9),(961,'Inaciolândia',9),(962,'Indiara',9),(963,'Inhumas',9),(964,'Ipameri',9),(965,'Ipiranga de Goiás',9),(966,'Iporá',9),(967,'Israelândia',9),(968,'Itaberaí',9),(969,'Itaguari',9),(970,'Itaguaru',9),(971,'Itajá',9),(972,'Itapaci',9),(973,'Itapirapuã',9),(974,'Itapuranga',9),(975,'Itarumã',9),(976,'Itauçu',9),(977,'Itumbiara',9),(978,'Ivolândia',9),(979,'Jandaia',9),(980,'Jaraguá',9),(981,'Jataí',9),(982,'Jaupaci',9),(983,'Jesúpolis',9),(984,'Joviânia',9),(985,'Jussara',9),(986,'Lagoa Santa',9),(987,'Leopoldo de Bulhões',9),(988,'Luziânia',9),(989,'Mairipotaba',9),(990,'Mambaí',9),(991,'Mara Rosa',9),(992,'Marzagão',9),(993,'Matrinchã',9),(994,'Maurilândia',9),(995,'Mimoso de Goiás',9),(996,'Minaçu',9),(997,'Mineiros',9),(998,'Moiporá',9),(999,'Monte Alegre de Goiás',9),(1000,'Montes Claros de Goiás',9),(1001,'Montividiu',9),(1002,'Montividiu do Norte',9),(1003,'Morrinhos',9),(1004,'Morro Agudo de Goiás',9),(1005,'Mossâmedes',9),(1006,'Mozarlândia',9),(1007,'Mundo Novo',9),(1008,'Mutunópolis',9),(1009,'Nazário',9),(1010,'Nerópolis',9),(1011,'Niquelândia',9),(1012,'Nova América',9),(1013,'Nova Aurora',9),(1014,'Nova Crixás',9),(1015,'Nova Glória',9),(1016,'Nova Iguaçu de Goiás',9),(1017,'Nova Roma',9),(1018,'Nova Veneza',9),(1019,'Novo Brasil',9),(1020,'Novo Gama',9),(1021,'Novo Planalto',9),(1022,'Orizona',9),(1023,'Ouro Verde de Goiás',9),(1024,'Ouvidor',9),(1025,'Padre Bernardo',9),(1026,'Palestina de Goiás',9),(1027,'Palmeiras de Goiás',9),(1028,'Palmelo',9),(1029,'Palminópolis',9),(1030,'Panamá',9),(1031,'Paranaiguara',9),(1032,'Paraúna',9),(1033,'Perolândia',9),(1034,'Petrolina de Goiás',9),(1035,'Pilar de Goiás',9),(1036,'Piracanjuba',9),(1037,'Piranhas',9),(1038,'Pirenópolis',9),(1039,'Pires do Rio',9),(1040,'Planaltina',9),(1041,'Pontalina',9),(1042,'Porangatu',9),(1043,'Porteirão',9),(1044,'Portelândia',9),(1045,'Posse',9),(1046,'Professor Jamil',9),(1047,'Quirinópolis',9),(1048,'Rialma',9),(1049,'Rianápolis',9),(1050,'Rio Quente',9),(1051,'Rio Verde',9),(1052,'Rubiataba',9),(1053,'Sanclerlândia',9),(1054,'Santa Bárbara de Goiás',9),(1055,'Santa Cruz de Goiás',9),(1056,'Santa Fé de Goiás',9),(1057,'Santa Helena de Goiás',9),(1058,'Santa Isabel',9),(1059,'Santa Rita do Araguaia',9),(1060,'Santa Rita do Novo Destino',9),(1061,'Santa Rosa de Goiás',9),(1062,'Santa Tereza de Goiás',9),(1063,'Santa Terezinha de Goiás',9),(1064,'Santo Antônio da Barra',9),(1065,'Santo Antônio de Goiás',9),(1066,'Santo Antônio do Descoberto',9),(1067,'São Domingos',9),(1068,'São Francisco de Goiás',9),(1069,'São João da Paraúna',9),(1070,'São João d`Aliança',9),(1071,'São Luís de Montes Belos',9),(1072,'São Luíz do Norte',9),(1073,'São Miguel do Araguaia',9),(1074,'São Miguel do Passa Quatro',9),(1075,'São Patrício',9),(1076,'São Simão',9),(1077,'Senador Canedo',9),(1078,'Serranópolis',9),(1079,'Silvânia',9),(1080,'Simolândia',9),(1081,'Sítio d`Abadia',9),(1082,'Taquaral de Goiás',9),(1083,'Teresina de Goiás',9),(1084,'Terezópolis de Goiás',9),(1085,'Três Ranchos',9),(1086,'Trindade',9),(1087,'Trombas',9),(1088,'Turvânia',9),(1089,'Turvelândia',9),(1090,'Uirapuru',9),(1091,'Uruaçu',9),(1092,'Uruana',9),(1093,'Urutaí',9),(1094,'Valparaíso de Goiás',9),(1095,'Varjão',9),(1096,'Vianópolis',9),(1097,'Vicentinópolis',9),(1098,'Vila Boa',9),(1099,'Vila Propício',9),(1100,'Abaíra',5),(1101,'Abaré',5),(1102,'Acajutiba',5),(1103,'Adustina',5),(1104,'Água Fria',5),(1105,'Aiquara',5),(1106,'Alagoinhas',5),(1107,'Alcobaça',5),(1108,'Almadina',5),(1109,'Amargosa',5),(1110,'Amélia Rodrigues',5),(1111,'América Dourada',5),(1112,'Anagé',5),(1113,'Andaraí',5),(1114,'Andorinha',5),(1115,'Angical',5),(1116,'Anguera',5),(1117,'Antas',5),(1118,'Antônio Cardoso',5),(1119,'Antônio Gonçalves',5),(1120,'Aporá',5),(1121,'Apuarema',5),(1122,'Araças',5),(1123,'Aracatu',5),(1124,'Araci',5),(1125,'Aramari',5),(1126,'Arataca',5),(1127,'Aratuípe',5),(1128,'Aurelino Leal',5),(1129,'Baianópolis',5),(1130,'Baixa Grande',5),(1131,'Banzaê',5),(1132,'Barra',5),(1133,'Barra da Estiva',5),(1134,'Barra do Choça',5),(1135,'Barra do Mendes',5),(1136,'Barra do Rocha',5),(1137,'Barreiras',5),(1138,'Barro Alto',5),(1139,'Barro Preto',5),(1140,'Barrocas',5),(1141,'Belmonte',5),(1142,'Belo Campo',5),(1143,'Biritinga',5),(1144,'Boa Nova',5),(1145,'Boa Vista do Tupim',5),(1146,'Bom Jesus da Lapa',5),(1147,'Bom Jesus da Serra',5),(1148,'Boninal',5),(1149,'Bonito',5),(1150,'Boquira',5),(1151,'Botuporã',5),(1152,'Brejões',5),(1153,'Brejolândia',5),(1154,'Brotas de Macaúbas',5),(1155,'Brumado',5),(1156,'Buerarema',5),(1157,'Buritirama',5),(1158,'Caatiba',5),(1159,'Cabaceiras do Paraguaçu',5),(1160,'Cachoeira',5),(1161,'Caculé',5),(1162,'Caém',5),(1163,'Caetanos',5),(1164,'Caetité',5),(1165,'Cafarnaum',5),(1166,'Cairu',5),(1167,'Caldeirão Grande',5),(1168,'Camacan',5),(1169,'Camaçari',5),(1170,'Camamu',5),(1171,'Campo Alegre de Lourdes',5),(1172,'Campo Formoso',5),(1173,'Canápolis',5),(1174,'Canarana',5),(1175,'Canavieiras',5),(1176,'Candeal',5),(1177,'Candeias',5),(1178,'Candiba',5),(1179,'Cândido Sales',5),(1180,'Cansanção',5),(1181,'Canudos',5),(1182,'Capela do Alto Alegre',5),(1183,'Capim Grosso',5),(1184,'Caraíbas',5),(1185,'Caravelas',5),(1186,'Cardeal da Silva',5),(1187,'Carinhanha',5),(1188,'Casa Nova',5),(1189,'Castro Alves',5),(1190,'Catolândia',5),(1191,'Catu',5),(1192,'Caturama',5),(1193,'Central',5),(1194,'Chorrochó',5),(1195,'Cícero Dantas',5),(1196,'Cipó',5),(1197,'Coaraci',5),(1198,'Cocos',5),(1199,'Conceição da Feira',5),(1200,'Conceição do Almeida',5),(1201,'Conceição do Coité',5),(1202,'Conceição do Jacuípe',5),(1203,'Conde',5),(1204,'Condeúba',5),(1205,'Contendas do Sincorá',5),(1206,'Coração de Maria',5),(1207,'Cordeiros',5),(1208,'Coribe',5),(1209,'Coronel João Sá',5),(1210,'Correntina',5),(1211,'Cotegipe',5),(1212,'Cravolândia',5),(1213,'Crisópolis',5),(1214,'Cristópolis',5),(1215,'Cruz das Almas',5),(1216,'Curaçá',5),(1217,'Dário Meira',5),(1218,'Dias d`Ávila',5),(1219,'Dom Basílio',5),(1220,'Dom Macedo Costa',5),(1221,'Elísio Medrado',5),(1222,'Encruzilhada',5),(1223,'Entre Rios',5),(1224,'Érico Cardoso',5),(1225,'Esplanada',5),(1226,'Euclides da Cunha',5),(1227,'Eunápolis',5),(1228,'Fátima',5),(1229,'Feira da Mata',5),(1230,'Feira de Santana',5),(1231,'Filadélfia',5),(1232,'Firmino Alves',5),(1233,'Floresta Azul',5),(1234,'Formosa do Rio Preto',5),(1235,'Gandu',5),(1236,'Gavião',5),(1237,'Gentio do Ouro',5),(1238,'Glória',5),(1239,'Gongogi',5),(1240,'Governador Mangabeira',5),(1241,'Guajeru',5),(1242,'Guanambi',5),(1243,'Guaratinga',5),(1244,'Heliópolis',5),(1245,'Iaçu',5),(1246,'Ibiassucê',5),(1247,'Ibicaraí',5),(1248,'Ibicoara',5),(1249,'Ibicuí',5),(1250,'Ibipeba',5),(1251,'Ibipitanga',5),(1252,'Ibiquera',5),(1253,'Ibirapitanga',5),(1254,'Ibirapuã',5),(1255,'Ibirataia',5),(1256,'Ibitiara',5),(1257,'Ibititá',5),(1258,'Ibotirama',5),(1259,'Ichu',5),(1260,'Igaporã',5),(1261,'Igrapiúna',5),(1262,'Iguaí',5),(1263,'Ilhéus',5),(1264,'Inhambupe',5),(1265,'Ipecaetá',5),(1266,'Ipiaú',5),(1267,'Ipirá',5),(1268,'Ipupiara',5),(1269,'Irajuba',5),(1270,'Iramaia',5),(1271,'Iraquara',5),(1272,'Irará',5),(1273,'Irecê',5),(1274,'Itabela',5),(1275,'Itaberaba',5),(1276,'Itabuna',5),(1277,'Itacaré',5),(1278,'Itaeté',5),(1279,'Itagi',5),(1280,'Itagibá',5),(1281,'Itagimirim',5),(1282,'Itaguaçu da Bahia',5),(1283,'Itaju do Colônia',5),(1284,'Itajuípe',5),(1285,'Itamaraju',5),(1286,'Itamari',5),(1287,'Itambé',5),(1288,'Itanagra',5),(1289,'Itanhém',5),(1290,'Itaparica',5),(1291,'Itapé',5),(1292,'Itapebi',5),(1293,'Itapetinga',5),(1294,'Itapicuru',5),(1295,'Itapitanga',5),(1296,'Itaquara',5),(1297,'Itarantim',5),(1298,'Itatim',5),(1299,'Itiruçu',5),(1300,'Itiúba',5),(1301,'Itororó',5),(1302,'Ituaçu',5),(1303,'Ituberá',5),(1304,'Iuiú',5),(1305,'Jaborandi',5),(1306,'Jacaraci',5),(1307,'Jacobina',5),(1308,'Jaguaquara',5),(1309,'Jaguarari',5),(1310,'Jaguaripe',5),(1311,'Jandaíra',5),(1312,'Jequié',5),(1313,'Jeremoabo',5),(1314,'Jiquiriçá',5),(1315,'Jitaúna',5),(1316,'João Dourado',5),(1317,'Juazeiro',5),(1318,'Jucuruçu',5),(1319,'Jussara',5),(1320,'Jussari',5),(1321,'Jussiape',5),(1322,'Lafaiete Coutinho',5),(1323,'Lagoa Real',5),(1324,'Laje',5),(1325,'Lajedão',5),(1326,'Lajedinho',5),(1327,'Lajedo do Tabocal',5),(1328,'Lamarão',5),(1329,'Lapão',5),(1330,'Lauro de Freitas',5),(1331,'Lençóis',5),(1332,'Licínio de Almeida',5),(1333,'Livramento de Nossa Senhora',5),(1334,'Luís Eduardo Magalhães',5),(1335,'Macajuba',5),(1336,'Macarani',5),(1337,'Macaúbas',5),(1338,'Macururé',5),(1339,'Madre de Deus',5),(1340,'Maetinga',5),(1341,'Maiquinique',5),(1342,'Mairi',5),(1343,'Malhada',5),(1344,'Malhada de Pedras',5),(1345,'Manoel Vitorino',5),(1346,'Mansidão',5),(1347,'Maracás',5),(1348,'Maragogipe',5),(1349,'Maraú',5),(1350,'Marcionílio Souza',5),(1351,'Mascote',5),(1352,'Mata de São João',5),(1353,'Matina',5),(1354,'Medeiros Neto',5),(1355,'Miguel Calmon',5),(1356,'Milagres',5),(1357,'Mirangaba',5),(1358,'Mirante',5),(1359,'Monte Santo',5),(1360,'Morpará',5),(1361,'Morro do Chapéu',5),(1362,'Mortugaba',5),(1363,'Mucugê',5),(1364,'Mucuri',5),(1365,'Mulungu do Morro',5),(1366,'Mundo Novo',5),(1367,'Muniz Ferreira',5),(1368,'Muquém de São Francisco',5),(1369,'Muritiba',5),(1370,'Mutuípe',5),(1371,'Nazaré',5),(1372,'Nilo Peçanha',5),(1373,'Nordestina',5),(1374,'Nova Canaã',5),(1375,'Nova Fátima',5),(1376,'Nova Ibiá',5),(1377,'Nova Itarana',5),(1378,'Nova Redenção',5),(1379,'Nova Soure',5),(1380,'Nova Viçosa',5),(1381,'Novo Horizonte',5),(1382,'Novo Triunfo',5),(1383,'Olindina',5),(1384,'Oliveira dos Brejinhos',5),(1385,'Ouriçangas',5),(1386,'Ourolândia',5),(1387,'Palmas de Monte Alto',5),(1388,'Palmeiras',5),(1389,'Paramirim',5),(1390,'Paratinga',5),(1391,'Paripiranga',5),(1392,'Pau Brasil',5),(1393,'Paulo Afonso',5),(1394,'Pé de Serra',5),(1395,'Pedrão',5),(1396,'Pedro Alexandre',5),(1397,'Piatã',5),(1398,'Pilão Arcado',5),(1399,'Pindaí',5),(1400,'Pindobaçu',5),(1401,'Pintadas',5),(1402,'Piraí do Norte',5),(1403,'Piripá',5),(1404,'Piritiba',5),(1405,'Planaltino',5),(1406,'Planalto',5),(1407,'Poções',5),(1408,'Pojuca',5),(1409,'Ponto Novo',5),(1410,'Porto Seguro',5),(1411,'Potiraguá',5),(1412,'Prado',5),(1413,'Presidente Dutra',5),(1414,'Presidente Jânio Quadros',5),(1415,'Presidente Tancredo Neves',5),(1416,'Queimadas',5),(1417,'Quijingue',5),(1418,'Quixabeira',5),(1419,'Rafael Jambeiro',5),(1420,'Remanso',5),(1421,'Retirolândia',5),(1422,'Riachão das Neves',5),(1423,'Riachão do Jacuípe',5),(1424,'Riacho de Santana',5),(1425,'Ribeira do Amparo',5),(1426,'Ribeira do Pombal',5),(1427,'Ribeirão do Largo',5),(1428,'Rio de Contas',5),(1429,'Rio do Antônio',5),(1430,'Rio do Pires',5),(1431,'Rio Real',5),(1432,'Rodelas',5),(1433,'Ruy Barbosa',5),(1434,'Salinas da Margarida',5),(1435,'Salvador',5),(1436,'Santa Bárbara',5),(1437,'Santa Brígida',5),(1438,'Santa Cruz Cabrália',5),(1439,'Santa Cruz da Vitória',5),(1440,'Santa Inês',5),(1441,'Santa Luzia',5),(1442,'Santa Maria da Vitória',5),(1443,'Santa Rita de Cássia',5),(1444,'Santa Teresinha',5),(1445,'Santaluz',5),(1446,'Santana',5),(1447,'Santanópolis',5),(1448,'Santo Amaro',5),(1449,'Santo Antônio de Jesus',5),(1450,'Santo Estêvão',5),(1451,'São Desidério',5),(1452,'São Domingos',5),(1453,'São Felipe',5),(1454,'São Félix',5),(1455,'São Félix do Coribe',5),(1456,'São Francisco do Conde',5),(1457,'São Gabriel',5),(1458,'São Gonçalo dos Campos',5),(1459,'São José da Vitória',5),(1460,'São José do Jacuípe',5),(1461,'São Miguel das Matas',5),(1462,'São Sebastião do Passé',5),(1463,'Sapeaçu',5),(1464,'Sátiro Dias',5),(1465,'Saubara',5),(1466,'Saúde',5),(1467,'Seabra',5),(1468,'Sebastião Laranjeiras',5),(1469,'Senhor do Bonfim',5),(1470,'Sento Sé',5),(1471,'Serra do Ramalho',5),(1472,'Serra Dourada',5),(1473,'Serra Preta',5),(1474,'Serrinha',5),(1475,'Serrolândia',5),(1476,'Simões Filho',5),(1477,'Sítio do Mato',5),(1478,'Sítio do Quinto',5),(1479,'Sobradinho',5),(1480,'Souto Soares',5),(1481,'Tabocas do Brejo Velho',5),(1482,'Tanhaçu',5),(1483,'Tanque Novo',5),(1484,'Tanquinho',5),(1485,'Taperoá',5),(1486,'Tapiramutá',5),(1487,'Teixeira de Freitas',5),(1488,'Teodoro Sampaio',5),(1489,'Teofilândia',5),(1490,'Teolândia',5),(1491,'Terra Nova',5),(1492,'Tremedal',5),(1493,'Tucano',5),(1494,'Uauá',5),(1495,'Ubaíra',5),(1496,'Ubaitaba',5),(1497,'Ubatã',5),(1498,'Uibaí',5),(1499,'Umburanas',5),(1500,'Una',5),(1501,'Urandi',5),(1502,'Uruçuca',5),(1503,'Utinga',5),(1504,'Valença',5),(1505,'Valente',5),(1506,'Várzea da Roça',5),(1507,'Várzea do Poço',5),(1508,'Várzea Nova',5),(1509,'Varzedo',5),(1510,'Vera Cruz',5),(1511,'Vereda',5),(1512,'Vitória da Conquista',5),(1513,'Wagner',5),(1514,'Wanderley',5),(1515,'Wenceslau Guimarães',5),(1516,'Xique-Xique',5),(1517,'Acrelândia',1),(1518,'Assis Brasil',1),(1519,'Brasiléia',1),(1520,'Bujari',1),(1521,'Capixaba',1),(1522,'Cruzeiro do Sul',1),(1523,'Epitaciolândia',1),(1524,'Feijó',1),(1525,'Jordão',1),(1526,'Mâncio Lima',1),(1527,'Manoel Urbano',1),(1528,'Marechal Thaumaturgo',1),(1529,'Plácido de Castro',1),(1530,'Porto Acre',1),(1531,'Porto Walter',1),(1532,'Rio Branco',1),(1533,'Rodrigues Alves',1),(1534,'Santa Rosa do Purus',1),(1535,'Sena Madureira',1),(1536,'Senador Guiomard',1),(1537,'Tarauacá',1),(1538,'Xapuri',1),(1539,'Água Branca',2),(1540,'Anadia',2),(1541,'Arapiraca',2),(1542,'Atalaia',2),(1543,'Barra de Santo Antônio',2),(1544,'Barra de São Miguel',2),(1545,'Batalha',2),(1546,'Belém',2),(1547,'Belo Monte',2),(1548,'Boca da Mata',2),(1549,'Branquinha',2),(1550,'Cacimbinhas',2),(1551,'Cajueiro',2),(1552,'Campestre',2),(1553,'Campo Alegre',2),(1554,'Campo Grande',2),(1555,'Canapi',2),(1556,'Capela',2),(1557,'Carneiros',2),(1558,'Chã Preta',2),(1559,'Coité do Nóia',2),(1560,'Colônia Leopoldina',2),(1561,'Coqueiro Seco',2),(1562,'Coruripe',2),(1563,'Craíbas',2),(1564,'Delmiro Gouveia',2),(1565,'Dois Riachos',2),(1566,'Estrela de Alagoas',2),(1567,'Feira Grande',2),(1568,'Feliz Deserto',2),(1569,'Flexeiras',2),(1570,'Girau do Ponciano',2),(1571,'Ibateguara',2),(1572,'Igaci',2),(1573,'Igreja Nova',2),(1574,'Inhapi',2),(1575,'Jacaré dos Homens',2),(1576,'Jacuípe',2),(1577,'Japaratinga',2),(1578,'Jaramataia',2),(1579,'Jequiá da Praia',2),(1580,'Joaquim Gomes',2),(1581,'Jundiá',2),(1582,'Junqueiro',2),(1583,'Lagoa da Canoa',2),(1584,'Limoeiro de Anadia',2),(1585,'Maceió',2),(1586,'Major Isidoro',2),(1587,'Mar Vermelho',2),(1588,'Maragogi',2),(1589,'Maravilha',2),(1590,'Marechal Deodoro',2),(1591,'Maribondo',2),(1592,'Mata Grande',2),(1593,'Matriz de Camaragibe',2),(1594,'Messias',2),(1595,'Minador do Negrão',2),(1596,'Monteirópolis',2),(1597,'Murici',2),(1598,'Novo Lino',2),(1599,'Olho d`Água das Flores',2),(1600,'Olho d`Água do Casado',2),(1601,'Olho d`Água Grande',2),(1602,'Olivença',2),(1603,'Ouro Branco',2),(1604,'Palestina',2),(1605,'Palmeira dos Índios',2),(1606,'Pão de Açúcar',2),(1607,'Pariconha',2),(1608,'Paripueira',2),(1609,'Passo de Camaragibe',2),(1610,'Paulo Jacinto',2),(1611,'Penedo',2),(1612,'Piaçabuçu',2),(1613,'Pilar',2),(1614,'Pindoba',2),(1615,'Piranhas',2),(1616,'Poço das Trincheiras',2),(1617,'Porto Calvo',2),(1618,'Porto de Pedras',2),(1619,'Porto Real do Colégio',2),(1620,'Quebrangulo',2),(1621,'Rio Largo',2),(1622,'Roteiro',2),(1623,'Santa Luzia do Norte',2),(1624,'Santana do Ipanema',2),(1625,'Santana do Mundaú',2),(1626,'São Brás',2),(1627,'São José da Laje',2),(1628,'São José da Tapera',2),(1629,'São Luís do Quitunde',2),(1630,'São Miguel dos Campos',2),(1631,'São Miguel dos Milagres',2),(1632,'São Sebastião',2),(1633,'Satuba',2),(1634,'Senador Rui Palmeira',2),(1635,'Tanque d`Arca',2),(1636,'Taquarana',2),(1637,'Teotônio Vilela',2),(1638,'Traipu',2),(1639,'União dos Palmares',2),(1640,'Viçosa',2),(1641,'Alvarães',4),(1642,'Amaturá',4),(1643,'Anamã',4),(1644,'Anori',4),(1645,'Apuí',4),(1646,'Atalaia do Norte',4),(1647,'Autazes',4),(1648,'Barcelos',4),(1649,'Barreirinha',4),(1650,'Benjamin Constant',4),(1651,'Beruri',4),(1652,'Boa Vista do Ramos',4),(1653,'Boca do Acre',4),(1654,'Borba',4),(1655,'Caapiranga',4),(1656,'Canutama',4),(1657,'Carauari',4),(1658,'Careiro',4),(1659,'Careiro da Várzea',4),(1660,'Coari',4),(1661,'Codajás',4),(1662,'Eirunepé',4),(1663,'Envira',4),(1664,'Fonte Boa',4),(1665,'Guajará',4),(1666,'Humaitá',4),(1667,'Ipixuna',4),(1668,'Iranduba',4),(1669,'Itacoatiara',4),(1670,'Itamarati',4),(1671,'Itapiranga',4),(1672,'Japurá',4),(1673,'Juruá',4),(1674,'Jutaí',4),(1675,'Lábrea',4),(1676,'Manacapuru',4),(1677,'Manaquiri',4),(1678,'Manaus',4),(1679,'Manicoré',4),(1680,'Maraã',4),(1681,'Maués',4),(1682,'Nhamundá',4),(1683,'Nova Olinda do Norte',4),(1684,'Novo Airão',4),(1685,'Novo Aripuanã',4),(1686,'Parintins',4),(1687,'Pauini',4),(1688,'Presidente Figueiredo',4),(1689,'Rio Preto da Eva',4),(1690,'Santa Isabel do Rio Negro',4),(1691,'Santo Antônio do Içá',4),(1692,'São Gabriel da Cachoeira',4),(1693,'São Paulo de Olivença',4),(1694,'São Sebastião do Uatumã',4),(1695,'Silves',4),(1696,'Tabatinga',4),(1697,'Tapauá',4),(1698,'Tefé',4),(1699,'Tonantins',4),(1700,'Uarini',4),(1701,'Urucará',4),(1702,'Urucurituba',4),(1703,'Amapá',3),(1704,'Calçoene',3),(1705,'Cutias',3),(1706,'Ferreira Gomes',3),(1707,'Itaubal',3),(1708,'Laranjal do Jari',3),(1709,'Macapá',3),(1710,'Mazagão',3),(1711,'Oiapoque',3),(1712,'Pedra Branca do Amaparí',3),(1713,'Porto Grande',3),(1714,'Pracuúba',3),(1715,'Santana',3),(1716,'Serra do Navio',3),(1717,'Tartarugalzinho',3),(1718,'Vitória do Jari',3),(1719,'Abaiara',6),(1720,'Acarape',6),(1721,'Acaraú',6),(1722,'Acopiara',6),(1723,'Aiuaba',6),(1724,'Alcântaras',6),(1725,'Altaneira',6),(1726,'Alto Santo',6),(1727,'Amontada',6),(1728,'Antonina do Norte',6),(1729,'Apuiarés',6),(1730,'Aquiraz',6),(1731,'Aracati',6),(1732,'Aracoiaba',6),(1733,'Ararendá',6),(1734,'Araripe',6),(1735,'Aratuba',6),(1736,'Arneiroz',6),(1737,'Assaré',6),(1738,'Aurora',6),(1739,'Baixio',6),(1740,'Banabuiú',6),(1741,'Barbalha',6),(1742,'Barreira',6),(1743,'Barro',6),(1744,'Barroquinha',6),(1745,'Baturité',6),(1746,'Beberibe',6),(1747,'Bela Cruz',6),(1748,'Boa Viagem',6),(1749,'Brejo Santo',6),(1750,'Camocim',6),(1751,'Campos Sales',6),(1752,'Canindé',6),(1753,'Capistrano',6),(1754,'Caridade',6),(1755,'Cariré',6),(1756,'Caririaçu',6),(1757,'Cariús',6),(1758,'Carnaubal',6),(1759,'Cascavel',6),(1760,'Catarina',6),(1761,'Catunda',6),(1762,'Caucaia',6),(1763,'Cedro',6),(1764,'Chaval',6),(1765,'Choró',6),(1766,'Chorozinho',6),(1767,'Coreaú',6),(1768,'Crateús',6),(1769,'Crato',6),(1770,'Croatá',6),(1771,'Cruz',6),(1772,'Deputado Irapuan Pinheiro',6),(1773,'Ererê',6),(1774,'Eusébio',6),(1775,'Farias Brito',6),(1776,'Forquilha',6),(1777,'Fortaleza',6),(1778,'Fortim',6),(1779,'Frecheirinha',6),(1780,'General Sampaio',6),(1781,'Graça',6),(1782,'Granja',6),(1783,'Granjeiro',6),(1784,'Groaíras',6),(1785,'Guaiúba',6),(1786,'Guaraciaba do Norte',6),(1787,'Guaramiranga',6),(1788,'Hidrolândia',6),(1789,'Horizonte',6),(1790,'Ibaretama',6),(1791,'Ibiapina',6),(1792,'Ibicuitinga',6),(1793,'Icapuí',6),(1794,'Icó',6),(1795,'Iguatu',6),(1796,'Independência',6),(1797,'Ipaporanga',6),(1798,'Ipaumirim',6),(1799,'Ipu',6),(1800,'Ipueiras',6),(1801,'Iracema',6),(1802,'Irauçuba',6),(1803,'Itaiçaba',6),(1804,'Itaitinga',6),(1805,'Itapajé',6),(1806,'Itapipoca',6),(1807,'Itapiúna',6),(1808,'Itarema',6),(1809,'Itatira',6),(1810,'Jaguaretama',6),(1811,'Jaguaribara',6),(1812,'Jaguaribe',6),(1813,'Jaguaruana',6),(1814,'Jardim',6),(1815,'Jati',6),(1816,'Jijoca de Jericoacoara',6),(1817,'Juazeiro do Norte',6),(1818,'Jucás',6),(1819,'Lavras da Mangabeira',6),(1820,'Limoeiro do Norte',6),(1821,'Madalena',6),(1822,'Maracanaú',6),(1823,'Maranguape',6),(1824,'Marco',6),(1825,'Martinópole',6),(1826,'Massapê',6),(1827,'Mauriti',6),(1828,'Meruoca',6),(1829,'Milagres',6),(1830,'Milhã',6),(1831,'Miraíma',6),(1832,'Missão Velha',6),(1833,'Mombaça',6),(1834,'Monsenhor Tabosa',6),(1835,'Morada Nova',6),(1836,'Moraújo',6),(1837,'Morrinhos',6),(1838,'Mucambo',6),(1839,'Mulungu',6),(1840,'Nova Olinda',6),(1841,'Nova Russas',6),(1842,'Novo Oriente',6),(1843,'Ocara',6),(1844,'Orós',6),(1845,'Pacajus',6),(1846,'Pacatuba',6),(1847,'Pacoti',6),(1848,'Pacujá',6),(1849,'Palhano',6),(1850,'Palmácia',6),(1851,'Paracuru',6),(1852,'Paraipaba',6),(1853,'Parambu',6),(1854,'Paramoti',6),(1855,'Pedra Branca',6),(1856,'Penaforte',6),(1857,'Pentecoste',6),(1858,'Pereiro',6),(1859,'Pindoretama',6),(1860,'Piquet Carneiro',6),(1861,'Pires Ferreira',6),(1862,'Poranga',6),(1863,'Porteiras',6),(1864,'Potengi',6),(1865,'Potiretama',6),(1866,'Quiterianópolis',6),(1867,'Quixadá',6),(1868,'Quixelô',6),(1869,'Quixeramobim',6),(1870,'Quixeré',6),(1871,'Redenção',6),(1872,'Reriutaba',6),(1873,'Russas',6),(1874,'Saboeiro',6),(1875,'Salitre',6),(1876,'Santa Quitéria',6),(1877,'Santana do Acaraú',6),(1878,'Santana do Cariri',6),(1879,'São Benedito',6),(1880,'São Gonçalo do Amarante',6),(1881,'São João do Jaguaribe',6),(1882,'São Luís do Curu',6),(1883,'Senador Pompeu',6),(1884,'Senador Sá',6),(1885,'Sobral',6),(1886,'Solonópole',6),(1887,'Tabuleiro do Norte',6),(1888,'Tamboril',6),(1889,'Tarrafas',6),(1890,'Tauá',6),(1891,'Tejuçuoca',6),(1892,'Tianguá',6),(1893,'Trairi',6),(1894,'Tururu',6),(1895,'Ubajara',6),(1896,'Umari',6),(1897,'Umirim',6),(1898,'Uruburetama',6),(1899,'Uruoca',6),(1900,'Varjota',6),(1901,'Várzea Alegre',6),(1902,'Viçosa do Ceará',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (6,NULL,'Cliente','Jorgito da Silva Paiva',NULL,'jspaiva.1977@gmail.com','$2a$08$Cf1f11ePArKlBJomM0F6a.IxU0M3gvPpr/DHek8nUTRUAhCaK23c.','2017-02-11 08:22:16',1),(7,NULL,'Cliente','Sergio Loroza',NULL,'sergio@gmail.com','$2a$08$Cf1f11ePArKlBJomM0F6a.IxU0M3gvPpr/DHek8nUTRUAhCaK23c.','2017-02-11 10:24:56',2),(8,NULL,'Cliente','Leonardo Ferreira Lima',NULL,'delacrox3@hotmail.com','$2a$08$Cf1f11ePArKlBJomM0F6a.8hkDBVwbjEj4M.X8f8Mif742BLRbCGO','2017-02-16 10:34:01',2);
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
  `tipo_endereco` enum('Casa','Trabalho') NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `fk_tb_endereco_tb_bairro1_idx` (`fk_id_bairro`) USING BTREE,
  KEY `fk_tb_endereco_tb_logradouro1_idx` (`fk_id_logradouro`) USING BTREE,
  KEY `fk_tb_endereco_tb_cliente1_idx` (`fk_id_cliente`) USING BTREE,
  CONSTRAINT `fk_tb_endereco_tb_bairro1` FOREIGN KEY (`fk_id_bairro`) REFERENCES `tb_bairro` (`id_bairro`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_endereco_tb_cliente1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_endereco_tb_logradouro1` FOREIGN KEY (`fk_id_logradouro`) REFERENCES `tb_logradouro` (`id_logradouro`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` VALUES (2,'16 Conjunto A Casa','19',73050161,30,25,6,'Casa'),(4,'16 Conjunto A Casa','30',73050162,30,25,7,'Casa'),(5,'modulo b','17',73380700,34,28,8,'Casa');
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_forma_pagamento`
--

DROP TABLE IF EXISTS `tb_forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_forma_pagamento` (
  `id_forma_pagamento` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `forma_pagamento` varchar(90) NOT NULL,
  PRIMARY KEY (`id_forma_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_forma_pagamento`
--

LOCK TABLES `tb_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_forma_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_frete`
--

DROP TABLE IF EXISTS `tb_frete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_frete` (
  `id_frete` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_frete` varchar(80) NOT NULL,
  `valor_frete` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_frete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_frete`
--

LOCK TABLES `tb_frete` WRITE;
/*!40000 ALTER TABLE `tb_frete` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_frete` ENABLE KEYS */;
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
  KEY `fk_tb_historico_produto_tb_produto1_idx` (`fk_id_produto`) USING BTREE,
  KEY `fk_tb_historico_produto_tb_cliente1_idx` (`fk_id_cliente`) USING BTREE,
  CONSTRAINT `fk_tb_historico_produto_tb_cliente1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_historico_produto_tb_produto1` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `id_itens_pedido` int(8) unsigned zerofill NOT NULL,
  `quantidade` mediumint(3) unsigned NOT NULL,
  `valor_unitario` decimal(6,2) NOT NULL,
  `fk_id_pedido` int(8) unsigned zerofill NOT NULL,
  `fk_id_produto_venda` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_itens_pedido`),
  KEY `fk_tb_itens_pedido_tb_pedido_idx` (`fk_id_pedido`) USING BTREE,
  KEY `fk_tb_itens_pedido_tb_produto_venda1_idx` (`fk_id_produto_venda`) USING BTREE,
  CONSTRAINT `fk_tb_itens_pedido_tb_pedido` FOREIGN KEY (`fk_id_pedido`) REFERENCES `tb_pedido` (`id_pedido`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_itens_pedido_tb_produto_venda1` FOREIGN KEY (`fk_id_produto_venda`) REFERENCES `tb_produto_venda` (`id_produto_venda`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `troco` enum('S','N') NOT NULL,
  `valor_troco` decimal(6,2) DEFAULT NULL,
  `fk_id_cliente` int(10) unsigned NOT NULL,
  `fk_id_frete` tinyint(3) unsigned NOT NULL,
  `fk_id_forma_pagamento` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_tb_pedido_tb_cliente1_idx` (`fk_id_cliente`),
  KEY `fk_tb_pedido_tb_frete1_idx` (`fk_id_frete`) USING BTREE,
  KEY `fk_tb_pedido_tb_forma_pagamento1_idx` (`fk_id_forma_pagamento`) USING BTREE,
  CONSTRAINT `fk_tb_pedido_tb_cliente1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pedido_tb_forma_pagamento1` FOREIGN KEY (`fk_id_forma_pagamento`) REFERENCES `tb_forma_pagamento` (`id_forma_pagamento`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_pedido_tb_frete1` FOREIGN KEY (`fk_id_frete`) REFERENCES `tb_frete` (`id_frete`) ON DELETE NO ACTION ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permissao_grupo`
--

LOCK TABLES `tb_permissao_grupo` WRITE;
/*!40000 ALTER TABLE `tb_permissao_grupo` DISABLE KEYS */;
INSERT INTO `tb_permissao_grupo` VALUES (1,'Admin','1'),(2,'Cliente','2,8');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permissao_parametros`
--

LOCK TABLES `tb_permissao_parametros` WRITE;
/*!40000 ALTER TABLE `tb_permissao_parametros` DISABLE KEYS */;
INSERT INTO `tb_permissao_parametros` VALUES (1,'completo'),(2,'cliente'),(8,'logout');
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
  `tamanho` enum('Pequeno','Médio','Grande','Júnior') DEFAULT NULL,
  `preco_compra` decimal(8,2) NOT NULL,
  `data_compra` date NOT NULL,
  `qtd_comprada` mediumint(4) unsigned NOT NULL,
  `qtd_estoque` mediumint(4) unsigned DEFAULT NULL,
  `prod_nome_imagem` varchar(220) DEFAULT NULL,
  `fk_id_categoria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_tb_produto_tb_categoria1_idx` (`fk_id_categoria`) USING BTREE,
  CONSTRAINT `fk_tb_produto_tb_categoria1` FOREIGN KEY (`fk_id_categoria`) REFERENCES `tb_categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
INSERT INTO `tb_produto` VALUES (1,'Pizza Calabresa','Recheio de Calabresa com Mussarela','','Júnior',18.00,'2017-02-01',30,30,'e348d552e1227d3e3d31a35e44e81c81.jpeg',4),(2,'Coca Cola','Coca Cola de 600 ML','600ml','Médio',3.60,'2017-02-01',30,30,'9f20296eecfa38f3d5820a0bf20ba9ab.jpeg',5),(3,'Crepe','Recheio de Presunto e Mussarela','','Pequeno',4.60,'2017-02-01',30,30,'80288e0b4857b9b719174b2cbd01f758.jpeg',6),(4,'Guaraná','Guaraná de 600 ML','600ml','Médio',3.35,'2017-02-01',30,30,'1d0a4472f51fa61bf206da2affbadb34.jpeg',5);
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tg_atualiza_tab_produto_venda
AFTER UPDATE ON tb_produto
FOR EACH ROW BEGIN
	declare result varchar(8);
	/* Criando variaveis do loop */
	declare done int default false;
	declare idLoop int;
	declare pcLoop decimal(8,2);
    
	/* Criando Cursor para o LOOP */
	declare crTB_PRODUTO cursor for SELECT
		p.id_produto as id,
		p.preco_compra as pc
	from tb_produto p
	where id_produto = NEW.id_produto;
	-- DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
	declare continue handler for not found set done = true;
    
    OPEN crTB_PRODUTO;
    
	-- LOOP
	read_loop: loop 
	  -- Obtem os valores da linha
	  fetch crTB_PRODUTO into idLoop, pcLoop;

	  if done then
		leave read_loop;
	  end if;

	end loop;
    
    CLOSE crTB_PRODUTO;
    
    SET result = (SELECT ativo FROM tb_produto_venda WHERE ativo = 'true' AND fk_id_produto = NEW.id_produto);
    
    if result IS NULL then
		INSERT INTO tb_produto_venda (preco_venda, ativo, data_cadastro, fk_id_produto) VALUES (fncCalculaPrecoVendaProduto(NEW.preco_compra), 'true', NOW(), NEW.id_produto);
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_produto_venda`
--

DROP TABLE IF EXISTS `tb_produto_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_produto_venda` (
  `id_produto_venda` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preco_venda` decimal(8,2) NOT NULL,
  `ativo` enum('true','false') NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `fk_id_produto` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_produto_venda`),
  KEY `fk_tb_produto_venda_tb_produto1_idx` (`fk_id_produto`) USING BTREE,
  CONSTRAINT `fk_tb_produto_venda_tb_produto1` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produto` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto_venda`
--

LOCK TABLES `tb_produto_venda` WRITE;
/*!40000 ALTER TABLE `tb_produto_venda` DISABLE KEYS */;
INSERT INTO `tb_produto_venda` VALUES (1,22.00,'true','2017-02-20 21:08:58',1),(2,5.00,'true','2017-02-20 22:12:49',2),(3,6.00,'true','2017-02-20 22:28:56',3),(4,5.00,'true','2017-02-20 22:37:36',4);
/*!40000 ALTER TABLE `tb_produto_venda` ENABLE KEYS */;
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

--
-- Dumping events for database 'pizzaria'
--

--
-- Dumping routines for database 'pizzaria'
--
/*!50003 DROP FUNCTION IF EXISTS `fncCalculaPrecoVendaProduto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fncCalculaPrecoVendaProduto`(valor_compra DECIMAL (8,2)) RETURNS decimal(8,2)
BEGIN
	DECLARE valor_venda DECIMAL (8,2);
    SET valor_venda = CEILING(valor_compra * 1.17);
RETURN valor_venda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fncRetornaAtivoTbProdVenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fncRetornaAtivoTbProdVenda`(p_id INT) RETURNS varchar(20) CHARSET utf8
BEGIN
	declare result varchar(20);
	/* Criando variaveis do loop */
	declare done int default false;
	declare idLoop int;
	declare pcLoop decimal(8,2);
    
	/* Criando Cursor para o LOOP */
	declare crTB_PRODUTO cursor for SELECT
		p.id_produto as id,
		p.preco_compra as pc
	from tb_produto p
	where id_produto = p_id;
	-- DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
	declare continue handler for not found set done = true;
    
    OPEN crTB_PRODUTO;
    
	-- LOOP
	read_loop: loop 
	  -- Obtem os valores da linha
	  fetch crTB_PRODUTO into idLoop, pcLoop;

	  if done then
		leave read_loop;
	  end if;

	end loop;
    
    CLOSE crTB_PRODUTO;
    
    SET result = (SELECT ativo FROM tb_produto_venda WHERE ativo = 'true' AND fk_id_produto = p_id);
    
    if result IS NULL then
		INSERT INTO tb_produto_venda (preco_venda, ativo, data_cadastro, fk_id_produto) VALUES (fncCalculaPrecoVendaProduto(pcLoop), 'true', NOW(), idLoop);
		SET result = 'Inserido na Tb Venda';
    else
		SET result = 'Não Inseriu';
    end if;
    
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_atualiza_estoque_produtos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_atualiza_estoque_produtos`(p_id INT)
BEGIN
	DECLARE qtd INT;
	SET qtd = (SELECT qtd_comprada FROM tb_produto WHERE id_produto = p_id);
    UPDATE tb_produto SET qtd_estoque = qtd WHERE id_produto = p_id;
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

-- Dump completed on 2017-02-20 22:40:13

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemaodontologicomentafinal
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
-- Table structure for table `atiende`
--

DROP TABLE IF EXISTS `atiende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atiende` (
  `numTrabajador` int NOT NULL,
  `cedula` int NOT NULL,
  KEY `fk_Atiende_Odontologo1_idx` (`numTrabajador`),
  KEY `fk_Atiende_Paciente1_idx` (`cedula`),
  CONSTRAINT `fk_Atiende_Odontologo1` FOREIGN KEY (`numTrabajador`) REFERENCES `odontologo` (`numTrabajador`),
  CONSTRAINT `fk_Atiende_Paciente1` FOREIGN KEY (`cedula`) REFERENCES `paciente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atiende`
--

LOCK TABLES `atiende` WRITE;
/*!40000 ALTER TABLE `atiende` DISABLE KEYS */;
INSERT INTO `atiende` VALUES (1,1101691241),(1,1106937170),(5,1151740806),(3,1123400470),(3,1106937170),(1,1154305762),(2,1144002944),(3,1136355767),(4,1151740806),(4,1157103741),(2,1135149716),(2,1122555517),(6,1122555517),(6,1151643958);
/*!40000 ALTER TABLE `atiende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citamedica`
--

DROP TABLE IF EXISTS `citamedica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citamedica` (
  `idConsulta` int NOT NULL AUTO_INCREMENT COMMENT 'Id de Consulta\n',
  `estado` varchar(80) DEFAULT NULL COMMENT 'Estado de la Cita \n',
  `fecha` date DEFAULT NULL COMMENT 'Fecha de Cita\n',
  `hora` time DEFAULT NULL COMMENT 'Hora de Cita\n',
  `motivo` varchar(200) DEFAULT NULL COMMENT 'Motivo de Cita\n',
  `idPrecio` int NOT NULL,
  PRIMARY KEY (`idConsulta`),
  KEY `fk_CitaMedica_Precio1_idx` (`idPrecio`),
  CONSTRAINT `fk_CitaMedica_Precio1` FOREIGN KEY (`idPrecio`) REFERENCES `precio` (`idPrecio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citamedica`
--

LOCK TABLES `citamedica` WRITE;
/*!40000 ALTER TABLE `citamedica` DISABLE KEYS */;
INSERT INTO `citamedica` VALUES (1,'Activo','2021-02-03','08:00:00','Molestia de diente',3),(2,'Activo','2021-02-03','09:00:00','Control de braquets',4),(3,'Cancelado','2021-02-03','11:00:00','Diente Careado',2),(4,'Activo','2021-02-03','11:30:00','Extraccion de Terceros Molares',6),(5,'Cancelado','2021-02-05','10:45:00','Revision Odontologica',1),(6,'Cancelado','2021-02-05','12:45:00','Cambio de Protesis',8),(7,'Activo','2021-05-09','08:00:00','Control de Ortodoncia',4),(8,'Cancelado','2021-05-09','10:00:00','Fractura Dental',2),(9,'Cancelado','2021-09-15','13:00:00','Sensibilidad',2),(10,'Activo','2021-09-15','15:00:00','Movilidad Dental',4);
/*!40000 ALTER TABLE `citamedica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultageneral`
--

DROP TABLE IF EXISTS `consultageneral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultageneral` (
  `fecha` date DEFAULT NULL COMMENT 'Fecha de Consulta General\n',
  `idConsulta` int NOT NULL,
  KEY `fk_ConsultaGeneral_CitaMedica1_idx` (`idConsulta`),
  CONSTRAINT `fk_ConsultaGeneral_CitaMedica1` FOREIGN KEY (`idConsulta`) REFERENCES `citamedica` (`idConsulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultageneral`
--

LOCK TABLES `consultageneral` WRITE;
/*!40000 ALTER TABLE `consultageneral` DISABLE KEYS */;
INSERT INTO `consultageneral` VALUES ('2021-02-03',1),('2021-02-05',5),('2021-02-05',6),('2021-09-15',9);
/*!40000 ALTER TABLE `consultageneral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio` (
  `numero` int NOT NULL AUTO_INCREMENT COMMENT 'Numero de Consultorio\n',
  `tipo` varchar(80) DEFAULT NULL COMMENT 'Tipo de Consultorio\n',
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,'Rayos X'),(2,'Consultorio General'),(3,'Sala de Rehabilitacion'),(4,'Consultorio General'),(5,'Sala de Cirugias'),(6,'Consultorio General');
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genera`
--

DROP TABLE IF EXISTS `genera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genera` (
  `numTrabajador` int NOT NULL,
  `cedula` int NOT NULL,
  `idConsulta` int NOT NULL,
  KEY `fk_Genera_Odontologo1_idx` (`numTrabajador`),
  KEY `fk_Genera_Paciente1_idx` (`cedula`),
  KEY `fk_Genera_Cita Medica1_idx` (`idConsulta`),
  CONSTRAINT `fk_Genera_Cita Medica1` FOREIGN KEY (`idConsulta`) REFERENCES `citamedica` (`idConsulta`),
  CONSTRAINT `fk_Genera_Odontologo1` FOREIGN KEY (`numTrabajador`) REFERENCES `odontologo` (`numTrabajador`),
  CONSTRAINT `fk_Genera_Paciente1` FOREIGN KEY (`cedula`) REFERENCES `paciente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genera`
--

LOCK TABLES `genera` WRITE;
/*!40000 ALTER TABLE `genera` DISABLE KEYS */;
INSERT INTO `genera` VALUES (1,1101691241,1),(1,1106937170,2),(5,1151740806,3),(3,1123400470,4),(3,1106937170,5),(1,1154305762,6),(2,1144002944,7),(3,1136355767,8),(4,1151740806,9),(4,1157103741,10);
/*!40000 ALTER TABLE `genera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historiaclinica`
--

DROP TABLE IF EXISTS `historiaclinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historiaclinica` (
  `numHistoriaC` int NOT NULL COMMENT 'Numero de Historia de Paciente\n',
  `motivoConsulta` varchar(200) DEFAULT NULL COMMENT 'Motivo de Consulta\n',
  `enfermedadActual` varchar(200) DEFAULT NULL COMMENT 'Enfermedad Actual del Paciente\n',
  `diagnostico` varchar(200) DEFAULT NULL COMMENT 'Diagnostico del Paciente\n',
  `cedula` int NOT NULL,
  `idOdontograma` int NOT NULL,
  PRIMARY KEY (`numHistoriaC`),
  KEY `fk_HistoriaClinica_Paciente1_idx` (`cedula`),
  KEY `fk_HistoriaClinica_Odontograma1_idx` (`idOdontograma`),
  CONSTRAINT `fk_HistoriaClinica_Odontograma1` FOREIGN KEY (`idOdontograma`) REFERENCES `odontograma` (`idOdontograma`),
  CONSTRAINT `fk_HistoriaClinica_Paciente1` FOREIGN KEY (`cedula`) REFERENCES `paciente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historiaclinica`
--

LOCK TABLES `historiaclinica` WRITE;
/*!40000 ALTER TABLE `historiaclinica` DISABLE KEYS */;
INSERT INTO `historiaclinica` VALUES (23656,'Restauracion de Protesis','Presion Alta','Lesion coronal de 4 piezas',1127992609,3),(38444,'Revision y Control de Estetica','Ninguna','Analisis de Radiografia',1136355767,5),(43797,'Evolucion y Crecimiento de los Terceros Molares','Ninguna','Apiñamiento de los Dientes',1123400470,2),(86464,'Revision y Control de la Ortodoncia','Ninguna','Diseño de Plan de tratamiento y adaptacion del paciente',1135149716,4),(90740,'Observacion y Seguimiento de Braquets','Diabetes','Falta de Cepillado de Dientes',1104306735,1);
/*!40000 ALTER TABLE `historiaclinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeropieza`
--

DROP TABLE IF EXISTS `numeropieza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numeropieza` (
  `numPieza` int DEFAULT NULL COMMENT 'Numero de Piezas del Odontograma',
  `idOdontograma` int NOT NULL,
  KEY `fk_NumeroPieza_Odontograma1_idx` (`idOdontograma`),
  CONSTRAINT `fk_NumeroPieza_Odontograma1` FOREIGN KEY (`idOdontograma`) REFERENCES `odontograma` (`idOdontograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeropieza`
--

LOCK TABLES `numeropieza` WRITE;
/*!40000 ALTER TABLE `numeropieza` DISABLE KEYS */;
INSERT INTO `numeropieza` VALUES (11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(18,2),(28,2),(38,2),(48,2),(12,3),(11,3),(21,3),(22,3),(31,4),(32,4),(33,4),(34,4),(35,4),(36,4),(37,4),(41,4),(42,4),(43,4),(44,4),(45,4),(46,4),(47,4),(21,5),(11,5);
/*!40000 ALTER TABLE `numeropieza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oclusion`
--

DROP TABLE IF EXISTS `oclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oclusion` (
  `idOclusion` int NOT NULL AUTO_INCREMENT COMMENT 'Id de Oclusion\n',
  `tipo` varchar(80) DEFAULT NULL COMMENT 'Tipo de Oclusion\n',
  `descripcion` varchar(200) DEFAULT NULL COMMENT 'Descripcion de Oclusion\n',
  PRIMARY KEY (`idOclusion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oclusion`
--

LOCK TABLES `oclusion` WRITE;
/*!40000 ALTER TABLE `oclusion` DISABLE KEYS */;
INSERT INTO `oclusion` VALUES (1,'Clase 1','el primer molar inferior se encuentra en relación normal, ocluyendo la cúspide mesiovestibular'),(2,'Clase 2','el primer molar inferior se encuentra en relación distal respecto al superior y se reconocen dos divisiones, según la inclinación de los incisivos superiores, y dos subdivisiones'),(3,'Clase 3','el primer molar inferior se encuentra en relación mesial respecto del superior. La articulación dentaria a nivel del área de los incisivos está habitualmente invertida.');
/*!40000 ALTER TABLE `oclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odontograma`
--

DROP TABLE IF EXISTS `odontograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odontograma` (
  `idOdontograma` int NOT NULL AUTO_INCREMENT COMMENT 'Id de Odontograma\n',
  `observacion` varchar(200) DEFAULT NULL COMMENT 'Numero de Pieza Dental(s)\n',
  `diagnostico` varchar(200) DEFAULT NULL COMMENT 'Diagnostico de Piezas\n',
  PRIMARY KEY (`idOdontograma`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odontograma`
--

LOCK TABLES `odontograma` WRITE;
/*!40000 ALTER TABLE `odontograma` DISABLE KEYS */;
INSERT INTO `odontograma` VALUES (1,'Todos los dientes del maxilar superior se encuentran con acumulacion de sarro y residuos de comida','Dientes de la parte superior derecha se encuentran en estado medio y dientes de la parte superior izquierda se encuentran en estado medio, presentan bacterias'),(2,'Se necesita llevar a cabo una cirugía','Derecho superior, arriba a la izquierda, abajo a la izquierda, abajo a la derecha en desarrollo'),(3,'Se realiza cambio y restauración de nueva Prótesis','Incisivos arriba a la derecha y arriba a la izquierda en estado medio'),(4,'Se realiza cambio y reparacion del arco dañado','Incisivo abajo a la izquierda e inferior derecho se encuentra con el cable de ortodoncia roto'),(5,'Llevar a cabo el proceso de restauracion','Incisivo arriba e incisivo a la derecha se encuentra en mal estado');
/*!40000 ALTER TABLE `odontograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odontologo`
--

DROP TABLE IF EXISTS `odontologo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odontologo` (
  `numTrabajador` int NOT NULL AUTO_INCREMENT COMMENT 'Numero de Odontologo\n',
  `nombre` varchar(80) DEFAULT NULL COMMENT 'Nombre(s)\n',
  `apellidoPa` varchar(80) DEFAULT NULL COMMENT 'Apellido Paterno\n',
  `apellidoMa` varchar(80) DEFAULT NULL COMMENT 'Apellido Materno\n',
  PRIMARY KEY (`numTrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odontologo`
--

LOCK TABLES `odontologo` WRITE;
/*!40000 ALTER TABLE `odontologo` DISABLE KEYS */;
INSERT INTO `odontologo` VALUES (1,'Luis','Sanchez','Romero'),(2,'Lucas','Castiillo','Salcedo'),(3,'Marco','Rodriguez','Valdivieso'),(4,'Ana','Martinez','Riofrio'),(5,'Martha','Camacho','Mercedes'),(6,'Rashell','Tigsilema','Sarmiento');
/*!40000 ALTER TABLE `odontologo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `cedula` int NOT NULL COMMENT 'Nro. Cedula Paciente\n',
  `nombre` varchar(80) DEFAULT NULL COMMENT 'Nombre(s)\n',
  `apellidoPa` varchar(80) DEFAULT NULL COMMENT 'Apellido Paterno\n',
  `apellidoMa` varchar(80) DEFAULT NULL COMMENT 'Apellido Materno\n',
  `sexo` char(1) DEFAULT NULL COMMENT 'Sexo (F o M)\n',
  `nacimiento` date DEFAULT NULL COMMENT 'Fecha de Nacimiento\n',
  `profesion` varchar(80) DEFAULT NULL COMMENT 'Profesion o Cargo\n',
  `telefono` int DEFAULT NULL COMMENT 'Telefono Celular o Telefono de Hogar\n',
  `calle` varchar(80) DEFAULT NULL COMMENT 'Calle de Vivienda\n',
  `ciudad` varchar(80) DEFAULT NULL COMMENT 'Ciudad de Vivienda\n',
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1101691241,'Marcela','Gomez','Natan','M','1997-01-01','Ingeniera en Minas',915297193,'Av de los Paltas entre Italia y Rusia','Loja'),(1104306735,'Antony','Paucar','Calva','H','1994-08-14','Abogado',7270394,'Miguel Riofrio y Lauro Guerrero Esquina','Gonzanama'),(1106937170,'Andres','Macas','Pineda','H','1996-05-01','Doctor',964559818,'Ramon Pinto y 10 de Agosto Esquina','Espindola'),(1122555517,'Elissa','Gonzales','Ortega','M','1996-10-09','Ingeniera Forestal',7278298,'Nicolasa Jurado y Jose A. Paladines Esquina','Calvas'),(1123400470,'Juan','Castro','Mendez','H','1997-06-20','Chofer',992649281,'Av Pio Jaramillo y John F. Keneddy','Catamayo'),(1127992609,'Dolores','Martinez','Sucre','M','1999-11-25','Abogada',7275898,'Juan Montalvo y Calle Napoleon Esquina','Celica'),(1135149716,'David','Salcedo','Salcedo','H','1994-05-20','Policia',938916226,'Av Pio Jaramillo y Diego Noboa','Loja'),(1136355767,'Marta','Jimenez','Rodriguez','M','1990-12-24','Piloto',7279772,'Jaime Roldos Aguilera y Francisco Lecaro Esquina','Paltas'),(1142270671,'Luis','Delgado','Maldonado','H','1996-02-02','Arquitecto',919269140,'Blanca Cano y Jose M Bustamante Esquina','Puyango'),(1144002944,'Estefania','Garcia','Cueva','M','1998-01-30','Abogada',72710996,'Homero Idrovo y Manuel de J. Lozano Esquina','Quianga'),(1149670343,'Mario','Benitez','Quevedo','H','1996-10-24','Militar',943997013,'Av Salvador Bustamante entre Isla Sta . Fe e Isla Sta. Cruz','Saraguro'),(1151643958,'Josue','Sauca','Fabricio','H','1995-03-25','Abogado',72756858,'Calle Toronto y Houston Esquina','Zapotillo'),(1151740806,'Roberto','Galvan','Torres','H','1995-04-12','Profesor',966578852,'Calle Ottawa y Monterreal Esquina','Loja'),(1154305762,'Jonathan','Sefla','Paredes','H','1991-02-05','Carpintero',72720191,'Calle Los Angeles y Ottawa Esquina','Paltas'),(1155025842,'Dayanna','Balcazar','Eduardo','M','1997-12-01','Militar',932074016,'Calle Illiniza y Sangay Esquina','Olmedo'),(1157103741,'Eliana','Salcedo','Armijos','M','1995-09-15','Ingeniera Automotriz',72740305,'Av Orillas del Zamora y Vicente Rocafuerte Esquina','Celica'),(1166448559,'Carlos','Castro','Villavicencio','H','1993-07-21','Psicologo',939747416,'Rio Bobanaza y Rio Pilcomaya Esquina','ChaguarpambaC'),(1167742260,'Angel','Macas','Anabel','H','1992-03-16','Bombero',72716362,'Rio de la Plara y Rio Santiago Esquina','Loja'),(1168850125,'Elena','Ochoa','Vivanco','M','1999-11-24','Ingeniera en Minas',957581822,'Rio Orinoco y Rio Arauca Esquina','Loja'),(1176592846,'Maria','Castillo','Jumbo','M','1991-11-23','Estudiante',72760571,'Sucre y 18 de Noviembre','Loja');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio`
--

DROP TABLE IF EXISTS `precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio` (
  `idPrecio` int NOT NULL AUTO_INCREMENT COMMENT 'Id de Precio',
  `valor` double DEFAULT NULL COMMENT 'Valor de Consulta o Tratamiento',
  `descripcion` varchar(200) DEFAULT NULL COMMENT 'Descripcion de Precios',
  PRIMARY KEY (`idPrecio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio`
--

LOCK TABLES `precio` WRITE;
/*!40000 ALTER TABLE `precio` DISABLE KEYS */;
INSERT INTO `precio` VALUES (1,10,'Profilaxis'),(2,10,'Operatoria'),(3,80,'Endodoncia'),(4,1350,'Ortodoncia'),(5,40,'Extraccion de Dientes Normales'),(6,80,'Extraccion de Terceros Molares'),(7,300,'Protesis Totales'),(8,350,'Protesis Parciales'),(9,20,'Restauracion Dental');
/*!40000 ALTER TABLE `precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruebascomplementarias`
--

DROP TABLE IF EXISTS `pruebascomplementarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pruebascomplementarias` (
  `pruebaComp` varchar(80) DEFAULT NULL,
  `numHistoriaC` int NOT NULL,
  KEY `fk_PruebasComplementarias_HistoriaClinica1_idx` (`numHistoriaC`),
  CONSTRAINT `fk_PruebasComplementarias_HistoriaClinica1` FOREIGN KEY (`numHistoriaC`) REFERENCES `historiaclinica` (`numHistoriaC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruebascomplementarias`
--

LOCK TABLES `pruebascomplementarias` WRITE;
/*!40000 ALTER TABLE `pruebascomplementarias` DISABLE KEYS */;
INSERT INTO `pruebascomplementarias` VALUES ('Radiografia Panoramica',38444),('Radiografia Panoramica',43797),('Conteo Sanguineo',43797),('radiografía Periapical',23656);
/*!40000 ALTER TABLE `pruebascomplementarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetamedica`
--

DROP TABLE IF EXISTS `recetamedica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetamedica` (
  `idReceta` int NOT NULL AUTO_INCREMENT COMMENT 'Id de Receta Medica\n',
  `medicamento` varchar(200) DEFAULT NULL COMMENT 'Medicamentos de la Receta\n',
  `dosis` varchar(200) DEFAULT NULL COMMENT 'Dosis de Medicamentos\n',
  `tiempo` varchar(200) DEFAULT NULL COMMENT 'Tiempo de Receta para el Tratamiento\n',
  `idConsulta` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `fk_RecetaMedica_Tratamiento1_idx` (`idConsulta`),
  CONSTRAINT `fk_RecetaMedica_Tratamiento1` FOREIGN KEY (`idConsulta`) REFERENCES `tratamiento` (`idConsulta`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetamedica`
--

LOCK TABLES `recetamedica` WRITE;
/*!40000 ALTER TABLE `recetamedica` DISABLE KEYS */;
INSERT INTO `recetamedica` VALUES (1,'Paracetamol','500 mg ','cada 4 horas',2,6,'Analgesico y \r antipirético eficaz para el control del dolor leve o moderado causado por dolor odontogénico y neuralgias'),(2,'Metamizol','575 mg','cada 8 horas',2,4,'Analgesico de prescripción médica autorizado para el tratamiento del dolor \r agudo intenso fuerte dolor de muelas o de la fiebre alta que no responde a otros tratamientos.'),(3,'Diclofenaco','50 mg','cada 8 horas',5,6,'Diclofenaco:\nAntiinflamatorio para problemas graves de dolor e inflamación, dolor en articulaciones y dolores en los dientes'),(4,'Hidrocortisona','40 mg','cada dia',5,5,'Hidrocortisona:\nAlivia la inflamacion (hinchazon, calor, enrojecimiento y dolor)'),(5,'Dexametasona','8 mg','cada dia',6,2,'Farmaco para disminuir o tratar de evitar las reacciones \ndel cuerpo ante el estres que pueden llegar a generar \nlas exodoncias u otro procedimiento quirúrgico en cirugia oral o maxilofacial'),(6,'Tramadol','100 mg','cada 8 horas',6,5,'Medicamento para tratar el dolor que va de moderado a grave en los adultos / Analgesico'),(7,'Naproxeno','30 mg','cada 6 horas',7,2,'(Aleve y genericos) tienen un efecto particularmente bueno \ncontra el dolor dental porque reducen la inflamacion en las areas lastimadas de la boca'),(8,'Ibuprofeno','600 mg','cada 6 horas',8,3,'Para el Proceso inflamatorio (dolor de muelas o de garganta)');
/*!40000 ALTER TABLE `recetamedica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajar`
--

DROP TABLE IF EXISTS `trabajar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajar` (
  `dia` date DEFAULT NULL COMMENT 'Fecha de Trabajo en Consultorio\n',
  `horaInicio` time DEFAULT NULL COMMENT 'Hora de Inicio de Trabajo \n',
  `horaFin` time DEFAULT NULL COMMENT 'Hora de Salida de Trabajo\n',
  `numero` int NOT NULL,
  `numTrabajador` int NOT NULL,
  KEY `fk_Trabajar_Consultorio_idx` (`numero`),
  KEY `fk_Trabajar_Odontologo1_idx` (`numTrabajador`),
  CONSTRAINT `fk_Trabajar_Consultorio` FOREIGN KEY (`numero`) REFERENCES `consultorio` (`numero`),
  CONSTRAINT `fk_Trabajar_Odontologo1` FOREIGN KEY (`numTrabajador`) REFERENCES `odontologo` (`numTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajar`
--

LOCK TABLES `trabajar` WRITE;
/*!40000 ALTER TABLE `trabajar` DISABLE KEYS */;
INSERT INTO `trabajar` VALUES ('2021-02-03','08:00:00','16:00:00',1,1),('2021-02-03','08:00:00','16:00:00',2,2),('2021-02-03','08:00:00','16:00:00',3,3),('2021-02-05','08:00:00','16:00:00',1,1),('2021-02-05','08:00:00','16:00:00',2,2),('2021-02-05','08:00:00','16:00:00',3,3),('2021-05-09','08:00:00','16:00:00',5,6),('2021-09-15','08:00:00','16:00:00',6,6);
/*!40000 ALTER TABLE `trabajar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento` (
  `descripcion` varchar(200) DEFAULT NULL COMMENT 'Descripcion del Tratamiento\n',
  `fechaInicio` date DEFAULT NULL COMMENT 'Fecha de Inicio de Tratamiento\n',
  `fechaFin` date DEFAULT NULL COMMENT 'Fecha de Finalización de Tratamiento\n',
  `tipoT` varchar(200) DEFAULT NULL COMMENT 'Tipo de Tratamiento\n',
  `idConsulta` int NOT NULL,
  `idOclusion` int NOT NULL,
  `numHistoriaC` int NOT NULL,
  PRIMARY KEY (`idConsulta`),
  KEY `fk_Tratamiento_Cita Medica1_idx` (`idConsulta`),
  KEY `fk_Tratamiento_Oclusion1_idx` (`idOclusion`),
  KEY `fk_Tratamiento_Historia Clinica1_idx` (`numHistoriaC`),
  CONSTRAINT `fk_Tratamiento_Cita Medica1` FOREIGN KEY (`idConsulta`) REFERENCES `citamedica` (`idConsulta`),
  CONSTRAINT `fk_Tratamiento_Historia Clinica1` FOREIGN KEY (`numHistoriaC`) REFERENCES `historiaclinica` (`numHistoriaC`),
  CONSTRAINT `fk_Tratamiento_Oclusion1` FOREIGN KEY (`idOclusion`) REFERENCES `oclusion` (`idOclusion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES ('Se realizo un cambio de ligas y cambio de arcos','2021-02-03','2024-02-03','Ortodoncia',2,1,90740),('Se detecto malas ocliusiones y apiñaniemto','2021-02-05','2021-02-19','Profilaxis',5,1,43797),('Se llevo a cabo una revision y se procedio con el cambio de la protesis','2021-02-05','2021-03-05','Protesis Parciales',6,1,23656),('Se revisa la oclusion del paciente , y se trata si tiene presencia de malas oclusiones , apiñamientos , diastemas','2021-05-09','2024-05-09','Ortodoncia',7,2,86464),('Se revisa la pieza dental , si su fractura es extensa deberia ser extraida','2021-05-09','2021-05-11','Operatoria',8,3,38444);
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-17 23:15:45

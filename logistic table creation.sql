-- Host: localhost    Database: logistic_data
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Cust_ID` int NOT NULL,
  `Cust_NAME` varchar(30) DEFAULT NULL,
  `Cust_EMAIL_ID` varchar(45) DEFAULT NULL,
  `Cust_CONT_NO` varchar(20) DEFAULT NULL,
  `Cust_ADDR` varchar(100) DEFAULT NULL,
  `Cust_TYPE` varchar(30) DEFAULT NULL,
  `Membership_M_ID` int DEFAULT NULL,
  PRIMARY KEY (`Cust_ID`),
  KEY `Membership_M_ID_idx` (`Membership_M_ID`),
  CONSTRAINT `Membership_M_ID` FOREIGN KEY (`Membership_M_ID`) REFERENCES `membership` (`M_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee manages shipment`
--

DROP TABLE IF EXISTS `employee manages shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee manages shipment` (
  `Employee_E_ID` int DEFAULT NULL,
  `Shipment_SH_ID` int DEFAULT NULL,
  `Status_SH_ID` int DEFAULT NULL,
  KEY `Employee_E_ID_idx` (`Employee_E_ID`),
  KEY `Shipment_SH_ID_idx` (`Shipment_SH_ID`),
  KEY `Status_SH_ID_idx` (`Status_SH_ID`),
  CONSTRAINT `Employee_E_ID` FOREIGN KEY (`Employee_E_ID`) REFERENCES `employee_details` (`Emp_ID`),
  CONSTRAINT `Shipment_SH_ID` FOREIGN KEY (`Shipment_SH_ID`) REFERENCES `shipment_details` (`SD_ID`),
  CONSTRAINT `Status_SID` FOREIGN KEY (`Status_SH_ID`) REFERENCES `status` (`SH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_details`
--

DROP TABLE IF EXISTS `employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_details` (
  `Emp_ID` int NOT NULL,
  `Emp_NAME` varchar(30) DEFAULT NULL,
  `Emp_DESIGNATION` varchar(40) DEFAULT NULL,
  `Emp_ADDR` varchar(100) DEFAULT NULL,
  `Emp_BRANCH` varchar(15) DEFAULT NULL,
  `Emp_CONT_NO` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `M_ID` int NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  PRIMARY KEY (`M_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `PAYMENT_ID` varchar(40) NOT NULL,
  `AMOUNT` int DEFAULT NULL,
  `PAYMENT_STATUS` varchar(10) DEFAULT NULL,
  `PAYMENT_DATE` date DEFAULT NULL,
  `PAYMENT_MODE` varchar(25) DEFAULT NULL,
  `Shipment_SH_ID` int DEFAULT NULL,
  `Shipment_Client_C_ID` int DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `Status_SH_ID_idx` (`Shipment_SH_ID`),
  KEY `Shipment_Client_C_ID_idx` (`Shipment_Client_C_ID`),
  CONSTRAINT `Shipment_Client_C_ID` FOREIGN KEY (`Shipment_Client_C_ID`) REFERENCES `customer` (`Cust_ID`),
  CONSTRAINT `Status_SH_ID` FOREIGN KEY (`Shipment_SH_ID`) REFERENCES `shipment_details` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shipment_details`
--

DROP TABLE IF EXISTS `shipment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment_details` (
  `SD_ID` int NOT NULL,
  `SD_CONTENT` varchar(45) DEFAULT NULL,
  `SD_DOMAIN` varchar(15) DEFAULT NULL,
  `SD_TYPE` varchar(15) DEFAULT NULL,
  `SD_WEIGHT` varchar(10) DEFAULT NULL,
  `SD_CHARGES` int DEFAULT NULL,
  `SD-ADDR` varchar(100) DEFAULT NULL,
  `DS_ADDR` varchar(100) DEFAULT NULL,
  `Customer_Cust_ID` int DEFAULT NULL,
  PRIMARY KEY (`SD_ID`),
  KEY `Customer_Cust_ID_idx` (`Customer_Cust_ID`),
  CONSTRAINT `Customer_Cust_ID` FOREIGN KEY (`Customer_Cust_ID`) REFERENCES `customer` (`Cust_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `SH_ID` int NOT NULL,
  `CURRENT_ST` varchar(15) DEFAULT NULL,
  `SENT_DATE` varchar(10) DEFAULT NULL,
  `DELIVERY_DATE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SH_ID`),
  CONSTRAINT `SH_ID` FOREIGN KEY (`SH_ID`) REFERENCES `shipment_details` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


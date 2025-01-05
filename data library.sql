CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS author;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE author (
  a_id int NOT NULL,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NOT NULL,
  PRIMARY KEY (a_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES author WRITE;
INSERT INTO author VALUES (10,'Walter','Issacson'),(11,'Joel','Fuhrman'),(20,'Jawaharlal','Nehru'),(30,'Mahatma',' Gandhi'),(40,'E','Balagurusamy'),(50,'Ellen','Lupton'),(60,'Lindsay','Adler'),(70,'Napoleon','Hill'),(80,'Peter','M.Senge'),(90,'John','Rawls'),(100,'Stephen ',' Hawking');
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS book;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE book (
  b_id int NOT NULL,
  Title varchar(45) NOT NULL,
  author varchar(45) NOT NULL,
  category_id int NOT NULL,
  publication_year varchar(45) NOT NULL,
  PRIMARY KEY (b_id),
  KEY category_id_idx (category_id),
  CONSTRAINT category FOREIGN KEY (category_id) REFERENCES category (cate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES book WRITE;
INSERT INTO book VALUES (1,'Steve Jobs','Walter Issacson',100,'1990'),(2,'Discovery of India','Jawaharlal Nehru',101,'1999'),(3,'My Experiments with Truth','Mahatma Gandhi',102,'1998'),(4,'Object Oriented Programming with C++','E Balagurusamy',103,'2000'),(5,'Thinking with type','Ellen Lupton',104,'1997'),(6,'The Photographer\'s','Lindsay Adler',105,'2002'),(7,'Think and Grow','Napoleon Hill',106,'1992'),(8,'The Fifth Discipline : The Art','Peter M.Senge',107,'1995'),(9,'A Theory of Justice','John Rawls',108,'2001'),(10,'Eat to Live','Joel Fuhrman',109,'2003');
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS book_author;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE book_author (
  book_id int NOT NULL,
  author_id int NOT NULL,
  PRIMARY KEY (book_id,author_id),
  KEY bookid_idx (book_id),
  KEY authorid_idx (author_id),
  CONSTRAINT authorid FOREIGN KEY (author_id) REFERENCES author (a_id),
  CONSTRAINT bookid FOREIGN KEY (book_id) REFERENCES book (b_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES book_author WRITE;
INSERT INTO book_author VALUES (1,10),(2,20),(3,30),(4,40),(5,50),(6,60),(7,70),(8,80),(9,90),(10,11);
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS category;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE category (
  cate_id int NOT NULL,
  category_name varchar(45) NOT NULL,
  PRIMARY KEY (cate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES category WRITE;
INSERT INTO category VALUES (100,'Biography'),(101,'History'),(102,'Autobiography'),(103,'Education'),(104,'Arts'),(105,'Photography'),(106,'Economics'),(107,'Management'),(108,'Law'),(109,'Health'),(110,'Space');
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS employees;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE employees (
  employe_Id int NOT NULL,
  `First Name` varchar(45) NOT NULL,
  `Last Name` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Contract Type` varchar(45) NOT NULL,
  phone_number varchar(15) NOT NULL,
  PRIMARY KEY (employe_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES employees WRITE;
INSERT INTO employees VALUES (1100,'Uriah','Bridges','Librarian','full time','8200357431'),(1101,'Paula','Small','assistant librarian','part time','9974994921'),(1102,'Edward','Buck','IT support','full time','760052255'),(1103,'Michael','Riordan','security','full time','820054566'),(1104,'Jasmine','Onque','admin staff','part time','8140471945');
UNLOCK TABLES;

--
-- Table structure for table `fine`
--

DROP TABLE IF EXISTS fine;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE fine (
  fine_id int NOT NULL,
  member_id int NOT NULL,
  loan_id int NOT NULL,
  fine_date varchar(15) NOT NULL,
  fine_amount int NOT NULL,
  PRIMARY KEY (fine_id),
  KEY member_ID_idx (member_id),
  KEY loan_id_idx (loan_id),
  CONSTRAINT loan_id FOREIGN KEY (loan_id) REFERENCES loan (loan_id),
  CONSTRAINT `member` FOREIGN KEY (member_id) REFERENCES `member` (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine`
--

LOCK TABLES fine WRITE;
INSERT INTO fine VALUES (5001,2002,1500,'23-feb-24',5),(5002,2001,1510,'02-jan-24',15),(5003,2003,1515,'02-mar-24',40),(5004,2009,1520,'16-feb-24',30),(5005,2006,1525,'16-jan-24',25);
UNLOCK TABLES;

--
-- Table structure for table `fine_payment`
--

DROP TABLE IF EXISTS fine_payment;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE fine_payment (
  finepay_id int NOT NULL,
  member_id int NOT NULL,
  payment_date varchar(20) NOT NULL,
  payment_amount int NOT NULL,
  PRIMARY KEY (finepay_id),
  KEY memeberid_idx (member_id),
  CONSTRAINT memberid FOREIGN KEY (member_id) REFERENCES `member` (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine_payment`
--

LOCK TABLES fine_payment WRITE;
INSERT INTO fine_payment VALUES (1300,2002,'02-mar-24',5),(1301,2001,'08-feb-24',15),(1302,2003,'08-apr-24',40),(1303,2006,'22-apr-24',30),(1304,2009,'23-mar-24',25);
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS loan;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE loan (
  loan_id int NOT NULL,
  book_id int NOT NULL,
  member_id int NOT NULL,
  loan_date varchar(20) NOT NULL,
  returned_date varchar(20) NOT NULL,
  PRIMARY KEY (loan_id),
  KEY book_id_idx (book_id),
  KEY m_id_idx (member_id),
  CONSTRAINT `book id` FOREIGN KEY (book_id) REFERENCES book (b_id),
  CONSTRAINT m_id FOREIGN KEY (member_id) REFERENCES `member` (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES loan WRITE;
INSERT INTO loan VALUES (1500,1,2002,'22-jan-24','22-feb-24'),(1510,3,2001,'01-jan-24','01-feb-24'),(1515,4,2003,'01-march-24','01-apr-24'),(1520,5,2009,'15-feb-24','14-apr-24'),(1525,2,2006,'15-jan-24','15-mar-24');
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS member;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  member_id int NOT NULL,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NOT NULL,
  Joined_date varchar(45) NOT NULL,
  active_status varchar(18) NOT NULL,
  PRIMARY KEY (member_id),
  KEY active_member_id_idx (active_status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES member WRITE;
INSERT INTO member VALUES (2001,'Joseph','Martins','20-Jan-22','active'),(2002,'Myriam','Givens','04-Aug-23','active'),(2003,'Dheepa','Nguyen','10-Aug-18','inactive'),(2004,'Bartholemew','Khemmich','25-May-22','active'),(2005,'Xana','Potts','05-Dec-19','inactive'),(2006,'Prater','Jeremy','28-Apr-19','active'),(2007,'Kaylah','Moon','09-Jul-19','active'),(2008,'Kristen','Tate','05-Apr-21','inactive'),(2009,'Bobby','Rodgers','28-Nov-21','inactive'),(2010,'Reid','Park','16-Jan-21','active');
UNLOCK TABLES;

--
-- Table structure for table `member_status`
--

DROP TABLE IF EXISTS member_status;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE member_status (
  status_id int NOT NULL,
  status_value varchar(18) NOT NULL,
  PRIMARY KEY (status_id),
  KEY memberstatus_idx (status_value),
  CONSTRAINT memberstatus FOREIGN KEY (status_value) REFERENCES `member` (active_status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_status`
--

LOCK TABLES member_status WRITE;
INSERT INTO member_status VALUES (2001,'active'),(2002,'active'),(2004,'active'),(2006,'active'),(2007,'active'),(2010,'active'),(2003,'inactive'),(2005,'inactive'),(2008,'inactive'),(2009,'inactive');
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS reservation;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE reservation (
  reservation_id int NOT NULL,
  Book_id int NOT NULL,
  member_id int NOT NULL,
  reservation_date varchar(20) NOT NULL,
  reservation_status int NOT NULL,
  PRIMARY KEY (reservation_id),
  KEY book_id_idx (Book_id),
  KEY member_id_idx (member_id),
  KEY reservation_status_id_idx (reservation_status),
  CONSTRAINT book_id FOREIGN KEY (Book_id) REFERENCES book (b_id),
  CONSTRAINT member_id FOREIGN KEY (member_id) REFERENCES `member` (member_id),
  CONSTRAINT reservation_status_id FOREIGN KEY (reservation_status) REFERENCES reservation_status (rstatus_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES reservation WRITE;
INSERT INTO reservation VALUES (2301,5,2004,'01-may-24',1601),(2302,7,2005,'02-jun-24',1602);
UNLOCK TABLES;

--
-- Table structure for table `reservation_status`
--

DROP TABLE IF EXISTS reservation_status;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE reservation_status (
  rstatus_Id int NOT NULL,
  status_value varchar(45) NOT NULL,
  PRIMARY KEY (rstatus_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_status`
--

LOCK TABLES reservation_status WRITE;
INSERT INTO reservation_status VALUES (1601,'reserved'),(1602,'unreserved');
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed

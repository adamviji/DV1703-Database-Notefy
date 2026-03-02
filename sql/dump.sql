-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: notefy_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `chord`
--

DROP TABLE IF EXISTS `chord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chord` (
  `Chord_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Chord_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chord`
--

LOCK TABLES `chord` WRITE;
/*!40000 ALTER TABLE `chord` DISABLE KEYS */;
INSERT INTO `chord` VALUES (6,'A'),(2,'Am'),(10,'B'),(9,'Bm'),(5,'C'),(4,'D'),(1,'E'),(7,'Em'),(8,'F'),(3,'G');
/*!40000 ALTER TABLE `chord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `Genre_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Genre_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Classic Rock','A high-energy, amplified sound centered on the electric guitar, bass guitar, and drums, typically featuring a 4/4 time signature with a strong,, backbeat-driven rhythm'),(2,'Pop','Mainstream music made for a broad audience'),(3,'Jazz','Jazz is a 20th-century American musical art form originating in New Orleans, characterized by improvisation, syncopated rhythms, swing notes, and complex harmonies'),(4,'Country','American folk music'),(5,'R&B','Rhymes and beats usually slow paced'),(6,'Indie',' Indie music is a genre rooted in independent production, known for its creative freedom, authentic style, and often guitar-driven, introspective sound. '),(7,'Hard Rock',' A subgenre of rock music characterized by heavy guitar riffs, strong rhythms, powerful vocals, and a high-energy, aggressive sound. '),(8,'Metal',' a heavy and intense genre of rock music defined by distorted guitars, powerful drumming, aggressive vocals, and a dark, high-energy sound. ');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `Song_ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Artist` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Genre_ID` int DEFAULT NULL,
  `original_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `difficulty` enum('beginner','intermediate','advanced') COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`Song_ID`),
  UNIQUE KEY `Title` (`Title`,`Artist`),
  KEY `Genre_ID` (`Genre_ID`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`Genre_ID`) REFERENCES `genre` (`Genre_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Paranoid','Black Sabbath',1,'E minor','intermediate',1970),(2,'Smoke on the Water','Deep Purple',1,'G Minor','beginner',1973),(3,'Eye of the tiger','Survivor',1,'C','beginner',1982),(4,'Let her go','Passenger',2,'G','beginner',2012),(5,'Take me home Country Roads','John Denver',4,'G','beginner',1971),(6,'Autumn Leaves','Nat King Cole',3,'Am','intermediate',1945),(7,'Fallin','Alicia Keys',5,'E minor','intermediate',2001),(8,'Snow(Hey oh!)','Red Hot Chilli Peppers',1,'G# minor','advanced',2006),(9,'Bohemian Rhapsody','Queen',1,'Bb Major','advanced',1975),(10,'Stairway to Heaven','Led Zeppelin',1,'A Minor','advanced',1971),(11,'Hotel California','Eagles',1,'B Minor','intermediate',1976),(12,'Sweet Child o Mine','Guns N Roses',7,'D Major','advanced',1987),(13,'Back in Black','ACDC',7,'E Minor','intermediate',1980),(14,'Highway to Hell','ACDC',7,'A Major','intermediate',1979),(15,'Thunderstruck','ACDC',7,'B Major','advanced',1990),(16,'Dream On','Aerosmith',7,'F Minor','advanced',1973),(17,'Walk This Way','Aerosmith',7,'E Major','intermediate',1975),(18,'Imagine','John Lennon',2,'C Major','beginner',1971),(19,'Let It Be','The Beatles',2,'C Major','beginner',1970),(20,'Hey Jude','The Beatles',1,'F Major','beginner',1968),(21,'Come Together','The Beatles',1,'D Minor','intermediate',1969),(22,'Something','The Beatles',1,'C Major','intermediate',1969),(23,'Billie Jean','Michael Jackson',2,'F# Minor','intermediate',1983),(24,'Beat It','Michael Jackson',2,'E Minor','intermediate',1982),(25,'Purple Rain','Prince',2,'Bb Major','intermediate',1984),(26,'With or Without You','U2',2,'D Major','beginner',1987),(27,'One','U2',2,'A Minor','intermediate',1991),(28,'Wonderwall','Oasis',6,'F# Minor','beginner',1995),(29,'Dont Look Back in Anger','Oasis',6,'C Major','beginner',1996),(30,'Creep','Radiohead',6,'G Major','beginner',1992),(31,'Karma Police','Radiohead',6,'A Minor','intermediate',1997),(32,'Smells Like Teen Spirit','Nirvana',7,'F Minor','intermediate',1991),(33,'Come As You Are','Nirvana',7,'E Minor','intermediate',1991),(34,'Enter Sandman','Metallica',8,'E Minor','intermediate',1991),(35,'Master of Puppets','Metallica',8,'E Minor','advanced',1986),(36,'Nothing Else Matters','Metallica',8,'E Minor','intermediate',1992),(38,'Iron Man','Black Sabbath',8,'B Minor','intermediate',1970),(39,'Crazy Train','Ozzy Osbourne',8,'F# Minor','advanced',1980),(40,'Run to the Hills','Iron Maiden',8,'E Minor','advanced',1982),(41,'The Trooper','Iron Maiden',8,'E Minor','advanced',1983),(42,'Breaking the Law','Judas Priest',8,'A Minor','intermediate',1980),(43,'Ace of Spades','Motorhead',8,'E Minor','advanced',1980),(45,'Ring of Fire','Johnny Cash',4,'G Major','beginner',1963),(46,'Folsom Prison Blues','Johnny Cash',4,'E Major','beginner',1955),(47,'Jolene','Dolly Parton',4,'C# Minor','intermediate',1973),(48,'The Gambler','Kenny Rogers',4,'C Major','beginner',1978),(49,'Friends in Low Places','Garth Brooks',4,'A Major','beginner',1990),(50,'On the Road Again','Willie Nelson',4,'E Major','beginner',1980),(51,'Take Five','Dave Brubeck',3,'Eb Minor','advanced',1959),(52,'So What','Miles Davis',3,'D Minor','advanced',1959),(53,'Autumn Leaves','Cannonball Adderley',3,'G Minor','intermediate',1958),(54,'Fly Me to the Moon','Frank Sinatra',3,'C Major','intermediate',1964),(55,'What a Wonderful World','Louis Armstrong',3,'F Major','beginner',1967),(56,'Georgia on My Mind','Ray Charles',3,'F Major','intermediate',1960),(57,'Respect','Aretha Franklin',5,'C Major','intermediate',1967),(58,'Superstition','Stevie Wonder',5,'Eb Minor','intermediate',1972),(59,'I Heard It Through the Grapevine','Marvin Gaye',5,'Eb Minor','intermediate',1968),(60,'Aint No Sunshine','Bill Withers',5,'A Minor','beginner',1971),(61,'Lets Stay Together','Al Green',5,'F Minor','intermediate',1971),(62,'My Girl','The Temptations',5,'C Major','beginner',1964),(63,'Every Breath You Take','The Police',2,'A Major','beginner',1983),(64,'Africa','Toto',2,'B Major','intermediate',1982),(65,'September','Earth Wind and Fire',5,'A Major','intermediate',1978),(66,'Shape of You','Ed Sheeran',2,'C# Minor','beginner',2017),(67,'Rolling in the Deep','Adele',2,'C Minor','intermediate',2010),(68,'Blinding Lights','The Weeknd',2,'F Minor','intermediate',2019),(69,'Seven Nation Army','The White Stripes',6,'E Minor','beginner',2003),(70,'Mr Brightside','The Killers',6,'D Major','intermediate',2003),(71,'Use Somebody','Kings of Leon',6,'C Major','intermediate',2008),(72,'Clocks','Coldplay',6,'Eb Major','intermediate',2002),(73,'Yellow','Coldplay',6,'B Major','beginner',2000),(74,'The Scientist','Coldplay',6,'F Major','beginner',2002),(75,'Boulevard of Broken Dreams','Green Day',6,'F Minor','intermediate',2004),(76,'American Idiot','Green Day',6,'Ab Major','intermediate',2004),(78,'Carry On Wayward Son','Kansas',1,'A Minor','advanced',1976),(79,'More Than a Feeling','Boston',1,'D Major','advanced',1976),(80,'Sweet Home Alabama','Lynyrd Skynyrd',1,'G Major','beginner',1974),(81,'Sultans of Swing','Dire Straits',1,'D Minor','advanced',1978),(82,'Money for Nothing','Dire Straits',1,'G Minor','advanced',1985),(83,'Free Fallin','Tom Petty',1,'F Major','beginner',1989),(84,'Brown Eyed Girl','Van Morrison',1,'G Major','beginner',1967),(85,'Dont Stop Believin','Journey',1,'E Major','intermediate',1981),(86,'Black Dog','Led Zeppelin',1,'A Major','advanced',1971),(87,'Whole Lotta Love','Led Zeppelin',1,'E Major','advanced',1969),(88,'Comfortably Numb','Pink Floyd',1,'B Minor','advanced',1979),(89,'Wish You Were Here','Pink Floyd',1,'G Major','beginner',1975),(90,'Another Brick in the Wall Part 2','Pink Floyd',1,'D Minor','intermediate',1979),(91,'Paint It Black','The Rolling Stones',1,'E Minor','intermediate',1966),(92,'Gimme Shelter','The Rolling Stones',1,'C# Minor','intermediate',1969),(93,'Sympathy for the Devil','The Rolling Stones',1,'E Major','intermediate',1968),(94,'Space Oddity','David Bowie',1,'C Major','intermediate',1969),(95,'Heroes','David Bowie',2,'D Major','intermediate',1977),(96,'Rhiannon','Fleetwood Mac',1,'A Minor','intermediate',1975),(97,'The Chain','Fleetwood Mac',1,'E Minor','advanced',1977),(98,'No Woman No Cry','Bob Marley',2,'C Major','beginner',1974),(99,'Three Little Birds','Bob Marley',2,'A Major','beginner',1977),(100,'Hallelujah','Jeff Buckley',6,'C Major','intermediate',1994),(101,'Ho Hey','The Lumineers',6,'C Major','beginner',2012),(103,'Bad Moon Rising','Creedence Clearwater Revival',1,'D Major','beginner',1969),(104,'Fortunate Son','Creedence Clearwater Revival',1,'G Major','intermediate',1969),(105,'Born to Run','Bruce Springsteen',1,'E Major','intermediate',1975),(106,'The Boys Are Back in Town','Thin Lizzy',7,'A Major','advanced',1976),(107,'Sharp Dressed Man','ZZ Top',7,'C Major','intermediate',1983),(108,'La Grange','ZZ Top',7,'A Minor','advanced',1973),(109,'Message in a Bottle','The Police',2,'C# Minor','advanced',1979),(110,'Roxanne','The Police',2,'G Minor','intermediate',1978),(111,'Under Pressure','Queen',1,'D Major','intermediate',1981),(112,'We Will Rock You','Queen',1,'E Minor','beginner',1977),(113,'We Are the Champions','Queen',1,'C Minor','intermediate',1977),(114,'Time','Pink Floyd',1,'F# Minor','advanced',1973),(115,'Money','Pink Floyd',1,'B Minor','advanced',1973),(116,'The Final Countdown','Europe',7,'F# Minor','intermediate',1986),(117,'Livin on a Prayer','Bon Jovi',7,'E Minor','intermediate',1986),(118,'Wanted Dead or Alive','Bon Jovi',7,'D Minor','intermediate',1986),(119,'Knockin on Heavens Door','Bob Dylan',1,'G Major','beginner',1973),(120,'Layla','Eric Clapton',1,'D Minor','advanced',1970),(121,'Tears in Heaven','Eric Clapton',1,'A Major','intermediate',1992),(122,'Wonderful Tonight','Eric Clapton',1,'G Major','beginner',1977),(123,'Hotel Yorba','The White Stripes',6,'E Major','beginner',2001),(124,'Sex on Fire','Kings of Leon',6,'E Major','intermediate',2008),(125,'Radioactive','Imagine Dragons',6,'B Minor','beginner',2012),(126,'Counting Stars','OneRepublic',2,'C# Minor','beginner',2013),(127,'Viva La Vida','Coldplay',2,'Ab Major','beginner',2008),(128,'Skyfall','Adele',2,'C Minor','intermediate',2012),(129,'Stayin Alive','Bee Gees',2,'F Minor','intermediate',1977),(130,'I Want It That Way','Backstreet Boys',2,'F# Minor','beginner',1999),(131,'Man in the Mirror','Michael Jackson',2,'G Major','intermediate',1988),(132,'Hysteria','Muse',6,'A Minor','advanced',2003),(133,'Plug In Baby','Muse',6,'E Minor','advanced',2001),(134,'Take It Easy','Eagles',1,'G Major','beginner',1972),(135,'Desperado','Eagles',1,'G Major','intermediate',1973),(136,'The Joker','Steve Miller Band',1,'G Major','beginner',1973),(137,'Long Train Runnin','The Doobie Brothers',1,'G Minor','intermediate',1973),(138,'China Grove','The Doobie Brothers',1,'G Major','intermediate',1973),(139,'Barracuda','Heart',7,'E Minor','advanced',1977),(140,'Crazy Little Thing Called Love','Queen',1,'D Major','beginner',1979),(141,'Owner of a Lonely Heart','Yes',1,'A Minor','intermediate',1983),(142,'Roundabout','Yes',1,'E Minor','advanced',1971),(144,'Highway Star','Deep Purple',7,'G Minor','advanced',1972),(145,'The Sound of Silence','Simon and Garfunkel',2,'E Minor','beginner',1964),(146,'Mrs Robinson','Simon and Garfunkel',2,'E Major','beginner',1968),(147,'Bridge Over Troubled Water','Simon and Garfunkel',2,'Eb Major','intermediate',1970),(148,'Good Riddance Time of Your Life','Green Day',6,'G Major','beginner',1997),(149,'Zombie','The Cranberries',6,'E Minor','intermediate',1994),(150,'Losing My Religion','REM',6,'D Minor','intermediate',1991),(151,'Drive','Incubus',6,'E Major','beginner',2000),(152,'All the Small Things','Blink 182',2,'C Major','beginner',1999),(153,'Iris','Goo Goo Dolls',2,'B Major','intermediate',1998),(154,'Yesterday','The Beatles',1,'F Major','beginner',1965),(155,'Shallow','Lady Gaga',2,'G Major','intermediate',2018),(156,'Someone Like You','Adele',2,'A Major','beginner',2011),(157,'Thinking Out Loud','Ed Sheeran',2,'D Major','beginner',2014),(158,'Perfect','Ed Sheeran',2,'Ab Major','beginner',2017),(159,'Stay With Me','Sam Smith',2,'C Major','beginner',2014),(160,'Chandelier','Sia',2,'A Minor','intermediate',2014),(161,'Uptown Funk','Bruno Mars',5,'D Minor','intermediate',2014),(162,'Just the Way You Are','Bruno Mars',2,'F Major','beginner',2010),(163,'Locked Out of Heaven','Bruno Mars',2,'B Minor','intermediate',2012),(164,'Happy','Pharrell Williams',2,'F Major','beginner',2013),(165,'Get Lucky','Daft Punk',2,'F# Minor','intermediate',2013),(166,'Pompeii','Bastille',6,'Eb Major','beginner',2013),(167,'Little Talks','Of Monsters and Men',6,'F Major','beginner',2011),(168,'Take Me to Church','Hozier',6,'A Minor','intermediate',2013),(169,'Budapest','George Ezra',2,'C Major','beginner',2014),(170,'Riptide','Vance Joy',6,'C Major','beginner',2013),(171,'Human','The Killers',6,'A Major','beginner',2008),(172,'Somebody That I Used to Know','Gotye',6,'D Minor','intermediate',2011),(173,'Demons','Imagine Dragons',6,'C Major','beginner',2013),(174,'Thunder','Imagine Dragons',6,'F# Minor','beginner',2017),(175,'Believer','Imagine Dragons',6,'C Minor','intermediate',2017),(176,'Stressed Out','Twenty One Pilots',6,'D Major','beginner',2015),(177,'Heathens','Twenty One Pilots',6,'F Minor','intermediate',2016),(178,'Time After Time','Cyndi Lauper',2,'C Major','beginner',1984),(179,'Girls Just Want to Have Fun','Cyndi Lauper',2,'F Major','beginner',1983),(180,'Come On Eileen','Dexys Midnight Runners',2,'D Major','beginner',1982),(181,'Take On Me','A-ha',2,'A Major','beginner',1985),(182,'Wake Me Up Before You Go Go','Wham',2,'G Major','beginner',1984),(183,'Careless Whisper','George Michael',2,'D Minor','intermediate',1984),(184,'When Doves Cry','Prince',2,'A Minor','intermediate',1984),(185,'Sign of the Times','Harry Styles',2,'F Major','intermediate',2017),(186,'As It Was','Harry Styles',2,'A Major','beginner',2022),(187,'Levitating','Dua Lipa',2,'B Minor','beginner',2020),(188,'Don\'t Start Now','Dua Lipa',2,'F# Minor','beginner',2019),(189,'Watermelon Sugar','Harry Styles',2,'G Major','beginner',2019),(190,'Anti-Hero','Taylor Swift',2,'D Major','beginner',2022),(191,'Flowers','Miley Cyrus',2,'C Major','beginner',2023),(192,'Unholy','Sam Smith',2,'A Minor','intermediate',2022),(193,'Bad Habits','Ed Sheeran',2,'F# Major','intermediate',2021),(194,'Peaches','Justin Bieber',2,'E Major','beginner',2021),(195,'Drivers License','Olivia Rodrigo',2,'Db Major','beginner',2021),(196,'Good 4 U','Olivia Rodrigo',2,'G# Minor','intermediate',2021),(197,'Heat Waves','Glass Animals',6,'F# Minor','beginner',2020),(198,'Running Up That Hill','Kate Bush',2,'C Major','intermediate',1985),(199,'Dont You Forget About Me','Simple Minds',2,'G Major','beginner',1985),(200,'Everybodys Changing','Keane',6,'C Major','beginner',2004),(201,'Somewhere Only We Know','Keane',6,'A Major','beginner',2004),(202,'This Is the Last Time','Keane',6,'D Major','beginner',2004),(203,'Dakota','Stereophonics',6,'D Major','beginner',2005),(204,'Have You Ever Seen the Rain','Creedence Clearwater Revival',1,'C Major','beginner',1971),(205,'Lust for Life','Iggy Pop',1,'A Major','intermediate',1977),(206,'Should I Stay or Should I Go','The Clash',7,'G Major','beginner',1982),(207,'London Calling','The Clash',7,'E Minor','intermediate',1979),(208,'Rock Around the Clock','Bill Haley',1,'C Major','beginner',1954);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songchords`
--

DROP TABLE IF EXISTS `songchords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songchords` (
  `Song_ID` int NOT NULL,
  `Chord_ID` int NOT NULL,
  PRIMARY KEY (`Song_ID`,`Chord_ID`),
  KEY `Chord_ID` (`Chord_ID`),
  CONSTRAINT `songchords_ibfk_1` FOREIGN KEY (`Song_ID`) REFERENCES `song` (`Song_ID`),
  CONSTRAINT `songchords_ibfk_2` FOREIGN KEY (`Chord_ID`) REFERENCES `chord` (`Chord_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songchords`
--

LOCK TABLES `songchords` WRITE;
/*!40000 ALTER TABLE `songchords` DISABLE KEYS */;
/*!40000 ALTER TABLE `songchords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfavorites`
--

DROP TABLE IF EXISTS `userfavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userfavorites` (
  `User_ID` int NOT NULL,
  `Song_ID` int NOT NULL,
  PRIMARY KEY (`User_ID`,`Song_ID`),
  KEY `Song_ID` (`Song_ID`),
  CONSTRAINT `userfavorites_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `userfavorites_ibfk_2` FOREIGN KEY (`Song_ID`) REFERENCES `song` (`Song_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfavorites`
--

LOCK TABLES `userfavorites` WRITE;
/*!40000 ALTER TABLE `userfavorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `userfavorites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-01 12:27:16

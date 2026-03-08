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
) ENGINE=InnoDB AUTO_INCREMENT=1071 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chord`
--

LOCK TABLES `chord` WRITE;
/*!40000 ALTER TABLE `chord` DISABLE KEYS */;
INSERT INTO `chord` VALUES (17,'A'),(230,'A7'),(99,'A7sus4'),(6,'Ab'),(317,'Abm'),(8,'Am'),(33,'B'),(188,'B7'),(1,'Bb'),(204,'Bbm'),(15,'Bm'),(11,'C'),(75,'C#m'),(227,'C7'),(100,'Cadd9'),(5,'Cm'),(48,'Cmaj7'),(367,'Csus2'),(12,'D'),(999,'D#m'),(7,'Db'),(51,'Dm'),(91,'Dsus2'),(98,'Dsus4'),(18,'E'),(222,'E7'),(3,'Eb'),(203,'Ebm'),(13,'Em'),(96,'Em7'),(4,'F'),(16,'F#'),(73,'F#m'),(37,'Fm'),(14,'Fmaj7'),(366,'Fsus2'),(9,'G'),(273,'G#m'),(219,'G7'),(205,'Gb'),(2,'Gm');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `difficulty` enum('Beginner','Intermediate','Advanced') COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`Song_ID`),
  UNIQUE KEY `Title` (`Title`,`Artist`),
  KEY `Genre_ID` (`Genre_ID`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`Genre_ID`) REFERENCES `genre` (`Genre_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Paranoid','Black Sabbath',1,'Em','Intermediate',1970),(2,'Smoke on the Water','Deep Purple',1,'Gm','Beginner',1973),(3,'Eye of the tiger','Survivor',1,'C','Beginner',1982),(4,'Let her go','Passenger',2,'G','Beginner',2012),(5,'Take me home Country Roads','John Denver',4,'G','Beginner',1971),(6,'Autumn Leaves','Nat King Cole',3,'Am','Intermediate',1945),(7,'Fallin','Alicia Keys',5,'Em','Intermediate',2001),(8,'Snow(Hey oh!)','Red Hot Chilli Peppers',1,'G#m','Advanced',2006),(9,'Bohemian Rhapsody','Queen',1,'Bb','Advanced',1975),(10,'Stairway to Heaven','Led Zeppelin',1,'Am','Advanced',1971),(11,'Hotel California','Eagles',1,'Bm','Intermediate',1976),(12,'Sweet Child o Mine','Guns N Roses',7,'D','Advanced',1987),(13,'Back in Black','ACDC',7,'Em','Intermediate',1980),(14,'Highway to Hell','ACDC',7,'A','Intermediate',1979),(15,'Thunderstruck','ACDC',7,'B','Advanced',1990),(16,'Dream On','Aerosmith',7,'Fm','Advanced',1973),(17,'Walk This Way','Aerosmith',7,'E','Intermediate',1975),(18,'Imagine','John Lennon',2,'C','Beginner',1971),(19,'Let It Be','The Beatles',2,'C','Beginner',1970),(20,'Hey Jude','The Beatles',1,'F','Beginner',1968),(21,'Come Together','The Beatles',1,'Dm','Intermediate',1969),(22,'Something','The Beatles',1,'C','Intermediate',1969),(23,'Billie Jean','Michael Jackson',2,'F#m','Intermediate',1983),(24,'Beat It','Michael Jackson',2,'Em','Intermediate',1982),(25,'Purple Rain','Prince',2,'Bb','Intermediate',1984),(26,'With or Without You','U2',2,'D','Beginner',1987),(27,'One','U2',2,'Am','Intermediate',1991),(28,'Wonderwall','Oasis',6,'F#m','Beginner',1995),(29,'Dont Look Back in Anger','Oasis',6,'C','Beginner',1996),(30,'Creep','Radiohead',6,'G','Beginner',1992),(31,'Karma Police','Radiohead',6,'Am','Intermediate',1997),(32,'Smells Like Teen Spirit','Nirvana',7,'Fm','Intermediate',1991),(33,'Come As You Are','Nirvana',7,'Em','Intermediate',1991),(34,'Enter Sandman','Metallica',8,'Em','Intermediate',1991),(35,'Master of Puppets','Metallica',8,'Em','Advanced',1986),(36,'Nothing Else Matters','Metallica',8,'Em','Intermediate',1992),(38,'Iron Man','Black Sabbath',8,'Bm','Intermediate',1970),(39,'Crazy Train','Ozzy Osbourne',8,'F#m','Advanced',1980),(40,'Run to the Hills','Iron Maiden',8,'Em','Advanced',1982),(41,'The Trooper','Iron Maiden',8,'Em','Advanced',1983),(42,'Breaking the Law','Judas Priest',8,'Am','Intermediate',1980),(43,'Ace of Spades','Motorhead',8,'Em','Advanced',1980),(45,'Ring of Fire','Johnny Cash',4,'G','Beginner',1963),(46,'Folsom Prison Blues','Johnny Cash',4,'E','Beginner',1955),(47,'Jolene','Dolly Parton',4,'C#m','Intermediate',1973),(48,'The Gambler','Kenny Rogers',4,'C','Beginner',1978),(49,'Friends in Low Places','Garth Brooks',4,'A','Beginner',1990),(50,'On the Road Again','Willie Nelson',4,'E','Beginner',1980),(51,'Take Five','Dave Brubeck',3,'Ebm','Advanced',1959),(52,'So What','Miles Davis',3,'Dm','Advanced',1959),(53,'Autumn Leaves','Cannonball Adderley',3,'Gm','Intermediate',1958),(54,'Fly Me to the Moon','Frank Sinatra',3,'C','Intermediate',1964),(55,'What a Wonderful World','Louis Armstrong',3,'F','Beginner',1967),(56,'Georgia on My Mind','Ray Charles',3,'F','Intermediate',1960),(57,'Respect','Aretha Franklin',5,'C','Intermediate',1967),(58,'Superstition','Stevie Wonder',5,'Ebm','Intermediate',1972),(59,'I Heard It Through the Grapevine','Marvin Gaye',5,'Ebm','Intermediate',1968),(60,'Aint No Sunshine','Bill Withers',5,'Am','Beginner',1971),(61,'Lets Stay Together','Al Green',5,'Fm','Intermediate',1971),(62,'My Girl','The Temptations',5,'C','Beginner',1964),(63,'Every Breath You Take','The Police',2,'A','Beginner',1983),(64,'Africa','Toto',2,'B','Intermediate',1982),(65,'September','Earth Wind and Fire',5,'A','Intermediate',1978),(66,'Shape of You','Ed Sheeran',2,'C#m','Beginner',2017),(67,'Rolling in the Deep','Adele',2,'Cm','Intermediate',2010),(68,'Blinding Lights','The Weeknd',2,'Fm','Intermediate',2019),(69,'Seven Nation Army','The White Stripes',6,'Em','Beginner',2003),(70,'Mr Brightside','The Killers',6,'D','Intermediate',2003),(71,'Use Somebody','Kings of Leon',6,'C','Intermediate',2008),(72,'Clocks','Coldplay',6,'Eb','Intermediate',2002),(73,'Yellow','Coldplay',6,'B','Beginner',2000),(74,'The Scientist','Coldplay',6,'F','Beginner',2002),(75,'Boulevard of Broken Dreams','Green Day',6,'Fm','Intermediate',2004),(76,'American Idiot','Green Day',6,'Ab','Intermediate',2004),(78,'Carry On Wayward Son','Kansas',1,'Am','Advanced',1976),(79,'More Than a Feeling','Boston',1,'D','Advanced',1976),(80,'Sweet Home Alabama','Lynyrd Skynyrd',1,'G','Beginner',1974),(81,'Sultans of Swing','Dire Straits',1,'Dm','Advanced',1978),(82,'Money for Nothing','Dire Straits',1,'Gm','Advanced',1985),(83,'Free Fallin','Tom Petty',1,'F','Beginner',1989),(84,'Brown Eyed Girl','Van Morrison',1,'G','Beginner',1967),(85,'Dont Stop Believin','Journey',1,'E','Intermediate',1981),(86,'Black Dog','Led Zeppelin',1,'A','Advanced',1971),(87,'Whole Lotta Love','Led Zeppelin',1,'E','Advanced',1969),(88,'Comfortably Numb','Pink Floyd',1,'Bm','Advanced',1979),(89,'Wish You Were Here','Pink Floyd',1,'G','Beginner',1975),(90,'Another Brick in the Wall Part 2','Pink Floyd',1,'Dm','Intermediate',1979),(91,'Paint It Black','The Rolling Stones',1,'Em','Intermediate',1966),(92,'Gimme Shelter','The Rolling Stones',1,'C#m','Intermediate',1969),(93,'Sympathy for the Devil','The Rolling Stones',1,'E','Intermediate',1968),(94,'Space Oddity','David Bowie',1,'C','Intermediate',1969),(95,'Heroes','David Bowie',2,'D','Intermediate',1977),(96,'Rhiannon','Fleetwood Mac',1,'Am','Intermediate',1975),(97,'The Chain','Fleetwood Mac',1,'Em','Advanced',1977),(98,'No Woman No Cry','Bob Marley',2,'C','Beginner',1974),(99,'Three Little Birds','Bob Marley',2,'A','Beginner',1977),(100,'Hallelujah','Jeff Buckley',6,'C','Intermediate',1994),(101,'Ho Hey','The Lumineers',6,'C','Beginner',2012),(103,'Bad Moon Rising','Creedence Clearwater Revival',1,'D','Beginner',1969),(104,'Fortunate Son','Creedence Clearwater Revival',1,'G','Intermediate',1969),(105,'Born to Run','Bruce Springsteen',1,'E','Intermediate',1975),(106,'The Boys Are Back in Town','Thin Lizzy',7,'A','Advanced',1976),(107,'Sharp Dressed Man','ZZ Top',7,'C','Intermediate',1983),(108,'La Grange','ZZ Top',7,'Am','Advanced',1973),(109,'Message in a Bottle','The Police',2,'C#m','Advanced',1979),(110,'Roxanne','The Police',2,'Gm','Intermediate',1978),(111,'Under Pressure','Queen',1,'D','Intermediate',1981),(112,'We Will Rock You','Queen',1,'Em','Beginner',1977),(113,'We Are the Champions','Queen',1,'Cm','Intermediate',1977),(114,'Time','Pink Floyd',1,'F#m','Advanced',1973),(115,'Money','Pink Floyd',1,'Bm','Advanced',1973),(116,'The Final Countdown','Europe',7,'F#m','Intermediate',1986),(117,'Livin on a Prayer','Bon Jovi',7,'Em','Intermediate',1986),(118,'Wanted Dead or Alive','Bon Jovi',7,'Dm','Intermediate',1986),(119,'Knockin on Heavens Door','Bob Dylan',1,'G','Beginner',1973),(120,'Layla','Eric Clapton',1,'Dm','Advanced',1970),(121,'Tears in Heaven','Eric Clapton',1,'A','Intermediate',1992),(122,'Wonderful Tonight','Eric Clapton',1,'G','Beginner',1977),(123,'Hotel Yorba','The White Stripes',6,'E','Beginner',2001),(124,'Sex on Fire','Kings of Leon',6,'E','Intermediate',2008),(125,'Radioactive','Imagine Dragons',6,'Bm','Beginner',2012),(126,'Counting Stars','OneRepublic',2,'C#m','Beginner',2013),(127,'Viva La Vida','Coldplay',2,'Ab','Beginner',2008),(128,'Skyfall','Adele',2,'Cm','Intermediate',2012),(129,'Stayin Alive','Bee Gees',2,'Fm','Intermediate',1977),(130,'I Want It That Way','Backstreet Boys',2,'F#m','Beginner',1999),(131,'Man in the Mirror','Michael Jackson',2,'G','Intermediate',1988),(132,'Hysteria','Muse',6,'Am','Advanced',2003),(133,'Plug In Baby','Muse',6,'Em','Advanced',2001),(134,'Take It Easy','Eagles',1,'G','Beginner',1972),(135,'Desperado','Eagles',1,'G','Intermediate',1973),(136,'The Joker','Steve Miller Band',1,'G','Beginner',1973),(137,'Long Train Runnin','The Doobie Brothers',1,'Gm','Intermediate',1973),(138,'China Grove','The Doobie Brothers',1,'G','Intermediate',1973),(139,'Barracuda','Heart',7,'Em','Advanced',1977),(140,'Crazy Little Thing Called Love','Queen',1,'D','Beginner',1979),(141,'Owner of a Lonely Heart','Yes',1,'Am','Intermediate',1983),(142,'Roundabout','Yes',1,'Em','Advanced',1971),(144,'Highway Star','Deep Purple',7,'Gm','Advanced',1972),(145,'The Sound of Silence','Simon and Garfunkel',2,'Em','Beginner',1964),(146,'Mrs Robinson','Simon and Garfunkel',2,'E','Beginner',1968),(147,'Bridge Over Troubled Water','Simon and Garfunkel',2,'Eb','Intermediate',1970),(148,'Good Riddance Time of Your Life','Green Day',6,'G','Beginner',1997),(149,'Zombie','The Cranberries',6,'Em','Intermediate',1994),(150,'Losing My Religion','REM',6,'Dm','Intermediate',1991),(151,'Drive','Incubus',6,'E','Beginner',2000),(152,'All the Small Things','Blink 182',2,'C','Beginner',1999),(153,'Iris','Goo Goo Dolls',2,'B','Intermediate',1998),(154,'Yesterday','The Beatles',1,'F','Beginner',1965),(155,'Shallow','Lady Gaga',2,'G','Intermediate',2018),(156,'Someone Like You','Adele',2,'A','Beginner',2011),(157,'Thinking Out Loud','Ed Sheeran',2,'D','Beginner',2014),(158,'Perfect','Ed Sheeran',2,'Ab','Beginner',2017),(159,'Stay With Me','Sam Smith',2,'C','Beginner',2014),(160,'Chandelier','Sia',2,'Am','Intermediate',2014),(161,'Uptown Funk','Bruno Mars',5,'Dm','Intermediate',2014),(162,'Just the Way You Are','Bruno Mars',2,'F','Beginner',2010),(163,'Locked Out of Heaven','Bruno Mars',2,'Bm','Intermediate',2012),(164,'Happy','Pharrell Williams',2,'F','Beginner',2013),(165,'Get Lucky','Daft Punk',2,'F#m','Intermediate',2013),(166,'Pompeii','Bastille',6,'Eb','Beginner',2013),(167,'Little Talks','Of Monsters and Men',6,'F','Beginner',2011),(168,'Take Me to Church','Hozier',6,'Am','Intermediate',2013),(169,'Budapest','George Ezra',2,'C','Beginner',2014),(170,'Riptide','Vance Joy',6,'C','Beginner',2013),(171,'Human','The Killers',6,'A','Beginner',2008),(172,'Somebody That I Used to Know','Gotye',6,'Dm','Intermediate',2011),(173,'Demons','Imagine Dragons',6,'C','Beginner',2013),(174,'Thunder','Imagine Dragons',6,'F#m','Beginner',2017),(175,'Believer','Imagine Dragons',6,'Cm','Intermediate',2017),(176,'Stressed Out','Twenty One Pilots',6,'D','Beginner',2015),(177,'Heathens','Twenty One Pilots',6,'Fm','Intermediate',2016),(178,'Time After Time','Cyndi Lauper',2,'C','Beginner',1984),(179,'Girls Just Want to Have Fun','Cyndi Lauper',2,'F','Beginner',1983),(180,'Come On Eileen','Dexys Midnight Runners',2,'D','Beginner',1982),(181,'Take On Me','A-ha',2,'A','Beginner',1985),(182,'Wake Me Up Before You Go Go','Wham',2,'G','Beginner',1984),(183,'Careless Whisper','George Michael',2,'Dm','Intermediate',1984),(184,'When Doves Cry','Prince',2,'Am','Intermediate',1984),(185,'Sign of the Times','Harry Styles',2,'F','Intermediate',2017),(186,'As It Was','Harry Styles',2,'A','Beginner',2022),(187,'Levitating','Dua Lipa',2,'Bm','Beginner',2020),(188,'Dont Start Now','Dua Lipa',2,'F#m','Beginner',2019),(189,'Watermelon Sugar','Harry Styles',2,'G','Beginner',2019),(190,'Anti-Hero','Taylor Swift',2,'D','Beginner',2022),(191,'Flowers','Miley Cyrus',2,'C','Beginner',2023),(192,'Unholy','Sam Smith',2,'Am','Intermediate',2022),(193,'Bad Habits','Ed Sheeran',2,'F#','Intermediate',2021),(194,'Peaches','Justin Bieber',2,'E','Beginner',2021),(195,'Drivers License','Olivia Rodrigo',2,'Db','Beginner',2021),(196,'Good 4 U','Olivia Rodrigo',2,'G#m','Intermediate',2021),(197,'Heat Waves','Glass Animals',6,'F#m','Beginner',2020),(198,'Running Up That Hill','Kate Bush',2,'C','Intermediate',1985),(199,'Dont You Forget About Me','Simple Minds',2,'G','Beginner',1985),(200,'Everybodys Changing','Keane',6,'C','Beginner',2004),(201,'Somewhere Only We Know','Keane',6,'A','Beginner',2004),(202,'This Is the Last Time','Keane',6,'D','Beginner',2004),(203,'Dakota','Stereophonics',6,'D','Beginner',2005),(204,'Have You Ever Seen the Rain','Creedence Clearwater Revival',1,'C','Beginner',1971),(205,'Lust for Life','Iggy Pop',1,'A','Intermediate',1977),(206,'Should I Stay or Should I Go','The Clash',7,'G','Beginner',1982),(207,'London Calling','The Clash',7,'Em','Intermediate',1979),(208,'Rock Around the Clock','Bill Haley',1,'C','Beginner',1954);
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
INSERT INTO `songchords` VALUES (2,1),(3,1),(9,1),(16,1),(20,1),(25,1),(32,1),(53,1),(55,1),(56,1),(57,1),(61,1),(67,1),(68,1),(72,1),(74,1),(75,1),(78,1),(81,1),(82,1),(83,1),(107,1),(110,1),(113,1),(118,1),(120,1),(127,1),(128,1),(129,1),(137,1),(140,1),(144,1),(147,1),(152,1),(154,1),(161,1),(162,1),(164,1),(166,1),(167,1),(172,1),(175,1),(177,1),(179,1),(183,1),(185,1),(198,1),(2,2),(9,2),(25,2),(53,2),(55,2),(56,2),(82,2),(110,2),(128,2),(137,2),(144,2),(162,2),(164,2),(166,2),(167,2),(172,2),(179,2),(183,2),(185,2),(1,3),(2,3),(9,3),(16,3),(20,3),(25,3),(35,3),(53,3),(61,3),(67,3),(68,3),(72,3),(75,3),(76,3),(82,3),(107,3),(110,3),(113,3),(127,3),(128,3),(129,3),(137,3),(144,3),(147,3),(158,3),(166,3),(175,3),(177,3),(185,3),(9,4),(10,4),(18,4),(19,4),(20,4),(22,4),(25,4),(29,4),(31,4),(32,4),(35,4),(42,4),(48,4),(53,4),(55,4),(56,4),(57,4),(62,4),(71,4),(74,4),(78,4),(81,4),(82,4),(83,4),(94,4),(96,4),(97,4),(98,4),(100,4),(101,4),(107,4),(108,4),(110,4),(118,4),(120,4),(132,4),(137,4),(140,4),(141,4),(144,4),(150,4),(152,4),(154,4),(159,4),(160,4),(161,4),(162,4),(164,4),(167,4),(168,4),(169,4),(170,4),(172,4),(173,4),(178,4),(179,4),(183,4),(184,4),(185,4),(191,4),(192,4),(198,4),(200,4),(204,4),(206,4),(208,4),(3,5),(9,5),(25,5),(30,5),(53,5),(67,5),(68,5),(72,5),(110,5),(113,5),(127,5),(128,5),(144,5),(147,5),(166,5),(175,5),(177,5),(3,6),(9,6),(16,6),(32,6),(51,6),(58,6),(59,6),(61,6),(67,6),(68,6),(72,6),(75,6),(76,6),(107,6),(113,6),(127,6),(128,6),(129,6),(144,6),(147,6),(158,6),(166,6),(175,6),(177,6),(195,6),(2,7),(9,7),(16,7),(32,7),(51,7),(58,7),(59,7),(61,7),(68,7),(75,7),(76,7),(127,7),(129,7),(147,7),(158,7),(177,7),(195,7),(10,8),(12,8),(18,8),(19,8),(22,8),(27,8),(29,8),(31,8),(33,8),(36,8),(42,8),(53,8),(54,8),(55,8),(60,8),(62,8),(71,8),(78,8),(79,8),(89,8),(90,8),(91,8),(94,8),(96,8),(97,8),(98,8),(100,8),(101,8),(108,8),(118,8),(119,8),(120,8),(131,8),(132,8),(133,8),(134,8),(135,8),(141,8),(145,8),(146,8),(150,8),(154,8),(159,8),(160,8),(162,8),(164,8),(167,8),(168,8),(169,8),(170,8),(172,8),(173,8),(178,8),(179,8),(182,8),(183,8),(184,8),(185,8),(189,8),(191,8),(192,8),(198,8),(199,8),(200,8),(204,8),(3,9),(4,9),(5,9),(10,9),(11,9),(12,9),(14,9),(18,9),(19,9),(21,9),(22,9),(26,9),(27,9),(28,9),(29,9),(30,9),(31,9),(33,9),(34,9),(36,9),(38,9),(40,9),(41,9),(42,9),(43,9),(45,9),(48,9),(57,9),(60,9),(62,9),(63,9),(65,9),(67,9),(69,9),(70,9),(71,9),(78,9),(79,9),(80,9),(84,9),(86,9),(88,9),(89,9),(90,9),(91,9),(94,9),(95,9),(96,9),(97,9),(98,9),(100,9),(101,9),(103,9),(104,9),(106,9),(107,9),(108,9),(111,9),(112,9),(113,9),(115,9),(117,9),(118,9),(119,9),(120,9),(121,9),(122,9),(125,9),(128,9),(131,9),(132,9),(133,9),(134,9),(135,9),(136,9),(138,9),(139,9),(140,9),(141,9),(142,9),(145,9),(146,9),(147,9),(148,9),(149,9),(150,9),(152,9),(154,9),(155,9),(157,9),(159,9),(160,9),(161,9),(163,9),(168,9),(169,9),(170,9),(171,9),(173,9),(175,9),(176,9),(178,9),(180,9),(181,9),(182,9),(184,9),(186,9),(187,9),(189,9),(190,9),(191,9),(192,9),(198,9),(199,9),(200,9),(201,9),(202,9),(203,9),(204,9),(205,9),(206,9),(207,9),(1,11),(2,11),(4,11),(10,11),(12,11),(16,11),(18,11),(19,11),(20,11),(22,11),(24,11),(27,11),(29,11),(30,11),(31,11),(33,11),(35,11),(36,11),(40,11),(43,11),(45,11),(48,11),(57,11),(62,11),(69,11),(71,11),(74,11),(75,11),(78,11),(79,11),(80,11),(81,11),(82,11),(84,11),(88,11),(89,11),(90,11),(91,11),(94,11),(95,11),(96,11),(97,11),(98,11),(100,11),(101,11),(104,11),(107,11),(110,11),(112,11),(117,11),(118,11),(119,11),(120,11),(122,11),(129,11),(131,11),(132,11),(133,11),(134,11),(135,11),(136,11),(137,11),(138,11),(139,11),(140,11),(141,11),(142,11),(145,11),(146,11),(149,11),(150,11),(152,11),(154,11),(155,11),(159,11),(160,11),(161,11),(162,11),(164,11),(167,11),(168,11),(169,11),(170,11),(172,11),(173,11),(176,11),(178,11),(179,11),(180,11),(182,11),(183,11),(184,11),(185,11),(189,11),(190,11),(191,11),(192,11),(198,11),(199,11),(200,11),(203,11),(204,11),(206,11),(207,11),(208,11),(1,12),(4,12),(5,12),(10,12),(11,12),(12,12),(13,12),(14,12),(15,12),(17,12),(22,12),(24,12),(26,12),(31,12),(33,12),(35,12),(36,12),(38,12),(39,12),(40,12),(41,12),(43,12),(45,12),(49,12),(53,12),(63,12),(65,12),(70,12),(78,12),(79,12),(80,12),(84,12),(86,12),(87,12),(88,12),(89,12),(91,12),(93,12),(95,12),(97,12),(99,12),(103,12),(104,12),(106,12),(111,12),(114,12),(115,12),(116,12),(117,12),(119,12),(121,12),(122,12),(125,12),(130,12),(131,12),(133,12),(134,12),(135,12),(136,12),(137,12),(138,12),(139,12),(140,12),(141,12),(142,12),(144,12),(145,12),(148,12),(149,12),(154,12),(155,12),(156,12),(157,12),(163,12),(165,12),(171,12),(174,12),(176,12),(180,12),(181,12),(182,12),(186,12),(187,12),(188,12),(189,12),(190,12),(193,12),(197,12),(199,12),(201,12),(202,12),(203,12),(205,12),(206,12),(207,12),(1,13),(4,13),(10,13),(11,13),(13,13),(19,13),(24,13),(27,13),(31,13),(33,13),(34,13),(35,13),(36,13),(40,13),(41,13),(43,13),(60,13),(79,13),(84,13),(88,13),(89,13),(91,13),(94,13),(95,13),(96,13),(97,13),(100,13),(104,13),(111,13),(117,13),(122,13),(131,13),(132,13),(133,13),(134,13),(135,13),(138,13),(139,13),(141,13),(142,13),(145,13),(146,13),(148,13),(149,13),(150,13),(154,13),(155,13),(157,13),(160,13),(168,13),(169,13),(173,13),(176,13),(178,13),(180,13),(182,13),(184,13),(187,13),(189,13),(190,13),(191,13),(192,13),(198,13),(199,13),(200,13),(202,13),(203,13),(204,13),(207,13),(10,14),(27,14),(54,14),(5,15),(11,15),(21,15),(26,15),(31,15),(38,15),(49,15),(65,15),(70,15),(79,15),(88,15),(95,15),(97,15),(106,15),(111,15),(114,15),(115,15),(121,15),(125,15),(131,15),(141,15),(142,15),(155,15),(157,15),(163,15),(165,15),(171,15),(176,15),(180,15),(186,15),(187,15),(188,15),(189,15),(190,15),(197,15),(199,15),(201,15),(202,15),(203,15),(205,15),(11,16),(34,16),(73,16),(142,16),(153,16),(193,16),(196,16),(5,17),(11,17),(13,17),(14,17),(15,17),(17,17),(21,17),(26,17),(38,17),(39,17),(40,17),(41,17),(43,17),(46,17),(47,17),(49,17),(50,17),(63,17),(64,17),(65,17),(66,17),(69,17),(70,17),(81,17),(85,17),(86,17),(87,17),(88,17),(92,17),(93,17),(95,17),(99,17),(103,17),(104,17),(105,17),(106,17),(109,17),(111,17),(112,17),(114,17),(115,17),(116,17),(117,17),(121,17),(123,17),(124,17),(125,17),(126,17),(130,17),(138,17),(139,17),(140,17),(142,17),(146,17),(151,17),(153,17),(155,17),(156,17),(157,17),(161,17),(163,17),(165,17),(171,17),(174,17),(176,17),(180,17),(181,17),(183,17),(186,17),(187,17),(188,17),(190,17),(193,17),(194,17),(196,17),(197,17),(201,17),(202,17),(203,17),(205,17),(207,17),(5,18),(11,18),(13,18),(15,18),(17,18),(23,18),(29,18),(31,18),(34,18),(38,18),(39,18),(42,18),(46,18),(47,18),(49,18),(50,18),(63,18),(64,18),(65,18),(69,18),(70,18),(73,18),(85,18),(86,18),(87,18),(92,18),(93,18),(99,18),(105,18),(106,18),(108,18),(112,18),(114,18),(116,18),(120,18),(121,18),(123,18),(124,18),(126,18),(130,18),(132,18),(140,18),(146,18),(151,18),(153,18),(156,18),(163,18),(165,18),(168,18),(171,18),(174,18),(181,18),(186,18),(188,18),(192,18),(193,18),(194,18),(196,18),(197,18),(201,18),(205,18),(15,33),(17,33),(23,33),(24,33),(30,33),(35,33),(36,33),(39,33),(40,33),(41,33),(47,33),(59,33),(64,33),(66,33),(69,33),(73,33),(85,33),(88,33),(92,33),(93,33),(105,33),(109,33),(114,33),(116,33),(123,33),(124,33),(126,33),(130,33),(132,33),(133,33),(139,33),(142,33),(151,33),(153,33),(174,33),(181,33),(193,33),(194,33),(196,33),(207,33),(16,37),(29,37),(61,37),(67,37),(68,37),(72,37),(75,37),(94,37),(113,37),(127,37),(128,37),(129,37),(147,37),(158,37),(166,37),(175,37),(177,37),(195,37),(18,48),(22,48),(54,48),(18,51),(19,51),(21,51),(52,51),(54,51),(55,51),(56,51),(60,51),(62,51),(74,51),(81,51),(90,51),(96,51),(110,51),(118,51),(120,51),(132,51),(150,51),(154,51),(160,51),(161,51),(162,51),(164,51),(167,51),(168,51),(169,51),(172,51),(173,51),(178,51),(179,51),(183,51),(184,51),(185,51),(191,51),(192,51),(198,51),(200,51),(204,51),(23,73),(39,73),(63,73),(64,73),(66,73),(70,73),(106,73),(109,73),(111,73),(114,73),(116,73),(121,73),(130,73),(156,73),(163,73),(165,73),(171,73),(174,73),(176,73),(180,73),(181,73),(186,73),(187,73),(188,73),(190,73),(197,73),(201,73),(202,73),(205,73),(23,75),(47,75),(64,75),(66,75),(73,75),(85,75),(92,75),(105,75),(106,75),(109,75),(114,75),(115,75),(116,75),(121,75),(124,75),(126,75),(151,75),(174,75),(188,75),(193,75),(194,75),(196,75),(197,75),(27,91),(28,96),(4,98),(28,98),(79,98),(28,99),(28,100),(148,100),(46,188),(50,188),(91,188),(135,188),(146,188),(51,203),(52,203),(58,203),(59,203),(195,203),(51,204),(56,204),(59,204),(158,204),(195,204),(51,205),(58,205),(76,205),(158,205),(177,205),(195,205),(54,219),(208,219),(54,222),(94,222),(115,222),(55,227),(56,227),(208,227),(56,230),(64,273),(85,273),(105,273),(124,273),(153,273),(193,273),(194,273),(196,273),(197,273),(73,317),(83,366),(83,367),(196,999);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Adam','Adam@mail.com','$2b$12$u7CrKfZd9FK186j5SFZxLea3VSTa/YM4AbMfLFR2jqbbynfqPwLeK','2026-03-08 16:11:21'),(2,'Johan','Johan@mail.com','$2b$12$9VsWIz6x22x75THTQZ7Zp.xgZzbpQPO3ckKM3rBkUWutQXIayqwl.','2026-03-08 16:11:21'),(3,'Gusav','Gustav@mail.com','$2b$12$FQzDNqolli6Xz8mGnCqUA.1kGSJkDcG3MriJWik9Jay26MLZb8nae','2026-03-08 16:11:21'),(4,'Emil','Emil@mail.com','$2b$12$xV22evUqLWlrm1asJp9eVe8.eq9LKiOYq7QXF97T0b4XFz1W5fEGO','2026-03-08 16:11:21'),(5,'Ludvig','Ludvig@mail.com','$2b$12$PZAsvH0EdElCSTS2AJfXxelRL2FktTL7i1BzeF2j.N//x4hcDqj3q','2026-03-08 16:11:21');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remove_favorites` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
            DELETE FROM UserFavorites
            WHERE User_ID = OLD.User_ID;
        END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

--
-- Dumping routines for database 'notefy_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search`(IN searchTerm VARCHAR(255))
BEGIN
            SELECT *
            FROM Song s
            WHERE s.Title LIKE CONCAT('%', searchTerm,'%')
            OR s.Artist LIKE CONCAT('%', searchTerm,'%');
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

-- Dump completed on 2026-03-08 17:31:55

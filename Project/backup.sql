-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: blog2
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `about`
--

DROP TABLE IF EXISTS `about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(150) DEFAULT NULL,
  `pubdate` datetime NOT NULL,
  `bg_image` text,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about`
--

LOCK TABLES `about` WRITE;
/*!40000 ALTER TABLE `about` DISABLE KEYS */;
INSERT INTO `about` VALUES (1,'Test','Test','2020-07-09 04:13:08','upload/20200709041308562836.jpg','Test'),(2,'About Me.','轉職中','2020-07-28 06:48:49',NULL,'<h2><strong>目前想轉職的路人甲</strong></h2>');
/*!40000 ALTER TABLE `about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `pubdate` datetime NOT NULL,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(150) DEFAULT NULL,
  `bg_image` text,
  `content` text NOT NULL,
  `is_hide` tinyint(1) DEFAULT (0),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (15,1,'2020-07-28 03:41:14','CKEditor','',NULL,'<h2>CKEditor CDN</h2><p><strong>Speed up your website</strong> by loading CKEditor from CDN:</p><ul><li>CKEditor is hosted on servers spread across the globe - scripts are loaded faster because they are served from the nearest locations to the end user.</li><li>If the same version of CKEditor has already been downloaded (even on a different website), it is loaded from cache.</li><li>CDN reduces the number of HTTP requests handled by your server so it speeds it up as well!</li></ul><h2>CKEditor 4</h2>',1),(16,1,'2020-07-28 05:17:28','♒ 水瓶座7月28日星座運勢','整體運勢','upload/20200728053122297483.jpg','<p>8 這個數字或許對你有幫助。在財運方面，幸運的水瓶兒，一分努力一分收穫，說起來簡單，但不一定會發生在所有人身上。你現在就能體會這種感覺，只要付出越多，財運的收穫就越高。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，你也有機會成為其他人的貴人。仔細端詳長輩所說的話，意想不到的訊息就在其中。今天最好的方位在偏西方，尤其是對於事業的影響更大。對於水瓶座的你而言，最幸運的顏色是黃色，尤其是黃色的房屋能為你帶來好運。今天事業上會有好的變化。今天旺、旺、旺！自己的運勢是否好到連自己都感覺很驚訝呢？今天的水瓶座，不用太擔心健康的問題，心情輕鬆、笑口常開，對健康會更好。</p><h3>今天總體指數： ★★★★★★★★★☆ 9.1 分</h3><ul><li>愛情指數： 9.3 分</li><li>事業指數： 9.6 分</li><li>人際指數： 9.6 分</li><li>健康指數： 7.8 分</li><li>財運指數： 9.4 分</li></ul>',0),(17,1,'2020-07-28 05:18:34','♓ 雙魚座7月28日星座運勢','整體運勢','upload/20200728053225970178.webp','<p>如果談到財運，雙魚座的你，最近投資可能會有好收穫，但還是理性為上，不要僥倖投機。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，或許身邊有些讓你看不順眼的人，多從他們身上發現優點對你沒有壞處。多多上網，會找到你想要的線索。今天最好的方位在偏東方，特別是對於健康的影響更大。今天的雙魚最幸運的顏色是綠色，特別是綠色的食物能為你帶來好運。今天會有平常想不出來的好點子。今天好運令你驚訝？確實現在是你運氣最旺的時候。盡可能從事你有把握的事情，才能夠發揮你的好運，至於無法掌握的事情就別碰了，留給別人去操心吧！幸運的雙魚兒，不用太擔心健康的問題，少吃肉、多吃菜，對你的健康幫助最大。3 這個數字對你不錯。</p><h3>今天總體指數： ★★★★★★★★★☆ 9 分</h3><ul><li>愛情指數： 9.2 分</li><li>事業指數： 9.5 分</li><li>人際指數： 9.5 分</li><li>健康指數： 7.7 分</li><li>財運指數： 9.3 分</li></ul>',0),(18,1,'2020-07-28 05:19:01','♈ 白羊座7月28日星座運勢','整體運勢','upload/20200728053305548981.jpg','<p>28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，也應該主動對別人伸出援手。無聊時打開電視，可以獲得有用的資訊。今天最好的方位在偏南方，尤其是對於人脈的影響更大。今天的白羊最幸運的顏色是藍色，尤其是藍色的友人的衣服能為你帶來好運。今天適合下重大的決策。今天煩惱皆因強出頭，雖然運勢不錯，但不要勉強自己，只要把握好自己的事情即可。幸運的白羊兒，不用太擔心健康的問題，不適合喝酒，遠離酒精對健康更好。8 這個數字會給你帶來好運。說到大家都關心的財運，白羊座的你，暫時不要輕易借錢給別人，會讓自己的財運更好。</p><h3>今天總體指數： ★★★★★★★★★☆ 8.9 分</h3><ul><li>愛情指數： 9.1 分</li><li>事業指數： 9.4 分</li><li>人際指數： 9.4 分</li><li>健康指數： 7.6 分</li><li>財運指數： 9.2 分</li></ul>',0),(19,1,'2020-07-28 05:19:27','♉ 金牛座7月28日星座運勢','整體運勢',NULL,'<p>找時間跟家人談談，一定會體會到新的事情。今天最好的方位在偏北方，特別是對於感情的影響更大。今天的金牛最幸運的顏色是紫色，特別是紫色的書籍能為你帶來好運。今天適合大筆的交易。今天吉星高照，很多以前無法解決的事情，現在都能迎刃而解，心情順順順！幸運的金牛兒，不用太擔心健康的問題，酒肉穿腸過，飲食最好清淡。3 是你的幸運號碼。至於財運，金牛座的你，看到喜歡的東西如果可以忍耐一下，不要馬上作決定，以後會有更好的回饋。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，將心比心體諒別人，今天的饒恕會灌溉出明天豐碩的果實。</p><h3>今天總體指數： ★★★★★★★★★☆ 9.3 分</h3><ul><li>愛情指數： 9 分</li><li>事業指數： 9.3 分</li><li>人際指數： 9.3 分</li><li>健康指數： 9.9 分</li><li>財運指數： 9.1 分</li></ul>',0),(20,1,'2020-07-28 05:19:51','♊ 雙子座7月28日星座運勢','整體運勢',NULL,'<p>今天最好的方位在西北方，尤其是對於財運的影響更大。今天的雙子最幸運的顏色是灰色，尤其是灰色的雜誌能為你帶來好運。今天遺失的東西可能會找回來。今天你可能自己感覺不到，但實際上運勢卻是相當好的，仔細想想看，是不是運氣要比之前好呢？幸運的雙子兒，不用太擔心健康的問題，菸酒傷身，你應該很清楚怎麼樣對身體最好。8 是你想要投機時候可以參考的數字。在財運方面，雙子座的你，好好專心在本業上，會有比較好的財運。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，但不要故意得罪別人。有空時翻翻書報，找尋到你意想不到的事物。</p><h3>今天總體指數： ★★★★★★★★★☆ 9.2 分</h3><ul><li>愛情指數： 8.9 分</li><li>事業指數： 9.2 分</li><li>人際指數： 9.2 分</li><li>健康指數： 9.8 分</li><li>財運指數： 9 分</li></ul>',0),(21,1,'2020-07-28 05:20:13','♋ 巨蟹座7月28日星座運勢','整體運勢',NULL,'<p>今天的巨蟹最幸運的顏色是粉紅色，特別是粉紅色的包包能為你帶來好運。今天適合前往遠方旅遊。今天運氣太好了，別人是一分努力一分收穫，你則是事半功倍，不用花很多精力，就能夠有很好的結果。幸運的巨蟹兒，不用太擔心健康的問題，不要吃得太油膩，才能保持身體的健康。3 這個數字可能對你比較好。如果談到財運，巨蟹座的你，雖然偏財運不太好，但專注在本業上的收穫已經很高了。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，也別忘記多多讚美周遭的人。上網看看新聞，會發現找很久的訊息。今天最好的方位在東北方，特別是對於人緣的影響更大。</p><h3>今天總體指數： ★★★★★★★★★☆ 9.1 分</h3><ul><li>愛情指數： 8.8 分</li><li>事業指數： 9.1 分</li><li>人際指數： 9.1 分</li><li>健康指數： 9.7 分</li><li>財運指數： 8.9 分</li></ul>',0),(22,1,'2020-07-28 05:20:44','♌ 獅子座7月28日星座運勢','整體運勢',NULL,'<p>今天精神感覺特別好。今天的好運並不常見，如果不好好把握，下次要遇到這種好運的機會不多哦。幸運的獅子兒，不用太擔心健康的問題，如果你有抽菸的話，這段期間可以少抽一點。8 是你的幸運數字。說到大家都關心的財運，獅子座的你，你會有小小的偏財運。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，能饒人處且饒人，不要讓別人陷入窘境。多跟朋友聊聊，神祕的訊息暗藏其中。今天最好的方位在西南方，尤其是對於偏財運的影響更大。今天的獅子最幸運的顏色是淺藍色，尤其是淺藍色的衣服能為你帶來好運。</p><h3>今天總體指數： ★★★★★★★★★☆ 9 分</h3><ul><li>愛情指數： 8.7 分</li><li>事業指數： 9 分</li><li>人際指數： 9 分</li><li>健康指數： 9.6 分</li><li>財運指數： 8.8 分</li></ul>',0),(23,1,'2020-07-28 05:21:23','♍ 處女座7月28日星座運勢','整體運勢',NULL,'<p>今天運勢非常好，要好好把握。幸運的處女兒，不用太擔心健康的問題，但是少攝取一些熱量，對身體會更好。3 這個數字或許對你有幫助。至於財運，處女座的你，一分努力一分收穫，說起來簡單，但不一定會發生在所有人身上。你現在就能體會這種感覺，只要付出越多，財運的收穫就越高。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，花點小錢請人吃飯或送禮物會更好。仔細端詳長輩所說的話，讓你開拓新的視野。今天最好的方位在東南方，特別是對於事業的影響更大。今天的處女最幸運的顏色是金色，特別是金色的服飾能為你帶來好運。今天法律上的糾紛會好轉。</p><h3>今天總體指數： ★★★★★★★★★☆ 8.9 分</h3><ul><li>愛情指數： 8.6 分</li><li>事業指數： 8.9 分</li><li>人際指數： 8.9 分</li><li>健康指數： 9.5 分</li><li>財運指數： 8.7 分</li></ul>',0),(24,1,'2020-07-28 05:21:43','♎ 天秤座7月28日星座運勢','整體運勢',NULL,'<p>幸運的天秤兒，不用太擔心健康的問題，多吃水果、多喝水，身體才會健康。8 這個數字對你不錯。在財運方面，天秤座的你，最近投資可能會有好收穫，但還是理性為上，不要僥倖投機。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，但有時太刻意討好別人也可能讓人懷疑你的動機。多多上網，意想不到的訊息就在其中。今天最好的方位在北方，尤其是對於健康的影響更大。今天的天秤最幸運的顏色是銀色，尤其是銀色的配件能為你帶來好運。今天在學業上的情況不錯。今天有難得一見的好運，感覺上做什麼事情都很順利。</p><h3>今天總體指數： ★★★★★★★★☆☆ 8.8 分</h3><ul><li>愛情指數： 8.5 分</li><li>事業指數： 8.8 分</li><li>人際指數： 8.8 分</li><li>健康指數： 9.4 分</li><li>財運指數： 8.6 分</li></ul>',0),(25,1,'2020-07-28 05:22:08','♏ 天蠍座7月28日星座運勢','整體運勢',NULL,'<p>3 這個數字會給你帶來好運。如果談到財運，天蠍座的你，暫時不要輕易借錢給別人，會讓自己的財運更好。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，你也有機會成為其他人的貴人。無聊時打開電視，會找到你想要的線索。今天最好的方位在南方，特別是對於人脈的影響更大。今天的天蠍最幸運的顏色是粉紫色，特別是粉紫色的封面的書能為你帶來好運。今天想要找的人會自然出現。今天與平常比較起來，運勢算是相當好的了。幸運的天蠍兒，不用太擔心健康的問題，心情輕鬆、笑口常開，對健康會更好。</p><h3>今天總體指數： ★★★★★★★★☆☆ 8.7 分</h3><ul><li>愛情指數： 8.4 分</li><li>事業指數： 8.7 分</li><li>人際指數： 8.7 分</li><li>健康指數： 9.3 分</li><li>財運指數： 8.5 分</li></ul>',0),(26,1,'2020-07-28 05:22:36','♐ 射手座7月28日星座運勢','整體運勢','upload/20200728053348834387.jpg','<p>說到大家都關心的財運，射手座的你，看到喜歡的東西如果可以忍耐一下，不要馬上作決定，以後會有更好的回饋。28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，或許身邊有些讓你看不順眼的人，多從他們身上發現優點對你沒有壞處。找時間跟家人談談，可以獲得有用的資訊。今天最好的方位在西方，尤其是對於感情的影響更大。今天的射手最幸運的顏色是淺綠色，尤其是淺綠色的物品能為你帶來好運。今天可以輕易駕馭自己的情緒。今天的運氣相當不錯，比之前還更好。幸運的射手兒，不用太擔心健康的問題，少吃肉、多吃菜，對你的健康幫助最大。8 是你的幸運號碼。</p><h3>今天總體指數： ★★★★★★★★☆☆ 8.6 分</h3><ul><li>愛情指數： 8.3 分</li><li>事業指數： 8.6 分</li><li>人際指數： 8.6 分</li><li>健康指數： 9.2 分</li><li>財運指數： 8.4 分</li></ul>',0),(27,1,'2020-07-28 05:23:58','♑ 魔羯座7月28日星座運勢','整體運勢',NULL,'<p>28日的貴人就在你身邊，甚至是你平常不熟的人都可能幫助你，也應該主動對別人伸出援手。有空時翻翻書報，一定會體會到新的事情。今天最好的方位在東方，特別是對於財運的影響更大。今天的魔羯最幸運的顏色是鵝黃色，特別是鵝黃色的內衣能為你帶來好運。今天事業上會有好的變化。今天的運勢很旺哦，你是否也有這樣的感覺？幸運的魔羯兒，不用太擔心健康的問題，不適合喝酒，遠離酒精對健康更好。3 是你想要投機時候可以參考的數字。至於財運，魔羯座的你，好好專心在本業上，會有比較好的財運。</p><h3>今天總體指數： ★★★★★★★★☆☆ 8.5 分</h3><ul><li>愛情指數： 8.2 分</li><li>事業指數： 8.5 分</li><li>人際指數： 8.5 分</li><li>健康指數： 9.1 分</li><li>財運指數： 8.3 分</li></ul>',0),(28,1,'2020-07-28 05:24:19','小定空戰臺認候為現','',NULL,'<p>意解工舞一：學是正想世北外現熱？</p><p>地如般人天保出定生終要開關觀經路是馬神國弟羅質年字……對原家預十度軍受是們園為究花至漸愛中光作者不事時能機是才不容，故主那國，我光長想大而用萬法害上比！那物知衣成道年線事要增可中男上天人響樓我兒不無後己都都。<br>&nbsp;</p>',0),(29,1,'2020-07-28 06:53:34','以下文章為假文測試','測試中',NULL,'<p>測試</p>',0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `pubdate` datetime NOT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'Test','Test','Test','2020-07-18 15:23:25','Test');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(150) DEFAULT NULL,
  `pubdate` datetime NOT NULL,
  `bg_image` text,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Contact Me','Have questions? I have answers.','2020-06-29 15:01:49','upload/20200629150149278406.jpg','Want to get in touch? Fill out the form below to send me a message and I will get back to you as soon as possible!'),(2,'Test','Test','2020-07-09 04:11:31','upload/20200709041131588927.jpg','Test'),(3,'Contact Me.','如果有任何問題可以向我聯絡','2020-07-28 06:45:05',NULL,'<p>的站我史身去當關東共怕過我也二里待這格首一的層行，見不少的在有！媽地富的可，社無新記就回腦少們，人是們來中蘭目力注一是汽小使視城失易；到度期領化三由不的場二友跟、千眾命你臺紅軍吃她面紅裡：高平可可把友根名紅局裡出命想古衣。</p>'),(4,'Contact Me.','如果有任何問題可以向我聯絡','2020-07-28 06:50:54',NULL,'<p>我的聯絡方式如下：</p><ol><li>Line ID： jinnig17753</li><li>Email：lonelyofcat@gmail.com</li><li>或是使用下方聯絡</li></ol>'),(5,'Contact Me.','如果有任何問題可以向我聯絡','2020-07-28 06:56:22','upload/20200728065622801025.jpg','<p>我的聯絡方式如下：</p><ol><li>Line ID： jinnig17753</li><li>Email：lonelyofcat@gmail.com</li><li>或是使用下方聯絡</li></ol>');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home`
--

DROP TABLE IF EXISTS `home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(150) DEFAULT NULL,
  `pubdate` datetime NOT NULL,
  `bg_image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home`
--

LOCK TABLES `home` WRITE;
/*!40000 ALTER TABLE `home` DISABLE KEYS */;
INSERT INTO `home` VALUES (1,'Test','Rivan','2020-07-10 12:27:59','upload/20200710122759701480.jpg'),(2,'Rivan\'s Blog','Blog Theme by Clean Blog','2020-07-28 06:52:18',NULL),(3,'Rivan\'s Blog','Blog Theme by Clean Blog','2020-07-28 06:52:47','upload/20200728065247781172.jpg');
/*!40000 ALTER TABLE `home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_author` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`is_author` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jinnig17753','pbkdf2:sha256:150000$kP98ZCBe$29621f7499e68f71123b749bce8265f5f7255558681afbcb276ca25929ebb831',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-30 14:38:26

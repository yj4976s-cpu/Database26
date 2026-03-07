DROP TABLE IF EXISTS `members`;
use data;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','manager','user') COLLATE utf8mb4_general_ci DEFAULT 'user',
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `members` WRITE;
INSERT INTO `members` VALUES (1,'adm','1111','관리자','admin',1,'2026-02-19'),(2,'mag','2345','매니저','manager',1,'2026-02-19');
UNLOCK TABLES;
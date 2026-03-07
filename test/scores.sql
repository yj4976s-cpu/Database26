DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `korean` int NOT NULL,
  `english` int NOT NULL,
  `math` int NOT NULL,
  `total` int NOT NULL,
  `average` float NOT NULL,
  `grade` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
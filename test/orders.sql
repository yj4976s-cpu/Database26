CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `status` enum('PAID','REFUND_REQ','REFUNDED','CANCELED') COLLATE utf8mb4_general_ci DEFAULT 'PAID',
  `total_price` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
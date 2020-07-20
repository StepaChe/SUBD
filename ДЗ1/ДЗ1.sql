CREATE TABLE `city` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `population` int unsigned NOT NULL,
  `region` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_id_idx` (`region`),
  CONSTRAINT `fk_region_id` FOREIGN KEY (`region`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `country` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `region_number` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `region` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `country` int unsigned NOT NULL,
  `city_number` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_id_idx` (`country`),
  CONSTRAINT `fk_country_id` FOREIGN KEY (`country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


#
# TABLE STRUCTURE FOR: Orders
#

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_status` varchar(20) NOT NULL CHECK (`delivery_status` in ('shipped','processing','delivered')),
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


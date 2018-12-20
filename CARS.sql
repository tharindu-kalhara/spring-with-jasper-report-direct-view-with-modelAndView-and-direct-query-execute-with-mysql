

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for CARS
-- ----------------------------
DROP TABLE IF EXISTS `CARS`;
CREATE TABLE `CARS`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PRICE` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CARS
-- ----------------------------
INSERT INTO `CARS` VALUES (1, 'Audi', 52642);
INSERT INTO `CARS` VALUES (2, 'Mercedes', 57127);
INSERT INTO `CARS` VALUES (3, 'Skoda', 9000);
INSERT INTO `CARS` VALUES (4, 'Volvo', 29000);
INSERT INTO `CARS` VALUES (5, 'Bentley', 350000);
INSERT INTO `CARS` VALUES (6, 'Citroen', 21000);
INSERT INTO `CARS` VALUES (7, 'Hummer', 41400);
INSERT INTO `CARS` VALUES (8, 'Volkswagen', 21600);

SET FOREIGN_KEY_CHECKS = 1;

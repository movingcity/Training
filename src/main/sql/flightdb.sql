/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100213
 Source Host           : localhost:16608
 Source Schema         : flightdb

 Target Server Type    : MariaDB
 Target Server Version : 100213
 File Encoding         : 65001

 Date: 12/03/2018 20:15:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT,
  `airl_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flt_number` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `schd_date_time` datetime(0) NOT NULL,
  `arrvdept` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acfttype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flgttype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `domsintl` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `actual_date_time` datetime(0) NULL DEFAULT NULL,
  `estimated_date_time` datetime(0) NULL DEFAULT NULL,
  `user_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `terminal_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES (1, 'CA', 'CA112', '2018-03-07 16:17:07', 'A', '321', 'W', 'B2265', 'D', NULL, '2018-03-07 16:09:40', 'LJ', 'T3');
INSERT INTO `flight` VALUES (2, 'CA', 'CA113', '2018-03-07 17:17:07', 'A', '320', 'W', 'B2288', 'I', '2018-03-07 18:09:10', NULL, 'HYN', 'T3');
INSERT INTO `flight` VALUES (3, 'CA', 'CA114', '2018-03-07 18:17:07', 'A', '733', 'W', NULL, 'D', NULL, NULL, 'HXB', 'T3');
INSERT INTO `flight` VALUES (4, 'CA', 'CA512', '2018-03-07 19:17:07', 'D', '321', 'W', 'B2271', 'D', NULL, NULL, 'RSL', 'T3');
INSERT INTO `flight` VALUES (5, 'CA', 'CA513', '2018-03-07 20:17:07', 'D', '320', 'W', NULL, 'I', NULL, '2018-03-07 18:09:21', 'RSL', 'T3');
INSERT INTO `flight` VALUES (7, 'CA', 'CA1018', '2018-03-11 00:11:00', 'A', '738', 'W', 'B2134', 'I', NULL, NULL, 'LiuJ2', 'T3');
INSERT INTO `flight` VALUES (8, 'CA', 'CA1018', '2018-03-11 00:11:00', 'A', '738', 'W', 'B2134', 'I', NULL, NULL, 'LiuJ2', 'T3');
INSERT INTO `flight` VALUES (9, 'CA', 'CA1022', '2018-03-12 00:12:00', 'A', 'A320', 'W', 'B2644', 'D', NULL, NULL, '', 'T3');

-- ----------------------------
-- Table structure for flight_route
-- ----------------------------
DROP TABLE IF EXISTS `flight_route`;
CREATE TABLE `flight_route`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT,
  `airp_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `domsintl_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrival_date_time` datetime(0) NULL DEFAULT NULL,
  `departure_date_time` datetime(0) NULL DEFAULT NULL,
  `step_number` int(2) NOT NULL,
  `flight_id` int(12) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_flight`(`flight_id`) USING BTREE,
  CONSTRAINT `FK_flight` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight_route
-- ----------------------------
INSERT INTO `flight_route` VALUES (1, 'CAN', 'D', NULL, '2018-03-07 18:16:12', 1, 1);
INSERT INTO `flight_route` VALUES (2, 'PEK', 'D', NULL, NULL, 2, 1);
INSERT INTO `flight_route` VALUES (3, 'LAA', 'I', NULL, '2018-03-07 18:16:17', 1, 2);
INSERT INTO `flight_route` VALUES (4, 'PEK', 'D', NULL, NULL, 2, 2);
INSERT INTO `flight_route` VALUES (5, 'CTU', 'D', NULL, '2018-03-07 18:16:20', 1, 3);
INSERT INTO `flight_route` VALUES (6, 'PEK', 'D', NULL, NULL, 2, 3);
INSERT INTO `flight_route` VALUES (7, 'PEK', 'D', NULL, NULL, 1, 4);
INSERT INTO `flight_route` VALUES (8, 'CAN', 'D', NULL, NULL, 2, 4);
INSERT INTO `flight_route` VALUES (9, 'PEK', 'D', NULL, NULL, 1, 5);
INSERT INTO `flight_route` VALUES (10, 'LAA', 'I', NULL, NULL, 2, 5);
INSERT INTO `flight_route` VALUES (13, 'CTU', 'D', NULL, '2018-03-11 08:11:00', 0, 7);
INSERT INTO `flight_route` VALUES (14, 'PEK', 'D', '2018-03-11 00:11:00', NULL, 1, 7);
INSERT INTO `flight_route` VALUES (15, 'CTU', 'D', NULL, '2018-03-11 08:11:00', 0, 8);
INSERT INTO `flight_route` VALUES (16, 'PEK', 'D', '2018-03-11 00:11:00', NULL, 1, 8);
INSERT INTO `flight_route` VALUES (17, 'CTU', 'D', NULL, '2018-03-12 05:30:00', 1, 9);
INSERT INTO `flight_route` VALUES (18, 'PEK', 'D', '2018-03-12 10:00:00', NULL, 2, 9);

SET FOREIGN_KEY_CHECKS = 1;

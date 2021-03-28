/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : flashfloodforcast

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 28/03/2021 17:08:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sysarea
-- ----------------------------
DROP TABLE IF EXISTS `sysarea`;
CREATE TABLE `sysarea`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `areaName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `town` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `village` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysarea
-- ----------------------------
INSERT INTO `sysarea` VALUES (1, '917', '泽周商务', '山西省', '宝鸡市', '金台区', '东风镇', '东风村', '东风路26号', NULL);

-- ----------------------------
-- Table structure for sysmenu
-- ----------------------------
DROP TABLE IF EXISTS `sysmenu`;
CREATE TABLE `sysmenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menuParentId` int(11) NOT NULL,
  `menuLevel` int(11) NOT NULL,
  `menuPath` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdAt` timestamp(0) NULL DEFAULT NULL,
  `updatedAt` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysmenu
-- ----------------------------
INSERT INTO `sysmenu` VALUES (1, '系统管理', 0, 1, '/sysmanagement', '2021-03-28 11:01:00', NULL, NULL);
INSERT INTO `sysmenu` VALUES (2, '角色管理', 1, 2, '/sysroles', '2021-03-28 11:01:46', NULL, NULL);
INSERT INTO `sysmenu` VALUES (3, '用户管理', 1, 2, '/sysusers', '2021-03-28 11:02:47', NULL, NULL);
INSERT INTO `sysmenu` VALUES (4, '菜单管理', 1, 2, '/sysmenus', '2021-03-28 11:03:23', NULL, NULL);
INSERT INTO `sysmenu` VALUES (5, '平台概况', 0, 1, '/home', '2021-03-28 11:08:39', '2021-03-28 11:08:50', NULL);
INSERT INTO `sysmenu` VALUES (6, '实时监控', 0, 1, '/livedata', '2021-03-28 11:09:13', NULL, NULL);
INSERT INTO `sysmenu` VALUES (7, '查询分析', 0, 1, '/querynanalysis', '2021-03-28 11:10:16', NULL, NULL);
INSERT INTO `sysmenu` VALUES (8, '日志管理', 0, 1, '/logs', '2021-03-28 11:10:46', NULL, NULL);
INSERT INTO `sysmenu` VALUES (9, '终端管理', 0, 1, '/devices', '2021-03-28 11:12:01', NULL, NULL);
INSERT INTO `sysmenu` VALUES (10, '升级管理', 0, 1, '/upgrade', '2021-03-28 11:12:45', NULL, NULL);
INSERT INTO `sysmenu` VALUES (11, '任务管理', 0, 1, '/tasks', '2021-03-28 11:13:38', NULL, NULL);

-- ----------------------------
-- Table structure for sysrole
-- ----------------------------
DROP TABLE IF EXISTS `sysrole`;
CREATE TABLE `sysrole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdAt` timestamp(0) NULL DEFAULT NULL,
  `updatedAt` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `menuId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysrole
-- ----------------------------
INSERT INTO `sysrole` VALUES (1, 'admin', '2021-03-28 11:04:11', NULL, NULL, '超级管理员');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` int(11) NOT NULL,
  `areaId` int(11) NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isActive` int(1) NOT NULL,
  `isAppUser` int(1) NOT NULL,
  `avatarUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT NULL,
  `updatedAt` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleIdKey`(`roleId`) USING BTREE,
  INDEX `areaKey`(`areaId`) USING BTREE,
  CONSTRAINT `areaKey` FOREIGN KEY (`areaId`) REFERENCES `sysarea` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `roleIdKey` FOREIGN KEY (`roleId`) REFERENCES `sysrole` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '18888888888', '123@admin.com', 1, 1, 'abc.jpg', '2021-03-28 15:11:02', '2021-03-28 15:45:08', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

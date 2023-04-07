/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : api_test

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 07/04/2023 19:32:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for keywords
-- ----------------------------
DROP TABLE IF EXISTS `keywords`;
CREATE TABLE `keywords`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pinyin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `content`(`content` ASC) USING BTREE,
  INDEX `pinyin`(`pinyin` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of keywords
-- ----------------------------
INSERT INTO `keywords` VALUES (1, '中国知网', 'zhongguozhiwang');
INSERT INTO `keywords` VALUES (2, '中国', 'zhongguo');
INSERT INTO `keywords` VALUES (3, '中国银行', 'zhongguoyinhang');
INSERT INTO `keywords` VALUES (4, '中国地图', 'zhongguoditu');
INSERT INTO `keywords` VALUES (5, '中国裁判文书网', 'zhongguocaipanwenshuwang');
INSERT INTO `keywords` VALUES (6, '中国奇谭', 'zhongguoqitan');
INSERT INTO `keywords` VALUES (7, '中国电信', 'zhongguodianxin');
INSERT INTO `keywords` VALUES (8, '中国人事考试网', 'zhongguorenshikaoshiwang');
INSERT INTO `keywords` VALUES (9, '中国裁判文书公开网查询', 'zhongguocaipanwenshuwanggongkaichaxun');
INSERT INTO `keywords` VALUES (10, '中国移动', 'zhongguoyidong');
INSERT INTO `keywords` VALUES (11, '中国联通', 'zhongguoliantong');
INSERT INTO `keywords` VALUES (12, '可以吃糖吗', 'keyichitangma');

SET FOREIGN_KEY_CHECKS = 1;

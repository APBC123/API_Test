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

 Date: 08/04/2023 10:00:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for keywords
-- ----------------------------
DROP TABLE IF EXISTS `keywords`;
CREATE TABLE `keywords`  (
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pinyin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`content`) USING BTREE,
  INDEX `pinyin`(`pinyin` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of keywords
-- ----------------------------
INSERT INTO `keywords` VALUES ('可以吃糖吗', 'keyichitangma');
INSERT INTO `keywords` VALUES ('可以喝水吗', 'keyiheshuima');
INSERT INTO `keywords` VALUES ('中国', 'zhongguo');
INSERT INTO `keywords` VALUES ('中国裁判文书网', 'zhongguocaipanwenshuwang');
INSERT INTO `keywords` VALUES ('中国裁判文书公开网查询', 'zhongguocaipanwenshuwanggongkaichaxun');
INSERT INTO `keywords` VALUES ('中国电信', 'zhongguodianxin');
INSERT INTO `keywords` VALUES ('中国地图', 'zhongguoditu');
INSERT INTO `keywords` VALUES ('中国联通', 'zhongguoliantong');
INSERT INTO `keywords` VALUES ('中国农业银行', 'zhongguonongyeyinhang');
INSERT INTO `keywords` VALUES ('中国奇谭', 'zhongguoqitan');
INSERT INTO `keywords` VALUES ('中国人事考试网', 'zhongguorenshikaoshiwang');
INSERT INTO `keywords` VALUES ('中国移动', 'zhongguoyidong');
INSERT INTO `keywords` VALUES ('中国银行', 'zhongguoyinhang');
INSERT INTO `keywords` VALUES ('中国知网', 'zhongguozhiwang');
INSERT INTO `keywords` VALUES ('中土', 'zhongtu');
INSERT INTO `keywords` VALUES ('中途', 'zhongtu');
INSERT INTO `keywords` VALUES ('种植', 'zhongzhi');

SET FOREIGN_KEY_CHECKS = 1;

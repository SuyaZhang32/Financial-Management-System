/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : l3009

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 04/10/2024 12:47:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userid` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `money` float(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `typeid` int(0) NOT NULL COMMENT '类型 1 收入 2 支出',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `paywayid` int(0) NULL DEFAULT NULL COMMENT '支付方式',
  `time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '交易时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `type`(`typeid`) USING BTREE,
  INDEX `payway`(`paywayid`) USING BTREE,
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`typeid`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`paywayid`) REFERENCES `payway` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 280 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (262, '家教', 1, 1000.00, 2, '', 2, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (263, '基金', 1, 2600.00, 2, '', 3, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (264, '购买衣服', 1, 1500.00, 1, '', 2, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (265, '日常开销', 1, 2600.00, 1, '', 4, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (266, '医疗保险', 1, 300.00, 1, '', 2, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (267, '缴纳书费', 1, 240.00, 1, '', 4, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (268, '吃饭', 1, 1000.00, 1, '', 2, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (269, '交通费', 1, 150.00, 1, '', 4, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (270, '兼职', 1, 300.00, 2, '', 2, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (271, '家教', 1, 200.00, 2, '', 4, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (272, '日常花销', 1, 1000.00, 1, '', 2, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (273, '聚餐娱乐', 1, 350.00, 1, '', 2, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (274, '工资', 1, 12000.00, 2, '2022年4月份工资', 3, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (275, '奖金', 1, 1500.00, 2, '', 4, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (276, '分红', 1, 5500.00, 2, '', 3, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (277, '出查补助', 1, 3500.00, 2, '', 3, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (278, '日常开销', 1, 2500.00, 1, '', 2, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (279, '交通花销', 1, 1000.00, 1, '', 2, '2024-10-04 16:30:57');
INSERT INTO `bill` VALUES (280, '1', 64, 1.00, 2, '11', 1, '2024-10-04 02:51:47');
INSERT INTO `bill` VALUES (281, '1', 64, 1.00, 1, '111', 1, '2024-10-04 02:51:58');

-- ----------------------------
-- Table structure for curaccount
-- ----------------------------
DROP TABLE IF EXISTS `curaccount`;
CREATE TABLE `curaccount`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NULL DEFAULT NULL,
  `houseid` int(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `money` float(255, 0) NULL DEFAULT NULL,
  `paywayid` int(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `typeid_id`(`houseid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of curaccount
-- ----------------------------
INSERT INTO `curaccount` VALUES (37, 1, NULL, '家庭资产', 4101, NULL, '无');
INSERT INTO `curaccount` VALUES (44, 64, 28, '家庭资产', 0, NULL, '无');

-- ----------------------------
-- Table structure for debt
-- ----------------------------
DROP TABLE IF EXISTS `debt`;
CREATE TABLE `debt`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NULL DEFAULT NULL,
  `houseid` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `residue` float(255, 2) NULL DEFAULT NULL,
  `curperiod` float(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of debt
-- ----------------------------
INSERT INTO `debt` VALUES (8, 1, NULL, '房贷', 11111.00, 11.00);
INSERT INTO `debt` VALUES (9, 1, NULL, '1', 1.00, 1.00);

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ownerid` int(0) NOT NULL COMMENT '户主编号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `holderid`(`ownerid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1, 3, '');
INSERT INTO `house` VALUES (3, 20, NULL);
INSERT INTO `house` VALUES (4, 21, NULL);
INSERT INTO `house` VALUES (5, 25, NULL);
INSERT INTO `house` VALUES (6, 26, NULL);
INSERT INTO `house` VALUES (7, 27, NULL);
INSERT INTO `house` VALUES (8, 29, NULL);
INSERT INTO `house` VALUES (9, 34, NULL);
INSERT INTO `house` VALUES (10, 35, NULL);
INSERT INTO `house` VALUES (11, 36, NULL);
INSERT INTO `house` VALUES (12, 38, NULL);
INSERT INTO `house` VALUES (13, 39, NULL);
INSERT INTO `house` VALUES (14, 40, NULL);
INSERT INTO `house` VALUES (15, 41, NULL);
INSERT INTO `house` VALUES (16, 42, NULL);
INSERT INTO `house` VALUES (17, 43, NULL);
INSERT INTO `house` VALUES (18, 44, NULL);
INSERT INTO `house` VALUES (19, 45, NULL);
INSERT INTO `house` VALUES (20, 46, NULL);
INSERT INTO `house` VALUES (21, 48, NULL);
INSERT INTO `house` VALUES (22, 49, NULL);
INSERT INTO `house` VALUES (23, 51, NULL);
INSERT INTO `house` VALUES (24, 53, NULL);
INSERT INTO `house` VALUES (25, 55, NULL);
INSERT INTO `house` VALUES (26, 57, NULL);
INSERT INTO `house` VALUES (27, 61, NULL);
INSERT INTO `house` VALUES (28, 64, NULL);

-- ----------------------------
-- Table structure for moneymanage
-- ----------------------------
DROP TABLE IF EXISTS `moneymanage`;
CREATE TABLE `moneymanage`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `rate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `userid` int(0) NULL DEFAULT NULL,
  `houseid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moneymanage
-- ----------------------------
INSERT INTO `moneymanage` VALUES (14, '信诚薪金宝', '200.0', '2.87', 1, 8);
INSERT INTO `moneymanage` VALUES (15, '国寿光源180', '200.0', '2.64', 1, 8);
INSERT INTO `moneymanage` VALUES (16, '平安享赢368', '400.0', '4.50', 1, 7);
INSERT INTO `moneymanage` VALUES (17, '广发聚荣', '300.0', '5.31', 1, 7);
INSERT INTO `moneymanage` VALUES (18, '汇添富', '300.0', '3.66', 1, 7);
INSERT INTO `moneymanage` VALUES (19, '鹏华招华', '200.0', '5.09', 1, 7);
INSERT INTO `moneymanage` VALUES (20, 'licai', '100.0', '3', 1, NULL);
INSERT INTO `moneymanage` VALUES (22, '产品1', '10000.0', '0.05', 1, 24);

-- ----------------------------
-- Table structure for payway
-- ----------------------------
DROP TABLE IF EXISTS `payway`;
CREATE TABLE `payway`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `payway` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payway
-- ----------------------------
INSERT INTO `payway` VALUES (1, '支付宝', NULL);
INSERT INTO `payway` VALUES (2, '微信', NULL);
INSERT INTO `payway` VALUES (3, '银联', NULL);
INSERT INTO `payway` VALUES (4, '现金', NULL);
INSERT INTO `payway` VALUES (5, '其他', NULL);

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `privilegeNumber` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限编号',
  `privilegeName` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `privilegeTipflag` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单级别',
  `privilegeTypeflag` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1启用 0禁用',
  `privilegeUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限URL',
  `icon` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES (62, '001', '收支管理', '0', '1', '', '&#xe698;');
INSERT INTO `privilege` VALUES (63, '001002', '支出详情', '1', '1', 'pay_details', '&#xe698;');
INSERT INTO `privilege` VALUES (64, '002', '账户总览', '0', '1', NULL, '&#xe702;');
INSERT INTO `privilege` VALUES (65, '001001', '收入详情', '1', '1', 'income_details', '&#xe698;');
INSERT INTO `privilege` VALUES (66, '003', '统计报表', '0', '1', NULL, '&#xe757;');
INSERT INTO `privilege` VALUES (67, '003001', '统计报表', '1', '1', 'chart_line', '&#xe757;');
INSERT INTO `privilege` VALUES (69, '005', '系统管理', '0', '1', '', '&#xe696;');
INSERT INTO `privilege` VALUES (70, '005001', '用户管理', '1', '1', 'sys_users', '&#xe6b8;');
INSERT INTO `privilege` VALUES (71, '005002', '角色管理', '1', '1', 'sys_roles', '&#xe70b;');
INSERT INTO `privilege` VALUES (75, '002002', '理财详情', '1', '1', 'asset_moneymanage_details', '&#xe702;');
INSERT INTO `privilege` VALUES (76, '002001', '活期资产', '1', '1', 'asset_account_details', '&#xe702;');
INSERT INTO `privilege` VALUES (77, '002003', '负债详情', '1', '1', 'asset_debt_details', '&#xe702;');
INSERT INTO `privilege` VALUES (78, '002004', '理财推荐', '1', '1', 'asset_product_details', '&#xe702;');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '风险等级',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '风险描述',
  `loss` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '亏损概率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '国债', 'R1', '谨慎型、低风险', '零');
INSERT INTO `product` VALUES (2, '存款类产品', 'R1', '谨慎型、低风险', '零');
INSERT INTO `product` VALUES (3, '保本保收益类产品', 'R1', '谨慎型、低风险', '零');
INSERT INTO `product` VALUES (4, '保本浮动收益类产品', 'R1', '谨慎型、低风险', '零');
INSERT INTO `product` VALUES (5, '银行间市场债券', 'R2', '稳健型、中低风险', '接近零');
INSERT INTO `product` VALUES (6, '交易所市场债券', 'R2', '稳健型、中低风险', '接近零');
INSERT INTO `product` VALUES (7, '资金拆借', 'R2', '稳健型、中低风险', '接近零');
INSERT INTO `product` VALUES (8, '信托计划', 'R2', '稳健型、中低风险', '接近零');
INSERT INTO `product` VALUES (9, '其他金融资产', 'R2', '稳健型、中低风险', '接近零');
INSERT INTO `product` VALUES (10, '债券', 'R3', '平衡型、中等风险', '较低');
INSERT INTO `product` VALUES (11, '同业存放', 'R3', '平衡型、中等风险', '较低');
INSERT INTO `product` VALUES (12, '股票', 'R3', '平衡型、中等风险', '较低');
INSERT INTO `product` VALUES (13, '商品', 'R3', '平衡型、中等风险', '较低');
INSERT INTO `product` VALUES (14, '外汇', 'R3', '平衡型、中等风险', '较低');
INSERT INTO `product` VALUES (15, '净值型理财', 'R3', '平衡型、中等风险', '较低');
INSERT INTO `product` VALUES (16, '混合型基金', 'R3', '平衡型、中等风险', '较低');
INSERT INTO `product` VALUES (17, '私募基金', 'R4', '进取型、中高风险', '较高');
INSERT INTO `product` VALUES (18, '信托产品', 'R4', '进取型、中高风险', '较高');
INSERT INTO `product` VALUES (19, '股票基金', 'R4', '进取型、中高风险', '较高');
INSERT INTO `product` VALUES (20, '指数基金', 'R4', '进取型、中高风险', '较高');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleid` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rolename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '系统管理员');
INSERT INTO `role` VALUES (2, '普通用户');

-- ----------------------------
-- Table structure for roleprivilieges
-- ----------------------------
DROP TABLE IF EXISTS `roleprivilieges`;
CREATE TABLE `roleprivilieges`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleID` int(0) NULL DEFAULT NULL COMMENT '角色维护表主键',
  `privilegeID` int(0) NULL DEFAULT NULL COMMENT '权限维护表主键',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `roleID`(`roleID`) USING BTREE,
  INDEX `privilegeID`(`privilegeID`) USING BTREE,
  CONSTRAINT `roleprivilieges_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `roleprivilieges_ibfk_2` FOREIGN KEY (`privilegeID`) REFERENCES `privilege` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 901 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roleprivilieges
-- ----------------------------
INSERT INTO `roleprivilieges` VALUES (881, 1, 65);
INSERT INTO `roleprivilieges` VALUES (882, 1, 63);
INSERT INTO `roleprivilieges` VALUES (883, 1, 75);
INSERT INTO `roleprivilieges` VALUES (884, 1, 76);
INSERT INTO `roleprivilieges` VALUES (885, 1, 77);
INSERT INTO `roleprivilieges` VALUES (886, 1, 78);
INSERT INTO `roleprivilieges` VALUES (887, 1, 67);
INSERT INTO `roleprivilieges` VALUES (889, 1, 70);
INSERT INTO `roleprivilieges` VALUES (890, 1, 71);
INSERT INTO `roleprivilieges` VALUES (891, 1, 62);
INSERT INTO `roleprivilieges` VALUES (892, 1, 64);
INSERT INTO `roleprivilieges` VALUES (893, 1, 66);
INSERT INTO `roleprivilieges` VALUES (895, 1, 69);
INSERT INTO `roleprivilieges` VALUES (896, 2, 65);
INSERT INTO `roleprivilieges` VALUES (897, 2, 63);
INSERT INTO `roleprivilieges` VALUES (898, 2, 67);
INSERT INTO `roleprivilieges` VALUES (899, 2, 62);
INSERT INTO `roleprivilieges` VALUES (900, 2, 66);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '支出');
INSERT INTO `type` VALUES (2, '收入');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `roleid` int(0) NOT NULL DEFAULT 3 COMMENT '角色编号',
  `houseid` int(0) NULL DEFAULT NULL COMMENT '所属家庭编号',
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `houseid`(`houseid`) USING BTREE,
  INDEX `roleid`(`roleid`) USING BTREE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`houseid`) REFERENCES `house` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '21232f297a57a5a743894ae4a801fc3', '管理员', 1, NULL, NULL);
INSERT INTO `user` VALUES (64, '1', 'c4ca4238a0b92382dcc509a6f75849b', '1', 2, 28, NULL);

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 120.77.213.16:3306
 Source Schema         : mayi

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 01/03/2019 13:13:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for citytable
-- ----------------------------
DROP TABLE IF EXISTS `citytable`;
CREATE TABLE `citytable`  (
  `City_id` int(10) NOT NULL AUTO_INCREMENT,
  `Ctiy_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`City_id`) USING BTREE,
  UNIQUE INDEX `city`(`City_id`, `Ctiy_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of citytable
-- ----------------------------
INSERT INTO `citytable` VALUES (1, '成都');
INSERT INTO `citytable` VALUES (2, '重庆');
INSERT INTO `citytable` VALUES (3, '上海');
INSERT INTO `citytable` VALUES (4, '三亚');
INSERT INTO `citytable` VALUES (5, '青岛');
INSERT INTO `citytable` VALUES (6, '广州');
INSERT INTO `citytable` VALUES (7, '杭州');
INSERT INTO `citytable` VALUES (8, '大连');
INSERT INTO `citytable` VALUES (9, '苏州');
INSERT INTO `citytable` VALUES (10, '西安');
INSERT INTO `citytable` VALUES (11, '都江堰');
INSERT INTO `citytable` VALUES (12, '峨眉山');
INSERT INTO `citytable` VALUES (13, '鞍山');
INSERT INTO `citytable` VALUES (14, '安阳');
INSERT INTO `citytable` VALUES (15, '澳门');
INSERT INTO `citytable` VALUES (16, '深圳');
INSERT INTO `citytable` VALUES (17, '威海');
INSERT INTO `citytable` VALUES (18, '安徽');
INSERT INTO `citytable` VALUES (19, '哈尔滨');
INSERT INTO `citytable` VALUES (20, '昆明');
INSERT INTO `citytable` VALUES (21, '香港');

-- ----------------------------
-- Table structure for commenttable
-- ----------------------------
DROP TABLE IF EXISTS `commenttable`;
CREATE TABLE `commenttable`  (
  `Comment_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `house_id` int(10) NOT NULL COMMENT '房屋的id',
  `house_comment_user_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论的用户',
  `house_comment_Text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论的内容',
  `house_comment_Score` float(5, 1) NOT NULL COMMENT '评论分数',
  `house_create_time` date NOT NULL COMMENT '评论的时间 2019-01-01 ',
  `order_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commenttable
-- ----------------------------
INSERT INTO `commenttable` VALUES (1, 1, '2', '房间整洁干净，十分安静，相比于住酒店更温馨自在，没有压抑的感觉。', 4.5, '2019-01-23', NULL);
INSERT INTO `commenttable` VALUES (2, 1, '4', '房间又干净又整洁，设施齐全，很温馨的。尤其要赞的房东姐姐人特好，客气礼貌热情，提前烧好澡水，让人在寒冷的天气里心暧暖的。网络、电视都很细心地贴着使用说明。以后一定还会来住，谢谢房东姐姐了。', 4.2, '2019-01-24', NULL);
INSERT INTO `commenttable` VALUES (3, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '这个房间真是太好啦', 3.5, '2019-01-26', 13);

-- ----------------------------
-- Table structure for house_datatable
-- ----------------------------
DROP TABLE IF EXISTS `house_datatable`;
CREATE TABLE `house_datatable`  (
  `house_data_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '已经预定时间id',
  `houser_id` int(10) NOT NULL COMMENT '被预定对应房间',
  `houser_data` date NOT NULL COMMENT '预定日期 2019-01-02',
  PRIMARY KEY (`house_data_id`) USING BTREE,
  UNIQUE INDEX `houser_data`(`houser_data`, `house_data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_datatable
-- ----------------------------
INSERT INTO `house_datatable` VALUES (1, 1, '2019-01-24');
INSERT INTO `house_datatable` VALUES (2, 1, '2019-01-25');
INSERT INTO `house_datatable` VALUES (3, 2, '2019-01-24');
INSERT INTO `house_datatable` VALUES (4, 2, '2019-01-25');
INSERT INTO `house_datatable` VALUES (5, 1, '2019-02-07');
INSERT INTO `house_datatable` VALUES (6, 1, '2019-02-08');
INSERT INTO `house_datatable` VALUES (19, 1, '2019-01-29');
INSERT INTO `house_datatable` VALUES (20, 1, '2019-01-30');
INSERT INTO `house_datatable` VALUES (21, 2, '2019-01-29');
INSERT INTO `house_datatable` VALUES (22, 2, '2019-01-30');
INSERT INTO `house_datatable` VALUES (23, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (24, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (25, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (26, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (27, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (28, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (29, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (30, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (31, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (32, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (33, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (34, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (35, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (36, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (37, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (38, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (39, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (40, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (41, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (42, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (43, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (44, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (45, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (46, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (47, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (48, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (49, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (50, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (51, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (52, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (53, 1, '2019-01-22');
INSERT INTO `house_datatable` VALUES (54, 1, '2019-01-23');
INSERT INTO `house_datatable` VALUES (55, 1, '2019-01-24');
INSERT INTO `house_datatable` VALUES (56, 1, '2019-01-25');
INSERT INTO `house_datatable` VALUES (57, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (58, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (59, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (60, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (61, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (62, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (63, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (64, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (65, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (66, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (67, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (68, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (69, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (70, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (71, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (72, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (73, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (74, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (75, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (76, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (77, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (78, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (79, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (80, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (81, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (82, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (83, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (84, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (85, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (86, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (87, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (88, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (89, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (90, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (91, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (92, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (93, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (94, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (95, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (96, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (97, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (98, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (99, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (100, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (101, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (102, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (103, 1, '2019-01-20');
INSERT INTO `house_datatable` VALUES (104, 1, '2019-01-21');
INSERT INTO `house_datatable` VALUES (105, 1, '2019-02-21');
INSERT INTO `house_datatable` VALUES (106, 1, '2019-03-08');
INSERT INTO `house_datatable` VALUES (107, 1, '2019-03-09');
INSERT INTO `house_datatable` VALUES (108, 1, '2019-03-10');
INSERT INTO `house_datatable` VALUES (109, 1, '2019-03-11');
INSERT INTO `house_datatable` VALUES (110, 1, '2019-03-12');
INSERT INTO `house_datatable` VALUES (111, 1, '2019-03-13');
INSERT INTO `house_datatable` VALUES (112, 1, '2019-03-14');
INSERT INTO `house_datatable` VALUES (113, 1, '2019-03-13');
INSERT INTO `house_datatable` VALUES (114, 1, '2019-03-14');
INSERT INTO `house_datatable` VALUES (115, 1, '2019-02-19');
INSERT INTO `house_datatable` VALUES (116, 1, '2019-02-18');
INSERT INTO `house_datatable` VALUES (117, 1, '2019-02-19');
INSERT INTO `house_datatable` VALUES (118, 1, '2019-02-25');
INSERT INTO `house_datatable` VALUES (119, 1, '2019-03-01');
INSERT INTO `house_datatable` VALUES (120, 1, '2019-04-03');
INSERT INTO `house_datatable` VALUES (121, 1, '2019-02-18');
INSERT INTO `house_datatable` VALUES (122, 1, '2019-02-19');
INSERT INTO `house_datatable` VALUES (123, 1, '2019-02-07');
INSERT INTO `house_datatable` VALUES (124, 1, '2019-02-10');
INSERT INTO `house_datatable` VALUES (125, 1, '2019-02-11');
INSERT INTO `house_datatable` VALUES (126, 1, '2019-02-12');
INSERT INTO `house_datatable` VALUES (127, 1, '2019-02-13');
INSERT INTO `house_datatable` VALUES (128, 1, '2019-02-03');
INSERT INTO `house_datatable` VALUES (129, 1, '2019-02-05');
INSERT INTO `house_datatable` VALUES (130, 1, '2019-02-06');
INSERT INTO `house_datatable` VALUES (131, 1, '2019-02-26');
INSERT INTO `house_datatable` VALUES (132, 1, '2019-02-27');

-- ----------------------------
-- Table structure for house_describe
-- ----------------------------
DROP TABLE IF EXISTS `house_describe`;
CREATE TABLE `house_describe`  (
  `describe_id` int(10) NOT NULL AUTO_INCREMENT,
  `Houser_id` int(10) NOT NULL,
  `describe_Text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`describe_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_describe
-- ----------------------------
INSERT INTO `house_describe` VALUES (1, 1, '☆ 小屋时尚婚房简约设计，绿色环保，温馨舒适。配有智能密码门锁，方便您24小时随时出入。房子是一套标准公寓居室。室内有30多平米，朝东是大三米五的飘窗。阳台有全自动洗衣机，好太太晾衣架哈！可以观看漂亮的奥林匹克公园，奥运五环塔，鸟巢水立方夜景！室内分为动静两个区间。静区是一个单人床和一张全新全友牌家私双人床，加宽床1.8米，床头柜及大衣柜。动区是客厅，有一张时尚宜家双人沙发和茶几及48英寸夏普电视组成。厨房共有10平米，餐厅有餐桌椅子。开放式厨房，配有天然气双灶，冰箱及蒸锅、炒锅和炖锅等。油、盐、酱、醋等调味料，菜板刀具一应俱全，您可以大展厨艺，食材自备，只是要求在您使用后即时清理厨房卫生，楼下就是物美超市，购物便利。卫生间是干湿分离，非常卫生哈！有史密斯热水器可以为您提供热水使用哈。坐式马桶每次都有消毒液清洗，健康第一哈！\r\n品牌洗发水、沐浴液、洗手液等，都是免费提供哈！一次性洗涮牙膏免费提供，为了您的健康毛巾自备哦！配有免费网wifi、液晶电视、600万正版片源，高清网络电影日夜可随时观看。床上用品有被子和被套枕头等，都是全新名牌，可以让你舒舒服服的，美美的睡天亮。\r\n\r\n☆ 小屋在华源·冠军城高档小区内，紧邻亚奥国际大酒店东。地铁15号线北沙滩站东200米。西临京昌高速路，东望奥运会主赛场，北靠奥运村东西主干路——清华东路，距奥运主赛场800米，步行10分钟。北沙滩桥东南角，北四环和五环之间，离地铁15号线北沙滩站200米，三分钟路程、距地铁8号线奥林匹克公园1100米，另外您可以自由换乘地铁4号线、5号线、10号线，非常方便。处于亚奥商圈。N多条公交线路510、466、81、607、594、特13、特15、913、425、328、379、419、484、518、628、695、751、839、836、949、307、625、407、345、379、运通110，为您的出行带来极大的方便。\r\n您想去北大、清华、圆明园、颐和园、在小区外北沙滩桥东站可乘594路公交车直达。去天安门、故宫、乘地铁非常方便快捷。  	 \r\n☆ 小区安静整洁，24小时保安，是2008年的商品住房，房间位于高层，有电梯，周边设施齐全，马路东南1000米就能到奥林匹克公园，附近有鸟巢、水立方、国家会议中心、中国科技馆、中科院地理所、心理所、遥感所，古动物博物馆、306医院、奥北中医院、中国音乐学院、对外经贸大学、中国音乐学院、北京联合大学、信息工程学院。\r\n小区楼下是潇湘楼，全聚德烤鸭店、庆丰包子铺、上岛咖啡、物美超市、附近有大鸭梨烤鸭、首航超市、、工商银行、华夏银行、浦发银行、招商银行、麦当劳、北辰购物中心、飘亮购物中心、旺市百利、第五大道、爱家家居等，往西两站地是林业大学、农业大学、矿业大学、地质石油大学、语言大学、北京科技大学，再往西就是五道口、北京大学、清华大学、中关村。');
INSERT INTO `house_describe` VALUES (2, 2, '☆ 小屋时尚婚房简约设计，绿色环保，温馨舒适。配有智能密码门锁，方便您24小时随时出入。房子是一套标准公寓居室。室内有30多平米，朝东是大三米五的飘窗。阳台有全自动洗衣机，好太太晾衣架哈！可以观看漂亮的奥林匹克公园，奥运五环塔，鸟巢水立方夜景！室内分为动静两个区间。静区是一个单人床和一张全新全友牌家私双人床，加宽床1.8米，床头柜及大衣柜。动区是客厅，有一张时尚宜家双人沙发和茶几及48英寸夏普电视组成。厨房共有10平米，餐厅有餐桌椅子。开放式厨房，配有天然气双灶，冰箱及蒸锅、炒锅和炖锅等。油、盐、酱、醋等调味料，菜板刀具一应俱全，您可以大展厨艺，食材自备，只是要求在您使用后即时清理厨房卫生，楼下就是物美超市，购物便利。卫生间是干湿分离，非常卫生哈！有史密斯热水器可以为您提供热水使用哈。坐式马桶每次都有消毒液清洗，健康第一哈！\r\n品牌洗发水、沐浴液、洗手液等，都是免费提供哈！一次性洗涮牙膏免费提供，为了您的健康毛巾自备哦！配有免费网wifi、液晶电视、600万正版片源，高清网络电影日夜可随时观看。床上用品有被子和被套枕头等，都是全新名牌，可以让你舒舒服服的，美美的睡天亮。\r\n\r\n☆ 小屋在华源·冠军城高档小区内，紧邻亚奥国际大酒店东。地铁15号线北沙滩站东200米。西临京昌高速路，东望奥运会主赛场，北靠奥运村东西主干路——清华东路，距奥运主赛场800米，步行10分钟。北沙滩桥东南角，北四环和五环之间，离地铁15号线北沙滩站200米，三分钟路程、距地铁8号线奥林匹克公园1100米，另外您可以自由换乘地铁4号线、5号线、10号线，非常方便。处于亚奥商圈。N多条公交线路510、466、81、607、594、特13、特15、913、425、328、379、419、484、518、628、695、751、839、836、949、307、625、407、345、379、运通110，为您的出行带来极大的方便。\r\n您想去北大、清华、圆明园、颐和园、在小区外北沙滩桥东站可乘594路公交车直达。去天安门、故宫、乘地铁非常方便快捷。  	 \r\n☆ 小区安静整洁，24小时保安，是2008年的商品住房，房间位于高层，有电梯，周边设施齐全，马路东南1000米就能到奥林匹克公园，附近有鸟巢、水立方、国家会议中心、中国科技馆、中科院地理所、心理所、遥感所，古动物博物馆、306医院、奥北中医院、中国音乐学院、对外经贸大学、中国音乐学院、北京联合大学、信息工程学院。\r\n小区楼下是潇湘楼，全聚德烤鸭店、庆丰包子铺、上岛咖啡、物美超市、附近有大鸭梨烤鸭、首航超市、、工商银行、华夏银行、浦发银行、招商银行、麦当劳、北辰购物中心、飘亮购物中心、旺市百利、第五大道、爱家家居等，往西两站地是林业大学、农业大学、矿业大学、地质石油大学、语言大学、北京科技大学，再往西就是五道口、北京大学、清华大学、中关村。');
INSERT INTO `house_describe` VALUES (3, 3, '☆ 小屋时尚婚房简约设计，绿色环保，温馨舒适。配有智能密码门锁，方便您24小时随时出入。房子是一套标准公寓居室。室内有30多平米，朝东是大三米五的飘窗。阳台有全自动洗衣机，好太太晾衣架哈！可以观看漂亮的奥林匹克公园，奥运五环塔，鸟巢水立方夜景！室内分为动静两个区间。静区是一个单人床和一张全新全友牌家私双人床，加宽床1.8米，床头柜及大衣柜。动区是客厅，有一张时尚宜家双人沙发和茶几及48英寸夏普电视组成。厨房共有10平米，餐厅有餐桌椅子。开放式厨房，配有天然气双灶，冰箱及蒸锅、炒锅和炖锅等。油、盐、酱、醋等调味料，菜板刀具一应俱全，您可以大展厨艺，食材自备，只是要求在您使用后即时清理厨房卫生，楼下就是物美超市，购物便利。卫生间是干湿分离，非常卫生哈！有史密斯热水器可以为您提供热水使用哈。坐式马桶每次都有消毒液清洗，健康第一哈！\r\n品牌洗发水、沐浴液、洗手液等，都是免费提供哈！一次性洗涮牙膏免费提供，为了您的健康毛巾自备哦！配有免费网wifi、液晶电视、600万正版片源，高清网络电影日夜可随时观看。床上用品有被子和被套枕头等，都是全新名牌，可以让你舒舒服服的，美美的睡天亮。\r\n\r\n☆ 小屋在华源·冠军城高档小区内，紧邻亚奥国际大酒店东。地铁15号线北沙滩站东200米。西临京昌高速路，东望奥运会主赛场，北靠奥运村东西主干路——清华东路，距奥运主赛场800米，步行10分钟。北沙滩桥东南角，北四环和五环之间，离地铁15号线北沙滩站200米，三分钟路程、距地铁8号线奥林匹克公园1100米，另外您可以自由换乘地铁4号线、5号线、10号线，非常方便。处于亚奥商圈。N多条公交线路510、466、81、607、594、特13、特15、913、425、328、379、419、484、518、628、695、751、839、836、949、307、625、407、345、379、运通110，为您的出行带来极大的方便。\r\n您想去北大、清华、圆明园、颐和园、在小区外北沙滩桥东站可乘594路公交车直达。去天安门、故宫、乘地铁非常方便快捷。  	 \r\n☆ 小区安静整洁，24小时保安，是2008年的商品住房，房间位于高层，有电梯，周边设施齐全，马路东南1000米就能到奥林匹克公园，附近有鸟巢、水立方、国家会议中心、中国科技馆、中科院地理所、心理所、遥感所，古动物博物馆、306医院、奥北中医院、中国音乐学院、对外经贸大学、中国音乐学院、北京联合大学、信息工程学院。\r\n小区楼下是潇湘楼，全聚德烤鸭店、庆丰包子铺、上岛咖啡、物美超市、附近有大鸭梨烤鸭、首航超市、、工商银行、华夏银行、浦发银行、招商银行、麦当劳、北辰购物中心、飘亮购物中心、旺市百利、第五大道、爱家家居等，往西两站地是林业大学、农业大学、矿业大学、地质石油大学、语言大学、北京科技大学，再往西就是五道口、北京大学、清华大学、中关村。');
INSERT INTO `house_describe` VALUES (4, 4, '☆ 小屋时尚婚房简约设计，绿色环保，温馨舒适。配有智能密码门锁，方便您24小时随时出入。房子是一套标准公寓居室。室内有30多平米，朝东是大三米五的飘窗。阳台有全自动洗衣机，好太太晾衣架哈！可以观看漂亮的奥林匹克公园，奥运五环塔，鸟巢水立方夜景！室内分为动静两个区间。静区是一个单人床和一张全新全友牌家私双人床，加宽床1.8米，床头柜及大衣柜。动区是客厅，有一张时尚宜家双人沙发和茶几及48英寸夏普电视组成。厨房共有10平米，餐厅有餐桌椅子。开放式厨房，配有天然气双灶，冰箱及蒸锅、炒锅和炖锅等。油、盐、酱、醋等调味料，菜板刀具一应俱全，您可以大展厨艺，食材自备，只是要求在您使用后即时清理厨房卫生，楼下就是物美超市，购物便利。卫生间是干湿分离，非常卫生哈！有史密斯热水器可以为您提供热水使用哈。坐式马桶每次都有消毒液清洗，健康第一哈！\r\n品牌洗发水、沐浴液、洗手液等，都是免费提供哈！一次性洗涮牙膏免费提供，为了您的健康毛巾自备哦！配有免费网wifi、液晶电视、600万正版片源，高清网络电影日夜可随时观看。床上用品有被子和被套枕头等，都是全新名牌，可以让你舒舒服服的，美美的睡天亮。\r\n\r\n☆ 小屋在华源·冠军城高档小区内，紧邻亚奥国际大酒店东。地铁15号线北沙滩站东200米。西临京昌高速路，东望奥运会主赛场，北靠奥运村东西主干路——清华东路，距奥运主赛场800米，步行10分钟。北沙滩桥东南角，北四环和五环之间，离地铁15号线北沙滩站200米，三分钟路程、距地铁8号线奥林匹克公园1100米，另外您可以自由换乘地铁4号线、5号线、10号线，非常方便。处于亚奥商圈。N多条公交线路510、466、81、607、594、特13、特15、913、425、328、379、419、484、518、628、695、751、839、836、949、307、625、407、345、379、运通110，为您的出行带来极大的方便。\r\n您想去北大、清华、圆明园、颐和园、在小区外北沙滩桥东站可乘594路公交车直达。去天安门、故宫、乘地铁非常方便快捷。  	 \r\n☆ 小区安静整洁，24小时保安，是2008年的商品住房，房间位于高层，有电梯，周边设施齐全，马路东南1000米就能到奥林匹克公园，附近有鸟巢、水立方、国家会议中心、中国科技馆、中科院地理所、心理所、遥感所，古动物博物馆、306医院、奥北中医院、中国音乐学院、对外经贸大学、中国音乐学院、北京联合大学、信息工程学院。\r\n小区楼下是潇湘楼，全聚德烤鸭店、庆丰包子铺、上岛咖啡、物美超市、附近有大鸭梨烤鸭、首航超市、、工商银行、华夏银行、浦发银行、招商银行、麦当劳、北辰购物中心、飘亮购物中心、旺市百利、第五大道、爱家家居等，往西两站地是林业大学、农业大学、矿业大学、地质石油大学、语言大学、北京科技大学，再往西就是五道口、北京大学、清华大学、中关村。');
INSERT INTO `house_describe` VALUES (5, 5, '☆ 小屋时尚婚房简约设计，绿色环保，温馨舒适。配有智能密码门锁，方便您24小时随时出入。房子是一套标准公寓居室。室内有30多平米，朝东是大三米五的飘窗。阳台有全自动洗衣机，好太太晾衣架哈！可以观看漂亮的奥林匹克公园，奥运五环塔，鸟巢水立方夜景！室内分为动静两个区间。静区是一个单人床和一张全新全友牌家私双人床，加宽床1.8米，床头柜及大衣柜。动区是客厅，有一张时尚宜家双人沙发和茶几及48英寸夏普电视组成。厨房共有10平米，餐厅有餐桌椅子。开放式厨房，配有天然气双灶，冰箱及蒸锅、炒锅和炖锅等。油、盐、酱、醋等调味料，菜板刀具一应俱全，您可以大展厨艺，食材自备，只是要求在您使用后即时清理厨房卫生，楼下就是物美超市，购物便利。卫生间是干湿分离，非常卫生哈！有史密斯热水器可以为您提供热水使用哈。坐式马桶每次都有消毒液清洗，健康第一哈！\r\n品牌洗发水、沐浴液、洗手液等，都是免费提供哈！一次性洗涮牙膏免费提供，为了您的健康毛巾自备哦！配有免费网wifi、液晶电视、600万正版片源，高清网络电影日夜可随时观看。床上用品有被子和被套枕头等，都是全新名牌，可以让你舒舒服服的，美美的睡天亮。\r\n\r\n☆ 小屋在华源·冠军城高档小区内，紧邻亚奥国际大酒店东。地铁15号线北沙滩站东200米。西临京昌高速路，东望奥运会主赛场，北靠奥运村东西主干路——清华东路，距奥运主赛场800米，步行10分钟。北沙滩桥东南角，北四环和五环之间，离地铁15号线北沙滩站200米，三分钟路程、距地铁8号线奥林匹克公园1100米，另外您可以自由换乘地铁4号线、5号线、10号线，非常方便。处于亚奥商圈。N多条公交线路510、466、81、607、594、特13、特15、913、425、328、379、419、484、518、628、695、751、839、836、949、307、625、407、345、379、运通110，为您的出行带来极大的方便。\r\n您想去北大、清华、圆明园、颐和园、在小区外北沙滩桥东站可乘594路公交车直达。去天安门、故宫、乘地铁非常方便快捷。  	 \r\n☆ 小区安静整洁，24小时保安，是2008年的商品住房，房间位于高层，有电梯，周边设施齐全，马路东南1000米就能到奥林匹克公园，附近有鸟巢、水立方、国家会议中心、中国科技馆、中科院地理所、心理所、遥感所，古动物博物馆、306医院、奥北中医院、中国音乐学院、对外经贸大学、中国音乐学院、北京联合大学、信息工程学院。\r\n小区楼下是潇湘楼，全聚德烤鸭店、庆丰包子铺、上岛咖啡、物美超市、附近有大鸭梨烤鸭、首航超市、、工商银行、华夏银行、浦发银行、招商银行、麦当劳、北辰购物中心、飘亮购物中心、旺市百利、第五大道、爱家家居等，往西两站地是林业大学、农业大学、矿业大学、地质石油大学、语言大学、北京科技大学，再往西就是五道口、北京大学、清华大学、中关村。');
INSERT INTO `house_describe` VALUES (6, 6, '☆ 小屋时尚婚房简约设计，绿色环保，温馨舒适。配有智能密码门锁，方便您24小时随时出入。房子是一套标准公寓居室。室内有30多平米，朝东是大三米五的飘窗。阳台有全自动洗衣机，好太太晾衣架哈！可以观看漂亮的奥林匹克公园，奥运五环塔，鸟巢水立方夜景！室内分为动静两个区间。静区是一个单人床和一张全新全友牌家私双人床，加宽床1.8米，床头柜及大衣柜。动区是客厅，有一张时尚宜家双人沙发和茶几及48英寸夏普电视组成。厨房共有10平米，餐厅有餐桌椅子。开放式厨房，配有天然气双灶，冰箱及蒸锅、炒锅和炖锅等。油、盐、酱、醋等调味料，菜板刀具一应俱全，您可以大展厨艺，食材自备，只是要求在您使用后即时清理厨房卫生，楼下就是物美超市，购物便利。卫生间是干湿分离，非常卫生哈！有史密斯热水器可以为您提供热水使用哈。坐式马桶每次都有消毒液清洗，健康第一哈！\r\n品牌洗发水、沐浴液、洗手液等，都是免费提供哈！一次性洗涮牙膏免费提供，为了您的健康毛巾自备哦！配有免费网wifi、液晶电视、600万正版片源，高清网络电影日夜可随时观看。床上用品有被子和被套枕头等，都是全新名牌，可以让你舒舒服服的，美美的睡天亮。\r\n\r\n☆ 小屋在华源·冠军城高档小区内，紧邻亚奥国际大酒店东。地铁15号线北沙滩站东200米。西临京昌高速路，东望奥运会主赛场，北靠奥运村东西主干路——清华东路，距奥运主赛场800米，步行10分钟。北沙滩桥东南角，北四环和五环之间，离地铁15号线北沙滩站200米，三分钟路程、距地铁8号线奥林匹克公园1100米，另外您可以自由换乘地铁4号线、5号线、10号线，非常方便。处于亚奥商圈。N多条公交线路510、466、81、607、594、特13、特15、913、425、328、379、419、484、518、628、695、751、839、836、949、307、625、407、345、379、运通110，为您的出行带来极大的方便。\r\n您想去北大、清华、圆明园、颐和园、在小区外北沙滩桥东站可乘594路公交车直达。去天安门、故宫、乘地铁非常方便快捷。  	 \r\n☆ 小区安静整洁，24小时保安，是2008年的商品住房，房间位于高层，有电梯，周边设施齐全，马路东南1000米就能到奥林匹克公园，附近有鸟巢、水立方、国家会议中心、中国科技馆、中科院地理所、心理所、遥感所，古动物博物馆、306医院、奥北中医院、中国音乐学院、对外经贸大学、中国音乐学院、北京联合大学、信息工程学院。\r\n小区楼下是潇湘楼，全聚德烤鸭店、庆丰包子铺、上岛咖啡、物美超市、附近有大鸭梨烤鸭、首航超市、、工商银行、华夏银行、浦发银行、招商银行、麦当劳、北辰购物中心、飘亮购物中心、旺市百利、第五大道、爱家家居等，往西两站地是林业大学、农业大学、矿业大学、地质石油大学、语言大学、北京科技大学，再往西就是五道口、北京大学、清华大学、中关村。');
INSERT INTO `house_describe` VALUES (7, 7, '☆ 电梯房， 两室一厅一卫一厨观光露台。房间宽敞明亮、南北通透、明厨明卫。两卧室放置双人床，可住4人；客厅沙发打开可做沙发床，可再增住2人；独立卫浴24小时热水，有洗衣机；厨房灶具餐具齐全，可自我烹饪；露台可茗茶休闲。\r\n\r\n☆ 小区门口有两个公交站，附近有两个地铁站。共十几条公交线路和两条地铁线路。打车也很方便。\r\n\r\n☆ 小区门口有超市、零售店、餐馆、银行网点、药店、多个公共公园。');
INSERT INTO `house_describe` VALUES (8, 8, '☆ 电梯房， 两室一厅一卫一厨观光露台。房间宽敞明亮、南北通透、明厨明卫。两卧室放置双人床，可住4人；客厅沙发打开可做沙发床，可再增住2人；独立卫浴24小时热水，有洗衣机；厨房灶具餐具齐全，可自我烹饪；露台可茗茶休闲。\r\n\r\n☆ 小区门口有两个公交站，附近有两个地铁站。共十几条公交线路和两条地铁线路。打车也很方便。\r\n\r\n☆ 小区门口有超市、零售店、餐馆、银行网点、药店、多个公共公园。');
INSERT INTO `house_describe` VALUES (9, 9, '☆ 电梯房， 两室一厅一卫一厨观光露台。房间宽敞明亮、南北通透、明厨明卫。两卧室放置双人床，可住4人；客厅沙发打开可做沙发床，可再增住2人；独立卫浴24小时热水，有洗衣机；厨房灶具餐具齐全，可自我烹饪；露台可茗茶休闲。\r\n\r\n☆ 小区门口有两个公交站，附近有两个地铁站。共十几条公交线路和两条地铁线路。打车也很方便。\r\n\r\n☆ 小区门口有超市、零售店、餐馆、银行网点、药店、多个公共公园。');
INSERT INTO `house_describe` VALUES (10, 10, '☆ 电梯房， 两室一厅一卫一厨观光露台。房间宽敞明亮、南北通透、明厨明卫。两卧室放置双人床，可住4人；客厅沙发打开可做沙发床，可再增住2人；独立卫浴24小时热水，有洗衣机；厨房灶具餐具齐全，可自我烹饪；露台可茗茶休闲。\r\n\r\n☆ 小区门口有两个公交站，附近有两个地铁站。共十几条公交线路和两条地铁线路。打车也很方便。\r\n\r\n☆ 小区门口有超市、零售店、餐馆、银行网点、药店、多个公共公园。');
INSERT INTO `house_describe` VALUES (11, 11, '☆ 电梯房， 两室一厅一卫一厨观光露台。房间宽敞明亮、南北通透、明厨明卫。两卧室放置双人床，可住4人；客厅沙发打开可做沙发床，可再增住2人；独立卫浴24小时热水，有洗衣机；厨房灶具餐具齐全，可自我烹饪；露台可茗茶休闲。\r\n\r\n☆ 小区门口有两个公交站，附近有两个地铁站。共十几条公交线路和两条地铁线路。打车也很方便。\r\n\r\n');
INSERT INTO `house_describe` VALUES (12, 12, '☆ 电梯房， 两室一厅一卫一厨观光露台。房间宽敞明亮、南北通透、明厨明卫。两卧室放置双人床，可住4人；客厅沙发打开可做沙发床，可再增住2人；独立卫浴24小时热水，有洗衣机；厨房灶具餐具齐全，可自我烹饪；露台可茗茶休闲。\r\n\r\n☆ 小区门口有两个公交站，附近有两个地铁站。共十几条公交线路和两条地铁线路。打车也很方便。\r\n\r\n');
INSERT INTO `house_describe` VALUES (13, 13, '☆ 电梯房， 两室一厅一卫一厨观光露台。房间宽敞明亮、南北通透、明厨明卫。两卧室放置双人床，可住4人；客厅沙发打开可做沙发床，可再增住2人；独立卫浴24小时热水，有洗衣机；厨房灶具餐具齐全，可自我烹饪；露台可茗茶休闲。\r\n\r\n☆ 小区门口有两个公交站，附近有两个地铁站。共十几条公交线路和两条地铁线路。打车也很方便。\r\n\r\n');
INSERT INTO `house_describe` VALUES (14, 14, '☆ 电梯房， 两室一厅一卫一厨观光露台。房间宽敞明亮、南北通透、明厨明卫。两卧室放置双人床，可住4人；客厅沙发打开可做沙发床，可再增住2人；独立卫浴24小时热水，有洗衣机；厨房灶具餐具齐全，可自我烹饪；露台可茗茶休闲。\r\n\r\n☆ 小区门口有两个公交站，附近有两个地铁站。共十几条公交线路和两条地铁线路。打车也很方便。\r\n\r\n');

-- ----------------------------
-- Table structure for house_img
-- ----------------------------
DROP TABLE IF EXISTS `house_img`;
CREATE TABLE `house_img`  (
  `h_img_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '图片自增id',
  `House_id` int(10) NOT NULL COMMENT '房屋的ID',
  `img_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`h_img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_img
-- ----------------------------
INSERT INTO `house_img` VALUES (1, 1, '1', '/house/1/1.jpg');
INSERT INTO `house_img` VALUES (2, 1, '1', '/house/1/2.jpg');
INSERT INTO `house_img` VALUES (3, 1, '1', '/house/1/3.jpg');
INSERT INTO `house_img` VALUES (4, 1, '1', '/house/1/4.jpg');
INSERT INTO `house_img` VALUES (5, 1, '1', '/house/1/5.jpg');
INSERT INTO `house_img` VALUES (6, 1, '1', '/house/1/6.jpg');
INSERT INTO `house_img` VALUES (7, 1, '1', '/house/1/7.jpg');
INSERT INTO `house_img` VALUES (8, 1, '1', '/house/1/8.jpg');
INSERT INTO `house_img` VALUES (9, 1, '1', '/house/1/9.jpg');
INSERT INTO `house_img` VALUES (10, 1, '1', '/house/1/10.jpg');
INSERT INTO `house_img` VALUES (11, 1, '1', '/house/1/11.jpg');
INSERT INTO `house_img` VALUES (12, 1, '1', '/house/1/12.jpg');
INSERT INTO `house_img` VALUES (13, 1, '1', '/house/1/13.jpg');
INSERT INTO `house_img` VALUES (14, 1, '1', '/house/1/14.jpg');
INSERT INTO `house_img` VALUES (15, 1, '1', '/house/1/16.jpg');
INSERT INTO `house_img` VALUES (16, 1, '1', '/house/1/17.jpg');
INSERT INTO `house_img` VALUES (17, 1, '1', '/house/1/18.jpg');
INSERT INTO `house_img` VALUES (18, 1, '1', '/house/1/19.jpg');
INSERT INTO `house_img` VALUES (19, 1, '1', '/house/1/20.jpg');
INSERT INTO `house_img` VALUES (20, 1, '1', '/house/1/15.jpg');
INSERT INTO `house_img` VALUES (21, 2, '2', '/house/2/1.jpg');
INSERT INTO `house_img` VALUES (22, 2, '2', '/house/2/2.jpg');
INSERT INTO `house_img` VALUES (23, 2, '2', '/house/2/3.jpg');
INSERT INTO `house_img` VALUES (24, 2, '2', '/house/2/4.jpg');
INSERT INTO `house_img` VALUES (25, 2, '2', '/house/2/5.jpg');
INSERT INTO `house_img` VALUES (26, 2, '2', '/house/2/6.jpg');
INSERT INTO `house_img` VALUES (27, 2, '2', '/house/2/7.jpg');
INSERT INTO `house_img` VALUES (28, 2, '2', '/house/2/8.jpg');
INSERT INTO `house_img` VALUES (29, 2, '2', '/house/2/9.jpg');
INSERT INTO `house_img` VALUES (30, 2, '2', '/house/2/10.jpg');
INSERT INTO `house_img` VALUES (31, 3, '3', '/house/3/1.jpg');
INSERT INTO `house_img` VALUES (32, 3, '3', '/house/3/2.jpg');
INSERT INTO `house_img` VALUES (33, 3, '3', '/house/3/3.jpg');
INSERT INTO `house_img` VALUES (34, 3, '3', '/house/3/4.jpg');
INSERT INTO `house_img` VALUES (35, 3, '3', '/house/3/5.jpg');
INSERT INTO `house_img` VALUES (36, 3, '3', '/house/3/6.jpg');
INSERT INTO `house_img` VALUES (37, 3, '3', '/house/3/7.jpg');
INSERT INTO `house_img` VALUES (38, 3, '3', '/house/3/8.jpg');
INSERT INTO `house_img` VALUES (39, 3, '3', '/house/3/9.jpg');
INSERT INTO `house_img` VALUES (40, 3, '3', '/house/3/10.jpg');
INSERT INTO `house_img` VALUES (41, 3, '3', '/house/3/11.jpg');
INSERT INTO `house_img` VALUES (42, 3, '3', '/house/3/12.jpg');
INSERT INTO `house_img` VALUES (43, 3, '3', '/house/3/13.jpg');
INSERT INTO `house_img` VALUES (44, 3, '3', '/house/3/14.jpg');
INSERT INTO `house_img` VALUES (45, 3, '3', '/house/3/15.jpg');
INSERT INTO `house_img` VALUES (46, 3, '3', '/house/3/16.jpg');
INSERT INTO `house_img` VALUES (47, 4, '3', '/house/4/1.jpg');
INSERT INTO `house_img` VALUES (48, 4, '3', '/house/4/2.jpg');
INSERT INTO `house_img` VALUES (49, 4, '3', '/house/4/3.jpg');
INSERT INTO `house_img` VALUES (50, 4, '3', '/house/4/4.jpg');
INSERT INTO `house_img` VALUES (51, 4, '3', '/house/4/5.jpg');
INSERT INTO `house_img` VALUES (52, 4, '3', '/house/4/6.jpg');
INSERT INTO `house_img` VALUES (53, 4, '3', '/house/4/7.jpg');
INSERT INTO `house_img` VALUES (54, 4, '3', '/house/4/8.jpg');
INSERT INTO `house_img` VALUES (55, 4, '3', '/house/4/9.jpg');
INSERT INTO `house_img` VALUES (56, 4, '3', '/house/4/10.jpg');
INSERT INTO `house_img` VALUES (57, 5, '3', '/house/5/1.jpg');
INSERT INTO `house_img` VALUES (58, 5, '3', '/house/5/2.jpg');
INSERT INTO `house_img` VALUES (59, 5, '3', '/house/5/3.jpg');
INSERT INTO `house_img` VALUES (60, 5, '3', '/house/5/4.jpg');
INSERT INTO `house_img` VALUES (61, 5, '3', '/house/5/5.jpg');
INSERT INTO `house_img` VALUES (62, 5, '3', '/house/5/6.jpg');
INSERT INTO `house_img` VALUES (63, 5, '3', '/house/5/7.jpg');
INSERT INTO `house_img` VALUES (64, 5, '3', '/house/5/8.jpg');
INSERT INTO `house_img` VALUES (65, 5, '3', '/house/5/9.jpg');
INSERT INTO `house_img` VALUES (66, 5, '3', '/house/5/10.jpg');
INSERT INTO `house_img` VALUES (67, 6, '3', '/house/6/1.jpg');
INSERT INTO `house_img` VALUES (68, 6, '3', '/house/6/2.jpg');
INSERT INTO `house_img` VALUES (69, 6, '3', '/house/6/3.jpg');
INSERT INTO `house_img` VALUES (70, 6, '3', '/house/6/4.jpg');
INSERT INTO `house_img` VALUES (71, 6, '3', '/house/6/5.jpg');
INSERT INTO `house_img` VALUES (72, 6, '3', '/house/6/6.jpg');
INSERT INTO `house_img` VALUES (73, 6, '3', '/house/6/7.jpg');
INSERT INTO `house_img` VALUES (74, 6, '3', '/house/6/8.jpg');
INSERT INTO `house_img` VALUES (75, 6, '3', '/house/6/9.jpg');
INSERT INTO `house_img` VALUES (76, 6, '3', '/house/6/10.jpg');
INSERT INTO `house_img` VALUES (77, 7, '3', '/house/7/1.jpg');
INSERT INTO `house_img` VALUES (78, 7, '3', '/house/7/2.jpg');
INSERT INTO `house_img` VALUES (79, 7, '3', '/house/7/3.jpg');
INSERT INTO `house_img` VALUES (80, 7, '3', '/house/7/4.jpg');
INSERT INTO `house_img` VALUES (81, 7, '3', '/house/7/5.jpg');
INSERT INTO `house_img` VALUES (82, 7, '3', '/house/7/6.jpg');
INSERT INTO `house_img` VALUES (83, 7, '3', '/house/7/7.jpg');
INSERT INTO `house_img` VALUES (84, 7, '3', '/house/7/8.jpg');
INSERT INTO `house_img` VALUES (85, 7, '3', '/house/7/9.jpg');
INSERT INTO `house_img` VALUES (86, 7, '3', '/house/7/10.jpg');
INSERT INTO `house_img` VALUES (87, 8, '3', '/house/8/1.jpg');
INSERT INTO `house_img` VALUES (88, 8, '3', '/house/8/2.jpg');
INSERT INTO `house_img` VALUES (89, 8, '3', '/house/8/3.jpg');
INSERT INTO `house_img` VALUES (90, 8, '3', '/house/8/4.jpg');
INSERT INTO `house_img` VALUES (91, 8, '3', '/house/8/5.jpg');
INSERT INTO `house_img` VALUES (92, 8, '3', '/house/8/6.jpg');
INSERT INTO `house_img` VALUES (93, 8, '3', '/house/8/7.jpg');
INSERT INTO `house_img` VALUES (94, 8, '3', '/house/8/8.jpg');
INSERT INTO `house_img` VALUES (95, 8, '3', '/house/8/9.jpg');
INSERT INTO `house_img` VALUES (96, 8, '3', '/house/8/10.jpg');
INSERT INTO `house_img` VALUES (97, 9, '3', '/house/9/1.jpg');
INSERT INTO `house_img` VALUES (98, 9, '3', '/house/9/2.jpg');
INSERT INTO `house_img` VALUES (99, 9, '3', '/house/9/3.jpg');
INSERT INTO `house_img` VALUES (100, 9, '3', '/house/9/4.jpg');
INSERT INTO `house_img` VALUES (101, 9, '3', '/house/9/5.jpg');
INSERT INTO `house_img` VALUES (102, 9, '3', '/house/9/6.jpg');
INSERT INTO `house_img` VALUES (103, 9, '3', '/house/9/7.jpg');
INSERT INTO `house_img` VALUES (104, 9, '3', '/house/9/8.jpg');
INSERT INTO `house_img` VALUES (105, 9, '3', '/house/9/9.jpg');
INSERT INTO `house_img` VALUES (106, 9, '3', '/house/9/10.jpg');
INSERT INTO `house_img` VALUES (107, 10, '3', '/house/10/1.jpg');
INSERT INTO `house_img` VALUES (108, 10, '3', '/house/10/2.jpg');
INSERT INTO `house_img` VALUES (109, 10, '3', '/house/10/3.jpg');
INSERT INTO `house_img` VALUES (110, 10, '3', '/house/10/4.jpg');
INSERT INTO `house_img` VALUES (111, 10, '3', '/house/10/5.jpg');
INSERT INTO `house_img` VALUES (112, 10, '3', '/house/10/6.jpg');
INSERT INTO `house_img` VALUES (113, 10, '3', '/house/10/7.jpg');
INSERT INTO `house_img` VALUES (114, 10, '3', '/house/10/8.jpg');
INSERT INTO `house_img` VALUES (115, 10, '3', '/house/10/9.jpg');
INSERT INTO `house_img` VALUES (116, 10, '3', '/house/10/10.jpg');
INSERT INTO `house_img` VALUES (117, 11, NULL, '/house/10/10.jpg');
INSERT INTO `house_img` VALUES (118, 11, NULL, '/house/11/1.jpg');
INSERT INTO `house_img` VALUES (119, 11, NULL, '/house/11/2.jpg');
INSERT INTO `house_img` VALUES (120, 11, NULL, '/house/11/3.jpg');
INSERT INTO `house_img` VALUES (121, 11, NULL, '/house/11/4.jpg');
INSERT INTO `house_img` VALUES (122, 11, NULL, '/house/11/5.jpg');
INSERT INTO `house_img` VALUES (123, 11, NULL, '/house/11/6.jpg');
INSERT INTO `house_img` VALUES (124, 11, NULL, '/house/11/7.jpg');
INSERT INTO `house_img` VALUES (125, 11, NULL, '/house/11/8.jpg');
INSERT INTO `house_img` VALUES (126, 11, NULL, '/house/11/9.jpg');
INSERT INTO `house_img` VALUES (127, 11, NULL, '/house/11/10.jpg');
INSERT INTO `house_img` VALUES (128, 12, NULL, '/house/12/1.jpg');
INSERT INTO `house_img` VALUES (129, 12, NULL, '/house/12/2.jpg');
INSERT INTO `house_img` VALUES (130, 12, NULL, '/house/12/3.jpg');
INSERT INTO `house_img` VALUES (131, 12, NULL, '/house/12/4.jpg');
INSERT INTO `house_img` VALUES (132, 12, NULL, '/house/12/5.jpg');
INSERT INTO `house_img` VALUES (133, 12, NULL, '/house/12/6.jpg');
INSERT INTO `house_img` VALUES (134, 12, NULL, '/house/12/7.jpg');
INSERT INTO `house_img` VALUES (135, 12, NULL, '/house/12/8.jpg');
INSERT INTO `house_img` VALUES (136, 12, NULL, '/house/12/9.jpg');
INSERT INTO `house_img` VALUES (137, 12, NULL, '/house/12/11.jpg');
INSERT INTO `house_img` VALUES (138, 12, NULL, '/house/12/12.jpg');
INSERT INTO `house_img` VALUES (139, 12, NULL, '/house/12/13.jpg');
INSERT INTO `house_img` VALUES (140, 12, NULL, '/house/12/14.jpg');
INSERT INTO `house_img` VALUES (141, 12, NULL, '/house/12/15.jpg');
INSERT INTO `house_img` VALUES (142, 12, NULL, '/house/12/10.jpg');
INSERT INTO `house_img` VALUES (143, 13, NULL, '/house/13/1.jpg');
INSERT INTO `house_img` VALUES (144, 13, NULL, '/house/13/2.jpg');
INSERT INTO `house_img` VALUES (145, 13, NULL, '/house/13/3.jpg');
INSERT INTO `house_img` VALUES (146, 13, NULL, '/house/13/4.jpg');
INSERT INTO `house_img` VALUES (147, 13, NULL, '/house/13/5.jpg');
INSERT INTO `house_img` VALUES (148, 13, NULL, '/house/13/6.jpg');
INSERT INTO `house_img` VALUES (149, 13, NULL, '/house/13/7.jpg');
INSERT INTO `house_img` VALUES (150, 13, NULL, '/house/13/8.jpg');
INSERT INTO `house_img` VALUES (151, 13, NULL, '/house/13/9.jpg');
INSERT INTO `house_img` VALUES (152, 13, NULL, '/house/13/10.jpg');
INSERT INTO `house_img` VALUES (153, 14, NULL, '/house/14/1.jpg');
INSERT INTO `house_img` VALUES (154, 14, NULL, '/house/14/2.jpg');
INSERT INTO `house_img` VALUES (155, 14, NULL, '/house/14/3.jpg');
INSERT INTO `house_img` VALUES (156, 14, NULL, '/house/14/4.jpg');
INSERT INTO `house_img` VALUES (157, 14, NULL, '/house/14/5.jpg');
INSERT INTO `house_img` VALUES (158, 14, NULL, '/house/14/6.jpg');
INSERT INTO `house_img` VALUES (159, 14, NULL, '/house/14/7.jpg');
INSERT INTO `house_img` VALUES (160, 14, NULL, '/house/14/8.jpg');
INSERT INTO `house_img` VALUES (161, 14, NULL, '/house/14/9.jpg');
INSERT INTO `house_img` VALUES (162, 14, NULL, '/house/14/10.jpg');

-- ----------------------------
-- Table structure for house_info
-- ----------------------------
DROP TABLE IF EXISTS `house_info`;
CREATE TABLE `house_info`  (
  `h_info_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '房屋详情id',
  `Houser_id` int(10) NOT NULL COMMENT '房屋id',
  `Houser_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋名称',
  `Houser_Type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '如  2室1厅 1厨2卫',
  `Houser_Bed_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大床(2m*2m) 1张',
  `Houser_Bed` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '如  宜住4人 3床',
  `Houser_latitude` double(255, 10) NOT NULL COMMENT '经度',
  `House_longitude` double(255, 10) NOT NULL COMMENT '维度',
  `House_Price` int(10) NOT NULL COMMENT '价格',
  `House_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋具体地址',
  `House_pf` double(2, 1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '房间评分',
  `House_square` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公寓信息',
  PRIMARY KEY (`h_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_info
-- ----------------------------
INSERT INTO `house_info` VALUES (0000000001, 1, '〔可月租〕鸟巢中科院国家会议中心音乐学院', '一室一卫', '大床(2m*2m) 1张', '宜住3人 2床', 31.2304324029, 121.4737919321, 368, '四川省成都市青羊区人民中路一段4号', 5.0, '公寓 60平米');
INSERT INTO `house_info` VALUES (0000000002, 2, '「工业风U+」春熙路•人民公园•宽窄巷•', '二室一厅', '大床(2m*1.8m) 1张', '宜住4人 2床', 30.5354853058, 104.0656575754, 642, '四川省成都市武侯区天府大道中段1388号', 5.0, '公寓 58平米');
INSERT INTO `house_info` VALUES (0000000003, 3, '春熙路太古里双地铁嘉年华主题大床房', '三室一厅', '大床(2m*1.9m) 1张', '宜住6人 3床', 30.6526134369, 104.0835070386, 500, '四川省成都市锦江区红星路三段1号IFS国金中心商场', 5.0, '公寓 90平米');
INSERT INTO `house_info` VALUES (0000000004, 4, '春熙路/太古里/双地铁嘉年华主题大床房', '一室一卫', '大床(2m*2m) 1张', '宜住2人 1床', 30.6540624958, 104.0811145082, 466, '四川省成都市锦江区红星路三段1号IFS国金中心商场', 4.0, '公寓 90平米');
INSERT INTO `house_info` VALUES (0000000005, 5, '成都春熙路天府广场地球村~舒适大床房', '二室一卫', '大床(2m*2m) 1张', '宜住4人 2床', 30.6557682457, 104.0853414496, 100, '四川省成都市锦江区大慈寺路30号大慈寺路28号院', 3.0, '公寓 60平米');
INSERT INTO `house_info` VALUES (0000000006, 6, '观音桥轻轨站旁寒舍公寓舒适大床房', '一室一卫', '大床(2m*2m) 1张', '宜住2人 1床', 29.5725307878, 106.5335553040, 288, '重庆市重庆市江北区世纪金街366号', 5.0, '公寓 75平米');
INSERT INTO `house_info` VALUES (0000000007, 7, '解放碑洪崖洞江景观赏地中海式温馨小屋', '二室二卫', '大床(2m*1.8m) 1张', '宜住4人 2床', 29.5613580275, 106.5538267363, 388, '重庆市重庆市渝中区人民路173号', 5.0, '公寓 80平米');
INSERT INTO `house_info` VALUES (0000000008, 8, '近五四广场聚会、亲子公寓可住6人', '三室二卫', '大床(2m*2m) 1张', '宜住6人 3床', 29.5586516417, 106.5464452971, 596, '重庆市重庆市渝中区正街9号', 5.0, '公寓 67平米');
INSERT INTO `house_info` VALUES (0000000009, 9, '赛特购物中心附近的温馨小家冬季促销', '二室一卫', '大床(2m*2m) 1张', '宜住4人 2床', 29.5585569587, 106.5685882370, 400, '重庆市重庆市渝中区北区路59号', 5.0, '公寓 60平米');
INSERT INTO `house_info` VALUES (0000000010, 10, '万达家电齐全（独门独户）拎包入住', '二室一卫', '大床(2m*1.8m) 1张', '宜住2人 2床', 29.5576610349, 106.5701439183, 300, '重庆市重庆市渝中区民生路252号', 5.0, '公寓 50平米');
INSERT INTO `house_info` VALUES (0000000011, 11, '成都小米度假短租公寓红星国际店豪华大床房', '1室1卫1厨', '大床(2×1.8米)1张', '宜住2人 1床', 30.5552205641, 104.5561389412, 396, '成都市锦江区庆云南街69号红星国际', 5.0, '公寓 80平米');
INSERT INTO `house_info` VALUES (0000000012, 12, '【七月】之一春熙地铁口太古里财富中心', '1室1厅1卫1厨', '大床(2×1.5米)1张', '宜住2人 1床', 30.6546840020, 104.0784444353, 455, '成都市锦江区青石桥南街-道路\r\n\r\n成都市锦江区青石桥南街-道路', 5.0, '公寓 52平米');
INSERT INTO `house_info` VALUES (0000000013, 13, '春熙路太古里双地铁嘉年华主题大床房', '1室 1卫 1厨', '大床(2×1.8米)1张', '宜住 2人 1床', 30.6556296555, 104.0795255753, 359, '成都市锦江区第一城大厦', 5.0, '51平米');
INSERT INTO `house_info` VALUES (0000000014, 14, '子时民宿-钠春熙路太古里北欧家庭影院', '1室 1卫', '大床(2×1.8米)1张', '宜住 2人 1床', 30.6623725202, 104.0855819441, 366, '成都市锦江区庆云西街69号红星国际4号楼', 5.0, '43平米');

-- ----------------------------
-- Table structure for housetable
-- ----------------------------
DROP TABLE IF EXISTS `housetable`;
CREATE TABLE `housetable`  (
  `House_id` int(10) NOT NULL AUTO_INCREMENT,
  `City_id` int(10) NOT NULL,
  PRIMARY KEY (`House_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of housetable
-- ----------------------------
INSERT INTO `housetable` VALUES (1, 1);
INSERT INTO `housetable` VALUES (2, 1);
INSERT INTO `housetable` VALUES (3, 1);
INSERT INTO `housetable` VALUES (4, 1);
INSERT INTO `housetable` VALUES (5, 1);
INSERT INTO `housetable` VALUES (6, 2);
INSERT INTO `housetable` VALUES (7, 2);
INSERT INTO `housetable` VALUES (8, 2);
INSERT INTO `housetable` VALUES (9, 2);
INSERT INTO `housetable` VALUES (10, 2);
INSERT INTO `housetable` VALUES (11, 1);
INSERT INTO `housetable` VALUES (12, 1);
INSERT INTO `housetable` VALUES (13, 1);
INSERT INTO `housetable` VALUES (14, 1);

-- ----------------------------
-- Table structure for money
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money`  (
  `moneyid` int(10) NOT NULL AUTO_INCREMENT,
  `user_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `moneyCount` int(5) NOT NULL DEFAULT 10000 COMMENT '用户的余额',
  PRIMARY KEY (`moneyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES (1, '1', 10000);
INSERT INTO `money` VALUES (2, '2', 10000);
INSERT INTO `money` VALUES (3, '3', 10000);
INSERT INTO `money` VALUES (4, '4', 10000);
INSERT INTO `money` VALUES (5, '5', 10000);
INSERT INTO `money` VALUES (6, '6', 10000);
INSERT INTO `money` VALUES (7, '7', 10000);
INSERT INTO `money` VALUES (8, '8', 10000);
INSERT INTO `money` VALUES (9, '9', 10000);
INSERT INTO `money` VALUES (10, '10', 10000);
INSERT INTO `money` VALUES (11, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', 3480);

-- ----------------------------
-- Table structure for order_table
-- ----------------------------
DROP TABLE IF EXISTS `order_table`;
CREATE TABLE `order_table`  (
  `order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `house_id` int(10) NOT NULL COMMENT '被预定的id',
  `user_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预定人id',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人姓名',
  `contact_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人电话',
  `check_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入住人姓名',
  `check_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入住人身份证',
  `order_createTime` datetime(0) NOT NULL COMMENT '订单创建时间',
  `check_time` date NOT NULL COMMENT '入住时间',
  `outCheck_time` date NOT NULL COMMENT '离店时间',
  `order_state` int(1) NOT NULL DEFAULT 0 COMMENT '订单状态 1为成功 0为 代付款',
  `check_count` int(1) NOT NULL COMMENT '入住人数',
  `Price` decimal(10, 2) NOT NULL COMMENT '价格',
  `comments` int(1) NOT NULL DEFAULT 0 COMMENT '订单是否评论 0 未评论 1已经评论',
  `days` int(3) NULL DEFAULT NULL COMMENT '入住天数',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_table
-- ----------------------------
INSERT INTO `order_table` VALUES (13, 2, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', 'diaoxin', '15351392023', 'diaoxin', '513902199612124879', '2019-01-24 18:41:58', '2019-01-24', '2019-01-26', 0, 3, 200.00, 1, 2);
INSERT INTO `order_table` VALUES (14, 3, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', 'diaoxin', '15351392023', 'diaoxin', '513902199612124879', '2019-01-24 18:43:13', '2019-01-24', '2019-01-26', 0, 3, 200.00, 0, 2);
INSERT INTO `order_table` VALUES (30, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '510626199611154250', '2019-01-26 10:31:51', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (31, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '510626199611154250', '2019-01-26 10:31:53', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (32, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '5106261996111542', '2019-01-26 10:32:24', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (33, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '510626199611154250', '2019-01-26 10:33:46', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (34, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '51062619961115425', '2019-01-26 10:33:59', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (35, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '510626199611542504', '2019-01-26 10:34:13', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (36, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '地魁', '15284848777', '刘家杰', '510626199611145877', '2019-01-26 10:35:03', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (37, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '出跟', '15282828845', '丢丢', '510626199644444444', '2019-01-26 10:37:40', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (38, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282884545', '几个', '810643878434840754', '2019-01-26 10:38:51', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (39, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '8106751042487X6444', '2019-01-26 10:44:47', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (40, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '六里桥', '15284845487', '刘家杰', '154249757248487777', '2019-01-26 11:50:43', '2019-01-23', '2019-01-24', 0, 5, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (41, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '510626199611154250', '2019-01-26 11:52:01', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (42, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '510626199611154250', '2019-01-26 11:53:08', '2019-01-23', '2019-01-24', 1, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (43, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '丢丢', '51064349787548777X', '2019-01-26 15:04:39', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (44, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '丢丢', '51064349787548777X', '2019-01-26 15:06:21', '2019-01-23', '2019-01-24', 0, 1, 200.00, 0, 1);
INSERT INTO `order_table` VALUES (45, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '丢丢', '15508383923', '丢丢', '510626196611154250', '2019-01-27 09:10:27', '2019-01-20', '2019-01-26', 1, 6, 200.00, 0, 6);
INSERT INTO `order_table` VALUES (46, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '溜了溜了', '15285784546', '今年', '512804664846467877', '2019-01-27 09:37:00', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (47, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '510626199611154250', '2019-01-27 09:40:11', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (48, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '给你', '15282828845', '你提', '510643484348794678', '2019-01-27 09:41:16', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (49, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '丢丢', '510626199611542503', '2019-01-27 09:43:43', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (50, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '就几件', '13487218787', '地理', '451218454077845787', '2019-01-27 09:45:04', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (51, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '就几件', '15282828484', '名额', '510626199612454872', '2019-01-27 09:46:33', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (52, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '李林', '510734348457678707', '2019-01-27 09:48:06', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (53, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '拜拜', '15282828845', '就该', '510626199645184278', '2019-01-27 09:49:20', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (54, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '哈哈哈', '15284573487', '呵呵', '152187548784678787', '2019-01-27 09:50:27', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (55, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '立体感', '15248424872', '就够了', '518707348457840757', '2019-01-27 09:59:15', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (56, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '就几件', '15284548754', '丢丢', '510642497348757877', '2019-01-27 10:01:58', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (57, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '就几件', '15284', '丢丢', '510642497348757877', '2019-01-27 10:03:08', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (58, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '你得', '510626194946194978', '2019-01-27 10:07:06', '2019-01-20', '2019-01-22', 0, 11, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (59, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '你得', '510626194946194978', '2019-01-27 10:07:17', '2019-01-20', '2019-01-22', 0, 11, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (60, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '你得', '510626194946194978', '2019-01-27 10:07:25', '2019-01-20', '2019-01-22', 0, 11, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (61, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '就够了', '110', '您', '1', '2019-01-27 10:09:16', '2019-01-20', '2019-01-22', 0, 2, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (62, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '就够了', '15282828845', '您', '1', '2019-01-27 10:09:26', '2019-01-20', '2019-01-22', 0, 2, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (63, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '就够了', '15282828845', '您跟', '510626199611154250', '2019-01-27 10:09:38', '2019-01-20', '2019-01-22', 0, 2, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (64, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '就够了', '15282828845', '好久', '510626199611154250', '2019-01-27 10:10:46', '2019-01-20', '2019-01-22', 0, 11, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (65, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '就够了', '15282828845', '好久', '510626199611154250', '2019-01-27 10:10:56', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (66, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828445', '溜了', '510626199611545500', '2019-01-27 10:17:39', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (67, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '看看', '15282828845', '就扣', '510626199611542500', '2019-01-27 10:19:04', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (68, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '刘家杰', '15282828845', '刘家杰', '351062619464578704', '2019-01-27 10:40:09', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (69, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '溜了', '15282828888', '明跟', '510973782461978724', '2019-01-27 15:43:56', '2019-01-20', '2019-01-22', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (70, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '打地鼠多', '18681729855', '搜索', '511018825555555', '2019-01-29 10:18:26', '2019-02-21', '2019-02-22', 1, 2, 160.00, 0, 1);
INSERT INTO `order_table` VALUES (71, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '何艳', '18302829295', '何艳', '51162319970702396X', '2019-01-29 10:36:36', '2019-03-08', '2019-03-15', 1, 3, 160.00, 0, 7);
INSERT INTO `order_table` VALUES (72, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '何艳', '18302829295', '何艳', '51162319970702396X', '2019-01-29 10:40:56', '2019-03-13', '2019-03-15', 1, 2, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (73, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '何艳', '18302829295', '何艳', '51162319970702396X', '2019-01-29 10:43:15', '2019-02-19', '2019-02-20', 1, 2, 160.00, 0, 1);
INSERT INTO `order_table` VALUES (74, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '何艳', '18302829295', '何艳', '51162319970702396X', '2019-01-29 10:46:16', '2019-02-18', '2019-02-20', 0, 1, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (75, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '何艳', '18302829295', '何艳', '51162319970702396X', '2019-01-29 10:47:36', '2019-02-25', '2019-02-26', 1, 1, 160.00, 0, 1);
INSERT INTO `order_table` VALUES (76, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '夏雨', '13547589870', '夏雨', '51178919970702396X', '2019-01-29 10:50:11', '2019-03-01', '2019-03-02', 0, 2, 160.00, 0, 1);
INSERT INTO `order_table` VALUES (77, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '夏雨', '13547898290', '夏雨', '51162319970702396X', '2019-01-29 10:51:42', '2019-04-03', '2019-04-04', 0, 2, 160.00, 0, 1);
INSERT INTO `order_table` VALUES (78, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '夏雨', '13574158960', '夏雨', '51162319970702396X', '2019-01-29 10:52:46', '2019-02-18', '2019-02-20', 1, 2, 160.00, 0, 2);
INSERT INTO `order_table` VALUES (79, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '夏雨', '13578569820', '夏雨', '511645199782023965', '2019-01-29 10:54:08', '2019-02-07', '2019-02-08', 1, 2, 160.00, 0, 1);
INSERT INTO `order_table` VALUES (80, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '夏雨', '18574953269', '夏雨', '544649799512583695', '2019-01-29 10:55:53', '2019-02-10', '2019-02-14', 1, 3, 160.00, 0, 4);
INSERT INTO `order_table` VALUES (81, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '夏雨', '15789654896', '夏雨', '51162319970702396X', '2019-01-29 12:05:27', '2019-02-03', '2019-02-04', 1, 2, 160.00, 0, 1);
INSERT INTO `order_table` VALUES (82, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '夏雨', '14785296874', '夏雨', '511658977412589635', '2019-01-29 12:58:25', '2019-02-05', '2019-02-07', 1, 1, 642.00, 0, 2);
INSERT INTO `order_table` VALUES (83, 1, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', '在这种', '18181755842', '近些年', '510181199820655555', '2019-01-29 14:22:26', '2019-02-26', '2019-02-28', 1, 2, 368.00, 0, 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `users_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户openid',
  `avatarUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户城市',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `languages` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`users_id`) USING BTREE,
  INDEX `openid`(`users_id`, `user_openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1', '/images/1.jpg', 'chengdu', 'China', 'zh_CN', '我是房东1', 'Sichuan', '1');
INSERT INTO `users` VALUES (2, '2', '/images/2.jpg', 'chengdu', 'China', 'zh_CN', '我是房东2', 'Sichuan', '1');
INSERT INTO `users` VALUES (3, '3', '/images/3.jpg', 'chengdu', 'China', 'zh_CN', '我是房东3', 'Sichuan', '1');
INSERT INTO `users` VALUES (4, '4', '/images/4.jpg', 'chengdu', 'China', 'zh_CN', '我是房东4', 'Sichuan', '1');
INSERT INTO `users` VALUES (5, '5', '/images/5.jpg', 'chengdu', 'China', 'zh_CN', '我是房东5', 'Sichuan', '1');
INSERT INTO `users` VALUES (6, '6', '/images/6.jpg', 'chengdu', 'China', 'zh_CN', '我是房东6', 'Sichuan', '1');
INSERT INTO `users` VALUES (7, '7', '/images/7.jpg', 'chengdu', 'China', 'zh_CN', '我是房东7', 'Sichuan', '1');
INSERT INTO `users` VALUES (8, '8', '/images/8.jpg', 'chengdu', 'China', 'zh_CN', '我是房东8', 'Sichuan', '1');
INSERT INTO `users` VALUES (9, '9', '/images/9.jpg', 'chengdu', 'China', 'zh_CN', '我是房东9', 'Sichuan', '1');
INSERT INTO `users` VALUES (10, '10', '/images/10.jpg', 'chengdu', 'China', 'zh_CN', '我是房东10', 'Sichuan', '1');
INSERT INTO `users` VALUES (13, 'ohLPu0NtSmmezR1oTWAtM4dq5I-4', 'https://wx.qlogo.cn/mmopen/vi_32/mHPKoxg87FCpRIHOobVAQoWkytibDZiaicx0osiaGa1YbZfCQfWGnN0aHxHy5FrAcvqqVNicbqPErxbUNicA0AsY74tg/132', 'Ziyang', 'China', NULL, '我烦得很', 'Sichuan', '1');

-- ----------------------------
-- Table structure for users_house_rp
-- ----------------------------
DROP TABLE IF EXISTS `users_house_rp`;
CREATE TABLE `users_house_rp`  (
  `u_h_rp_id` int(10) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) NOT NULL COMMENT '用户id',
  `House_id` int(10) NOT NULL COMMENT '房屋id',
  PRIMARY KEY (`u_h_rp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_house_rp
-- ----------------------------
INSERT INTO `users_house_rp` VALUES (1, 1, 1);
INSERT INTO `users_house_rp` VALUES (2, 2, 2);
INSERT INTO `users_house_rp` VALUES (3, 1, 3);
INSERT INTO `users_house_rp` VALUES (4, 1, 4);
INSERT INTO `users_house_rp` VALUES (5, 2, 5);
INSERT INTO `users_house_rp` VALUES (6, 2, 6);
INSERT INTO `users_house_rp` VALUES (7, 3, 7);
INSERT INTO `users_house_rp` VALUES (8, 3, 8);
INSERT INTO `users_house_rp` VALUES (9, 4, 9);
INSERT INTO `users_house_rp` VALUES (10, 5, 10);
INSERT INTO `users_house_rp` VALUES (11, 1, 11);
INSERT INTO `users_house_rp` VALUES (12, 6, 12);
INSERT INTO `users_house_rp` VALUES (13, 4, 13);
INSERT INTO `users_house_rp` VALUES (14, 4, 14);

SET FOREIGN_KEY_CHECKS = 1;

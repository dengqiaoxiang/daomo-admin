/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : screen

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 04/05/2021 18:14:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_agent_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_user`;
CREATE TABLE `tb_agent_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '代理ID',
  `merid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户id',
  `total_commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '历史总佣金',
  `commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '当前佣金',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '地址',
  `rebate` smallint(4) NOT NULL DEFAULT 0 COMMENT '返佣比例',
  `level_rebate` smallint(4) NOT NULL DEFAULT 0 COMMENT '下级返佣比例',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否通过',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_agent_user
-- ----------------------------

-- ----------------------------
-- Table structure for tb_mall_cate
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_cate`;
CREATE TABLE `tb_mall_cate`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_mall_cate
-- ----------------------------
INSERT INTO `tb_mall_cate` VALUES (9, '手机', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', 0, 1, '', 1589440437, 1589440437, NULL);

-- ----------------------------
-- Table structure for tb_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_goods`;
CREATE TABLE `tb_mall_goods`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品logo',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品图片 以 | 做分割符号',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `market_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '市场价',
  `discount_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '折扣价',
  `sales` int(11) NULL DEFAULT 0 COMMENT '销量',
  `virtual_sales` int(11) NULL DEFAULT 0 COMMENT '虚拟销量',
  `stock` int(11) NULL DEFAULT 0 COMMENT '库存',
  `total_stock` int(11) NULL DEFAULT 0 COMMENT '总库存',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品列表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_mall_goods
-- ----------------------------
INSERT INTO `tb_mall_goods` VALUES (8, 10, '落地-风扇', 'http://admin.host/upload/20200514/a0f7fe9637abd219f7e93ceb2820df9b.jpg', 'http://admin.host/upload/20200514/95496713918290f6315ea3f87efa6bf2.jpg|http://admin.host/upload/20200514/ae29fa9cba4fc02defb7daed41cb2b13.jpg|http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg|http://admin.host/upload/20200514/3b88be4b1934690e5c1bd6b54b9ab5c8.jpg', '<p>76654757</p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/198070421110fa01f2c2ac2f52481647.jpg\" style=\"height:689px; width:790px\" /></p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/a07a742c15a78781e79f8a3317006c1d.jpg\" style=\"height:877px; width:790px\" /></p>\n', 599.00, 368.00, 0, 594, 0, 0, 675, 1, '', 1589454309, 1589567016, NULL);
INSERT INTO `tb_mall_goods` VALUES (9, 9, '电脑', 'http://admin.host/upload/20200514/bbf858d469dec2e12a89460110068d3d.jpg', 'http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg', '<p>477</p>\n', 0.00, 0.00, 0, 0, 115, 320, 0, 1, '', 1589465215, 1589476345, NULL);

-- ----------------------------
-- Table structure for tb_shop_activity
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_activity`;
CREATE TABLE `tb_shop_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频标题',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `interface` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口组',
  `titles` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标题组',
  `videos` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '短视频组',
  `cards` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '卡券组',
  `number` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '限制次数',
  `day` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '限制天数',
  `pages` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '页面配置',
  `othes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '更多',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ums`(`merchant`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_activity
-- ----------------------------
INSERT INTO `tb_shop_activity` VALUES (1, 2, 'test活动名称', NULL, '&lt;p&gt;&lt;span&gt;活动内容指的就是活动的具体方案，为某一次活动所指定的书面计划，具体行动实施办法细则，步骤等。对具体将要进行的活动进行书面的计划，对每个步骤的详细分析，研究，以确定活动的顺利，圆满进行。&lt;/span&gt;&lt;/p&gt;&lt;p pingfang=&quot;&quot; lantinghei=&quot;&quot; microsoft=&quot;&quot; white-space:=&quot;&quot; background-color:=&quot;&quot;&gt;&lt;span&gt;内容应根据策划书的特点在以下项目中选取内容重点阐述，具体项目有：基本情况简介、主要执行对象、近期状况、组织部门、活动开展原因、社会影响、以及相关目的动机。其次应说明问题的环境特征；&lt;/span&gt;&lt;/p&gt;&lt;p pingfang=&quot;&quot; lantinghei=&quot;&quot; microsoft=&quot;&quot; white-space:=&quot;&quot; background-color:=&quot;&quot;&gt;&lt;span&gt;主要考虑环境的内在优势、弱点、机会及威胁等因素，对其作好全面的分析（SWOT分析），将内容重点放在环境分析的各项因素上，对过去现在的情况进行详细的描述，并通过对情况的预测制定计划。如环境不明，则应该通过调查研究等方式进行分析加以补充。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '{\"0\":\"user_info\",\"1\":\"mobile_alert\",\"5\":\"video.create\"}', '[\"23232323\"]', '[\"http:\\/\\/screen.c\\/upload\\/20210419\\/88e74866b36612cf521ecc56e626c00b.mp4\"]', '[\"90\",\"91\"]', 22, 222, '{\"replace_congratulations\":\"\",\"replace_participate\":\"\",\"replace_works\":\"\",\"replace_introduction\":\"\",\"get_button\":\"\",\"view_button\":\"\"}', '{\"real_share\":\"https:\\/\\/v.douyin.com\\/Jb4mTh7\\/\",\"poi_name\":\"test\\u6296\\u97f3\\u5546\\u6237\\u540d\\u79f0\",\"poi_address\":\"\",\"real_openid\":\"ddsdsd\",\"poi_share\":\"https:\\/\\/v.douyin.com\\/Jg6wryE\\/\",\"send_interval\":\"1\",\"mode\":\"0\",\"mode_share\":\"0\",\"mode_share_url\":\"\",\"poster\":\"http:\\/\\/screen.c\\/upload\\/20210419\\/a48b910326eaacb3d20fdab44f5a5eba.jpg\"}', 1, NULL, 1618884901, NULL);

-- ----------------------------
-- Table structure for tb_shop_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_coupon`;
CREATE TABLE `tb_shop_coupon`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `shopid` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `coupon_type` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coupon_validity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `coupon_num` int(10) NOT NULL DEFAULT 0,
  `use_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `coupon_times` int(10) NOT NULL DEFAULT 0,
  `consume_type` tinyint(1) NOT NULL DEFAULT 0,
  `show_sort` int(10) NOT NULL DEFAULT 0,
  `use_tip` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image_banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopid`(`shopid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_coupon
-- ----------------------------
INSERT INTO `tb_shop_coupon` VALUES (90, 'test卡券', 2, 1, 1, '{\"discount\":\"2\"}', '{\"get_start\":\"2021-04-14  00:00:00\",\"get_end\":\"2021-05-29 23:59:59\",\"time_type\":2,\"deadline\":0,\"limit\":6}', 100, '卡券使用门槛212', 1, 0, 1, '卡券使用说明', 'test卡券', '', '', 0, 1618804569, 1618804569, NULL);
INSERT INTO `tb_shop_coupon` VALUES (91, 'test代金券', 2, 1, 2, '{\"least_cost\":\"100\",\"reduce_cost\":\"10\"}', '{\"get_start\":\"2021-04-14  00:00:00\",\"get_end\":\"2021-05-29 23:59:59\",\"time_type\":1,\"start\":\"2021-04-14  00:00:00\",\"end\":\"2021-05-31 23:59:59\"}', 1222, '卡券使用门槛', 1, 0, 12, '卡券使用说明', 'test代金券', '', '', 0, 1618804630, 1618804630, NULL);
INSERT INTO `tb_shop_coupon` VALUES (92, 'test礼品券', 2, 1, 3, '{\"gift\":\"\\u82f9\\u679c122\"}', '{\"get_start\":\"2021-04-01  00:00:00\",\"get_end\":\"2021-05-29 23:59:59\",\"time_type\":2,\"deadline\":0,\"limit\":1}', 12121, '卡券使用门槛', 212, 0, 12, '12121212', '卡券标题', '', '', 0, 1618804768, 1618816643, NULL);

-- ----------------------------
-- Table structure for tb_shop_coupon_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_coupon_member`;
CREATE TABLE `tb_shop_coupon_member`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `shopid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `aid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `mid` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `createtime` int(10) NOT NULL DEFAULT 0,
  `usetime` int(10) NOT NULL DEFAULT 0,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coupon_type` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coupon_validity` varchar(233) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `use_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `consume_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `check_uid` int(10) NOT NULL DEFAULT 0,
  `use_tip` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `shopid`(`shopid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡券领取记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_coupon_member
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop_manager
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_manager`;
CREATE TABLE `tb_shop_manager`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `shopid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `power` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_logintime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopid`(`shopid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_manager
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_member`;
CREATE TABLE `tb_shop_member`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `unionid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uos`(`uniacid`, `openid`, `status`) USING BTREE,
  INDEX `idx_uus`(`uniacid`, `unionid`, `status`) USING BTREE,
  INDEX `idx_ups`(`uniacid`, `phone`, `status`) USING BTREE,
  INDEX `indx_openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_member
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop_member_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_member_info`;
CREATE TABLE `tb_shop_member_info`  (
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE INDEX `mid`(`mid`) USING BTREE,
  INDEX `nickname`(`nickname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户资料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_member_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop_merchant
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_merchant`;
CREATE TABLE `tb_shop_merchant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sign` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作人员',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `logo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `consume_type` tinyint(1) NOT NULL DEFAULT 0,
  `consume_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `limit_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `set_activity` tinyint(1) NOT NULL DEFAULT 1,
  `set_coupon` tinyint(1) NOT NULL DEFAULT 1,
  `starttime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `endtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `check_activity` tinyint(1) NOT NULL DEFAULT 1,
  `activity_num` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_uss`(`sign`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_merchant
-- ----------------------------
INSERT INTO `tb_shop_merchant` VALUES (2, NULL, '5500', 'test商家', '15812428301', 'e10adc3949ba59abbe56e057f20f883e', 'http://screen.c/upload/20210415/db6785ed88ff6e19ab55478088773cf4.jpg', '佛山市南海区狮山镇白沙桥庄边', NULL, 1, 0, '', 0, 1, 1, 1618329600, 1622476799, 1, 0, 1618478015, 1618480783);
INSERT INTO `tb_shop_merchant` VALUES (3, NULL, '5500', '唯企悦客服', '15812428301', 'e10adc3949ba59abbe56e057f20f883e', 'http://screen.c/upload/20210415/db6785ed88ff6e19ab55478088773cf4.jpg', '佛山市南海区狮山镇白沙桥庄边', NULL, 1, 0, '', 0, 1, 1, 1617206400, 1622303999, 1, 0, 1618656710, 1618656710);
INSERT INTO `tb_shop_merchant` VALUES (4, NULL, '', 'huang', '13724005183', 'e10adc3949ba59abbe56e057f20f883e', 'http://www.screen.c/upload/20210422/24edbf26618ce6ab17632071ac9f6576.jpg', '广东佛山', NULL, 1, 0, '', 0, 1, 1, 1617206400, 1622476799, 1, 0, 1619077288, 1619077690);

-- ----------------------------
-- Table structure for tb_shop_merchant_official
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_merchant_official`;
CREATE TABLE `tb_shop_merchant_official`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `merchant_id` int(10) NOT NULL COMMENT '商户id',
  `authorizer_appid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号app_id',
  `authorizer_access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'authorizer_refresh_token',
  `expires_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户公众号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_merchant_official
-- ----------------------------
INSERT INTO `tb_shop_merchant_official` VALUES (2, 4, '', '', NULL, NULL);

-- ----------------------------
-- Table structure for tb_shop_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_relation`;
CREATE TABLE `tb_shop_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `merchant` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `video_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件id',
  `item_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频id',
  `download_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载量',
  `forward_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏量',
  `play_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放量',
  `share_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分享量',
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论量',
  `digg_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `counttime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '同步时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_umam`(`mid`, `activity`, `merchant`) USING BTREE,
  INDEX `idx_um`(`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_relation
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop_turntable
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_turntable`;
CREATE TABLE `tb_shop_turntable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备id',
  `shopid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `device` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `bg_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景图',
  `code_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已扫次数',
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否激活',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态：0下线，1在线',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ums`(`shopid`) USING BTREE,
  INDEX `device`(`device`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大转盘表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_turntable
-- ----------------------------
INSERT INTO `tb_shop_turntable` VALUES (1, 0, 'tddd', 'adsdsdsdd', 'http://screen.c/upload/20210415/836bfd6a9a366bdb61e0045cf8b47e54.jpg', 0, 1, 1, 1618914241, 1618984579, NULL);
INSERT INTO `tb_shop_turntable` VALUES (2, 0, 'ddd ', 'dddddsdsd', 'http://screen.c/upload/20210415/836bfd6a9a366bdb61e0045cf8b47e54.jpg', 0, 1, 1, 1619006887, 1620122475, NULL);

-- ----------------------------
-- Table structure for tb_shop_turntable_award
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_turntable_award`;
CREATE TABLE `tb_shop_turntable_award`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备id',
  `spin_times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '旋转时间(秒)',
  `light_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '灯数量',
  `award` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '奖励',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device_id`(`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大转盘奖励配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_turntable_award
-- ----------------------------
INSERT INTO `tb_shop_turntable_award` VALUES (4, 1, 20, 5, '[{\"award_value\":\"\\u8c22\\u8c22\\u60e0\\u987e\",\"award_light_no\":\"1\",\"award_rate\":\"20\",\"award_assign\":\"\",\"award_count\":\"10\"},{\"award_value\":\"\\u4e00\\u7b49\\u5956\",\"award_light_no\":\"2\",\"award_rate\":\"1\",\"award_assign\":\"\",\"award_count\":\"1\"},{\"award_value\":\"\\u4e8c\\u7b49\\u5956\",\"award_light_no\":\"3\",\"award_rate\":\"2\",\"award_assign\":\"\",\"award_count\":\"2\"},{\"award_value\":\"\\u4e09\\u7b49\\u5956\",\"award_light_no\":\"4\",\"award_rate\":\"4\",\"award_assign\":\"\",\"award_count\":\"10\"},{\"award_value\":\"\\u56db\\u7b49\\u5956\",\"award_light_no\":\"5\",\"award_rate\":\"5\",\"award_assign\":\"\",\"award_count\":\"100\"}]', 1619001286, 1619001286, NULL);

-- ----------------------------
-- Table structure for tb_shop_wechat_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_wechat_article`;
CREATE TABLE `tb_shop_wechat_article`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '具体内容',
  `thumb_media_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图文消息的封面图片素材id',
  `digest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图文消息的摘要，仅有单图文消息才有摘要，多图文此处为空',
  `source_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部URL',
  `show_cover` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示封面，0 为 false，即不显示，1 为 true，即显示',
  `merchant_id` int(10) NULL DEFAULT NULL COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `create_time` int(12) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信-文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_wechat_article
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop_wechat_fans
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_wechat_fans`;
CREATE TABLE `tb_shop_wechat_fans`  (
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '粉丝openid',
  `id` bigint(12) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tagid_list` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '粉丝标签id',
  `is_black` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否为黑名单状态 0 否 1 是',
  `subscribe` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '关注状态(0未关注,1已关注)',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `sex` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '用户性别(1男性,2女性,0未知)',
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户所在国家',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户所在省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户所在城市',
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户的语言(zh_CN)',
  `headimgurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `subscribe_time` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '关注时间',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `subscribe_scene` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '扫码关注场景',
  `qr_scene` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '二维码场景值',
  `qr_scene_str` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '二维码场景内容',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `merchant_id` int(10) NULL DEFAULT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_wechat_fans_openid`(`openid`) USING BTREE,
  INDEX `index_wechat_fans_isblack`(`is_black`) USING BTREE,
  INDEX `index_wechat_fans_subscribe`(`subscribe`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2091 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信公众号-粉丝 用户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_wechat_fans
-- ----------------------------
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20zvhZcpASh5Jym7VPtY_a_E', 1932, '', 0, 1, 'wrLCusKywrnwn5KX', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM5JPh3DOZYFnwH6wQZ7dpaYBBuKnPaNJJe5bc4tg68EGFmhV1gkwO3V0UBlxwgDDWwLicpo2jUutSQ/132', 1548600329, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201FaOZoVU-2jeHbbbA-6xLc', 1933, '', 0, 1, '562W6ZOt5bm/5ZGK77yM5Lil55Sf', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF8ZDxMLXybomluqSRxWmKFLZt1qmWhWrLhjIrSQnajYquLo18Z4Qh2pE7yGCVc3QLcOLnfibvKWfiarZWTRBaDiaRy/132', 1553152723, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2049lXS_wX6uOYkc_vFsUsVw', 1934, '', 0, 1, '5pyJ55ej6Z2S5bm0', 1, '安道尔', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGFic8HTfOQgUCF7UXvibLzxdiaEYjhtxniao1ygR9U48lRTEZW53k46z90DeAX82wvhESg7tlzJYxzofCA/132', 1558527531, '', 'ADD_SCENE_SEARCH', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20yMJaYPOaACp0SBODTbCTu8', 1935, '', 0, 1, 'QeiRiea0quiPrw==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fujpXqbhMPcnk51Iib9IOQUAkTCKp1EWpqlTLsCVhzl3EG4pYqWLLorHtEj3MzE9bFy2pfN5dnibRyVNu45UvKBlj/132', 1548507906, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207-o_r6l9BzB9pZ_d-vQjtY', 1936, '', 0, 1, '8J+Um+mFt+WwkfCflJs=', 1, '中国', '香港', '南区', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBQ15xgcpkdNaNHWtDS4JbFwUmexvN850OEsQUnx5HIRo6MnlZF1gBGUiaxStS8TKT1cHUp1AMMedoWvvLX6fOH9j/132', 1546422480, '', 'ADD_SCENE_OTHERS', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS203bXA57ZGaBQOv4lyMSuQ7k', 1937, '', 0, 1, '6ZmI5by6MTM0MjQ0NzczOTjvvIjljYHkuIkp', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM53iahpib0HzmaEe9LzduKcpbOQ0BF26YnFQicoPvSibsbecGBCia34qarRQbVrNtPrS0FPwSc8ictlHUMw/132', 1546620940, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20_DsDfIL738HKHAr9PGl9to', 1938, '', 0, 1, '44CK5a6i5LqR5p2l44CL5oqW6Z+z6KOC5Y+Y5LqM57u056CB', 0, '', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLAqrlmPF4wNefFoBbf97gYwFJibIDNevfac2eXPKP235aHqTqrYFQ9e5hNyiapKCzz9hcvD2iaLtR6iaw/132', 1573114484, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20w5bqWR3yAIIkwbpLqbzLbA', 1939, '', 0, 1, '44CC', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLCBK1Yf7H5ZvbsrBEnx3fGH5cvt2jOlFp6VPDQuMMF5Utib05noWiaJTfXbHfQahXxEFgibVqenjsTGw/132', 1548411306, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201bsojqR1tby7gRADIvGjRk', 1940, '', 0, 1, '55uu5qCH5piv6KaB6Z2g5Yqq5Yqb5omN5Lya5a6e546w', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fscD2ckjeCbBxPl8KWlXaXM9NJ1b4wc64fkXINrNgbWDHqIygJ2Ua3JKBPiax8n3Cwzul0gnVOYmEA/132', 1547107653, '', 'ADD_SCENE_QR_CODE', '0', '3770084', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS203amMwsRU970HeLhzXRDR0E', 1941, '', 0, 1, '5YWr5oiS5ZWG5qGl5bu656uZ', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWLJebwicZRtUQOoIV1vuq36UdDmK9rliaV7V3CANECicq5DyxmQ2tzYKrAr2fYjIeoZicUHls0rr7xA57bs3l6G7qZ/132', 1603443574, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2091-Nn50wpCORSsrKBUcceA', 1942, '', 0, 1, '5a6J5Y2a5Lio5aeR6IuP5Z+O5aSWwq4xMzM3MDEwOTc3OQ==', 1, '中国', '北京', '朝阳', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF9ryK8BOzgw6L5lcNOun2Ml6xJ8GQaicDjZdkvklf7X05hjQempBc6YrEvLb680CKgliarOdYVVLxuA/132', 1547768680, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2015GywTc2FzIWYCOvu3Rn-g', 1943, '', 0, 1, '5YiY56OK', 1, '中国', '四川', '成都', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBRCQSIQVZUdOhdsAicqc5yHbGpktibRKm06U3A3BgCmx4UyvhwibfhnDOZDTX60QXrTDAEibsldUMTTQH22ocbnyUKB/132', 1545475396, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS209HUECfFn5tqY83cI4R31Sc', 1944, '', 0, 1, '56We5LuZ5rW35Lit6YeR6bG8', 1, '新加坡', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/PiajxSqBRaEIUDeHfSfDIwlRmviaia9ibjnU3bv0kHfBWFGT7H6cGpos9alr6ByEHWD01Fu9f44ExG52yL7cqu3ETg/132', 1547724941, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS200odZPFsjKRxptLjH6lT-MM', 1945, '', 0, 1, '8J+QjvCfkI7wn5CO', 1, '日本', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBRCQSIQVZUdOjJcp5RoJ8SvcXILwOQdXzFCGr9YvRm1OSQ34XoRiaxEicMia10KU8rPxQ0chNficm9qq12nicxJq0UGQ/132', 1545038878, '', 'ADD_SCENE_QR_CODE', '0', '3704787', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201lvz4JxVYMRzBYO95rK1OU', 1946, '', 0, 1, '5rS75rO85LuU', 1, '中国', '广西', '百色', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/PiajxSqBRaEJNRSO8rnD3rCxUWbic6DibibOlKjZmLNVdibN8cu8YFvNaD5dQ1RwkC6CcfM8okZPtZRuicOQvz5rrezQ/132', 1546946331, '', 'ADD_SCENE_QR_CODE', '0', '3736830', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS200iG8DW3nshwWU6qlZTXdbQ', 1947, '', 0, 1, '6KGj5LyB5Y2w5pyN6aWw5a6a5Yi2LeW9qeWNsOmAmuagh+etvuWNsOWIt+WHjA==', 1, '中国', '广西', '南宁', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLARbHCwEexF3U4ZsWn2icObZWB6hSFNyswlHHvL9tv5BAXtJ1PzLlTKiaQwiaWW05HM2ekw0WyKvubJQ/132', 1551943796, '', 'ADD_SCENE_SEARCH', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-mGJePs7ZvDEXv1MKO2qzo', 1948, '', 0, 1, '5ZSQ5YGl5YW0ICAgMTM3NTExMzk1Mjc=', 1, '中国', '广东', '深圳', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM6yXDnpAGqzwjwoJMkZTIjoo5icRhH4UuKjd3CAIkc0pSzRp97ib5MXkfgRTFaoxxDaNtibsX1RsRjRD7iaYFic7nD385e5PEEfB3Mg/132', 1583816363, '', 'ADD_SCENE_PAID', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS206B9ZMOrwQ9msooJHoAxnKM', 1949, '', 0, 1, '5YWz5a2Q54Kr', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/zia2uE5F2WDAeuQfGNAGsPeL4N0DvACVs61aMG3kwvBV2s7bfA5bDU9B6poExRggqEZ5Qu0sS7cxqlLOvZib9IUsGNqEI3U0Vm/132', 1574042488, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS206WrclLA1rlfeyz175i22vc', 1950, '', 0, 1, '8J+MiFllcm93TW8=', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fu95zNIk0yf2Z54ic7n0qg8V6iaqfwow5jXp6WKv0ibNCwsJAeKGmibiamia23RndjvIGYKz5svealzJIvJXOVWLQ9LUCSDa9tiaTvaIc/132', 1618972348, '', 'ADD_SCENE_SEARCH', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS200drukZLOu_mAdKkbuoQ20s', 1951, '', 0, 1, '5Lil6YeR6ZSL77yI56e75Yqo5a695bim5oql6KOFMTM4ODk5MzAwNTY=', 1, '中国', '广东', '揭阳', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM6yXDnpAGqzwjwoJMkZTIjoDkSU8AGfdVISnFnCgERc0DZHicGjQ9gVujTaah69TR1QN9pxGtZ2qr5vRKCicBQFy3o02XNpBNEzY/132', 1545632917, '', 'ADD_SCENE_QR_CODE', '0', '3704787', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS206qFuc5fnBLjaCdUMEoP6WQ', 1952, '', 0, 1, '6LaF6LaK', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLDng1HcjcK5ZmNzbkew0zs9rJXoRiadLoX4C3p266wBKicFdd3sqZ6icEU9xdPz1bqqgoSAdeVm6zoxoCJg3OhSONlQibbC8vw8gHo/132', 1546852134, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205TKoJRs8XdJdph7fawCBP4', 1953, '', 0, 1, '6Zi/54+N', 2, '澳大利亚', '南澳大利亚', '甘比亚山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBRCQSIQVZUdOnvic9Jt8aPBc8qc7trVVzg5W0Z2gjlJpw16a1xyLq9JZRZwnaZtRMc9ApdGsuJxFBJXLArB3qibIO/132', 1547284769, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20xvxWFxpi42VqDHXTl0V4cQ', 1954, '', 0, 1, '5L2z5Y2O6ZOd5LiaIOiTneeUnw==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLBEY9c159DyMOa0icLI9ISMXJTjDu6Pvn0xrw1EILcQWABt3ibE2lufSEIbvoFpryxicNPqHRdibLTP2w/132', 1547560746, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201vLvgisxe0SEz4PZczUnS8', 1955, '', 0, 1, 'WVVFeGlhbnNoZW5n', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWLJebwicZRtUQbOfNzsiaErZvusnfV73tg1NtlhuibFuLOu2lTzdyaz1icXcliazuQBT9LYGphfAYibGfrSqJRlkNIoc/132', 1552545669, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20x9rFm03KaiGO0SvTjzysLk', 1956, '', 0, 1, '5LiA5Y+35rij55S38J+Rhg==', 2, '中国', '福建', '莆田', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBRCQSIQVZUdOstG4mhQHGM6Z4SDhxnRF7kVicNsAf0BdgGJZlJjPW7H9fGCfq8LyCnjiaZSFwcFxwSlUyibpcicnrtz/132', 1547640137, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS209I1QgzV1r3Wh905JIckruA', 1957, '', 0, 1, '6YOR5pm65q2m', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBRCQSIQVZUdOq88TCLGf1kE1VBic4BH96mqt0vZjR0VHnmJAvapcRw9vfXOXG35zuMlIaR583Ffrnoxx35opPkicz/132', 1547976334, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS202XBSPMsq84cJnU6XH1XsVY', 1958, '', 0, 1, '5YCp54+N', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fu95zNIk0yf2cDIcA0yIIF1L4N80ZT7pQTia2GrCwaMKwbqR9dWmO2dUVEsuiarNdbFb79HpAI7luDw7vRAFNUrE6/132', 1546845780, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20zgsVPErXZt9sFeS6SYJFAQ', 1959, '', 0, 1, '5Y2O5Li96L2s6Lqr77yB56iz5L2P6IO96LWi8J+kmA==', 2, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fu95zNIk0yf2QNoaZ5sh0UicbPq2tWTtAVfqKxDJX2Or9iaDsgLpUmibXh90BqicvRwUDDjQDaI9mfjMVyI9FdHzKLp/132', 1547309094, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS203RmVHeQKRyRkLORdWgYuuM', 1960, '', 0, 1, 'QeWRqOmRqw==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF9bQLzEXLYXOCwBMOiacBrT2FVITzwRyiayLIClqbqe1IicDz6iacpxsWpqq4ssQn6pMBmwzTRDInu42ZyTBzmdJgMaf7e02Ax37K0/132', 1551872631, '', 'ADD_SCENE_PAID', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20xtCDb2Jhsc9Pl5Rw-S9YkI', 1961, '', 0, 1, '6LuN', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWLJebwicZRtUfQkAR6IJDnfW9jnYNjHhwtcuwlN2QFFEGtc8meEjSyXJfWtDiakoagbibXx0n1VwJg3P9qR0rJLFh/132', 1539757427, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20_Tl9FHpC9wfrcNxwx6keRY', 1962, '', 0, 1, 'X1/Cukg=', 2, '奥地利', '维也纳', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBRCQSIQVZUdOhm7iaicbBicVhicv9zbAibWQwqXQ43ZB85GxelKKaQqLnB15kJ3jUHHuTt5eFlMaibPLsRCLACwicGj28A/132', 1545475949, '', 'ADD_SCENE_OTHERS', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS203Y5Zrrgca6DF8Rkwg4lNF0', 1963, '', 0, 1, '6Jab5rmYSuS6kQ==', 0, '', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLC1ef722JgZEvVTHBphqyjKPN7tJ7dW3OmFbxmPWTBhHQ6sQKFtNOBZ40n2LYO2ncgDnID2e0hGVA/132', 1602932080, '', 'ADD_SCENE_SEARCH', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2085qZzZlA4VLpnnGzsdTN-I', 1964, '', 0, 1, '6YKx5YuH5oiQ', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGFicSYbEIo0yKibiaoeHLrvWfaJOlqlVIvKkmoMsZTJeDLlwuGtH0LF4vibLjL7zNm032xicJuK4jF8cJ3w/132', 1558943554, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205uJFIGyqgggh_5JYEI0bj0', 1965, '', 0, 1, '6ZGr6ZGr', 2, '巴哈马', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fu95zNIk0yf2QYAYZ9ADNfSCdIDrUgDRicvNpv12BibCSbEIpr7Dia67sH5Pf0fx3yPibEys7Ma3jnyOv6RyQdWmcO2gbOWxgMujFQ/132', 1547640099, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS208AgoTl3BQBNfqyrKg4nv-s', 1966, '', 0, 1, '6I2J5Y6f', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWLJebwicZRtUSvibpIPbtEwWiaJgsFluian68ia0eibN4onaoLvoDuTpibS5ExYUyajRnruTqgWQOe8PCEX0sSCTlWhwY/132', 1545365339, '', 'ADD_SCENE_QR_CODE', '0', '3738035', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wzD_h_vsuU2iWUzUfuBly0', 1967, '', 0, 1, 'LiAuIOivuuiogA==', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWLJebwicZRtUXSsx9VxZC1EyJDTbeELAtvTVNUoXB18cRiaPzDiaM6t9g47KjoicnqStN7picu68AFQVIzM4uyrD4tZ/132', 1584545804, '', 'ADD_SCENE_PAID', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS209VJRDOCjihZkUGd52aVyww', 1968, '', 0, 1, '6Zu26Zu25o2MLkx3auS4nOe6ouWhkeiDtuS6lOmHkeWWt+a2gg==', 1, '中国', '广东', '惠州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/zia2uE5F2WDAeuQfGNAGsPWLyUN4Ftm6GTibNTCRsEmh81znFHs2E5oLvrTVicUqUiaBxFJgA16FLCQH1YgZ93MVjfFaeclnhRDM/132', 1553868561, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-5b5zM9WbAwzV7ommuQTLc', 1969, '', 0, 1, 'V2llIFNpZQ==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLDng1HcjcK5ZmNzbkew0zs96a8q3kZagZpcRrpBYLVe7bZibaicJEzEdHlzt9ceOdu4du1SiaYXSYjR4n2icK4G2JHpnXoubFlIx0M/132', 1545903719, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20xRRIdNHm6oM7OsSqg4JOII', 1970, '', 0, 1, '5p2O5aSn5rW3', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM5pxxiasIZnWOGeqQ5yN9DQEflBLxn9ibbkWPdxsk2ia6WWETtIIf4kWsTW9fDxlctQEwchwPngADH0Q/132', 1548216397, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS204ic6xNsTnk26rWVJtpZBJc', 1971, '', 0, 1, '5LiA5ZOB6Iy25bqEMTU4NTg3MDk5MjI=', 2, '中国', '浙江', '温州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF9DQGS2nsT0TicoFI0atnseM6bNX4gIuxFD4G324jBl9y1zrGcrrUBbGiaXSYY86OqRwLCgMQ0RBzNA/132', 1547009062, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2043mYPqiDO0vJrjwql-NBaM', 1972, '', 0, 1, '5aSn5pyx', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWLJebwicZRtUe7siaK7kZU2OrpaOK0lrgUUBo861GtOM6q1NPozWHicZxCuPVt5k9PsicKBYmfxz9qeSeL75s9qsVp/132', 1544014487, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20we6ejJDj362A80Wm1fiDKo', 1973, '', 0, 1, '5pum', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWLJebwicZRtUfmGwGTsNqfKlo9dUYsVCLuFJlATnpiaFhmQnFkeiaqHPsBQB5Vtl0OYhGpo82ickfY2NOKJSm6fGk8/132', 1546865831, '', 'ADD_SCENE_QR_CODE', '0', '3736830', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS203Hea7WJxg1zKjo4JYJUR9Y', 1974, '', 0, 1, '6ZmI5LiH5bmz', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLDng1HcjcK5ZmNzbkew0zs9cK2ek3PLeJlibgezO8Q3ENcLiaBnibYMDcqKZVfSiau3qwl22A8Fx6R8EZgk8K6oJkXbgrb73VpspIk/132', 1545836196, '', 'ADD_SCENE_SEARCH', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS209chWqFl-7euel1CXrL-gKo', 1975, '', 0, 1, '5aSc5Y2K5Zue5a625p2l', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZhMavAKicBJsG3EyHWd8xgXIdOoYbINsicNH4FsUsQOHjtIicN2gsRV9OibgibVAeC82EvlFd4ib0Muxad/132', 1544801410, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wuHF3eBlSvlfRehFMA_x3w', 1976, '', 0, 1, '5L2g55yL5LiN6KeB5oiR8J+ZjPCfj78=', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBSI9lnJCcmKvvFnOoK7qkRicwjRaX685Vy98eXyG0vVLp3rt0IsSAWOjeAeRQLRTKkKicvGud8HngwM3f7bReGzKq/132', 1550202689, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20yw8xOqy_9GNSGC3wtBINcI', 1977, '', 0, 1, '5Y2a5oiQLeaIkOW/l+Wdmg==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTHZibCOKrXnSfsKJSJbogeBiaDFGKkXAlt9ibk43T6NT0QqnlfgbibQ5v5wqpFY27x2pYwUVPXs3Z4Tdabr2HUnaAT/132', 1552494219, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201F8LZ8EJYIMV7N5jBKcP8c', 1978, '', 0, 1, '6buE5bCP6Z2S', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvYpiavyu1rPDmSB3pHXIlZKqPOGysPrzaR5dQQkVxd8qTbnyOFmnPib5UhLD6uMLw3Bx1Kd0dQzQEJ5Fo0PM4TOj/132', 1556857560, '', 'ADD_SCENE_OTHERS', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS209CG1JkzOEoOSffiqEsMe_Y', 1979, '', 0, 1, '6L+O6aOO', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/fvibu4M3TubRHz8QDAFtDUVfJg9Q4RnnN82gZjVFmPoUyAywtsdZeHl0O0QnEwhKIKLSjAdt0qLMwib3jGFPljhVOxlr3RKv2P/132', 1551000576, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207vCy-eI-PJ2mSuC_X65dL0', 1980, '', 0, 1, '5L2b5bGxLem4v+m5jy3lvKDkvbPmn7MxMzgyNzcxMDQ0Ng==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWe5HaWL8dlXIYEZkcYd1on1MPDxjevfUDuGxepmOnZ1PuUG6vicWMMMF1S5ZcuYjTrDKBtAz3SUxQ42vy3VBLuw/132', 1550737524, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS208xx10P6GMcGS4wGKQhTOOs', 1981, '', 0, 1, '5YWr5oiS5bu656uZ5bCP56iL5bqP', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZragT8XibiafJVbEPvzNjzze8hJCpXEbFoZFibzesa2xM2MMZ7NEQ3dgkZqgTKMYF9bWCqCT4Lt5TRV/132', 1619059664, '', 'ADD_SCENE_OTHERS', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20yCU-h97LmMiyn0JZoXXByM', 1982, '', 0, 1, '5Y+2562d8J+OtueUnPCfjbA=', 2, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBQAwJkDSHnlBJqMs2PCLwHDdPg8YW8icFfTO11tFWvapwQXqDiaPH6By9GlhBozRSxubSzTZdPkO9G6OBl5HFK9oT/132', 1545285057, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-Eemg4c915GT4SvptKHacI', 1983, '', 0, 1, 'RGlsbGlu', 0, '瑞士', '苏黎世', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvhe8KLX02nUqsMMmDfaQOHkmlF2Z9HKOib86zVblPnTnUiaeswicMnTXfd2jNnfibFriabibsicqspDgRRiaCTUPiabxtcj/132', 1546949525, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20_-eiyLRTtUVqeqZ8KrsoBI', 1984, '', 0, 1, '5Y2w55Sf5rS7572R57uc56eR5oqA5a2Z55Sf', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28ftrYOZI4CUltmudtXYDQFQFLhoRw57d2KibpG1IqWNeuJTqJ1n7FUNSHiaIksEbT4npFyhNw7vACrZlmibIVEClSvy/132', 1544161454, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS200ZaN-qnqGtlxX68YbeT0aw', 1985, '', 0, 1, '5b+D6Z2Z5aaC5rC0', 1, '中国', '广西', '梧州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3LiaVicymEc0p3R5Uiaevo1D9xtwvyA1G57CMdxpaLZV8Svibv1IfUzcv23ibTcEXibaF3KqqI2icLxQ6cibE/132', 1549359660, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207LMb0FZh0JQNG3fTduhZfg', 1986, '', 0, 1, '44CK5qiZ6KiY44CL', 1, '中国', '广东', '东莞', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jXeywx7riaYkbWETWFI4GKRZdIxnHEyPNkJicdZOOKAhF4Tck2jbxePicfbBAergF065coq2DPlLXU85G2LJQeU3mb/132', 1547637217, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201hQUdq4vyLmU-t-RBo_5Gw', 1987, '', 0, 1, 'QWHwn5KLIOiKrOiKrA==', 2, '中国', '广东', '肇庆', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF97KkwqeT5SYHabFHVZmeqLeicwlibULeGlNuYKODd182U4XWoGmZ8r4NxQCnDwFUiaMfRnJMEUicxN6SkFOyzkH1dH/132', 1547455287, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-ZvPrYq4C0PKdwsbdt2WSI', 1988, '', 0, 1, '55uK5Yqb5aSa55Sc55Sc', 2, '阿曼', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBQwBIWt4q8k65ic2tfEKWywdtlpkHdsDTibYZlsQ5zT209IDOf3JMk0AfdEsAC3EKnKRuJibjMRPxVbxlqRDSCC9Dic/132', 1547456785, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS204IExVoS5P4j0dxnLsR271k', 1989, '', 0, 1, 'VklIQU8=', 1, '日本', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWcfic6Pzhm9S5869rlpSHPPCiassA0e970DbJdRHcuhnqcqMMmongEXs5QlLic9icd1kOPrMT2DbbyjRljTnPumxKC/132', 1544089218, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20z1cloDLfQFpdfNxBkWioKI', 1990, '', 0, 1, '6ZmI5q2m5Lic', 1, '中国', '广东', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTHZibCOKrXnSfaYKq62pr5WXDq9eFHVtic1Vf5rmeSdgUsnnlbxny9IlHWqoP9BvGoad2jvrqJ6gwQhZ6nqibO71A/132', 1552409813, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20yCr10Hr0eMQkf4QWRbg75U', 1991, '', 0, 1, 'a3lnbw==', 1, '中国', '广东', '中山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jVcvC8QJV8WiccQPHkwlXU8Le3V8lczC149qeWcnwxPq4LCEtciaaol0s8ib40s3LsyiaJhTY9CcJlLu87iaWVTTNlpt/132', 1585708093, '', 'ADD_SCENE_PAID', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20yystAPpxBWYgpuNblsTUdY', 1992, '', 0, 1, 'Qem4v+i/kOi+vuaxvei9pueUqOWTgeaJueWPkTEzOTIzMTkwMDUx', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTClYFibRch5JH9t1UliaCYcaWAw5TkDRdBMPWB0jugmicSSj4siaMzAUd9nnIlrz82iafs95zzGkY8FhZ7Bx6A6cSiau/132', 1546066311, '', 'ADD_SCENE_QR_CODE', '0', '3690499', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wVpDlL_A6zvHpe5TebsAfc', 1993, '', 0, 1, '6YKT6YKT', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jV4dibic33ApSzIbXiaSmGzwHOnPCI3CY20tCrWWvk615pppJk9tiblT5ia9PdBZh8Am4bsCYZvQ0ImicI6ApjCrY7Hzy/132', 1619058669, '', 'ADD_SCENE_SEARCH', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS206SqvxaqjLIRvZsXWJEonvw', 1994, '', 0, 1, '5LyY5Y2w5b2p5Y2w', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBQvrOR9ME8pDPC6lia5VCHichX8ib1w86awzTmlNUgUYFCzIRe0uruIcGKVticoDaaOqo97yJElSwzTkicticGDYxaL1E/132', 1551975808, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207YaW4wJFSzDVrpiLqpej5g', 1995, '', 0, 1, '5byg5pmT5Zu9', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jXeywx7riaYkbUUI4LcECia6Hsbsib9INEU9hX1icP9e2ibIAzEpvNH3UX6B3dmW0Dibk40zrav8FncVdhibz1FoMpZvwF/132', 1553872506, '', 'ADD_SCENE_QR_CODE', '0', '3881046', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wFK2XgPL5mbRvjlU_-GERI', 1996, '', 0, 1, '5a2f5ZOl', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28ftHGUqD55sph0bVicAiaFVj256gt9l8s1PqChYibq8GfN6ftnnKiczYicVAJZQRS2Hnw9p2Q22Za1w2icmNxtHuMFUwB4/132', 1547366123, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201b3N_WBsRUPKERA25IBjZw', 1997, '', 0, 1, '5rOi7o2F', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM5a7ba9yeGmJJkD7K8JkjvQh5yW9m6w2klzZDcwkh2U8SJhNu3LWSo9xgKRKoaIesibVdUibmPvRgHpuG8pXCIvicbNvYc391mZgs/132', 1545644064, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20zh-Vz2SaytToiaeYaqbO1w', 1998, '', 0, 1, '6ZGr5YW4576O5Y+R57uP55CG', 1, '中国', '上海', '金山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBQhSYeicStb1b0lMBlVPhYDgMCMIEyNmIBnd5tyYfjferoZicVL9Hwck1bTZoIlb1qU5ibRxUOdqatR6icyic6ib1D925/132', 1547455411, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wR1szE4-vnmZDvqUofJYm0', 1999, '', 0, 1, 'Lg==', 1, '冰岛', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fuxSbpUwdUU4bFaSPPXS0vJz21gNVQmOEnKgKIDb4dTyiaIccWhWtWtKjUbrTAb9tl7GMAlIBXQdMUaBbo0EwsZib/132', 1547478628, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20woi57qZxjj8QaZzYQNH2OE', 2000, '', 0, 1, '5ZWG5qGlQWzmmbrog73okKXplIDns7vnu58=', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/bWmGaGcWUNpevbEqgic6NPv8so8Kmon5YtibOcbZjDXyKtycKa0Cox8gD3hK3lfpoE74M89qxJgTp9iaqwNgAYibsV4kCgqticSdz/132', 1547486500, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-MKjE8wifZszSbJ5dv2OMw', 2001, '', 0, 1, '6ICB6KGy5LiN55So6aOY5p+U', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/mDRiaU2Cwu6HULeDs2WBdWt9OeQdwwyhlh0aTEQcIeo5GSYhdm4icJWu02hxsKUamWhJBXwHnJZbYqQRDU1HJ2lxyYMXtmJVc0/132', 1547771025, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20yFTlG-GL6wDxMPqzzKCeE8', 2002, '', 0, 1, '6K+X8J+SlSDpk60=', 2, '中国', '广西', '南宁', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3Lqg0pmiaGuoYVXj1VVMBic0SzcS2T644GVdBbA0cuD49WwRrjIyAiaVian65RQHZJraaRkLla0vUs8co/132', 1573114616, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205gF8SbJBIRL-csQBMq4yo0', 2003, '', 0, 1, '6YCf6ZuVKOedvynlub/lkYrlrZdg5qCH6K+G5Y6CLem7hOaVrOaYjg==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTHZibCOKrXnSW2LFIhlXzfJseTeFViabrp2Mml2KZ8A69Ficcicm7ZAwiawe4yPE41QlDNfS6mGqgpNkBJn46nrF02o/132', 1575085314, '', 'ADD_SCENE_PAID', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS200i8k12FaSK55hKY7fhmgYU', 2004, '', 0, 1, '5Yav572X6ZKK44CB', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZjcserb9kDvAGxYvyicppr7xibIzybHrk4sn5ErDd5VAIBoyibYSvibliaNnC859ED6nCwSDUXBvp2HvE/132', 1548319644, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS204MXGjxvQyPWuj0a4mJtUMA', 2005, '', 0, 1, '44CC44CC44CC', 2, '中国', '广东', '清远', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWs7f4ZwibjF1x5Uk5Wbia1Y2ADAsojIN2a9rfLesgbDYDUwvJZDZFhUsZssZXYtIfERGK11GibuwZmeFAoqLiaBbde/132', 1596506092, '', 'ADD_SCENE_SEARCH', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201jfn8ey1R35v6esB-_KZ28', 2006, '', 0, 1, 'Q29sb3IgV29ya3M=', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM7f9ZrTtXYyiadEU4eMJUBiaNzicRKAkdsatBD8h2rWReNYo6QtK3GrqQiaFepmDQD5zR9yXlx0TIp5sS3ibQ5MFXXpz29IOE042ibicY/132', 1557318572, '', 'ADD_SCENE_QR_CODE', '0', '3697137', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS202IJBGhIF_L4GY4yZdd8PLk', 2007, '', 0, 1, 'TWFyay7phZLlsI/nmb0=', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBSBEm3uAS0H6ciaSxPbUyUt7BJ63ia96PMkHhRbRD77ua4iayfKvBQMhTEVKjDjOIbl3qiaXcMNefdPTDR7aBaOslth/132', 1551948306, '', 'ADD_SCENE_SEARCH', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207850WlQ6g800guFiI7zHqY', 2008, '', 0, 1, '5ZSQ', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jV2cB5jtRBJTmlII1PTQubjGHytWVb7JiaqHOCylEE26NWVblIcXeIzqqiau7fCMMHzxY6d9CuR9UHicQczYSd7QXb/132', 1545636964, '', 'ADD_SCENE_SEARCH', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20x2AJGL3YRbm0GdkVa-9moM', 2009, '', 0, 1, '5rC85Lma', 1, '中国', '广东', '韶关', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jXMP54hk4s63AyEia8XLbtGwq0SxaR3UjIo50nJaTXemVhqdK1LYGS7hicVR2rV5jPfbibxZFX5QhZ5A3PAIV01nPq/132', 1573205260, '', 'ADD_SCENE_PAID', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wZctKYa20bPsiHIjNpnm7U', 2010, '', 0, 1, 'SmFuZQ==', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3Lk8qyEQzhBia4picvonXRESIFuTHAx1CxqTPREiaKDc39PNuicia8zZ2p93mhAg2iafDcLu4kma14OxBFQ/132', 1545479143, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207G0Ac1OlmxC8Y1Pk1Epvro', 2011, '', 0, 1, '5pu5546J77yIMDAwMDEwNDjvvIk=', 0, '', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGFicRKdo5FjUGBOcvwowm1wrnOBoQ9z6RlTDg31ib3LIr6xsiauMJiarBWzicuQbibure3xehx7p6ZSJnNbPaFmGRPS0iby/132', 1547536750, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS208E5nbA50HXVwJD--GkajWU', 2012, '', 0, 1, '5Y2i56Wd6JmOMTM4Mjc3NzE2NjU=', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/uj6ObAM2ca9mzgOqrFmicWrpkyPYcg8GLZiaX4pm0NPPPcjTxPqPc6zFGsN4uP7IDkmoB2HwLkIkPIo393lEwWZkSpG6Wl2vSk/132', 1543727771, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS202dpS5W-KoV017oFU2qqLfg', 2013, '', 0, 1, '5pif6b6Z6KOF6aWw5bm/5ZGKLeaYn+eItw==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTHZibCOKrXnSTYaT59cI6uGbE7Yfia4BoZNojBTA6qT9ic87YyNSocqfFeo7udOdJstnV9wbLsQibhQuBXiabhb56EN/132', 1545994808, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205bheZQfzz8w4f-zYgcbZTQ', 2014, '', 0, 1, '5Lul5bqX', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/uj6ObAM2ca9mzgOqrFmicWpmcZxjjsgI9Xmicz8J00jvFQOiao4a6VZUibPC5Ef3OsNjscblpGBLqbUFHEQKfYGYryLiaaEXlbPj9/132', 1547478640, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20xvzPzeSYADCzn1uxwQRi_c', 2015, '', 0, 1, '5p2O6YeR5Y2O', 1, '中国', '福建', '漳州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3LmsYbxL22ScLEKQzZTLzaSffd955vibQ25pxgHYqQaicCbeCR607YKQdo2Hibeia0bBwTbJ5fS7mTasp/132', 1546502113, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20zKpKlSvbydsr8cuzQr3jC4', 2016, '', 0, 1, '5bCP5YW2', 1, '阿尔及利亚', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZtBmTKI1sgWgMR7XoBsP5D4ILiczMFPE27sJ6dmVgbLBIERp79U6gMyvtkfkVpXeYbic6P7naHHPCr/132', 1548236052, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20_m3fCTQxdU0qGW6qy3U2_M', 2017, '', 0, 1, '5L2z5b6X5LmQ', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fs3xCqH3ic9BKpicppzP9uyMxchkhVvRibYWiajSCEMlx5t69TxiccibhWftxt6txictOfcxUVCY6uhWGAp2lsuxZCaOVd/132', 1548409259, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20_Hvp7plprhDkm8KYcmVqAg', 2018, '', 0, 1, '5aSa5b2p5b+r5Y2w', 1, '中国', '广东', '中山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fsuj7c8P9oDTLMpZAiaicKetWAC8pJ2709L5chbmAFL7v3zRJE0U799GhgkgAqwcUbLPlEV0NgZ3X8hW1mNv4PemU/132', 1574398698, '', 'ADD_SCENE_PAID', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20zJJ6T3RF7lIT0WGB8RoUCo', 2019, '', 0, 1, '6K+a5L+h5Li65pys77ya5pu+55SfMTM1MzU3ODc5MDM=', 0, '', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZpIPGUrqt6jic6kl8Be8fl6Nicib2KAia7jIKf6TWSDyNuTI73NNOx1heViaibialdCpe60YzNDOEB3SKTk/132', 1583916928, '', 'ADD_SCENE_PAID', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-VzEiYTm-4tNnLrmCM8pYs', 2020, '', 0, 1, '5Zyj6aqR5aOr5YC85b6X5L2g5oul5pyJ', 1, '中国', '广西', '贵港', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZh8hKqD3eQODo2AYXnLHb6SvJiakicB81RDWQvCW53mOogo10LVGlI9Wo2dUZib7LCvv9qye5syqvos/132', 1546609987, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS204QA8oU6lgYTbTLhVaTqfF4', 2021, '', 0, 1, '5bmz5Yeh8J+UsOS5i+i3rw==', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fsGXjJWCrvurhXhezPBibWHlxtedNmoxoAJugTbJV9SmaBiaCtQ1dIpAhgbU7YYD4o05n1bMx3uHcXqZtu4HZgapl/132', 1545211397, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS204iggFcBWxKErkTovwY4vUA', 2022, '', 0, 1, '5pyJ57yY5Lq6', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jW3hiby36JGXazZswfD1ibibZmqDInUghwgRXUreGk5hQSibz4UZvLWBzSMRN0CfISqhANbhJSv79aYBrhCXc1TJV83/132', 1547099518, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS208ZQUplebP4mpLnPhtlVzHI', 2023, '', 0, 1, '5ZCR', 1, '中国', '广东', '珠海', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTHZibCOKrXnSUdHpI2kzUUibvPrjrFwyvUb0jtIgTqSqmTX6unHXjIl9jPe0Whre3ia4BoFLrP3FlvibMibcrUeyh0a/132', 1590889960, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS204JXxpI3xo2CsXLJ9vzr5JY', 2024, '', 0, 1, '8J+HqPCfh7NNcl/lvKDmlofwn4eo8J+Hsw==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3LvhklrHVQkoh3dHDMJPPiaiaJGXAk5ibXJ6JSka5qzzWavv1iazdibGEibVW2qaBxzkicpkAP8MOQz7XkEP/132', 1554443938, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20zRAnHazabIjJQqpHsJoTPI', 2025, '', 0, 1, '6aOO6Zuo5LmL5ZCO', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/r9lWu6OlzJvTCy5NbusiaZeMKQYcztX5w49s74j0NrapicCEnibZOicpoYqTprVprr9DoAD9OeibdGLh8BHeoTEQicFOUiaVuQspae3/132', 1545459721, '', 'ADD_SCENE_QR_CODE', '0', '3690499', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20xxni7pJZFoedCGqKnOcQXE', 2026, '', 0, 1, '5Lqu', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZuIqSKrrWsy5ib862AjH43ZACibRVN1kya0muiazicbicdmfCHE5iaeLc50fs2gFzJwsXyyV9rib1Bx8TzN/132', 1547204481, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2081QDY2Pt5bx-7N792xxRwI', 2027, '', 0, 1, 'QUFB8J+SjSDwn5KLIOWNjuWNjg==', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28ftZyHibgJoErM36zjJBwiaZNtB31N0HssA5BLhicxoHbkWWnO34r0orEibqEiaJXlNUAAsDMh1aaJem4JZia0bznTibYje/132', 1547640154, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205JKVxkUEpEvhrQ1iVU6M_o', 2028, '', 0, 1, '54+N5aeQ44CQ6aKI5qSO55eF44CB6IWw6IW/55a855eb77yM5oiR5biu5L2g44CR', 2, '中国', '广东', '深圳', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBQYicuGjH1kiclz5WTfIzWuBnWyZm5pMYOiacWk4yTotuRSxM1oBB5FiczLco23EMdYq0HXqTB5aVQVGE8uBbfmiaMd8/132', 1545279248, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS206scYCWPNEJE_hNsn5GVSY4', 2029, '', 0, 1, '6ZmM6Lev', 2, '中国', '广西', '百色', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/uj6ObAM2ca9mzgOqrFmicWlT7d3IZO0Z4dGWGZI32Fd25jtOjKT2bl5FicKLoWkL9laf5Dlhgm8Ycia3tRw1elePsOm6ibMb0MN1/132', 1546859957, '', 'ADD_SCENE_QR_CODE', '0', '3736830', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wS1R0J7Jy8ZX63GYpniSGE', 2030, '', 0, 1, '5p2O5pWP', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28ftZg77SMrWcBYjbeW1sDQNMnogrXXnZXial6aF4PTnsD9nXq2qRSVF1U4wv8jO5D6RcBLDoica6GOym1Owic0JtSmS/132', 1545976784, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20953JGNSObu6ZihAe08q88Q', 2031, '', 0, 1, '5Y2T6LaK5a6P6aOe', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jXYHBnr0Bqk1hsn3sVLBx3z6M4dCXGHTC7uxDCfTfthYnsUZPTdt9CgaaJdhWzquwciaYQtc4VMpQEmGgmpXm6r0/132', 1547097118, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678889, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20893hSFMHLbEBg2kZt-r8RE', 2032, '', 0, 1, 'QUHvvZ7nrZbpk63lub/lkYrorr7orqHmi5vniYzvvZ7kuKXlgaXmmI4=', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3LokTpolOfgpnNqnliasH4uuRCskqqjPibObFdiacmgIgdxIlWTEI7m3ic8FmRdJfbUtdh3faVWvv0OFn/132', 1544151856, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20_a2h7hVwfqA04RO-pOElto', 2033, '', 0, 1, '6YGp6ICF55Sf5a2Y', 1, '中国', '广东', '肇庆', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZnRjLe3D1kBesCdicnVDCkQgxaq51NCuwoHiaSd0EmN3vUcTGn4sYVZ7trIR3lOhUMFicF4VpT9HBfN/132', 1547560972, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205PX-tcPCYkz2CYnU0VWc8Q', 2034, '', 0, 1, '5b2p5Y2w6YCafuS9leW6huWFiQ==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF97KkwqeT5SYMuKqicic7VWc4ibCChp0clxPHtswdzk8HHajiaqLAyGNfl81edYibzux2hd8xUQP0Mibe79qEao9IgE7E/132', 1576503905, '', 'ADD_SCENE_SEARCH', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20yrehavkzjmOj94HQrSgYsE', 2035, '', 0, 1, '54OIICAg6Ziz', 1, '中国', '湖南', '长沙', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28ftqGibLdpPfjjyx12fhHkw3GwWXK8pXKrvicZtYZrn8XoexJolGFf4S5tEzJS2KjkxzscGthjEwPzccN6JxZ0qPwZ/132', 1545632537, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205sSVOXxUmrrpr0bOK5f7A8', 2036, '', 0, 1, 'd8mqc2tp', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3LuGnINeK90Z7euL9PDficU1aRlXuhwqBV21RDmVSBxUKqTWdwDqm6PczY3Qmj0QkhttPB70iaQHdvU/132', 1547479594, '', 'ADD_SCENE_OTHERS', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20zpBfJsOmIu2TFow__ACrhQ', 2037, '', 0, 1, '5rKI5ZOy6bi/', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvZncTmjdoJTnV5U9oVT7QUbUNsbIKy99HRfwNWjH2jSJQjmPbTyt1gng1A18zzMXH4Vpq91SAd6OwOMtAa64pI/132', 1546774147, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201S4om3tqDJuwg9xLTeJfFw', 2038, '', 0, 1, 'UWlu', 1, '阿曼', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jXkG9ZaFJD5HFVTUyEEyss9Xqz5gCnN3wls1junEp8R0Bpmgpe2liaVYu2I4R6RjBJ6tyw1YBTzhKduuPibPN8ickb/132', 1553153147, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wKW0kYpZunz9p9R2rQwRUs', 2039, '', 0, 1, '5oGS', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/uj6ObAM2ca9mzgOqrFmicWmMiaUQL3WYVBFiaLAuIbsmo1YKdY1LulZs1C3AnUa7q70qrMiaIGQS4RVa8pcuGEQntstzrGia2CGIO/132', 1573008115, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS200yV3TZJaeD4_-6m_kLL5Ho', 2040, '', 0, 1, '6K+a5L+h57uP6JCl77yM5YWx6LWi5aSp5LiL', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3LpJNBUkZicWwcb2JlgKABjHibfGcIFSSzgzU1qDyfzaibicoFXicfDaaeSmJOcVsOmCo1nVCbBjTdp6Nf/132', 1544668603, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS204-5P9xq4fHb2Qa9Rbr9IdA', 2041, '', 0, 1, '5pyJ6LGh6YWS5Z+OLeWImOWwj+idtg==', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBQHRz55VpHI43yKoIPmpQ4mkqt8pTVAuQKR8hN8H0MQoqxwfCgPKe6mnGOVlwGZJA4icZbpSlkib6kwpjFTUiaLVPJ/132', 1543384284, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20x9Vz2-xjWy2UfotshM-3Ug', 2042, '', 0, 1, '5byg5byg8J+nuOC+gOC9sg==', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBR8aQT9Z2kQPkB2Ob2FB0bBO1jibjKUqa2xTicDrDBMQibF5CWfKK6P605LHicqWOSib1JIMLCWqnLXY02sUIetOr4ab/132', 1543887069, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS209fY34TPepaASxySYBqJUyQ', 2043, '', 0, 1, 'QeacieixoeeDn+mFkuWfjjEzOTI2MTM1Mzg4', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/wTQw8pSb6L5EwwP3JNJ7rLKmlvTYuPicUsHI9ib7Mywb6XSCeWRTecciafPWqjksliannnBIWVykhdpXZkmcXv7rGdSReZwiazEO2/132', 1544171771, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20zW5xXbBDmYkuzvhcUdB7wY', 2044, '', 0, 1, '5rip5pyI6I6y', 2, '阿富汗', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/3TuiaqIiacRAVPj8ezqCXSFy8NDQwnolxo0zUJrwxWZfLoc7kNoibLic5OMDIr04VGJxG1diaObHm8nZMEo0mGmPv4gRHXg2T0RDO/132', 1547533232, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20xU956VGjPf8YYKOZ18VgTw', 2045, '', 0, 1, '6ZmI5rW35rOi', 1, '中国', '湖南', '衡阳', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM602b3vqq70oWccBia2ibLljPv42ZNnAWibBXLzQg9IC5RXPL8XkAVPYicYcv7A6HaWsZwhPdZ9OFqwI54EDht8pl9t2kSibn7ibuj08/132', 1552650306, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS209tGN1RqozH8_Bcdtl0iF1M', 2046, '', 0, 1, '5L+K6Im6', 1, '布隆迪', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28ftTRqibzGwsMPdiaicj7ficMhyqcyo4bwUnS4tnlxoibQDT2bVJmnuicicsd6FFIBoeZY10D01fa40NJ50N3SrXaKpZB9N/132', 1575194132, '', 'ADD_SCENE_PAID', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2036-QFBqk8AL0rjQOHJHN_U', 2047, '', 0, 1, '6ZmI5paH5Y2O', 1, '中国', '广东', '揭阳', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jVxfO6Sl16vq1oibCXj7LdicbD2qc0x1wAeRotrbjWiaOKCP2OeRJUWVbzet1lvkKvO8tjAA2hAXIIwEcORLicDafGib/132', 1545923351, '', 'ADD_SCENE_OTHERS', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS202zQqdMuwlM2c4HtqmpLlb0', 2048, '', 0, 1, '6b6Z57qi5qKF', 2, '中国', '广东', '阳江', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZvNw1slT6MZibaZa5YjQUhB4KMjlkQPoMgsC9afochTjU4gIPvUmBtTvM9SUyMTSKf2s9iajCo1a15/132', 1545478498, '', 'ADD_SCENE_OTHERS', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wekKaCWQ6305MhAdk-VqyI', 2049, '', 0, 1, '6ZSL', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jUYO2kVRCW6npPxcKOWaEicnYt0lupx68DibmRibgPVJrAcjA0pmyIWACswPmtkoEEDSuED8ldicSay9al0ph7KhBpM/132', 1543648101, '', 'ADD_SCENE_SEARCH', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS203ods1a4BQuktGY8BrW49WA', 2050, '', 0, 1, '5Lia77yI6byO6K6w5r2u5ZGz6bKc77yJ', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5UoR9h0rWiaAoVIouIt8qIdBaKQBYCXDq8icGOmbXP8Jz8PQ4ic0YXicWrMdyUyGKxiciaaUrwNYSAWslNegX9QEdET5mtaS9s4m0I/132', 1546955132, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207XDPDTpo5QUhpf9s7TUGd0', 2051, '', 0, 1, '5pyJ6LGh5ZWG6LS4Lui/m+WPo+e6oumFki7lvKDmhac=', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/mDRiaU2Cwu6HULeDs2WBdWiacXy4N7ekGcoB6Gmb1oR65g2Y79ricneaummZ9b0zd8mFCJxr1pAZAXJ3g1uLfibY5Bvfl4L98SNf/132', 1546152746, '', 'ADD_SCENE_SEARCH', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20w943tOcybw-sRYJz6YwBdo', 2052, '', 0, 1, 'Y29vbCBraWQ=', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLA63L5BxaUdwcV82dulg2iarzNdpCPMPibHnynSBwkQ4pDFLc6Eqs2gKsibCt9pQ40l89NAtkuqELlcAicTMcDfp7VBho2SAWxhHwE/132', 1546604970, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS208Wj05nL0DIpAbl4HK90ZZI', 2053, '', 0, 1, '6Zi/5omN', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBT6I35PA780VztfoGsoGFicib6hMot5DKODYlbXz0P3J7HfXKJ6bNP4F8mzJjqiaibCdZjZHhl2PBZiaIK57cL4NemHQ/132', 1543849111, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS206OX-vwLGIJcFwwXMeCezsg', 2054, '', 0, 1, '6J6N6YCa', 1, '奥地利', '上奥地利', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWgxSqh3qPgTUoydGG6RJ7c3xeGFTuHUZDQViaMvfYoxKIicRkAGMkETk9kQib6RUTIOm8Tzms85s6RshrYZzlZBDB/132', 1552571071, '', 'ADD_SCENE_QR_CODE', '0', '3881046', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2049ieJge2N1GdAoJg_nSlHM', 2055, '', 0, 1, '5bCP5by655Sf6bKc77yIMTg2NzU3MjI4NDLvvIk=', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF8c6eBL2mMoKbp8RVm1DrjiakBPAaR23rWnJTDjAvWnGUqTOZuicI6nOLtQLlICwLVnnDayjm0Db0RIxEDJVS2agI/132', 1547179820, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205e9AnA18DlWgtdYzKzBie4', 2056, '', 0, 1, '6Zi/5bmz', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGFib68fduDSzibvtgq0q8YI55g27gHJo5VZxAWgecjLBeAgllubyuSartju1tNbnpmZq3QaMWKjTELaHGAHyIb6ZEa/132', 1546771317, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201bRUrLkmByy6cX1Ga459Pg', 2057, '', 0, 1, '5pyx5bu66aOe', 1, '中国', '四川', '乐山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28ft61RkrwVj0DwAbibXIAZSaBbgkBZ5SudkroeuVJhLZPGz1CnRqLBxicBcibcU8SDqgjZIkhvrpRuqvrOlOHbysHC5/132', 1546914129, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS203oJszkrtoywLkaG_WM032Q', 2058, '', 0, 1, 'a3lnbw==', 1, '中国', '广东', '深圳', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGFibmHwaDJPQ675TMju3pibwafq7v060PxqfoeicFrnAqJII3SdAh5kUxsIhLqicg6xB17ATu679wIXpaRZibTxUvfaec/132', 1585551460, '', 'ADD_SCENE_PAID', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS209cVrgTZ5_uwgxxh0A3iWfU', 2059, '', 0, 1, '6ZuF5q6/576O5Lia5a6i5pyN5Y+3', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWicvS9WBL1j4Gt4rG7ibyV1ztkCN9ZLpoCOz5Ij6BxXw6WpCleicUkVXIR24hL89kNVsahwV78lGMT85bkDr0niaJa/132', 1545977909, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS209xbivb1LZSqbzBdTkobfRA', 2060, '', 0, 1, 'Tm90IEZvdW5k', 1, '新加坡', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZqNnOLp7VGh4VnnHuaMFIRV9BM7VVGQqvaqE2DeJZjAicLpAiaJgib12xQg1Z7LCRlv8MQUg1y81RT0/132', 1599189381, '', 'ADD_SCENE_QR_CODE', '176', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2060YW3wFEHRNrlfgFF_KrBw', 2061, '', 0, 1, '5p2O5Y2r5pif', 1, '中国', '广东', '深圳', 'zh_HK', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jXKvGRmRD2H5gpzqnhCcZ65DwtnYqCgOstD9pG5pZW3ia1ZDecebDCn8ibyY1u4Zh2Oo2Y47ia1HqkWoL2GcRzN60c/132', 1546861330, '', 'ADD_SCENE_QR_CODE', '0', '3736830', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-9RET2t6aW7z2alVzzlyVo', 2062, '', 0, 1, '8J+SlyDmooHppqjmnIjwn5KW', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvCMQyXYkhGQ9WcMFDRDibIEV6fwVOc0EtwfRARBolCqEKZvB1pYYeD5oS6tRGyq1xoBtOzsn3jZtTIakyicxQwvA/132', 1546859304, '', 'ADD_SCENE_QR_CODE', '0', '3736830', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2058pgIJV3AWxjRhvc_RP8DU', 2063, '', 0, 1, '6Z+m6I2j6ZuE', 0, '', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZmiatxs8gslEYUy0o3Ie2NeEwTt6OAbph43QVoKdf1YaNQMsibZKniaCmAIN08DqRmuwWaib3guTv2icE/132', 1547290472, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-afpr6TvsDwKwpZd_qgDbY', 2064, '', 0, 1, '5byg5paw5p6XMTM2MzAxNjY4NjE=', 1, '中国', '四川', '广安', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWN4PzKkROQZl4icfibQAJ1oJ2vRibUu3SOuqHs9X0QOrzvqAsLCbBicQb5XzGFRbJWiayKib5yUCQdJreqJ9trhHAhY3/132', 1545288724, '', 'ADD_SCENE_QR_CODE', '0', '3690499', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS202jxDlqnqACT1cjkgwroA0I', 2065, '', 0, 1, '5YOP6aOO5LiA5qC36Ieq55Sx', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fuCavvAibaSG3GfYTLcEsZNqgGNQhpRoznLAicnU2bhsRmTS3FncLgZT9uWTib3ichTfgV7CfR72XR5GziaWKBsZyros/132', 1585312869, '', 'ADD_SCENE_PAID', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-eoPmoOWZndePI3g_3FeQY', 2066, '', 0, 1, 'TGlsefCfkos=', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBRdOc8ZlOia0wibW7VH6RuCIY0Ljl6EZFibee7wBojUXf97RJDMXaUWcjPZjEfcmSxTPtWdX6slpqM8IvadDoq0XYw/132', 1555885012, '', 'ADD_SCENE_QR_CODE', '0', '3881046', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20zA9wAe672XwgTV537ml2Bg', 2067, '', 0, 1, '6Zi/5Yab', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBSESYjxAbH6W1LcQY2IL4gYphhjKCgGllvPu0r3CvZoeHk1LYC1gYeKL93Q6r1hIE9Eic5PT2hjjSc08M0Gmf94K/132', 1545976237, '', 'ADD_SCENE_QR_CODE', '0', '3690499', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201H_yF5Mg7keMccvOr25rmI', 2068, '', 0, 1, '5pyJ6LGh5ZWG6LS46KGM7oCO5p2O5YW1MTU5ODYxMDUwMDk=', 1, '中国', '四川', '南充', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jUwFb5xbLG2AXrIibLenG76qhiaqrq8QZ3qLQbuVXRaqHWzSLvOH3YVAC5hHWEYT7QQQOBicOKFkPxibPiab3qa3yvtB/132', 1543308566, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS204vTbYeE0F9ZB-6AF7AFTAE', 2069, '', 0, 1, '5bqa6L6b6YeR', 1, '中国', '澳门', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF9j8BvbFuTv54bGUyrbeUX8uNKLeodnQD2ibt7cq8x0CJQj0xtbxrcDf59CwbdOTy5GtpNOOT1ibyFQzLzKibrBbHW/132', 1548230115, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207Y1_BtJIZ1QsrdTdJWet_M', 2070, '', 0, 1, '5r6z5Yev5q2M6YWS5Lia772e5byg', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fuJgibg8V1F2ke7DV8EYJDIacVD4bm9tRcpgCXaXibuyFHD7d0mNNYWH2WPvbyrvvVroibich4jES5Kazick5r8bJaJL/132', 1547281440, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2064K8MU2EE_wKWmbrmlDy8I', 2071, '', 0, 1, 'Qm9ubmll', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTYlfibYiaKL1aT6Su6JiaPsszbquCBQichuMZsYbE8KqbNfrV2jRdBXNromLwicGoY4xUzqM49vYuwibZGcEIUkfRyxX/132', 1546572640, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS201bxH5uXQXe8jOAdM3yPtI8', 2072, '', 0, 1, '5a+M5Li95biD6Im6', 1, '中国', '广西', '百色', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/ETzutccAzPu9Z9qfoC9Bsul1UUM4yDYloWutBWamEYb4ADCqNePoeiaCgicWgYHOEnBhicFmHkzgcSySZ5mpUNuAbOGnC3KbvrA/132', 1546861235, '', 'ADD_SCENE_QR_CODE', '0', '3736830', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20xytLrFwWMYmNdsUD1ZL3Qo', 2073, '', 0, 1, '546L6IKy5rab', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTHZibCOKrXnSWKtaTG8R91svtLwFeibv6Y3qHibsTmrHmAuKS5d8ypRMibTWbdOUWrTESMBTJyoNwiaduEjYcWHgiaoF/132', 1545476529, '', 'ADD_SCENE_OTHERS', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20-NtxW0QixjPkhdc0eZDEEo', 2074, '', 0, 1, '6buE55Sf44CC55S15Yqb5bel56iL', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM6dhqRibenAbMJe8QXT4icjOHes0VDVEO6e92DNFHjibeIBanNfscM9J9x54ayEU5WFmuvRchQRgMyFZny0B86AQhRxB5v7l4am6U/132', 1548123268, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205hc03vRfCzgB3aUArz9-_4', 2075, '', 0, 1, '5bel5L2c5Y+3ICBCNTAgICAgIOWwj+eHleWtkCAgICAgIPCfkp4=', 2, '中国', '香港', '北区', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTHZibCOKrXnSThhTRpBhaRy2JloDmxUqV1JlYkCON0zhvcs43BYs1icNtVlckloAZtvJRFb3zXPUW3pVUj6z2q7X/132', 1548579345, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207_CtvzmZMIDWJDCHQiuQus', 2076, '', 0, 1, '5aSp5ram', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jX6SFY0BGUWaa18YvlpgLCp18cYAiagcrIbdRaia3SbzgfouXHmRUbNia2TWbvWqwSI5Snrm9icTclnxwcuw5p0Y1Wq/132', 1545475905, '', 'ADD_SCENE_OTHERS', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20xHVjpL7dViXBTHPCd1TWVI', 2077, '', 0, 1, '5L+u54K85pyq5p2l', 1, '冰岛', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF97KkwqeT5SYM4Q7mLu1GjYZzXelQ0RQDp0ibZBsrN7zJx5C62LuqWTDektMtbdpk7gUAY2es0LGxWyKMiaia27d7c/132', 1546864255, '', 'ADD_SCENE_QR_CODE', '0', '3736830', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205dTG27lkSGdRquNuhGA2Ug', 2078, '', 0, 1, '5bCP6IqxMTgzMTg4OTE5Mzg=', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3LkbKTyEb5huYFibiaibibkjqzVhupc4ic8WkNPMQ6S6Hiash1qM5DEicgEvWuLyExMOTz4k9hO2w4D11SD5/132', 1547189825, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2083MqtgUl1lSFp0P1UQwT10', 2079, '', 0, 1, '6ZuF56aP5a6257q65Y2OMTg5MjcyMzUyMDE=', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jWJAibjFA6JeaZXMLha1IyyjxgLQvMLF84GCAib03Rrts7Qocbo8HYWqrGM023L005pC3LObD6we3dBkpBHHtwFibib/132', 1546600967, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS2041apEmbG8FN-9TFsalr4Ds', 2080, '', 0, 1, 'Q0M=', 2, '中国', '广东', '湛江', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF97KkwqeT5SYHibYccB2fRS37aNPaRLKnPr7Q1SNyDY0NOXvcyGf8mOGYmiaYEtjYcz9Am6pRtNibgicvvwcRpAKZO0/132', 1547788890, '', 'ADD_SCENE_QR_CODE', '0', '3697137', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20000SHot3qAalmAOPT_f7dA', 2081, '', 0, 1, '5riF6aOOMjA0NjMz', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBRRlNITXK1BmdgfLoKib8HTbe31ice0xhW2hKFbibuOVS55rKMicMFkWa15wUiaMvPrx8CyYudN6icFGgPSFydYqmR9Cq/132', 1544954196, '', 'ADD_SCENE_PROFILE_CARD', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS205xLUFhJBOepNvwC3EH28UY', 2082, '', 0, 1, '5b635b63Yg==', 1, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/O4KIs2D28fvBiaX6KTSw3LumDmD7NQlfoEEaw0julTaQKYwcMC5MTluTUibY6nibAZibw9W5vfFFeoQ0GKdQQZYqibOmJ9JseIe2b/132', 1598921947, '', 'ADD_SCENE_QR_CODE', '94', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207eu8pupMK6o4kk-rbp-ayQ', 2083, '', 0, 1, '5LmQ57+g5omT5q+b5Y6CMTg4MjQ4MzA3Njk=', 2, '中国', '广西', '河池', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGFicT1qiaHTkNj7pguDaibF6p9k7s9vicU3eD4FHRZsp2XrpoO3jm0Q4DFmfy4OCo8OU1ebIXOw5oJOWQgJXSibT42wVh/132', 1547467454, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS207TspBK0NH6WOCVjCmRThsU', 2084, '', 0, 1, '5Lik5qCW6Z2S5bm0IOerpeeUnw==', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBSn8vJntkibttYaYKoXUFHwhZ9AZBkJdCDFkPfNFohtrJwafkLhN74kRxX0SGp4cCrUZ4ib7mKicAGqH6QMRtNB9Ip/132', 1545288539, '', 'ADD_SCENE_QR_CODE', '0', '3690499', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wN6ZbBlDd3xmgvR1BAp-IU', 2085, '', 0, 1, '6YeM56iL77yI6ZuF56aP5a6257q677yJ', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/5LmlDaBI0jVBic3bwT838djVVB0BPbsUBGvCibiaS7fXxZk3vjRCDs1G8T6vZFUR5RFuB1IjpYW3YusNiaiaVOcBI4F3W5nIFkj0O/132', 1546947969, '', 'ADD_SCENE_QR_CODE', '0', '3770084', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20666cYLdWVEgzoB8KEg9bVw', 2086, '', 0, 1, '5Lit5bGx5L2V5bu65Yab', 1, '中国', '广东', '中山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM5DsXfNlibhbC1eGJ126IcL4pye52MW8sGezKvqP0ibavX87pJQegziahmFyY1ibndwFOuJqIJEgTqt8Sfdcz5DZxVFu6EUEeAgCmk/132', 1574161829, '', 'ADD_SCENE_PAID', '0', '', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS202KCaXLm1iSkMQrrIA7safg', 2087, '', 0, 1, '8J+SmFlBTkfwn5KY', 2, '中国', '广东', '广州', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/uj6ObAM2ca9mzgOqrFmicWhYlzHCicDjc8u8jA6KJMwnxQAibQbHzN10BR0H0cSHib3lziaOxNoYLKFA9NRHOzlbqO2k3ice95V1Ns/132', 1547455370, '', 'ADD_SCENE_QR_CODE', '0', '3794914', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20wH1RtZPIpJfzNqSaZju1AY', 2088, '', 0, 1, '5LiJ5ZGz55yf54Gr', 1, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/4GGZ9nOreGBRYAhZ2v1Hx2so5OOWIVU7MOlW9WmOh94N2zbRMfsBJlNtHuebWmCWwjue4jW6MbAtB5JNtjnNibwVicqtUYicGcV/132', 1552571091, '', 'ADD_SCENE_QR_CODE', '0', '3881046', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS200QEEg87pr3tjW9390A33Zk', 2089, '', 0, 1, '5pyJ6LGh5ZWG6LS4Lui/m+WPo+e6oumFkg==', 2, '安道尔', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGFibOxficvxWFAgwjJyszgJMhRxicpZNC13icZKKPBkF2V0mozudicAIa8XrajqwBqIw7dQ0vViciap80dwEv0x96qautdia/132', 1559157731, '', 'ADD_SCENE_QR_CODE', '0', '3697128', 1619678891, 4);
INSERT INTO `tb_shop_wechat_fans` VALUES ('o6IS20484u6tb103FD6474WkZ418', 2090, '', 0, 1, '6Z2S5pil5bCR5bm0', 2, '中国', '广东', '佛山', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/eniayhpspPBTHZibCOKrXnSYTCiah9zRVQEdW3V8PibrbxdK4Tm5ck1nHPfVKqpKIgoJvyHMJlPSzGmszrXnyjzYSpubC0oicb5iau/132', 1547545056, '', 'ADD_SCENE_QR_CODE', '0', '3696977', 1619678891, 4);

-- ----------------------------
-- Table structure for tb_shop_wechat_keys
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_wechat_keys`;
CREATE TABLE `tb_shop_wechat_keys`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(10) NULL DEFAULT NULL COMMENT '商户id',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(text,image,news)',
  `keys` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文本内容',
  `mediaId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '素材id（直接回复素材用）',
  `image_mediaId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片素材id',
  `news_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '排序字段',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_wechat_keys_type`(`type`) USING BTREE,
  INDEX `index_wechat_keys_keys`(`keys`) USING BTREE,
  INDEX `index_wechat_keys_appid`(`merchant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信-规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_wechat_keys
-- ----------------------------
INSERT INTO `tb_shop_wechat_keys` VALUES (1, 4, 'text', 'subscribe', '你好呀', NULL, NULL, NULL, 0, 1, 1620107035);

-- ----------------------------
-- Table structure for tb_shop_wechat_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_wechat_news`;
CREATE TABLE `tb_shop_wechat_news`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部url链接',
  `merchant_id` int(10) NULL DEFAULT NULL COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `create_time` int(12) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信-图文' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shop_wechat_news
-- ----------------------------

-- ----------------------------
-- Table structure for tb_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_admin`;
CREATE TABLE `tb_system_admin`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用,)',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_admin
-- ----------------------------
INSERT INTO `tb_system_admin` VALUES (1, NULL, '/static/admin/images/head.jpg', 'admin', 'a33b679d5581a8692988ec9f92ad2d6a2259eaa7', NULL, '', 32, 0, 1, 1618450298, 1620107266, NULL);

-- ----------------------------
-- Table structure for tb_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_auth`;
CREATE TABLE `tb_system_auth`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_auth
-- ----------------------------
INSERT INTO `tb_system_auth` VALUES (1, '管理员', 1, 1, '总后台管理员', 1588921753, 1618466307, NULL);
INSERT INTO `tb_system_auth` VALUES (6, '游客权限', 0, 1, '', 1588227513, 1589591751, 1589591751);
INSERT INTO `tb_system_auth` VALUES (7, '代理商', 0, 1, '代理商权限', 1618466253, 1618466253, NULL);
INSERT INTO `tb_system_auth` VALUES (8, '商家', 0, 1, '商家权限', 1618466284, 1618466284, NULL);

-- ----------------------------
-- Table structure for tb_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_auth_node`;
CREATE TABLE `tb_system_auth_node`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint(20) NULL DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_system_auth_auth`(`auth_id`) USING BTREE,
  INDEX `index_system_auth_node`(`node_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与节点关系表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_auth_node
-- ----------------------------
INSERT INTO `tb_system_auth_node` VALUES (1, 6, 1);
INSERT INTO `tb_system_auth_node` VALUES (2, 6, 2);
INSERT INTO `tb_system_auth_node` VALUES (3, 6, 9);
INSERT INTO `tb_system_auth_node` VALUES (4, 6, 12);
INSERT INTO `tb_system_auth_node` VALUES (5, 6, 18);
INSERT INTO `tb_system_auth_node` VALUES (6, 6, 19);
INSERT INTO `tb_system_auth_node` VALUES (7, 6, 21);
INSERT INTO `tb_system_auth_node` VALUES (8, 6, 22);
INSERT INTO `tb_system_auth_node` VALUES (9, 6, 29);
INSERT INTO `tb_system_auth_node` VALUES (10, 6, 30);
INSERT INTO `tb_system_auth_node` VALUES (11, 6, 38);
INSERT INTO `tb_system_auth_node` VALUES (12, 6, 39);
INSERT INTO `tb_system_auth_node` VALUES (13, 6, 45);
INSERT INTO `tb_system_auth_node` VALUES (14, 6, 46);
INSERT INTO `tb_system_auth_node` VALUES (15, 6, 52);
INSERT INTO `tb_system_auth_node` VALUES (16, 6, 53);
INSERT INTO `tb_system_auth_node` VALUES (17, 1, 1);
INSERT INTO `tb_system_auth_node` VALUES (18, 1, 2);
INSERT INTO `tb_system_auth_node` VALUES (19, 1, 3);
INSERT INTO `tb_system_auth_node` VALUES (20, 1, 4);
INSERT INTO `tb_system_auth_node` VALUES (21, 1, 5);
INSERT INTO `tb_system_auth_node` VALUES (22, 1, 6);
INSERT INTO `tb_system_auth_node` VALUES (23, 1, 7);
INSERT INTO `tb_system_auth_node` VALUES (24, 1, 8);
INSERT INTO `tb_system_auth_node` VALUES (25, 1, 9);
INSERT INTO `tb_system_auth_node` VALUES (26, 1, 10);
INSERT INTO `tb_system_auth_node` VALUES (27, 1, 11);
INSERT INTO `tb_system_auth_node` VALUES (28, 1, 12);
INSERT INTO `tb_system_auth_node` VALUES (29, 1, 13);
INSERT INTO `tb_system_auth_node` VALUES (30, 1, 14);
INSERT INTO `tb_system_auth_node` VALUES (31, 1, 15);
INSERT INTO `tb_system_auth_node` VALUES (32, 1, 16);
INSERT INTO `tb_system_auth_node` VALUES (33, 1, 17);
INSERT INTO `tb_system_auth_node` VALUES (34, 1, 18);
INSERT INTO `tb_system_auth_node` VALUES (35, 1, 19);
INSERT INTO `tb_system_auth_node` VALUES (36, 1, 20);
INSERT INTO `tb_system_auth_node` VALUES (37, 1, 21);
INSERT INTO `tb_system_auth_node` VALUES (38, 1, 22);
INSERT INTO `tb_system_auth_node` VALUES (39, 1, 23);
INSERT INTO `tb_system_auth_node` VALUES (40, 1, 24);
INSERT INTO `tb_system_auth_node` VALUES (41, 1, 25);
INSERT INTO `tb_system_auth_node` VALUES (42, 1, 26);
INSERT INTO `tb_system_auth_node` VALUES (43, 1, 27);
INSERT INTO `tb_system_auth_node` VALUES (44, 1, 28);
INSERT INTO `tb_system_auth_node` VALUES (45, 1, 29);
INSERT INTO `tb_system_auth_node` VALUES (46, 1, 30);
INSERT INTO `tb_system_auth_node` VALUES (47, 1, 31);
INSERT INTO `tb_system_auth_node` VALUES (48, 1, 32);
INSERT INTO `tb_system_auth_node` VALUES (49, 1, 33);
INSERT INTO `tb_system_auth_node` VALUES (50, 1, 34);
INSERT INTO `tb_system_auth_node` VALUES (51, 1, 35);
INSERT INTO `tb_system_auth_node` VALUES (52, 1, 36);
INSERT INTO `tb_system_auth_node` VALUES (53, 1, 37);
INSERT INTO `tb_system_auth_node` VALUES (54, 1, 38);
INSERT INTO `tb_system_auth_node` VALUES (55, 1, 39);
INSERT INTO `tb_system_auth_node` VALUES (56, 1, 40);
INSERT INTO `tb_system_auth_node` VALUES (57, 1, 41);
INSERT INTO `tb_system_auth_node` VALUES (58, 1, 42);
INSERT INTO `tb_system_auth_node` VALUES (59, 1, 43);
INSERT INTO `tb_system_auth_node` VALUES (60, 1, 44);
INSERT INTO `tb_system_auth_node` VALUES (61, 1, 45);
INSERT INTO `tb_system_auth_node` VALUES (62, 1, 46);
INSERT INTO `tb_system_auth_node` VALUES (63, 1, 47);
INSERT INTO `tb_system_auth_node` VALUES (64, 1, 48);
INSERT INTO `tb_system_auth_node` VALUES (65, 1, 49);
INSERT INTO `tb_system_auth_node` VALUES (66, 1, 50);
INSERT INTO `tb_system_auth_node` VALUES (67, 1, 51);
INSERT INTO `tb_system_auth_node` VALUES (68, 1, 52);
INSERT INTO `tb_system_auth_node` VALUES (69, 1, 53);
INSERT INTO `tb_system_auth_node` VALUES (70, 1, 54);
INSERT INTO `tb_system_auth_node` VALUES (71, 1, 55);
INSERT INTO `tb_system_auth_node` VALUES (72, 1, 56);
INSERT INTO `tb_system_auth_node` VALUES (73, 1, 57);
INSERT INTO `tb_system_auth_node` VALUES (74, 1, 58);
INSERT INTO `tb_system_auth_node` VALUES (75, 1, 59);
INSERT INTO `tb_system_auth_node` VALUES (76, 1, 60);
INSERT INTO `tb_system_auth_node` VALUES (77, 1, 61);
INSERT INTO `tb_system_auth_node` VALUES (78, 1, 62);
INSERT INTO `tb_system_auth_node` VALUES (79, 1, 63);
INSERT INTO `tb_system_auth_node` VALUES (80, 1, 64);
INSERT INTO `tb_system_auth_node` VALUES (81, 1, 65);
INSERT INTO `tb_system_auth_node` VALUES (82, 1, 66);
INSERT INTO `tb_system_auth_node` VALUES (83, 1, 67);
INSERT INTO `tb_system_auth_node` VALUES (84, 1, 68);

-- ----------------------------
-- Table structure for tb_system_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_config`;
CREATE TABLE `tb_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '变量值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) NULL DEFAULT 0,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `group`(`group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_config
-- ----------------------------
INSERT INTO `tb_system_config` VALUES (41, 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (42, 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (55, 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (56, 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '允许上传的文件类型', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (57, 'upload_allow_size', 'upload', '9024000', '允许上传的大小', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (58, 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (59, 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (60, 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (61, 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (62, 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (63, 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (64, 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (65, 'logo_title', 'site', '客云来', 'LOGO标题', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (66, 'logo_image', 'site', '/favicon.ico', 'logo图片', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (68, 'site_name', 'site', '客云来后台系统', '站点名称', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (69, 'site_ico', 'site', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '浏览器图标', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (70, 'site_copyright', 'site', '©版权所有 2014-2018 叁贰柒工作室66', '版权信息', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (71, 'site_beian', 'site', '粤ICP备16006642号-2', '备案信息', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (72, 'site_version', 'site', '2.0.0', '版本信息', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (75, 'sms_type', 'sms', 'alisms', '短信类型', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (76, 'miniapp_appid', 'wechat', '填你的', '小程序公钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (77, 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (78, 'web_appid', 'wechat', '填你的', '公众号公钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (79, 'web_appsecret', 'wechat', '填你的', '公众号私钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (80, 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (81, 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (82, 'txcos_region', 'upload', '填你的', '存储桶地域', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (83, 'tecos_bucket', 'upload', '填你的', '存储桶名称', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (84, 'qnoss_access_key', 'upload', '填你的', '访问密钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (85, 'qnoss_secret_key', 'upload', '填你的', '安全密钥', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (86, 'qnoss_bucket', 'upload', '填你的', '存储空间', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (87, 'qnoss_domain', 'upload', '填你的', '访问域名', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (88, 'douyin_domain', 'douyin', 'https://www.s280.com', '抖音回调域名', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (89, 'client_key', 'douyin', 'awxfism98wg9g4c5', '抖音client_key', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (90, 'client_secret', 'douyin', '362cbdce8beb00dc3ddadc8dca839bc8', '抖音client_secret', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (91, 'site_url', 'site', 'https://www.s280.com', '站点域名', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (92, 'app_id', 'open_wechat', 'wx1e6783d3ebdd454f', '第三方平台appid', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (93, 'secret', 'open_wechat', '072284f9ce5a4b2763648eabf9176268', '第三方平台AppSecret ', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (94, 'token', 'open_wechat', 'weixin', '第三方平台Token', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (95, 'aes_key', 'open_wechat', 'ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty', '第三方平台 AES Key', 0, NULL, NULL);
INSERT INTO `tb_system_config` VALUES (100, 'auth_code', 'open_wechat', '123445', '第三方平台授权码', 0, 1619162401, 1619162401);
INSERT INTO `tb_system_config` VALUES (101, 'expires_in', 'open_wechat', '1619163098', '第三方平台授权码过期时间', 0, 1619162401, 1619162401);

-- ----------------------------
-- Table structure for tb_system_log_202104
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_log_202104`;
CREATE TABLE `tb_system_log_202104`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '管理员ID',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 770 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台操作日志表 - 202104' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_log_202104
-- ----------------------------
INSERT INTO `tb_system_log_202104` VALUES (630, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"ofvu\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618450318);
INSERT INTO `tb_system_log_202104` VALUES (631, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"qabq\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618450331);
INSERT INTO `tb_system_log_202104` VALUES (632, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"em6p\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618450545);
INSERT INTO `tb_system_log_202104` VALUES (633, NULL, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"jxbf\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618456127);
INSERT INTO `tb_system_log_202104` VALUES (634, NULL, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"查ri\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618456133);
INSERT INTO `tb_system_log_202104` VALUES (635, NULL, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"nfik\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618456141);
INSERT INTO `tb_system_log_202104` VALUES (636, NULL, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"3t3k\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618456955);
INSERT INTO `tb_system_log_202104` VALUES (637, 1, '/admin/system.config/save', 'post', '', '{\"site_name\":\"客云来-后台系统\",\"site_ico\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/7d32671f4c1d1b01b0b28f45205763f9.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"粤ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2014-2018 叁贰柒工作室66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618457045);
INSERT INTO `tb_system_log_202104` VALUES (638, 1, '/admin/system.config/save', 'post', '', '{\"site_name\":\"客云来后台系统\",\"site_ico\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/7d32671f4c1d1b01b0b28f45205763f9.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"粤ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2014-2018 叁贰柒工作室66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618457460);
INSERT INTO `tb_system_log_202104` VALUES (639, 1, '/admin/system.config/save', 'post', '', '{\"site_name\":\"客云来后台系统\",\"site_ico\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/7d32671f4c1d1b01b0b28f45205763f9.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"粤ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2014-2018 叁贰柒工作室66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618457476);
INSERT INTO `tb_system_log_202104` VALUES (640, 1, '/admin/system.config/save', 'post', '', '{\"logo_title\":\"客云来\",\"logo_image\":\"\\/favicon.ico\",\"file\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618457919);
INSERT INTO `tb_system_log_202104` VALUES (641, 1, '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618458248);
INSERT INTO `tb_system_log_202104` VALUES (642, 1, '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618458362);
INSERT INTO `tb_system_log_202104` VALUES (643, 1, '/admin/system.config/save', 'post', '', '{\"douyin_domain\":\"http:\\/\\/screen.c\\/\",\"douyin_client_key\":\"awzf4kfetr9xb1ja\",\"douyin_client_secret\":\"1d3acd6b96db020815105a67e4b8c92e\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618459021);
INSERT INTO `tb_system_log_202104` VALUES (644, 1, '/admin/system.config/save', 'post', '', '{\"douyin_domain\":\"http:\\/\\/screen.c\\/\",\"douyin_client_key\":\"awzf4kfetr9xb1ja\",\"douyin_client_secret\":\"1d3acd6b96db020815105a67e4b8c92e\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618459421);
INSERT INTO `tb_system_log_202104` VALUES (645, 1, '/admin/system.config/save', 'post', '', '{\"douyin_domain\":\"http:\\/\\/screen.c\\/\",\"douyin_client_key\":\"awzf4kfetr9xb1ja\",\"douyin_client_secret\":\"1d3acd6b96db020815105a67e4b8c92e\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618459457);
INSERT INTO `tb_system_log_202104` VALUES (646, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"nbhf\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618465988);
INSERT INTO `tb_system_log_202104` VALUES (647, 1, '/admin/system.auth/add', 'post', '', '{\"title\":\"代理商\",\"remark\":\"代理商权限\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618466252);
INSERT INTO `tb_system_log_202104` VALUES (648, 1, '/admin/system.auth/add', 'post', '', '{\"title\":\"商家\",\"remark\":\"商家权限\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618466284);
INSERT INTO `tb_system_log_202104` VALUES (649, 1, '/admin/system.auth/edit?id=1', 'post', '', '{\"id\":\"1\",\"title\":\"管理员\",\"remark\":\"总后台管理员\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618466307);
INSERT INTO `tb_system_log_202104` VALUES (650, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618466349);
INSERT INTO `tb_system_log_202104` VALUES (651, 1, '/admin/system.menu/edit?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"0\",\"title\":\"代理管理\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618472123);
INSERT INTO `tb_system_log_202104` VALUES (652, 1, '/admin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"商家管理\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618472146);
INSERT INTO `tb_system_log_202104` VALUES (653, 1, '/admin/system.menu/add?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"254\",\"title\":\"商家列表\",\"href\":\"shop.shop\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618473052);
INSERT INTO `tb_system_log_202104` VALUES (654, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"vd7b\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618473212);
INSERT INTO `tb_system_log_202104` VALUES (655, 1, '/admin/system.menu/edit?id=255', 'post', '', '{\"id\":\"255\",\"pid\":\"254\",\"title\":\"商家列表\",\"href\":\"shop.merchant\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618473392);
INSERT INTO `tb_system_log_202104` VALUES (656, 1, '/admin/system.menu/edit?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"0\",\"title\":\"商户管理\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618473675);
INSERT INTO `tb_system_log_202104` VALUES (657, 1, '/admin/system.menu/edit?id=255', 'post', '', '{\"id\":\"255\",\"pid\":\"254\",\"title\":\"商户列表\",\"href\":\"shop.merchant\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618473683);
INSERT INTO `tb_system_log_202104` VALUES (658, 1, '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618476835);
INSERT INTO `tb_system_log_202104` VALUES (659, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"0:00 - 0:00\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"2255\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618476912);
INSERT INTO `tb_system_log_202104` VALUES (660, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"0:00 - 0:00\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"2255\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618476916);
INSERT INTO `tb_system_log_202104` VALUES (661, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"0:00 - 0:00\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"2255\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618476937);
INSERT INTO `tb_system_log_202104` VALUES (662, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"0:00 - 0:00\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"2255\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618477018);
INSERT INTO `tb_system_log_202104` VALUES (663, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-05 - 2021-05-29\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618477444);
INSERT INTO `tb_system_log_202104` VALUES (664, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-14 ~ 2021-05-31\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618477671);
INSERT INTO `tb_system_log_202104` VALUES (665, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-14 ~ 2021-05-31\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618477871);
INSERT INTO `tb_system_log_202104` VALUES (666, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-14 ~ 2021-05-31\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618477962);
INSERT INTO `tb_system_log_202104` VALUES (667, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-14 ~ 2021-05-31\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618478015);
INSERT INTO `tb_system_log_202104` VALUES (668, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"jy35\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618480433);
INSERT INTO `tb_system_log_202104` VALUES (669, 1, '/admin/shop.merchant/edit?id=2', 'post', '', '{\"id\":\"2\",\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"2edf895d7f04c4711a1e9f570ff1872ae53b99de\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-14 ~ 2021-05-31\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618480664);
INSERT INTO `tb_system_log_202104` VALUES (670, 1, '/admin/shop.merchant/edit?id=2', 'post', '', '{\"id\":\"2\",\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"2edf895d7f04c4711a1e9f570ff1872ae53b99de\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-14 ~ 2021-05-31\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618480670);
INSERT INTO `tb_system_log_202104` VALUES (671, 1, '/admin/shop.merchant/edit?id=2', 'post', '', '{\"id\":\"2\",\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"2edf895d7f04c4711a1e9f570ff1872ae53b99de\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-14 ~ 2021-05-31\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618480693);
INSERT INTO `tb_system_log_202104` VALUES (672, 1, '/admin/shop.merchant/edit?id=2', 'post', '', '{\"id\":\"2\",\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"2edf895d7f04c4711a1e9f570ff1872ae53b99de\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-14 ~ 2021-05-31\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618480758);
INSERT INTO `tb_system_log_202104` VALUES (673, 1, '/admin/shop.merchant/edit?id=2', 'post', '', '{\"id\":\"2\",\"name\":\"test商家\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"2edf895d7f04c4711a1e9f570ff1872ae53b99de\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-14 ~ 2021-05-31\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618480783);
INSERT INTO `tb_system_log_202104` VALUES (674, NULL, '/shop/login/index.html', 'post', '', '{\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"2bh7\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618482291);
INSERT INTO `tb_system_log_202104` VALUES (675, NULL, '/shop/login/index.html', 'post', '', '{\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"e7uw\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618482393);
INSERT INTO `tb_system_log_202104` VALUES (676, NULL, '/shop/login/index.html', 'post', '', '{\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xlk2\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618482715);
INSERT INTO `tb_system_log_202104` VALUES (677, NULL, '/shop/login/index.html', 'post', '', '{\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"unr5\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618482767);
INSERT INTO `tb_system_log_202104` VALUES (678, NULL, '/shop/login/index.html', 'post', '', '{\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"unr5\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618482778);
INSERT INTO `tb_system_log_202104` VALUES (679, NULL, '/shop/login/index.html', 'post', '', '{\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"unr5\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618482782);
INSERT INTO `tb_system_log_202104` VALUES (680, NULL, '/shop/login/index.html', 'post', '', '{\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"aley\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618482794);
INSERT INTO `tb_system_log_202104` VALUES (681, NULL, '/shop/login/index.html', 'post', '', '{\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"3q5n\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618482870);
INSERT INTO `tb_system_log_202104` VALUES (682, NULL, '/shop/login/index.html', 'post', '', '{\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"cvne\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618482931);
INSERT INTO `tb_system_log_202104` VALUES (683, NULL, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"gdcf\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1618483688);
INSERT INTO `tb_system_log_202104` VALUES (684, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"bhbq\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618536181);
INSERT INTO `tb_system_log_202104` VALUES (685, 1, '/admin/system.auth/saveAuthorize', 'post', '', '{\"title\":\"管理员\",\"node\":\"[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68]\",\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618536989);
INSERT INTO `tb_system_log_202104` VALUES (686, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"j56x\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618622311);
INSERT INTO `tb_system_log_202104` VALUES (687, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"vnqh\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618631651);
INSERT INTO `tb_system_log_202104` VALUES (688, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"augi\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618641214);
INSERT INTO `tb_system_log_202104` VALUES (689, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"dxxr\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618650575);
INSERT INTO `tb_system_log_202104` VALUES (690, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"y8vn\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618656630);
INSERT INTO `tb_system_log_202104` VALUES (691, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"唯企悦客服\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618656649);
INSERT INTO `tb_system_log_202104` VALUES (692, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"唯企悦客服\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618656654);
INSERT INTO `tb_system_log_202104` VALUES (693, 1, '/admin/shop.merchant/add', 'post', '', '{\"name\":\"唯企悦客服\",\"logo\":\"http:\\/\\/screen.c\\/upload\\/20210415\\/db6785ed88ff6e19ab55478088773cf4.jpg\",\"file\":\"\",\"staff\":\"5500\",\"phone\":\"15812428301\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"佛山市南海区狮山镇白沙桥庄边\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-01 ~ 2021-05-29\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618656710);
INSERT INTO `tb_system_log_202104` VALUES (694, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"8gfa\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618818686);
INSERT INTO `tb_system_log_202104` VALUES (695, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"dhig\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618826464);
INSERT INTO `tb_system_log_202104` VALUES (696, 1, '/admin/system.config/save', 'post', '', '{\"upload_type\":\"local\",\"upload_allow_ext\":\"doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg\",\"upload_allow_size\":\"9024000\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618826853);
INSERT INTO `tb_system_log_202104` VALUES (697, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"3eza\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618903990);
INSERT INTO `tb_system_log_202104` VALUES (698, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"aum3\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618904123);
INSERT INTO `tb_system_log_202104` VALUES (699, 1, '/admin/system.menu/add?id=250', 'post', '', '{\"id\":\"250\",\"pid\":\"250\",\"title\":\"免费\",\"href\":\"#\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618909815);
INSERT INTO `tb_system_log_202104` VALUES (700, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"qckk\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1619004527);
INSERT INTO `tb_system_log_202104` VALUES (701, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"kuym\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619058082);
INSERT INTO `tb_system_log_202104` VALUES (702, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"jcgm\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619071290);
INSERT INTO `tb_system_log_202104` VALUES (703, 1, '/admin/system.config/save', 'post', '', '{\"douyin_domain\":\"http:\\/\\/screen.c\\/\",\"client_key\":\" awxfism98wg9g4c5\",\"client_secret\":\"362cbdce8beb00dc3ddadc8dca839bc8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619071322);
INSERT INTO `tb_system_log_202104` VALUES (704, NULL, '/admin/system.config/save', 'post', '', '{\"douyin_domain\":\"http:\\/\\/screen.c\\/\",\"client_key\":\" awxfism98wg9g4c5\",\"client_secret\":\"362cbdce8beb00dc3ddadc8dca839bc8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619071428);
INSERT INTO `tb_system_log_202104` VALUES (705, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"chfb\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619071439);
INSERT INTO `tb_system_log_202104` VALUES (706, 1, '/admin/system.config/save', 'post', '', '{\"douyin_domain\":\"http:\\/\\/screen.c\\/\",\"client_key\":\" awxfism98wg9g4c5\",\"client_secret\":\"362cbdce8beb00dc3ddadc8dca839bc8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619071449);
INSERT INTO `tb_system_log_202104` VALUES (707, 1, '/admin/system.config/save', 'post', '', '{\"douyin_domain\":\"http:\\/\\/screen.c\\/\",\"client_key\":\" awxfism98wg9g4c5\",\"client_secret\":\"362cbdce8beb00dc3ddadc8dca839bc8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619071495);
INSERT INTO `tb_system_log_202104` VALUES (708, 1, '/admin/system.config/save', 'post', '', '{\"douyin_domain\":\"http:\\/\\/screen.c\\/\",\"client_key\":\" awxfism98wg9g4c5\",\"client_secret\":\"362cbdce8beb00dc3ddadc8dca839bc8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619071532);
INSERT INTO `tb_system_log_202104` VALUES (709, 1, '/admin/system.config/save', 'post', '', '{\"douyin_domain\":\"https:\\/\\/www.s280.com\",\"client_key\":\"awxfism98wg9g4c5\",\"client_secret\":\"362cbdce8beb00dc3ddadc8dca839bc8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619071654);
INSERT INTO `tb_system_log_202104` VALUES (710, 1, '/admin/system.config/save', 'post', '', '{\"site_url\":\"https:\\/\\/www.s280.com\",\"site_name\":\"客云来后台系统\",\"site_ico\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/7d32671f4c1d1b01b0b28f45205763f9.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"粤ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2014-2018 叁贰柒工作室66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1619072052);
INSERT INTO `tb_system_log_202104` VALUES (711, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"f8tt\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619077156);
INSERT INTO `tb_system_log_202104` VALUES (712, 1, '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619077191);
INSERT INTO `tb_system_log_202104` VALUES (713, 1, '/admin/shop.merchant/add', 'post', '', '{\"\\/admin\\/shop_merchant\\/add\":\"\",\"name\":\"huang\",\"logo\":\"http:\\/\\/www.screen.c\\/upload\\/20210422\\/24edbf26618ce6ab17632071ac9f6576.jpg\",\"file\":\"\",\"staff\":\"\",\"phone\":\"13724005183\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"address\":\"广东佛山\",\"limit_count\":\"2\",\"activity_num\":\"2\",\"time_limit\":\"2021-04-01 ~ 2021-05-31\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619077288);
INSERT INTO `tb_system_log_202104` VALUES (714, 1, '/admin/shop.merchant/edit?id=4', 'post', '', '{\"\\/admin\\/shop_merchant\\/edit\":\"\",\"id\":\"4\",\"name\":\"huang\",\"logo\":\"http:\\/\\/www.screen.c\\/upload\\/20210422\\/24edbf26618ce6ab17632071ac9f6576.jpg\",\"file\":\"\",\"staff\":\"\",\"phone\":\"13724005183\",\"password\":\"2edf895d7f04c4711a1e9f570ff1872ae53b99de\",\"address\":\"广东佛山\",\"limit_count\":\"0\",\"activity_num\":\"0\",\"time_limit\":\"2021-04-01 ~ 2021-05-31\",\"status\":\"1\",\"set_activity\":\"1\",\"check_activity\":\"1\",\"set_coupon\":\"1\",\"consume_type\":\"0\",\"consume_code\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619077690);
INSERT INTO `tb_system_log_202104` VALUES (715, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"13724005183\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"hv5w\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619085056);
INSERT INTO `tb_system_log_202104` VALUES (716, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"8kme\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619085063);
INSERT INTO `tb_system_log_202104` VALUES (717, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"euzd\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619141161);
INSERT INTO `tb_system_log_202104` VALUES (718, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"dcq4\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619141172);
INSERT INTO `tb_system_log_202104` VALUES (719, 1, '/admin/system.config/save', 'post', '', '{\"\\/admin\\/system_config\\/save\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619150314);
INSERT INTO `tb_system_log_202104` VALUES (720, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"13724005183\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"pemw\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619150326);
INSERT INTO `tb_system_log_202104` VALUES (721, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"fnrd\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619150333);
INSERT INTO `tb_system_log_202104` VALUES (722, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619157332);
INSERT INTO `tb_system_log_202104` VALUES (723, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619157340);
INSERT INTO `tb_system_log_202104` VALUES (724, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619157395);
INSERT INTO `tb_system_log_202104` VALUES (725, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158542);
INSERT INTO `tb_system_log_202104` VALUES (726, NULL, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158548);
INSERT INTO `tb_system_log_202104` VALUES (727, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"ebfx\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158558);
INSERT INTO `tb_system_log_202104` VALUES (728, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158572);
INSERT INTO `tb_system_log_202104` VALUES (729, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158615);
INSERT INTO `tb_system_log_202104` VALUES (730, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158686);
INSERT INTO `tb_system_log_202104` VALUES (731, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158792);
INSERT INTO `tb_system_log_202104` VALUES (732, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158862);
INSERT INTO `tb_system_log_202104` VALUES (733, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158895);
INSERT INTO `tb_system_log_202104` VALUES (734, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158946);
INSERT INTO `tb_system_log_202104` VALUES (735, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619158979);
INSERT INTO `tb_system_log_202104` VALUES (736, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619159065);
INSERT INTO `tb_system_log_202104` VALUES (737, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619159682);
INSERT INTO `tb_system_log_202104` VALUES (738, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619159719);
INSERT INTO `tb_system_log_202104` VALUES (739, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619163225);
INSERT INTO `tb_system_log_202104` VALUES (740, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619163656);
INSERT INTO `tb_system_log_202104` VALUES (741, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619163692);
INSERT INTO `tb_system_log_202104` VALUES (742, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619164859);
INSERT INTO `tb_system_log_202104` VALUES (743, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619164908);
INSERT INTO `tb_system_log_202104` VALUES (744, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619164927);
INSERT INTO `tb_system_log_202104` VALUES (745, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619165139);
INSERT INTO `tb_system_log_202104` VALUES (746, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619165147);
INSERT INTO `tb_system_log_202104` VALUES (747, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619165218);
INSERT INTO `tb_system_log_202104` VALUES (748, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619165228);
INSERT INTO `tb_system_log_202104` VALUES (749, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619165261);
INSERT INTO `tb_system_log_202104` VALUES (750, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619165315);
INSERT INTO `tb_system_log_202104` VALUES (751, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619165325);
INSERT INTO `tb_system_log_202104` VALUES (752, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619165349);
INSERT INTO `tb_system_log_202104` VALUES (753, 1, '/admin/system.config/saveWechat', 'post', '', '{\"\\/admin\\/system_config\\/saveWechat\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619167049);
INSERT INTO `tb_system_log_202104` VALUES (754, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"7utz\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619167061);
INSERT INTO `tb_system_log_202104` VALUES (755, 1, '/admin/system.config/save', 'post', '', '{\"\\/admin\\/system_config\\/save\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619167073);
INSERT INTO `tb_system_log_202104` VALUES (756, 1, '/admin/system.config/auth', 'post', '', '{\"\\/admin\\/system_config\\/auth\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619167219);
INSERT INTO `tb_system_log_202104` VALUES (757, 1, '/admin/system.config/save', 'post', '', '{\"\\/admin\\/system_config\\/save\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619167600);
INSERT INTO `tb_system_log_202104` VALUES (758, 1, '/admin/system.config/save', 'post', '', '{\"\\/admin\\/system_config\\/save\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619167643);
INSERT INTO `tb_system_log_202104` VALUES (759, 1, '/admin/system.config/save', 'post', '', '{\"\\/admin\\/system_config\\/save\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619167668);
INSERT INTO `tb_system_log_202104` VALUES (760, 1, '/admin/system.config/save', 'post', '', '{\"\\/admin\\/system_config\\/save\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"072284f9ce5a4b2763648eabf9176268\",\"token\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619167700);
INSERT INTO `tb_system_log_202104` VALUES (761, 1, '/admin/system.config/auth', 'post', '', '{\"\\/admin\\/system_config\\/auth\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"072284f9ce5a4b2763648eabf9176268\",\"token\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619169239);
INSERT INTO `tb_system_log_202104` VALUES (762, 1, '/admin/system.config/auth', 'post', '', '{\"\\/admin\\/system_config\\/auth\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"072284f9ce5a4b2763648eabf9176268\",\"token\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619171167);
INSERT INTO `tb_system_log_202104` VALUES (763, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"ef8w\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619236251);
INSERT INTO `tb_system_log_202104` VALUES (764, 1, '/admin/system.config/auth', 'post', '', '{\"\\/admin\\/system_config\\/auth\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"072284f9ce5a4b2763648eabf9176268\",\"token\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619236262);
INSERT INTO `tb_system_log_202104` VALUES (765, 1, '/admin/system.config/auth', 'post', '', '{\"\\/admin\\/system_config\\/auth\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"072284f9ce5a4b2763648eabf9176268\",\"token\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619236794);
INSERT INTO `tb_system_log_202104` VALUES (766, 1, '/admin/system.config/auth', 'post', '', '{\"\\/admin\\/system_config\\/auth\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"072284f9ce5a4b2763648eabf9176268\",\"token\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619247304);
INSERT INTO `tb_system_log_202104` VALUES (767, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"ydq8\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619247316);
INSERT INTO `tb_system_log_202104` VALUES (768, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"xvif\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619606203);
INSERT INTO `tb_system_log_202104` VALUES (769, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"5bfp\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1619606211);

-- ----------------------------
-- Table structure for tb_system_log_202105
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_log_202105`;
CREATE TABLE `tb_system_log_202105`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '管理员ID',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 632 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台操作日志表 - 202105' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_log_202105
-- ----------------------------
INSERT INTO `tb_system_log_202105` VALUES (630, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"a33b679d5581a8692988ec9f92ad2d6a2259eaa7\",\"captcha\":\"2f5q\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1620107266);
INSERT INTO `tb_system_log_202105` VALUES (631, 1, '/admin/system.config/save', 'post', '', '{\"\\/admin\\/system_config\\/save\":\"\",\"app_id\":\"wx1e6783d3ebdd454f\",\"secret\":\"072284f9ce5a4b2763648eabf9176268\",\"token\":\"weixin\",\"aes_key\":\"ChQ2cXI0ZmI9N20tTB1gmJJK87vLr9kB2KDSux7sIty\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', 1620109088);

-- ----------------------------
-- Table structure for tb_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_menu`;
CREATE TABLE `tb_system_menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) NULL DEFAULT 0 COMMENT '菜单排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `href`(`href`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 257 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_menu
-- ----------------------------
INSERT INTO `tb_system_menu` VALUES (227, 99999999, '后台首页', 'fa fa-home', 'index/welcome', '', '_self', 0, 1, NULL, NULL, 1573120497, NULL);
INSERT INTO `tb_system_menu` VALUES (228, 0, '系统管理', 'fa fa-cog', '', '', '_self', 0, 1, '', NULL, 1588999529, NULL);
INSERT INTO `tb_system_menu` VALUES (234, 228, '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', 10, 1, '', NULL, 1588228555, NULL);
INSERT INTO `tb_system_menu` VALUES (244, 228, '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', 12, 1, '', 1573185011, 1588228573, NULL);
INSERT INTO `tb_system_menu` VALUES (245, 228, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', 11, 1, '', 1573435877, 1588228634, NULL);
INSERT INTO `tb_system_menu` VALUES (246, 228, '节点管理', 'fa fa-list', 'system.node/index', '', '_self', 9, 1, '', 1573435919, 1588228648, NULL);
INSERT INTO `tb_system_menu` VALUES (247, 228, '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', 8, 1, '', 1573457448, 1588228566, NULL);
INSERT INTO `tb_system_menu` VALUES (248, 228, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', 0, 1, '', 1573542953, 1588228043, NULL);
INSERT INTO `tb_system_menu` VALUES (249, 0, '代理管理', 'fa fa-list', '', '', '_self', 0, 1, '', 1589439884, 1618472123, NULL);
INSERT INTO `tb_system_menu` VALUES (250, 249, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '', '_self', 0, 1, '', 1589439910, 1589439966, NULL);
INSERT INTO `tb_system_menu` VALUES (251, 249, '商品管理', 'fa fa-list', 'mall.goods/index', '', '_self', 0, 1, '', 1589439931, 1589439942, NULL);
INSERT INTO `tb_system_menu` VALUES (252, 228, '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', 0, 1, '', 1589623683, 1589623683, NULL);
INSERT INTO `tb_system_menu` VALUES (253, 228, '日志管理', 'fa fa-connectdevelop', 'system.log/index', '', '_self', 0, 1, '', 1589623684, 1589623684, NULL);
INSERT INTO `tb_system_menu` VALUES (254, 0, '商户管理', 'fa fa-list', '', '', '_self', 0, 1, '', 1618472146, 1618473675, NULL);
INSERT INTO `tb_system_menu` VALUES (255, 254, '商户列表', 'fa fa-list', 'shop.merchant/index', '', '_self', 0, 1, '', 1618473052, 1618473684, NULL);
INSERT INTO `tb_system_menu` VALUES (256, 250, '免费', 'fa fa-list', '#', '', '_self', 0, 1, '', 1618909815, 1618909815, NULL);

-- ----------------------------
-- Table structure for tb_system_node
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_node`;
CREATE TABLE `tb_system_node`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `node` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) NULL DEFAULT 3 COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启动RBAC权限控制',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `node`(`node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统节点表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_node
-- ----------------------------
INSERT INTO `tb_system_node` VALUES (1, 'system.admin', '管理员管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (2, 'system.admin/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (3, 'system.admin/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (4, 'system.admin/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (5, 'system.admin/password', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (6, 'system.admin/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (7, 'system.admin/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (8, 'system.admin/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (9, 'system.auth', '角色权限管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (10, 'system.auth/authorize', '授权', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (11, 'system.auth/saveAuthorize', '授权保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (12, 'system.auth/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (13, 'system.auth/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (14, 'system.auth/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (15, 'system.auth/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (16, 'system.auth/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (17, 'system.auth/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (18, 'system.config', '系统配置管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (19, 'system.config/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (20, 'system.config/save', '保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (21, 'system.menu', '菜单管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (22, 'system.menu/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (23, 'system.menu/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (24, 'system.menu/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (25, 'system.menu/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (26, 'system.menu/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (27, 'system.menu/getMenuTips', '添加菜单提示', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (28, 'system.menu/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (29, 'system.node', '系统节点管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (30, 'system.node/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (31, 'system.node/refreshNode', '系统节点更新', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (32, 'system.node/clearNode', '清除失效节点', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (33, 'system.node/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (34, 'system.node/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (35, 'system.node/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (36, 'system.node/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (37, 'system.node/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (38, 'system.uploadfile', '上传文件管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (39, 'system.uploadfile/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (40, 'system.uploadfile/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (41, 'system.uploadfile/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (42, 'system.uploadfile/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (43, 'system.uploadfile/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (44, 'system.uploadfile/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (45, 'mall.cate', '商品分类管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (46, 'mall.cate/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (47, 'mall.cate/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (48, 'mall.cate/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (49, 'mall.cate/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (50, 'mall.cate/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (51, 'mall.cate/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (52, 'mall.goods', '商城商品管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (53, 'mall.goods/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (54, 'mall.goods/stock', '入库', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (55, 'mall.goods/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (56, 'mall.goods/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (57, 'mall.goods/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (58, 'mall.goods/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (59, 'mall.goods/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `tb_system_node` VALUES (60, 'system.quick', '快捷入口管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `tb_system_node` VALUES (61, 'system.quick/index', '列表', 2, 1, 1589623188, 1589623188);
INSERT INTO `tb_system_node` VALUES (62, 'system.quick/add', '添加', 2, 1, 1589623188, 1589623188);
INSERT INTO `tb_system_node` VALUES (63, 'system.quick/edit', '编辑', 2, 1, 1589623188, 1589623188);
INSERT INTO `tb_system_node` VALUES (64, 'system.quick/delete', '删除', 2, 1, 1589623188, 1589623188);
INSERT INTO `tb_system_node` VALUES (65, 'system.quick/export', '导出', 2, 1, 1589623188, 1589623188);
INSERT INTO `tb_system_node` VALUES (66, 'system.quick/modify', '属性修改', 2, 1, 1589623188, 1589623188);
INSERT INTO `tb_system_node` VALUES (67, 'system.log', '操作日志管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `tb_system_node` VALUES (68, 'system.log/index', '列表', 2, 1, 1589623188, 1589623188);

-- ----------------------------
-- Table structure for tb_system_quick
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_quick`;
CREATE TABLE `tb_system_quick`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快捷链接',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统快捷入口表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_quick
-- ----------------------------
INSERT INTO `tb_system_quick` VALUES (1, '管理员管理', 'fa fa-user', 'system.admin/index', 0, 1, '', 1589624097, 1589624792, NULL);
INSERT INTO `tb_system_quick` VALUES (2, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', 0, 1, '', 1589624772, 1589624781, NULL);
INSERT INTO `tb_system_quick` VALUES (3, '菜单管理', 'fa fa-tree', 'system.menu/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `tb_system_quick` VALUES (6, '节点管理', 'fa fa-list', 'system.node/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
INSERT INTO `tb_system_quick` VALUES (7, '配置管理', 'fa fa-asterisk', 'system.config/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `tb_system_quick` VALUES (8, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
INSERT INTO `tb_system_quick` VALUES (10, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `tb_system_quick` VALUES (11, '商品管理', 'fa fa-list', 'mall.goods/index', 0, 1, NULL, 1589624772, 1589624781, NULL);

-- ----------------------------
-- Table structure for tb_system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_uploadfile`;
CREATE TABLE `tb_system_uploadfile`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `mime_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `file_ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `upload_time` int(10) NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `upload_type`(`upload_type`) USING BTREE,
  INDEX `original_name`(`original_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 319 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上传文件表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_system_uploadfile
-- ----------------------------
INSERT INTO `tb_system_uploadfile` VALUES (286, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (287, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (288, 'alioss', 'image/x-icon', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '', '', '', 0, 'image/x-icon', 0, 'ico', '', NULL, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (289, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (290, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (291, 'alioss', 'timg (1).jpg', 'http://easyadmin.oss-cn-shenzhen.aliyuncs.com/upload/20191113/ff793ced447febfa9ea2d86f9f88fa8e.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1573612437, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (296, 'txcos', '22243.jpg', 'https://easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com/upload/20191114/2381eaf81208ac188fa994b6f2579953.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1573712153, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (297, 'local', 'timg.jpg', 'http://admin.host/upload/20200423/5055a273cf8e3f393d699d622b74f247.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1587614155, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (298, 'local', 'timg.jpg', 'http://admin.host/upload/20200423/243f4e59f1b929951ef79c5f8be7468a.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1587614269, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (299, 'local', 'head.jpg', 'http://admin.host/upload/20200512/a5ce9883379727324f5686ef61205ce2.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589255649, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (300, 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/577c65f101639f53dbbc9e7aa346f81c.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589427798, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (301, 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589427840, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (302, 'local', '18811e7611c8f292.jpg', 'http://admin.host/upload/20200514/e1c6c9ef6a4b98b8f7d95a1a0191a2df.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589438645, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (316, 'local', '9e0bde2118b487d3b6982730142a2229.jpg', 'http://screen.c/upload/20210415/836bfd6a9a366bdb61e0045cf8b47e54.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1618458249, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (317, 'local', 'headimg_2.jpg', 'http://screen.c/upload/20210415/db6785ed88ff6e19ab55478088773cf4.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1618476835, NULL, NULL);
INSERT INTO `tb_system_uploadfile` VALUES (318, 'local', 'Koala.jpg', 'http://www.screen.c/upload/20210422/24edbf26618ce6ab17632071ac9f6576.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1619077191, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

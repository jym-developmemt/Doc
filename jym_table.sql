--
--批处理记录表
--
DROP TABLE IF EXISTS `jym_m_batch`; 

CREATE TABLE `jym_m_batch` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `batch_id` bigint (20) DEFAULT NULL COMMENT '商品发布批次ID'
    , `external_batch_id` varchar (50) NOT NULL COMMENT '外部批次ID'
    , `succeed` tinyint(1) DEFAULT NULL COMMENT '请求批处理结果'
    , `product_cnt` int (10) DEFAULT NULL COMMENT '发布商品件数'
    , `state_code` varchar (25) DEFAULT NULL COMMENT '请求返回状态码'
    , `extra_err_msg` varchar (255) DEFAULT NULL COMMENT '请求返回错误信息'
    , `method_id` varchar (100) NOT NULL COMMENT 'API接口ID'
    , `status` int (10) DEFAULT NULL COMMENT '任务状态'
    , `create_at` timestamp NULL DEFAULT NULL
    , `update_at` timestamp NULL DEFAULT NULL
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '批处理记录表'; 

--
--API接口表
--
DROP TABLE IF EXISTS `jym_f_api_method`; 

CREATE TABLE `jym_f_api_method` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `method` varchar (100) NOT NULL COMMENT 'API接口名称'
    , `description` varchar (255) NOT NULL COMMENT '接口描述'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = 'API接口表'; 

LOCK TABLES `jym_f_api_method` WRITE;
INSERT INTO `jym_f_api_method` VALUES (1, 'alibaba.jym.item.external.goods.batch.modifyprice', '交易猫外部商家批量商品改价接口'), (2, 'alibaba.jym.item.external.goods.batch.onsale', '交易猫外部商家批量上架商品接口'), ( 3, 'alibaba.jym.item.external.goods.batchtask.query', '交易猫外部商家查询商品批量任务接口'), ( 4, 'alibaba.jym.item.external.goods.detail.query', '交易猫外部商家商品详情查询接口'), ( 5, 'alibaba.jym.item.external.goods.status.batch.query', '交易猫外部商家商品状态批量查询接口'), ( 6, 'alibaba.jym.item.external.goods.batch.offsale', '交易猫外部商家批量下架商品接口'), ( 7, 'alibaba.jym.item.external.goods.batch.publish', '交易猫外部商家批量发布商品接口'); 
UNLOCK TABLES; 

--
--商品详细表
--
DROP TABLE IF EXISTS `jym_m_goods_entity`; 

CREATE TABLE `jym_m_goods_entity` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `goods_id` bigint (20) DEFAULT NULL COMMENT '交易猫商品ID'
    , `external_goods_id` varchar (50) NOT NULL COMMENT '外部商品ID'
    , `external_batch_id` varchar (50) NOT NULL COMMENT '外部批次ID'
    , `title` varchar (30) NOT NULL COMMENT '商品标题'
    , `price` varchar (20) NOT NULL COMMENT '价格'
    , `storage` int (10) NOT NULL COMMENT '库存'
    , `description` varchar (400) NOT NULL COMMENT '商品描述'
    , `server_info_id` int(10) NOT NULL COMMENT ''
    , `support_retrieve_compensation` tinyint(1) NOT NULL COMMENT '是否支持找回包赔'
    , `can_bargain` tinyint(1) NOT NULL COMMENT '是否支持议价'
    , `status` int (4) DEFAULT NULL COMMENT '商品处理状态'
    , `good_state` int (4) DEFAULT NULL COMMENT '商品所处状态'
    , `sub_batch_id` bigint (20) DEFAULT NULL COMMENT '商品任务id'
    , `reason` varchar (255) DEFAULT NULL COMMENT '子任务状态产生原因'
    , `create_at` timestamp NULL DEFAULT NULL
    , `update_at` timestamp NULL DEFAULT NULL
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品详细表'; 


--
--商品平台信息表
--
DROP TABLE IF EXISTS `jym_f_server_info`; 

CREATE TABLE `jym_f_server_info` ( 
    `entity_id` int(10) NOT NULL AUTO_INCREMENT
    , `system` varchar(10) DEFAULT NULL COMMENT '系统'
    , `good_type` varchar (20) DEFAULT NULL COMMENT '商品类型'
    , `cid` bigint(20) DEFAULT NULL COMMENT ''
    , `first_category_id` int(10) NOT NULL COMMENT '一级类目ID'
    , `first_category_name` varchar(20) DEFAULT NULL COMMENT '一级类目名称'
    , `second_category_id` bigint(20) NOT NULL COMMENT '二级类目ID'
    , `second_category_name` varchar(20) DEFAULT NULL COMMENT '二级类目名称'
    , `latform_id` int(10) NOT NULL COMMENT '平台id'
    , `client_id` bigint(20) NOT NULL COMMENT '客户端id'
    , `game_id` int(10) NOT NULL COMMENT '游戏id'
    , `server_id` bigint(20) NOT NULL COMMENT '服务器id'
    , `server_name` varchar(20) NOT NULL COMMENT '服务器名称'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品平台信息表'; 

LOCK TABLES `jym_f_server_info` WRITE;
INSERT INTO `jym_f_server_info` VALUES(1, '安卓', '哔哩哔哩【优质商家】', 1642583177628183, 1, NULL, 1642583177628183, NULL, 2, 1470047035887265, 1009609, 1580902730218531, '通用服务器'), (2, '安卓', '哔哩哔哩【优质商家】', 1642583177628183, 1, NULL, 1642583177628183, NULL, 2, 1470047035887265, 1009609, 1580896125355665, '新区预售'), (3, '安卓', '官方帐号【优质商家】', 1642583217534208, 1, NULL, 1642583217534208, NULL, 2, 1475997234386789, 1009609, 1580902730218531, '通用服务器'), (4, '安卓', 'Tap帐号-优质商家', 1642583287483026, 1, NULL, 1642583287483026, NULL, 2, 1580902730218531, 1009609, 1580902730218531, '通用服务器'), (5, '苹果', '官方帐号【优质商家】', 1642583633272220, 1, NULL, 1642583633272220, NULL, 3, 1470047031112667, 1009609, 1580902730218531, '通用服务器');
UNLOCK TABLES;

--
--卖家账号信息商品属性表
--
DROP TABLE IF EXISTS `jym_b_seller_goods_property`; 

CREATE TABLE `jym_b_seller_goods_property` ( 
    `entity_id` int (12) NOT NULL AUTO_INCREMENT
    , `external_goods_id` varchar (50) NOT NULL COMMENT '外部商品ID'
    , `property_id` bigint (20) NOT NULL COMMENT '属性id'
    , `value_id` bigint (20) NOT NULL COMMENT '属性值id'
    , `value` varchar (50) DEFAULT NULL COMMENT '属性值'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品类目表'; 

--
--商品属性表
--
DROP TABLE IF EXISTS `jym_b_goods_property`; 

CREATE TABLE `jym_b_goods_property` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `external_goods_id` varchar (50) NOT NULL COMMENT '外部商品ID'
    , `property_id` bigint (20) NOT NULL COMMENT '属性id'
    , `value_id` bigint (20) NOT NULL COMMENT '属性值id'
    , `value` varchar (50) DEFAULT NULL COMMENT '属性值'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品属性表'; 

--
--商品图片表
--
DROP TABLE IF EXISTS `jym_b_goods_images`; 

CREATE TABLE `jym_b_goods_images` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `external_goods_id` varchar (50) NOT NULL COMMENT '外部商品ID'
    , `image_id` bigint (20) DEFAULT NULL COMMENT '图片id'
    , `image_url` varchar (255) NOT NULL COMMENT '商品图片url'
    , `note` varchar (255) NOT NULL COMMENT '备注'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品属性表';


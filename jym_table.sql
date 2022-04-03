--
--批处理记录表
--
DROP TABLE IF EXISTS `jym_m_batch_hd`; 
CREATE TABLE `jym_m_batch_hd` ( 
    `external_batch_id` nvarchar(64) NOT NULL COMMENT '外部批次ID'
    , `batch_id` bigint(20) DEFAULT NULL COMMENT '商品发布批次ID'
    , `succeed` tinyint(1) DEFAULT NULL COMMENT '请求批处理结果'
    , `product_cnt` int(10) DEFAULT NULL COMMENT '发布商品件数'
    , `state_code` nvarchar(25) DEFAULT NULL COMMENT '请求返回状态码'
    , `extra_err_msg` nvarchar(255) DEFAULT NULL COMMENT '请求返回错误信息'
    , `method_id` nvarchar(100) NOT NULL COMMENT 'API接口ID'
    , `status` int(10) DEFAULT NULL COMMENT '任务状态'
    , `reason` nvarchar(255) DEFAULT NULL COMMENT '错误原因'
    , `create_at` timestamp NULL DEFAULT NULL
    , `update_at` timestamp NULL DEFAULT NULL
    , PRIMARY KEY (`external_batch_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '批处理记录表'; 

--
--批处理明细表
--
DROP TABLE IF EXISTS `jym_m_batch_dtl`;
CREATE TABLE `jym_m_batch_dtl` (
    `external_batch_id` nvarchar(64) NOT NULL COMMENT '外部批次ID'
    , `external_goods_id` nvarchar(64) NOT NULL COMMENT '外部商品ID'
    , `goods_id` nvarchar(20) DEFAULT NULL COMMENT '商品ID'
    , `status` int(10) NOT NULL COMMENT '子任务状态'
    , `reason` nvarchar(255) DEFAULT NULL COMMENT '子任务状态产生原因'
    , `goods_status` int(4) DEFAULT NULL COMMENT '商品处理状态'
    , `create_at` timestamp NULL DEFAULT NULL
    , `update_at` timestamp NULL DEFAULT NULL
    , PRIMARY KEY (`external_batch_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '批处理明细表'; 

--
--API接口表
--
DROP TABLE IF EXISTS `jym_f_api_method`; 
CREATE TABLE `jym_f_api_method` ( 
    `entity_id` nvarchar(64) NOT NULL
    , `method` nvarchar(100) NOT NULL COMMENT 'API接口名称'
    , `description` nvarchar(255) NOT NULL COMMENT '接口描述'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = 'API接口表'; 

LOCK TABLES `jym_f_api_method` WRITE;
INSERT INTO `jym_f_api_method` VALUES ('1', 'alibaba.jym.item.external.goods.batch.modifyprice', '交易猫外部商家批量商品改价接口'), ('2', 'alibaba.jym.item.external.goods.batch.onsale', '交易猫外部商家批量上架商品接口'), ('3', 'alibaba.jym.item.external.goods.batchtask.query', '交易猫外部商家查询商品批量任务接口'), ('4', 'alibaba.jym.item.external.goods.detail.query', '交易猫外部商家商品详情查询接口'), ('5', 'alibaba.jym.item.external.goods.status.batch.query', '交易猫外部商家商品状态批量查询接口'), ('6', 'alibaba.jym.item.external.goods.batch.offsale', '交易猫外部商家批量下架商品接口'), ('7', 'alibaba.jym.item.external.goods.batch.publish', '交易猫外部商家批量发布商品接口'); 
UNLOCK TABLES; 

--
--商品详细表
--
DROP TABLE IF EXISTS `jym_m_goods_entity`; 
CREATE TABLE `jym_m_goods_entity` ( 
    `external_goods_id` nvarchar(64) NOT NULL COMMENT '外部商品ID'
    , `title` nvarchar(15) NOT NULL COMMENT '商品标题'
    , `price` nvarchar(10) NOT NULL COMMENT '价格'
    , `storage` int(10) NOT NULL COMMENT '库存'
    , `description` nvarchar(200) NOT NULL COMMENT '商品描述'
    , `server_info_id` nvarchar(64) NOT NULL COMMENT ''
    , `support_retrieve_compensation` tinyint(1) NOT NULL COMMENT '是否支持找回包赔'
    , `can_bargain` tinyint(1) NOT NULL COMMENT '是否支持议价'
    , `create_at` timestamp NULL DEFAULT NULL
    , `update_at` timestamp NULL DEFAULT NULL
    , PRIMARY KEY (`external_goods_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品详细表'; 
    

--
--商品平台信息表
--
DROP TABLE IF EXISTS `jym_f_server_info`; 
CREATE TABLE `jym_f_server_info` ( 
    `entity_id` nvarchar(64) NOT NULL
    , `system` nvarchar(10) DEFAULT NULL COMMENT '系统'
    , `good_type` nvarchar(20) DEFAULT NULL COMMENT '商品类型'
    , `cid` nvarchar(20) DEFAULT NULL COMMENT ''
    , `first_category_id` nvarchar(20) NOT NULL COMMENT '一级类目ID'
    , `first_category_name` nvarchar(50) DEFAULT NULL COMMENT '一级类目名称'
    , `second_category_id` nvarchar(20) NOT NULL COMMENT '二级类目ID'
    , `second_category_name` nvarchar(50) DEFAULT NULL COMMENT '二级类目名称'
    , `latform_id` nvarchar(10) NOT NULL COMMENT '平台id'
    , `client_id` nvarchar(20) NOT NULL COMMENT '客户端id'
    , `game_id` nvarchar(10) NOT NULL COMMENT '游戏id'
    , `server_id` nvarchar(20) NOT NULL COMMENT '服务器id'
    , `server_name` nvarchar(50) NOT NULL COMMENT '服务器名称'
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
    `entity_id` int(10) NOT NULL AUTO_INCREMENT
    , `external_goods_id` nvarchar(64) NOT NULL COMMENT '外部商品ID'
    , `property_id` nvarchar(20) NOT NULL COMMENT '属性id'
    , `value_id` nvarchar(20) NOT NULL COMMENT '属性值id'
    , `value` nvarchar(50) DEFAULT NULL COMMENT '属性值'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品类目表'; 

--
--商品属性表
--
DROP TABLE IF EXISTS `jym_b_goods_property`; 
CREATE TABLE `jym_b_goods_property` ( 
    `entity_id` int(10) NOT NULL AUTO_INCREMENT
    , `external_goods_id` nvarchar(64) NOT NULL COMMENT '外部商品ID'
    , `property_id` nvarchar(20) NOT NULL COMMENT '属性id'
    , `value_id` nvarchar(20) NOT NULL COMMENT '属性值id'
    , `value` nvarchar(50) DEFAULT NULL COMMENT '属性值'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品属性表'; 

--
--商品图片表
--
DROP TABLE IF EXISTS `jym_b_goods_images`; 
CREATE TABLE `jym_b_goods_images` ( 
    `entity_id` int(10) NOT NULL AUTO_INCREMENT
    , `external_goods_id` nvarchar(64) NOT NULL COMMENT '外部商品ID'
    , `image_id` nvarchar(64) DEFAULT NULL COMMENT '图片id'
    , `image_url` nvarchar(255) NOT NULL COMMENT '商品图片url'
    , `note` nvarchar(255) DEFAULT NULL COMMENT '备注'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品属性表';

--
--商品状态管理表
--
DROP TABLE IF EXISTS `jym_m_goods_status`; 
CREATE TABLE `jym_m_goods_status` ( 
    `status_id` int(3) NOT NULL AUTO_INCREMENT
    , `name` nvarchar(100) NOT NULL COMMENT '描述'
    , PRIMARY KEY (`status_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '商品状态管理表';


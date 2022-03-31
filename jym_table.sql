--
--�������¼��
--
DROP TABLE IF EXISTS `jym_m_batch`; 

CREATE TABLE `jym_m_batch` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `batch_id` bigint (20) DEFAULT NULL COMMENT '��Ʒ��������ID'
    , `external_batch_id` varchar (50) NOT NULL COMMENT '�ⲿ����ID'
    , `succeed` tinyint(1) DEFAULT NULL COMMENT '������������'
    , `product_cnt` int (10) DEFAULT NULL COMMENT '������Ʒ����'
    , `state_code` varchar (25) DEFAULT NULL COMMENT '���󷵻�״̬��'
    , `extra_err_msg` varchar (255) DEFAULT NULL COMMENT '���󷵻ش�����Ϣ'
    , `method_id` varchar (100) NOT NULL COMMENT 'API�ӿ�ID'
    , `status` int (10) DEFAULT NULL COMMENT '����״̬'
    , `create_at` timestamp NULL DEFAULT NULL
    , `update_at` timestamp NULL DEFAULT NULL
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '�������¼��'; 

--
--API�ӿڱ�
--
DROP TABLE IF EXISTS `jym_f_api_method`; 

CREATE TABLE `jym_f_api_method` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `method` varchar (100) NOT NULL COMMENT 'API�ӿ�����'
    , `description` varchar (255) NOT NULL COMMENT '�ӿ�����'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = 'API�ӿڱ�'; 

LOCK TABLES `jym_f_api_method` WRITE;
INSERT INTO `jym_f_api_method` VALUES (1, 'alibaba.jym.item.external.goods.batch.modifyprice', '����è�ⲿ�̼�������Ʒ�ļ۽ӿ�'), (2, 'alibaba.jym.item.external.goods.batch.onsale', '����è�ⲿ�̼������ϼ���Ʒ�ӿ�'), ( 3, 'alibaba.jym.item.external.goods.batchtask.query', '����è�ⲿ�̼Ҳ�ѯ��Ʒ��������ӿ�'), ( 4, 'alibaba.jym.item.external.goods.detail.query', '����è�ⲿ�̼���Ʒ�����ѯ�ӿ�'), ( 5, 'alibaba.jym.item.external.goods.status.batch.query', '����è�ⲿ�̼���Ʒ״̬������ѯ�ӿ�'), ( 6, 'alibaba.jym.item.external.goods.batch.offsale', '����è�ⲿ�̼������¼���Ʒ�ӿ�'), ( 7, 'alibaba.jym.item.external.goods.batch.publish', '����è�ⲿ�̼�����������Ʒ�ӿ�'); 
UNLOCK TABLES; 

--
--��Ʒ��ϸ��
--
DROP TABLE IF EXISTS `jym_m_goods_entity`; 

CREATE TABLE `jym_m_goods_entity` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `goods_id` bigint (20) DEFAULT NULL COMMENT '����è��ƷID'
    , `external_goods_id` varchar (50) NOT NULL COMMENT '�ⲿ��ƷID'
    , `external_batch_id` varchar (50) NOT NULL COMMENT '�ⲿ����ID'
    , `title` varchar (30) NOT NULL COMMENT '��Ʒ����'
    , `price` varchar (20) NOT NULL COMMENT '�۸�'
    , `storage` int (10) NOT NULL COMMENT '���'
    , `description` varchar (400) NOT NULL COMMENT '��Ʒ����'
    , `server_info_id` int(10) NOT NULL COMMENT ''
    , `support_retrieve_compensation` tinyint(1) NOT NULL COMMENT '�Ƿ�֧���һذ���'
    , `can_bargain` tinyint(1) NOT NULL COMMENT '�Ƿ�֧�����'
    , `status` int (4) DEFAULT NULL COMMENT '��Ʒ����״̬'
    , `good_state` int (4) DEFAULT NULL COMMENT '��Ʒ����״̬'
    , `sub_batch_id` bigint (20) DEFAULT NULL COMMENT '��Ʒ����id'
    , `reason` varchar (255) DEFAULT NULL COMMENT '������״̬����ԭ��'
    , `create_at` timestamp NULL DEFAULT NULL
    , `update_at` timestamp NULL DEFAULT NULL
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '��Ʒ��ϸ��'; 


--
--��Ʒƽ̨��Ϣ��
--
DROP TABLE IF EXISTS `jym_f_server_info`; 

CREATE TABLE `jym_f_server_info` ( 
    `entity_id` int(10) NOT NULL AUTO_INCREMENT
    , `system` varchar(10) DEFAULT NULL COMMENT 'ϵͳ'
    , `good_type` varchar (20) DEFAULT NULL COMMENT '��Ʒ����'
    , `cid` bigint(20) DEFAULT NULL COMMENT ''
    , `first_category_id` int(10) NOT NULL COMMENT 'һ����ĿID'
    , `first_category_name` varchar(20) DEFAULT NULL COMMENT 'һ����Ŀ����'
    , `second_category_id` bigint(20) NOT NULL COMMENT '������ĿID'
    , `second_category_name` varchar(20) DEFAULT NULL COMMENT '������Ŀ����'
    , `latform_id` int(10) NOT NULL COMMENT 'ƽ̨id'
    , `client_id` bigint(20) NOT NULL COMMENT '�ͻ���id'
    , `game_id` int(10) NOT NULL COMMENT '��Ϸid'
    , `server_id` bigint(20) NOT NULL COMMENT '������id'
    , `server_name` varchar(20) NOT NULL COMMENT '����������'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '��Ʒƽ̨��Ϣ��'; 

LOCK TABLES `jym_f_server_info` WRITE;
INSERT INTO `jym_f_server_info` VALUES(1, '��׿', '���������������̼ҡ�', 1642583177628183, 1, NULL, 1642583177628183, NULL, 2, 1470047035887265, 1009609, 1580902730218531, 'ͨ�÷�����'), (2, '��׿', '���������������̼ҡ�', 1642583177628183, 1, NULL, 1642583177628183, NULL, 2, 1470047035887265, 1009609, 1580896125355665, '����Ԥ��'), (3, '��׿', '�ٷ��ʺš������̼ҡ�', 1642583217534208, 1, NULL, 1642583217534208, NULL, 2, 1475997234386789, 1009609, 1580902730218531, 'ͨ�÷�����'), (4, '��׿', 'Tap�ʺ�-�����̼�', 1642583287483026, 1, NULL, 1642583287483026, NULL, 2, 1580902730218531, 1009609, 1580902730218531, 'ͨ�÷�����'), (5, 'ƻ��', '�ٷ��ʺš������̼ҡ�', 1642583633272220, 1, NULL, 1642583633272220, NULL, 3, 1470047031112667, 1009609, 1580902730218531, 'ͨ�÷�����');
UNLOCK TABLES;

--
--�����˺���Ϣ��Ʒ���Ա�
--
DROP TABLE IF EXISTS `jym_b_seller_goods_property`; 

CREATE TABLE `jym_b_seller_goods_property` ( 
    `entity_id` int (12) NOT NULL AUTO_INCREMENT
    , `external_goods_id` varchar (50) NOT NULL COMMENT '�ⲿ��ƷID'
    , `property_id` bigint (20) NOT NULL COMMENT '����id'
    , `value_id` bigint (20) NOT NULL COMMENT '����ֵid'
    , `value` varchar (50) DEFAULT NULL COMMENT '����ֵ'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '��Ʒ��Ŀ��'; 

--
--��Ʒ���Ա�
--
DROP TABLE IF EXISTS `jym_b_goods_property`; 

CREATE TABLE `jym_b_goods_property` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `external_goods_id` varchar (50) NOT NULL COMMENT '�ⲿ��ƷID'
    , `property_id` bigint (20) NOT NULL COMMENT '����id'
    , `value_id` bigint (20) NOT NULL COMMENT '����ֵid'
    , `value` varchar (50) DEFAULT NULL COMMENT '����ֵ'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '��Ʒ���Ա�'; 

--
--��ƷͼƬ��
--
DROP TABLE IF EXISTS `jym_b_goods_images`; 

CREATE TABLE `jym_b_goods_images` ( 
    `entity_id` int (10) NOT NULL AUTO_INCREMENT
    , `external_goods_id` varchar (50) NOT NULL COMMENT '�ⲿ��ƷID'
    , `image_id` bigint (20) DEFAULT NULL COMMENT 'ͼƬid'
    , `image_url` varchar (255) NOT NULL COMMENT '��ƷͼƬurl'
    , `note` varchar (255) NOT NULL COMMENT '��ע'
    , PRIMARY KEY (`entity_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '��Ʒ���Ա�';


DROP TABLE IF EXISTS `sass_customer`;

CREATE TABLE `sass_customer` (
  `customer_id` varchar(12) NOT NULL COMMENT '客户编号',
  `customer_name` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `customer_class` varchar(2) DEFAULT NULL COMMENT '客户层级',
  `parent_id` varchar(12) DEFAULT NULL COMMENT '上级客户',
  `level` varchar(2) DEFAULT NULL COMMENT '级别',
  `customer_credits` varchar(20) DEFAULT NULL,
  `account_period` varchar(8) DEFAULT NULL COMMENT '账期',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `customer_id_path` varchar(500) DEFAULT NULL COMMENT '客户id路径',
  `province` varchar(10) DEFAULT NULL COMMENT '省份',
  `city` varchar(10) DEFAULT NULL COMMENT '城市',
  `industry` varchar(10) DEFAULT NULL COMMENT '行业',
  `AUTH_USER_ID` varchar(16) DEFAULT '' COMMENT '操作用户id',
  `AUTH_ORG_ID` varchar(20) DEFAULT '' COMMENT '操作用户机构号',
  `CREATE_DATE` varchar(10) DEFAULT '' COMMENT '创建日期',
  `CREATE_TIME` varchar(10) DEFAULT '' COMMENT '创建时间',
  `MODIFY_DATE` varchar(10) DEFAULT '' COMMENT '修改日期',
  `MODIFY_TIME` varchar(10) DEFAULT '' COMMENT '修改时间',
  `MODIFY_USER_ID` varchar(16) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`customer_id`),
  KEY `customer_name` (`customer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sass_customer` */

/*Table structure for table `sass_product_sn` */

DROP TABLE IF EXISTS `sass_product_sn`;

CREATE TABLE `sass_product_sn` (
  `id` varchar(20) NOT NULL,
  `sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '序列号SN码',
  `pn` varchar(50) NOT NULL COMMENT 'PN码',
  `delivery_id` varchar(20) DEFAULT NULL COMMENT '发货单编号',
  `customer_id` varchar(20) NOT NULL COMMENT '客户编号',
  `contract_id` varchar(20) DEFAULT NULL COMMENT '合同编号',
  `delivery_date` varchar(10) NOT NULL COMMENT '发货日期',
  `product_id` varchar(20) NOT NULL COMMENT '产品型号',
  `detail_code` varchar(100) DEFAULT NULL COMMENT '组合型号明细',
  `version` varchar(100) NOT NULL COMMENT '版本号',
  `vendor_code` varchar(20) NOT NULL COMMENT '厂商代码',
  `product_type_code` varchar(10) NOT NULL COMMENT '产品类型代码',
  `union_pay_term_id` varchar(50) NOT NULL COMMENT '银联唯一终端标识',
  `status` varchar(2) NOT NULL COMMENT '状态（已发货、已退货）',
  `warranty_period` varchar(10) DEFAULT NULL COMMENT '保修期',
  `AUTH_USER_ID` varchar(16) DEFAULT '' COMMENT '操作用户id',
  `AUTH_ORG_ID` varchar(20) DEFAULT '' COMMENT '操作用户机构号',
  `CREATE_DATE` varchar(10) DEFAULT '' COMMENT '创建日期',
  `CREATE_TIME` varchar(10) DEFAULT '' COMMENT '创建时间',
  `MODIFY_DATE` varchar(10) DEFAULT '' COMMENT '修改日期',
  `MODIFY_TIME` varchar(10) DEFAULT '' COMMENT '修改时间',
  `MODIFY_USER_ID` varchar(16) DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `sn` (`sn`),
  KEY `pn` (`pn`),
  KEY `contract_id` (`contract_id`),
  KEY `delivery_date` (`delivery_date`),
  KEY `product_id` (`product_id`),
  KEY `union_pay_term_id` (`union_pay_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sass_product_sn` */

/*Table structure for table `schema_version` */

DROP TABLE IF EXISTS `schema_version`;

CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `schema_version` */

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`code`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','中国','10','100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','山东省','20','110000','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','济南市','30','110101','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','0,1,2,3,','历城区','40','110102','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','0,1,2,3,','历下区','50','110104','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','0,1,2,3,','高新区','60','110105','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0ecb5cfc6c9f43d892caded74147be70','1002','Catering','app_category','App Type','30','0','1','2018-09-03 18:19:34','1','2019-11-28 20:36:46','餐饮','0'),('1','0','Normal','del_flag','Delete flag','10','0','1','2013-05-27 08:00:00','1','2019-04-17 11:25:12',NULL,'0'),('101','0','Prompt','upgrade_type','Device update method','10','0','1','2017-09-12 10:10:25','1','2019-11-15 10:56:37',NULL,'0'),('102','1','Mandatory','upgrade_type','Device update method','20','0','1','2017-09-12 10:11:53','1','2019-11-15 10:56:21',NULL,'0'),('112','9','ABD','40010','Industry','30','0','1','2017-11-07 18:30:00','1','2019-01-02 16:03:16',NULL,'0'),('119','1','ATM','TERMINAL_TYPE','Terminal type','10','0','1','2017-11-07 18:30:00','1','2019-04-17 10:44:39',NULL,'0'),('120','2','Traditional POS','TERMINAL_TYPE','Terminal type','30','0','1','2017-11-07 18:30:00','1','2019-11-15 10:53:22',NULL,'0'),('121','3','MPOS','TERMINAL_TYPE','Terminal type','40','0','1','2017-11-07 18:30:00','1','2019-11-15 10:53:29',NULL,'0'),('122','4','Intelligent POS','TERMINAL_TYPE','Terminal type','20','0','1','2017-11-07 18:30:00','1','2019-11-15 10:53:07',NULL,'0'),('123','5','Type II fixed-line POS','TERMINAL_TYPE','Terminal type','50','0','1','2017-11-07 18:30:00','1','2019-11-15 10:53:38',NULL,'0'),('124','0','Prompt','app_upgrade_type','App update method','10','0','1','2017-11-07 18:30:00','1','2019-04-17 10:39:02',NULL,'0'),('125','1','Mandatory','app_upgrade_type','App update method','20','0','1','2017-11-07 18:30:00','1','2019-04-17 10:39:21',NULL,'0'),('126','2','Independent update','app_upgrade_type','App update method','30','0','1','2017-11-07 18:30:00','1','2019-04-17 10:40:36',NULL,'0'),('17','1','Country','sys_area_type','Area type','10','0','1','2013-05-27 08:00:00','1','2019-04-17 11:30:08',NULL,'0'),('176a4452be8f4b36b2da9fe80d9e4ab1','UF','Firmware','tms_file_type','TMS file type','4','0','1','2019-03-13 18:05:35','1','2019-10-22 13:09:24','Firmware','0'),('18','2','Provinces, municipalities','sys_area_type','Area type','20','0','1','2013-05-27 08:00:00','1','2019-04-17 11:30:48',NULL,'0'),('19','3','prefecture-level','sys_area_type','Area type','30','0','1','2013-05-27 08:00:00','1','2019-04-17 11:31:41',NULL,'0'),('2','1','Delete','del_flag','Delete flag','20','0','1','2013-05-27 08:00:00','1','2019-04-17 11:11:49','测试说明','0'),('20','4','District','sys_area_type','Area type','40','0','1','2013-05-27 08:00:00','1','2019-04-17 11:32:12',NULL,'0'),('21','1','Company','sys_office_type','Organization type','10','0','1','2013-05-27 08:00:00','1','2019-11-15 10:51:07',NULL,'0'),('22','2','Department','sys_office_type','Organization type','20','0','1','2013-05-27 08:00:00','1','2019-11-15 10:51:13',NULL,'0'),('23','3','Group','sys_office_type','Organization type','30','0','1','2013-05-27 08:00:00','1','2019-11-15 10:51:01',NULL,'0'),('24','4','Other','sys_office_type','Organization type','40','0','1','2013-05-27 08:00:00','1','2019-11-15 10:51:19',NULL,'0'),('28','1','First Level','sys_office_grade','Organization type','10','0','1','2013-05-27 08:00:00','1','2019-11-15 10:48:54',NULL,'0'),('29','2','Second Level','sys_office_grade','Organization type','20','0','1','2013-05-27 08:00:00','1','2019-11-15 10:49:02',NULL,'0'),('3','1','Show','show_hide','Show/hide','10','0','1','2013-05-27 08:00:00','1','2019-04-17 11:07:11',NULL,'0'),('30','3','Third Level','sys_office_grade','Organization type','30','0','1','2013-05-27 08:00:00','1','2019-11-15 10:49:11',NULL,'0'),('31','4','Fourth Level','sys_office_grade','Organization type','40','0','1','2013-05-27 08:00:00','1','2019-11-15 10:49:25',NULL,'0'),('32b78ba1ea2647f5a4fa1037b8959530','0','YES','approve_flag','APP Audit Flag','10','0','1','2018-08-09 14:33:14','1','2019-01-02 16:04:06','YES','0'),('33','2','Company and below data','sys_data_scope','DATA SCOPE','20','0','1','2013-05-27 08:00:00','1','2019-04-17 11:37:14',NULL,'0'),('4','0','Hide','show_hide','Show/hide','20','0','1','2013-05-27 08:00:00','1','2019-04-17 11:07:29',NULL,'0'),('40','2','Office manager','sys_user_type','User type','20','0','1','2013-05-27 08:00:00','58dcd3d76db34e3a8b413420416ac561','2019-11-19 09:50:19',NULL,'0'),('41','3','General user','sys_user_type','User type','30','0','1','2013-05-27 08:00:00','1','2019-04-17 14:16:23',NULL,'0'),('410','I','Image','sys_advertisement_type','Advertisement type','10','0','1','2013-05-27 08:00:00','1','2019-11-15 10:43:23',NULL,'0'),('41d8bfe4a1904fd19bab5bbdbc46b1f1','1004','Cashier','app_category','App Type','50','0','1','2018-09-06 15:54:47','1','2019-11-28 20:37:13',NULL,'0'),('422','SA','APP Store APP','sys_advertisement_adAttribution','Advertisement adAttribution','30','0','1','2013-05-27 08:00:00','1','2019-11-15 10:42:48',NULL,'0'),('4dd090eeb5354667825cd52c36568f6e','DD','Dynamic library','tms_file_type','TMS file type','2','0','1','2019-03-13 18:04:17','1','2019-10-28 14:04:14','Dynamic library','0'),('513d009fcef3463e831b651d4fe7d9c1','1','A90','device_type','Device type','20','0','1','2017-08-29 13:35:30','1','2019-04-17 10:59:45',NULL,'0'),('519f5f11b7c84ce6a1f7cf6503cf41f8','APP','Application','tms_file_type','TMS file type','1','0','1','2019-03-13 18:01:20','1','2019-10-28 14:04:05','TMS FILE TYPE','0'),('54','1','Delete','cms_del_flag','Content status','20','0','1','2013-05-27 08:00:00','1','2019-04-17 11:12:03',NULL,'0'),('55','2','Review','cms_del_flag','Content status','15','0','1','2013-05-27 08:00:00','1','2019-04-17 11:24:54',NULL,'0'),('6','0','No','yes_no','Yes/No','20','0','1','2013-05-27 08:00:00','1','2018-11-23 15:21:21',NULL,'0'),('60ce02449af040ff8c013b7c65cdb9c3','1005','Parking','app_category','App Type','60','0','1','2018-09-06 15:59:30','1','2019-11-28 20:37:21','Parking','0'),('67','1','Access log','sys_log_type','Log type','10','0','1','2013-06-03 08:00:00','1','2019-11-15 10:46:49',NULL,'0'),('68','2','Exception log','sys_log_type','Log type','20','0','1','2013-06-03 08:00:00','1','2019-11-15 10:47:02',NULL,'0'),('6f4e10ac6a774733a02dbd7bb3363107','1007','Tobacco','app_category','App Type','70','0','1','2018-09-13 09:27:03','1','2019-11-28 20:37:49',NULL,'0'),('756617e2efb5470e89824995140ec03c','1','Flow','device_internet_status','Device Internet status','20','0','1','2019-11-15 17:11:17','1','2019-11-15 17:11:17',NULL,'0'),('958442918f9d4178b181a244f8a439e4','0','Organization and below','app_data_scope','App Promotion scope','10','0','1','2018-08-09 14:08:45','1','2019-11-15 10:30:03','Organization and below','0'),('96','1','Male','sex','sex','10','0','1','2013-10-28 08:00:00','1','2019-04-17 11:28:25',NULL,'0'),('97','2','Female','sex','sex','20','0','1','2013-10-28 08:00:00','1','2019-04-17 11:28:49',NULL,'0'),('a6f5275ec93e4e3c8dcf209b0b5b4764','1','NO','approve_flag','APP Audit Flag','20','0','1','2018-08-09 14:33:56','1','2019-01-02 16:03:56','NO','0'),('b7e56c00374d4b47a63786e8df0d7d8b','0','Silent installation','app_upflag','Update strategy','10','0','1','2018-06-19 09:59:59','1','2019-04-17 10:18:13','静默安装','0'),('bd9e74d4334047af9fc5c9e1ad734fc3','9','应用卸载','app_upflag','应用卸载','40','0','d4a97257ec4946239754f56f6e125059','2019-12-30 14:34:52','d4a97257ec4946239754f56f6e125059','2019-12-30 14:35:18',NULL,'0'),('c10114baab16430194eee5271d2f77b0','CK','PINPAD','tms_file_type','TMS file type','3','0','1','2019-03-13 18:04:39','1','2019-10-22 13:09:01','PINPAD','0'),('c740a3c1a9e94616a8f44b280128a257','1','Yes','yes_no','Yes/No','30','0','1','2017-09-01 08:58:21','1','2018-11-23 15:21:44','Yes/No','0'),('c847d533779a4c90b43ec8671bd83096','1','Prompt update','app_upflag','Update strategy','20','0','1','2018-06-19 10:01:20','1','2019-04-17 10:18:42','Prompt update','0'),('d9a4ca9e394c4142806c025117f290e1','1000','Restaurant','app_category','App Type','10','0','af765b9c7efe4008ad582c161ef07615','2018-11-26 17:16:00','1','2019-11-28 20:37:42','Restaurant','0'),('dadea8dce8da4cc98fbbc7899d42b6f7','1001','Mobile application platform','app_platform','platform','10','0','1','2018-06-05 17:52:54','1','2019-11-15 10:33:42','Mobile application platform','0'),('de507c7e86b340cd93381157886a8ab4','2','Mandatory update','app_upflag','Update strategy','30','0','1','2018-06-19 10:01:53','1','2019-04-17 10:19:03','Mandatory update','0'),('def8beedb778462684d554216c47d740','M','Multiple Times','tms_update_time','Update Number of TMS Devices','20','0','1','2017-08-29 13:35:30','1','2019-10-22 13:10:50',NULL,'0'),('def8beedb778462684d554216c47d745','WS','Font library','tms_file_type','TMS file type','5','0','1','2019-03-13 18:05:53','1','2019-10-22 13:09:41','Font library','0'),('def8beedb778462684d554216c47d746','PF','Parameter file','tms_file_type','TMS file type','6','0','1','2019-03-29 15:11:31','1','2019-10-22 13:09:58','Parameter file','0'),('def8beedb778462684d554216c47d747','A70','A70','tms_device_type','TMS device type','10','0','1','2017-08-29 13:35:30','1','2019-10-22 13:11:40',NULL,'0'),('def8beedb778462684d554216c47d748','A90','A90','tms_device_type','TMS device type','20','0','1','2017-08-29 13:35:30','1','2019-10-22 13:11:26',NULL,'0'),('def8beedb778462684d554216c47d749','O','Single Shot','tms_update_time','Update Number of TMS Devices','10','0','1','2017-08-29 13:35:30','1','2019-10-22 13:10:27',NULL,'0'),('def8beedb778462684d554216c47d757','V71','V71','tms_device_type','TMS device type','10','0','1','2017-08-29 13:35:30','1','2019-10-22 13:11:20',NULL,'0'),('def8beedb778462684d554216c47d758','V80SE','V80SE','tms_device_type','TMS device type','20','0','1','2017-08-29 13:35:30','1','2019-10-22 13:11:32',NULL,'0'),('dff32bf2914f41ff9a5d08f3c5384292','1001','Communication','app_category','App Type','20','0','1','2018-06-05 17:51:45','1','2019-11-28 20:36:37',NULL,'0'),('dff42ca4c5e745299bea6267d48c7a88','0','Wifi','device_internet_status','Device Internet status','10','0','1','2019-11-15 17:10:55','1','2019-11-15 17:10:55',NULL,'0'),('e59687ba7895417c9ae572c2b1bd394f','1','Exception','device_status','Device status','1','0','1','2017-11-08 10:41:22','1','2019-11-15 10:38:57','Exception','0'),('eb98f8649cd64575aa5156e9f741477d','0','Normal','device_status','Device status','0','0','1','2017-11-08 10:40:48','1','2019-11-15 10:38:33','设备状态','0'),('fee49d60b1ff46ac93e9fa1e8ec98a6a','1003','Retail','app_category','App Type','40','0','1','2018-09-03 18:19:54','1','2019-11-28 20:37:01','Retail','0');

/*Table structure for table `sys_file` */

DROP TABLE IF EXISTS `sys_file`;

CREATE TABLE `sys_file` (
  `id` varchar(64) NOT NULL,
  `file_name` varchar(400) DEFAULT NULL,
  `saved_name` varchar(400) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_md5` varchar(60) DEFAULT NULL COMMENT '文件md5值',
  `file_progress` varchar(10) DEFAULT NULL COMMENT '文件进度条',
  `upload_time` timestamp NULL DEFAULT NULL COMMENT '上传时间',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_file` */

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`title`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) values ('0060c70aa97a40838d7941635dab4ce7','1','System Management-User Management-To view','1','2020-08-11 16:54:41','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/index','GET','',''),('0165b22728104ebf8475ae33aea2bd55','1','Basic Data-Merchant Management-To view','1','2020-08-11 17:03:51','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/index','GET','',''),('07144c153bec43a1853a03911f5ae558','1','Basic Data-Merchant Management-To view','1','2020-08-11 17:04:55','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/index','GET','',''),('0c46276eb22c48c6a97b9b243346951f','1','System Management-Organization Management-Modify','1','2020-08-11 16:51:43','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/office/save','POST','parentName=Organization Name&name=Admin&code=Admin&sort=0&useable=1',''),('0c5875fc0b544a66bed0c542d22fb252','1','System Management-User Management-To view','1','2020-08-11 16:50:40','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/list','POST','reqObj={\"queryId\":\"userTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"office...',''),('16c57831055e4c29bdb477c9de2d0a24','1','System Login','1','2020-08-11 16:57:05','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/','GET','',''),('17c4ad7020124761a7153646b27a16b4','1','System Management-Role Management-To view','1','2020-08-11 16:52:14','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/role/list','POST','reqObj={\"queryId\":\"role_list\",\"pageName\":\"/spp-adm/\",\"pageInfo\":{\"pageSize\":10,\"pageNum\":1,\"total\":1},\"q...',''),('1971624971fe43458afce2aff75eb834','1','System Management-User Management-Modify','1','2020-08-11 16:55:19','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/checkLoginName','GET','loginName=admin1&oldLoginName=&id=',''),('1d3e3a9a47354248b2b87f66344c4595','1','System Management-User Management-To view','1','2020-08-11 16:53:37','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/index','GET','',''),('251979303fd0480aa8ad5feeb6c0a72f','1','System Management-User Management-To view','1','2020-08-11 16:53:59','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/list','POST','reqObj={\"queryId\":\"userTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":{\"pageSize\":10,\"pageNum\":1,\"total\":2},\"q...',''),('2a0fa32c546644b8907a5bff39e8fc30','1','System Management-User Management-To view','1','2020-08-11 16:55:47','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/list','POST','reqObj={\"queryId\":\"userTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":{\"pageSize\":10,\"pageNum\":1,\"total\":2},\"q...',''),('3455924b2739448bb47dd6826145a471','1','Equipment Info-Equipment Management-To view','1','2020-08-11 17:04:04','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/device/list','POST','mId=&reqObj={\"queryId\":\"device_list\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"orga...',''),('37428b94138745258fca881c9b3d510e','1','Basic Data-Merchant Management-To view','1','2020-08-11 17:00:36','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/index','GET','',''),('393a143e8ad84c3f92b715184ce2791c','1','System Management-Role Management-Modify','1','2020-08-11 16:52:17','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/role/assign','GET','id=3c6cad312c3340cd9b59221a08b9b0c1',''),('3a23564058fb497eacf8d5c0db6b00b0','1','Basic Data-Merchant Management-To view','1','2020-08-11 17:04:55','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/list','POST','reqObj={\"queryId\":\"merchantTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"or...',''),('3f632c1af0e44b53855ce95752a7cb05','1','Basic Data-Merchant Management-To view','1','2020-08-11 16:57:42','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/form','GET','',''),('3fb94a9503d742aa983fde9307236b21','1','System Management-User Management-To view','1','2020-08-11 16:54:04','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/form','GET','',''),('47cf8d223fe94c34bde42b1c64318bc5','1','System Management-User Management-To view','1','2020-08-11 16:54:43','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/form','GET','',''),('4bf75c27e57647b58203527df7c9d179','1','System Management-User Management-Modify','1','2020-08-11 16:53:57','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/checkLoginName','GET','loginName=sd_admin&oldLoginName=sd_admin&id=2',''),('5bc6ea1eac8746888f443202b6168ac8','1','Basic Data-Suppliers Info-To view','1','2020-08-11 16:57:33','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/manuFacturer/list','POST','reqObj={\"queryId\":\"manuFacturer_list\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[...',''),('5c22a75bff704fd3b9cb50a5e40ba0b5','1','System Management-Role Management-To view','1','2020-08-11 16:51:49','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/role/list','POST','reqObj={\"queryId\":\"role_list\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"office...',''),('5e5b699493984c55ab2247336328aafc','1','System Management-Role Management-Modify','1','2020-08-11 16:53:30','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/role/assignrole','POST','roleId=3c6cad312c3340cd9b59221a08b9b0c1&menuIds=[\"4028818a56d407950156d41352630000\",\"4028818a56d407950156d41435830001\",\"c554479dbffe4955bac334478...',''),('602b2a0d86e244cfa43d1bdf5626ac5e','1','Basic Data-Store Management-To view','1','2020-08-11 17:04:12','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/store/index','GET','',''),('623b558f9919457e8ce8cb9783dae9bc','1','System Login','1','2020-08-11 16:50:26','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/','GET','',''),('6564d15eb9ba4023aad62e1b4791c234','1','System Management-User Management-To view','1','2020-08-11 16:50:39','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/index','GET','',''),('67852150aa29480a9c3fba6a2dca0b4b','1','System Management-User Management-Modify','1','2020-08-11 16:53:59','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/save','POST','id=2&officeId=1&officeName=Beijing Jiwen Technology&name=sd_admin&loginFlag=1&userType=2&email=aaa@g.com&oldLoginName=sd_admin&loginName=sd_admin&mobile=15110012321&phone=adfadfad&roleIdList=1&_roleIdList=on',''),('68c00980ad4d4d9c847221a03fab0f77','1','Basic Data-Store Management-To view','1','2020-08-11 17:04:14','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/store/form','GET','',''),('6cbcf2f685784bce844402c75ad8e866','1','System Management-User Management-Modify','1','2020-08-11 16:55:09','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/checkLoginName','GET','loginName=admin&oldLoginName=&id=',''),('71b58ca25b5e409d89c19be723d7aa20','1','System Management-Role Management-Modify','1','2020-08-11 16:57:20','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/role/assign','GET','id=3c6cad312c3340cd9b59221a08b9b0c1',''),('73c6b78d53364baf86cf991f2545bcfd','1','System Management-User Management-To view','1','2020-08-11 16:53:44','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/form','GET','id=2',''),('741cd938b48948e5877017663a6e0a6a','1','Basic Data-Merchant Management-To view','1','2020-08-11 17:03:52','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/form','GET','',''),('7891879977b146979a45775e733e7182','1','System Management-User Management-Modify','1','2020-08-11 16:55:47','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/save','POST','officeId=ea09378f60774c01a2ea809bb159409b&officeName=Admin&name=admin&loginFlag=1&userType=2&email=admin@admin.com&loginName=admin1&mobile=18124328932&roleIdList=3c6cad312c3340cd9b59221a08b9b0c1&_roleIdList=on',''),('78cc52f050ed43b8a9339a757ddee3d1','1','System Management-Organization Management-To view','1','2020-08-11 16:50:51','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/office/index','GET','',''),('7c3133d9dee441399a0ac2c6b402790b','1','Basic Data-Merchant Management-To view','1','2020-08-11 17:00:36','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/list','POST','reqObj={\"queryId\":\"merchantTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"or...',''),('7cbd6c5cea2f4d4d89faacb965fba0e7','1','System Management-User Management-To view','1','2020-08-11 16:53:37','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/list','POST','reqObj={\"queryId\":\"userTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"office...',''),('83067cb9ff7e408ebb9620d5f2fb9d7f','1','Basic Data-Equipment Model-To view','1','2020-08-11 16:57:37','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/deviceType/list','POST','reqObj={\"queryId\":\"deviceType_list\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"...',''),('8fb137515ce84b9ea4d362fc9bd5bd06','1','Basic Data-Merchant Management-To view','1','2020-08-11 17:03:51','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/list','POST','reqObj={\"queryId\":\"merchantTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"or...',''),('909d675784f141598c35b26dca6eb7c6','1','System Management-User Management-To view','1','2020-08-11 16:54:42','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/list','POST','reqObj={\"queryId\":\"userTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"office...',''),('9440e10f9d7f41fda65d3e5382225167','1','Basic Data-Merchant Management-To view','1','2020-08-11 17:00:38','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/form','GET','',''),('9aa1d3c404bb412992465cfedc76c315','1','Basic Data-Equipment Model-To view','1','2020-08-11 17:04:53','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/deviceType/list','POST','reqObj={\"queryId\":\"deviceType_list\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"...',''),('9f59be2b1c5b43b2a6268ab1c4a78038','1','Basic Data-Merchant Management-To view','1','2020-08-11 16:57:40','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/list','POST','reqObj={\"queryId\":\"merchantTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"or...',''),('a418a4f3cf0d417d83c6a267ae813c04','1','System Management-Role Management-To view','1','2020-08-11 16:51:52','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/role/form','GET','',''),('a767b41979ad4a66882c3b59cbc498fe','1','System Management-User Management-To view','1','2020-08-11 16:57:11','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/list','POST','reqObj={\"queryId\":\"userTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"office...',''),('be99fe19bce64c19bd6f44908dd92507','1','Basic Data-Merchant Management-To view','1','2020-08-11 17:04:56','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/form','GET','',''),('c296cca0e0914e68a422425e0a617ed2','1','Basic Data-Merchant Management-To view','1','2020-08-11 16:57:40','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/merchant/index','GET','',''),('dad8339102614666b6b16107fa32381a','1','System Management-Role Management-To view','1','2020-08-11 16:57:17','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/role/list','POST','reqObj={\"queryId\":\"role_list\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"office...',''),('df63ff6ac0034c8dac31bc8b05db9e79','1','Basic Data-Store Management-To view','1','2020-08-11 17:04:12','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/store/list','POST','reqObj={\"queryId\":\"storeTable\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"orgId...',''),('e3b57501b1e641d2b6b814a40077bf7f','1','System Management-Role Management-Modify','1','2020-08-11 16:52:14','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/role/save','POST','officeId=ea09378f60774c01a2ea809bb159409b&name=Admin&enname=Admin&roleType=security-role&sysData=0&useable=1&dataScope=2',''),('e4bb4792e25c44dca56e7868ef15a37a','1','System Management-Organization Management-To view','1','2020-08-11 16:57:29','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/office/index','GET','',''),('edf26c30fa4b4618b4ba87e33185d0c2','1','System Management-User Management-To view','1','2020-08-11 16:57:11','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/user/index','GET','',''),('f119d43605f9438c97a6002691981392','1','Equipment Info-Equipment Management-To view','1','2020-08-11 17:04:46','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/device/list','POST','mId=&reqObj={\"queryId\":\"device_list\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"orga...',''),('fb9ddfcd9d084df4b933d83fc04d6a01','1','System Management-Dictionary Management-To view','1','2020-08-11 16:53:37','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','/spp-adm/sys/dict/list','POST','reqObj={\"queryId\":\"dict_list\",\"pageName\":\"/spp-adm/\",\"pageInfo\":null,\"query\":null,\"conditions\":[{\"type\":...','');

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '父Id',
  `parent_ids` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `code` varchar(50) DEFAULT NULL COMMENT '菜单编码',
  `functype` varchar(255) DEFAULT NULL COMMENT '菜单类型',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `level_code` varchar(36) DEFAULT NULL COMMENT '菜单层级',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `is_show` char(1) DEFAULT NULL COMMENT '是否显示 0 不显示 1显示',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限',
  `remarks` longtext COMMENT '说明',
  `del_flag` int(11) DEFAULT NULL COMMENT '删除标志',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `tc_name` varchar(128) DEFAULT NULL COMMENT '菜单中文名称',
  `en_name` varchar(128) DEFAULT NULL COMMENT '菜单英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`code`,`functype`,`icon`,`level_code`,`url`,`is_show`,`permission`,`remarks`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`tc_name`,`en_name`) values ('0309ea986e244bff842f9a5f44a586f6','e5f7b1c64570402bba11440762404c1a',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,e5f7b1c64570402bba11440762404c1a,','修改|Modify|修改','DEVICE_TYPE_MODIFY','2',NULL,'000048000004000002',NULL,'0','tms:device:type:modify','修改',0,'1','2019-08-07 16:21:55','1','2019-08-07 16:21:55','修改','Modify'),('03a36ea58d6542fd8665cea51edbf54c','4028818a56d407950156d4160e390002','0,4028818a56d407950156d41352630000,4028818a56d407950156d4160e390002,','修改|Modify|修改','dictedit','2','','000030000002000002','','0','sys:dict:edit','字典查看',0,'1','2017-02-22 17:03:16','1','2017-02-22 17:03:16','修改','Modify'),('0eb730a3962f48eab6b03c5e1cab1bd1','774545113ead498d91615253f6713bbc',' 0,774545113ead498d91615253f6713bbc,','App版本管理|App Version Management|App版本管理','APP_VERSION_MANAGER','1','fa fa-play','000043000003','/appVersion/index','0',NULL,NULL,0,'1','2017-09-13 17:57:48','1','2018-11-15 14:59:57','App版本管理','App version MGMT'),('1360e8bcba874bf7b388d1dd0db51c30','ef60de0b167a47e3814fb28a3313cb27','0,48ebb2a7de204d04a41186adf57e5c89,ef60de0b167a47e3814fb28a3313cb27,','获取信息|Get Detail|獲取詳情','DEVICEINFO','2',NULL,'000032000001000003',NULL,'0','device:getInfo',NULL,0,'1','2019-12-13 16:45:38','1','2019-12-13 16:45:54','獲取詳情','Get Detail'),('13b5c928b2fe4a4383a01864818ecbf4','50692b8a4621423abd80327af830c0fe',' 0,7d97ddd1e9b64b67b5851450f904c6d2,50692b8a4621423abd80327af830c0fe,','查看|To view|查看','STRATEGYVIEW','2',NULL,'000031000008000001',NULL,'0','strategy:view','策略查看',0,'1','2017-12-08 09:37:17','1','2019-11-15 14:47:12','查看','To view'),('18f6a135c6e241aebc8872eface5c959','53db090be1f34af1b8be0a1c93746703',' 0,e9c2d1ec11654db8a4c83d0347dda8e2,0,0,0,e9c2d1ec11654db8a4c83d0347dda8e2,0,e9c2d1ec11654db8a4c83d0347dda8e2,53db090be1f34af1b8be0a1c93746703,','查看|To view|查看','LOCATION_MANAGE','2',NULL,'000047000001000001',NULL,'0','sys:location:view',NULL,0,'1','2018-07-09 15:36:04','1','2018-07-09 15:36:04','查看','To view'),('1ab69b86425441c19a4765e049052fa1','483bd6e02845453aa570731b996b30a2','0,7d97ddd1e9b64b67b5851450f904c6d2,483bd6e02845453aa570731b996b30a2,','查看|To view|查看','MERCHANT','2',NULL,'000030000006000001',NULL,'0','sys:merchant:view',NULL,0,'1','2018-06-08 15:13:57','1','2019-11-15 14:46:59','查看','To view'),('1b8c178e55874b4b947c602f3159ae5c','4028818a56d407950156d4ecfafa0004','0,4028818a56d407950156d41352630000,4028818a56d407950156d4ecfafa0004,','授权|Authorization|授權','SYSASSIGN','2','','000030000004000003','','0','sys:role:assign','授权标识',0,'1','2017-03-16 09:43:40','1','2017-03-16 09:43:40','授權','Authorization'),('1c53bb34f778403ab4b1f613debe7a58','50692b8a4621423abd80327af830c0fe',' 0,7d97ddd1e9b64b67b5851450f904c6d2,50692b8a4621423abd80327af830c0fe,','修改|Modify|修改','STRATEGYEDIT','2',NULL,'000031000008000002',NULL,'0','strategy:edit','策略修改',0,'1','2017-12-08 09:38:03','1','2019-11-15 14:47:20','修改','Modify'),('2334aada92d14bb899391d7b12a4459c','aeb4bb332c2247a1a29350247d88f8e3','0,7d97ddd1e9b64b67b5851450f904c6d2,aeb4bb332c2247a1a29350247d88f8e3,','修改|Modify|修改','DEVICETYPEEDIT','2',NULL,'000031000003000002',NULL,'0','device:type:edit','设备型号修改',0,'1','2017-12-08 09:36:35','1','2017-12-08 09:36:35','修改','Modify'),('249be597d3f040048d9e0e62e189a898','d008459a8b1d428e8bb857b8f7afba8a','0,774545113ead498d91615253f6713bbc,d008459a8b1d428e8bb857b8f7afba8a,','查看|To view|查看','APPINFOVIEW','2',NULL,'000043000001000001',NULL,'0','app:info:view','应用信息查看',0,'1','2017-12-08 09:29:17','1','2017-12-08 09:29:17','查看','To view'),('2566121c199b4b3a9ea4726446775262','4028818a56d407950156d41d32ab0003','0,4028818a56d407950156d41352630000,4028818a56d407950156d41d32ab0003,','查看|To view|查看','menuview','2','','000030000003000001','','0','sys:menu:view','菜单查看',0,'1','2017-02-22 16:55:13','1','2017-02-22 16:55:40','查看','To view'),('2c4d4751d49b48d18d1fa9a6e52f5c64','4028818a56d407950156d41d32ab0003','0,4028818a56d407950156d41352630000,4028818a56d407950156d41d32ab0003,','修改|Modify|修改','menuedit','2','','000030000003000002','','0','sys:menu:edit','菜单修改权限',0,'1','2017-02-22 16:57:22','1','2017-02-22 16:57:22','修改','Modify'),('2cf114a84ef743afad23e6f7c40f4ed5','4028818a56d407950156d41435830001','0,4028818a56d407950156d41352630000,4028818a56d407950156d41435830001,','修改|Modify|修改','useredit','2','','000030000001000002','','0','sys:user:edit','用户修改',0,'1','2017-02-22 16:54:26','1','2017-02-22 16:54:26','修改','Modify'),('2d87a747cd0c4e58805f24dd3d164329','c211740e4fbc4b58a37ba053f1a60896',' 0,51a292382110429c8b026eadeda03013,0,0,0,51a292382110429c8b026eadeda03013,0,51a292382110429c8b026eadeda03013,c211740e4fbc4b58a37ba053f1a60896,','查看|To view|查看','ADVERTISEMENTVIEW','2','fa fa-creative-commons','000035000001000001',NULL,'0','sys:advertisement:view','查看',0,'1','2018-06-25 09:58:46','1','2018-06-25 09:58:46','查看','To view'),('36ffcd79923143f2a1c0c80b0b01b860','774545113ead498d91615253f6713bbc',' 0,774545113ead498d91615253f6713bbc,','App审核|App Audit|App審核','APPROVE','1','fa fa-yc','000043000004','/approvalRecord/approveIndex','0',NULL,'APP审核',0,'1','2018-06-07 16:02:25','1','2018-11-15 15:00:21','App審核','Approve'),('3df8f51cfc4f4ba2bf62329669068bad','d44fa5a5f62b46fe977b532c3a879d78',' 0,d44fa5a5f62b46fe977b532c3a879d78,','应用远程管理|Remote Management|应用远程管理','ACTIVE_RELEASE','1','fa fa-play','000044000002','/appInfo/appTelemanagementIndex','0',NULL,NULL,0,'1','2017-09-14 11:43:27','1','2018-11-15 15:00:57','应用远程管理','Remote MGMT'),('3f2b7770ffd74fdd95f3c83eb3b84411','e5f7b1c64570402bba11440762404c1a',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,e5f7b1c64570402bba11440762404c1a,','查看|To View|查看','DEVICE_TYPE_VIEW','2',NULL,'000048000004000001',NULL,'0','tms:device:type:view','查看',0,'1','2019-08-07 16:20:53','1','2019-08-07 16:20:53','查看','To View'),('3ffe5a7802fa4b719a4bd837ea5d94be','0',' 0,','TMS管理|Tms Manage|TMS管理','TMS_MANAGE','0','glyphicon glyphicon-paste','000048',NULL,'0','tms:view',NULL,0,'1','2019-03-13 15:21:54','1','2019-10-22 12:33:44','TMS管理','tms manage'),('402880e958eb83230158eb85a30f0000','402880eb58d9a6d40158d9a7b21f0000',' 0,402880eb58d9a6d40158d9a7b21f0000,','系统日志|System Log|','SYSLOG','1','fa fa-edit','000028000001','/sys/log/index','0',NULL,NULL,0,'1','2016-12-11 09:35:53','1','2019-04-09 09:56:13','系統日誌','System log'),('402880eb58d9a6d40158d9a7b21f0000','0',' 0,','系统工具|System Tools|系統工具','SYSTOOL','0','fa fa-wrench','000028',NULL,'0',NULL,NULL,0,'1','2016-12-07 22:19:55','1','2018-11-15 14:57:47','系統工具','System tools'),('402880eb58d9a6d40158d9a995130001','402880eb58d9a6d40158d9a7b21f0000',' 0,402880eb58d9a6d40158d9a7b21f0000,','监控|System monitoring|','SYSLISTENER','1','fa fa-pencil','000028000002','/druid','0',NULL,NULL,0,'1','2016-12-07 22:21:59','1','2019-04-09 09:56:55','系統監控','System monitoring'),('4028818a56d407950156d41352630000','0',' 0,','系统管理|System Management|系統管理','SYSTEM','0','fa fa-tv','000030',NULL,'0',NULL,NULL,0,'1','2016-08-29 10:14:11','1','2018-11-15 14:54:17','系統管理','System MGMT'),('4028818a56d407950156d41435830001','4028818a56d407950156d41352630000',' 0,4028818a56d407950156d41352630000,','用户管理|User Management|用戶管理','USER','1','fa fa-user','000030000001','/sys/user/index','0','sys:user:view',NULL,0,'1','2016-08-29 10:15:09','1','2018-11-15 14:55:12','用戶管理','User MGMT'),('4028818a56d407950156d4160e390002','4028818a56d407950156d41352630000',' 0,4028818a56d407950156d41352630000,','字典管理|Dictionary Management|字典管理','DICTIONARY','1','fa fa-book','000030000002','/sys/dict/index','0',NULL,NULL,0,'1','2016-08-29 10:17:10','1','2018-11-15 14:55:29','字典管理','Dictionary MGMT'),('4028818a56d407950156d41d32ab0003','4028818a56d407950156d41352630000',' 0,4028818a56d407950156d41352630000,','菜单管理|Menu Management|字典管理','FUNCTION','1','fa fa-cog','000030000003','/sys/menu/index','0','sys:menu:edit',NULL,0,'1','2016-08-29 10:24:58','1','2018-11-15 14:55:48','菜單管理','Menu MGMT'),('4028818a56d407950156d4ecfafa0004','4028818a56d407950156d41352630000',' 0,4028818a56d407950156d41352630000,','角色管理|Role Management|角色管理','Role','1','fa fa-street-view','000030000004','/sys/role/index','0',NULL,NULL,0,'1','2016-08-29 14:11:55','1','2018-11-15 14:55:57','角色管理','Role MGMT'),('427b3426fc5b4439a7d8698ca313c909','3ffe5a7802fa4b719a4bd837ea5d94be',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,','策略管理|Strategy Manage|策略管理','STRATEGY MANAGE','0','fa fa-random','000048000002','/tms/updateStrategy/index','0','tms:updateStrategy:view',NULL,0,'1','2019-03-13 15:49:15','1','2019-10-22 12:34:17','策略管理','strategy manage'),('483bd6e02845453aa570731b996b30a2','7d97ddd1e9b64b67b5851450f904c6d2','0,7d97ddd1e9b64b67b5851450f904c6d2,','商户管理|Merchant Management|商戶管理','MERCHANT','1','fa fa-user-plus','000031000006','/merchant/index','0','sys:merchant:view',NULL,0,'1','2018-06-06 10:31:43','1','2018-11-15 14:56:15','商戶管理','Merchant MGMT'),('48ebb2a7de204d04a41186adf57e5c89','0',' 0,','设备信息|Equipment Info|設備信息','DEVICEINFO','1','fa fa-square','000032',NULL,'0',NULL,NULL,0,'1','2017-08-18 08:51:59','1','2018-11-15 14:58:37','設備信息','Equipment info'),('4ae51e96b57d49a58d0d2788c212f08c','3ffe5a7802fa4b719a4bd837ea5d94be',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,','更新物管理|Update Items manage|更新物管理','UPDATE_ITEMS','1','fa fa-folder-open-o','000048000001','/tms/updateFiles/index','0','tms:updateItems:view','更新物管理',0,'1','2019-03-13 15:43:20','1','2019-10-22 12:34:04','更新物管理','update items manage'),('4bd97b729c864ab2804fc0e5b3aecb6d','483bd6e02845453aa570731b996b30a2','0,4028818a56d407950156d41352630000,483bd6e02845453aa570731b996b30a2,','修改|edit|修改','MERCHNAT','2',NULL,'000030000006000002',NULL,'0','sys:merchant:edit',NULL,0,'1','2018-06-08 15:14:45','1','2018-06-08 15:14:45','修改','edit'),('4d8b46bac10a45609756d6d6c4bd3dae','51a292382110429c8b026eadeda03013',' 0,51a292382110429c8b026eadeda03013,','广告审核|Advertisement Audit|廣告審核','ADVERTISING-AUDIT','1','fa fa-black-tie','000035000002','/advertisement/approveIndex','0',NULL,'广告审核',0,'1','2018-06-23 18:06:25','1','2018-11-15 15:05:19','廣告審核','Advertising audit'),('4f310b8e94744aa8a94df75758f7e57c','4ae51e96b57d49a58d0d2788c212f08c',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,0,0,0,3ffe5a7802fa4b719a4bd837ea5d94be,4ae51e96b57d49a58d0d2788c212f08c,','查看|view|查看','view','1',NULL,'000048000001000001',NULL,'0','tms:updateItems:view',NULL,0,'1','2019-03-13 16:47:41','1','2019-03-13 16:47:41','查看','view'),('50692b8a4621423abd80327af830c0fe','7d97ddd1e9b64b67b5851450f904c6d2',' 0,7d97ddd1e9b64b67b5851450f904c6d2,','策略管理|Strategic Management|策略管理','STRATEGY','1','fa fa-list-alt','000031000008','/strategy/index','0',NULL,'策略数据管理',0,'1','2017-09-19 08:27:17','1','2019-11-15 14:46:39','策略管理','Strategic MGMT'),('51a292382110429c8b026eadeda03013','0',' 0,','广告信息|Advertisement Info|廣告信息','ADVERTISEMENT','0','fa fa-genderless','000035',NULL,'0',NULL,'广告信息',0,'1','2018-06-23 17:58:37','1','2018-11-15 15:05:05','廣告信息','Advertising info'),('53db090be1f34af1b8be0a1c93746703','e9c2d1ec11654db8a4c83d0347dda8e2',' 0,e9c2d1ec11654db8a4c83d0347dda8e2,','商户终端范围|Merchant Terminal Range|商户终端范围','LOCATION_MANAGE','1',NULL,'000047000001','/scope/index','0','sys:location:view',NULL,0,'1','2018-07-09 15:35:35','1','2018-11-15 15:02:34','商户终端范围','Merchant terminal range'),('5a2b89a4e72643698ea10da25695274e','4028818a56d407950156d41352630000',' 0,4028818a56d407950156d41352630000,','机构管理|Organization Management|機構管理','OFFICE','1','fa fa-bars','000030000005','/sys/office/index','0','sys:office:view','机构树形管理',0,'1','2017-02-17 14:42:05','1','2018-11-15 14:56:05','機構管理','Organization MGMT'),('5b32d03f43664de5bc49ca76156163f8','5a2b89a4e72643698ea10da25695274e','0,4028818a56d407950156d41352630000,5a2b89a4e72643698ea10da25695274e,','查看|To view|查看','officeview','2','','000030000005000001','','0','sys:office:view','机构查看',0,'1','2017-02-22 16:59:52','1','2017-02-22 16:59:52','查看','To view'),('5ef6770000614b95a05538f31ff1da23','4028818a56d407950156d4ecfafa0004','0,4028818a56d407950156d41352630000,4028818a56d407950156d4ecfafa0004,','查看|To view|查看','roleview','2','','000030000004000001','','0','sys:role:view','角色查看权限',0,'1','2017-02-22 16:58:12','1','2017-02-22 16:58:12','查看','To view'),('5efcd30a607b452189a1d37f5b9266ad','84b2e4494bb2404da6bc312ee6efa11b',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,0,0,3ffe5a7802fa4b719a4bd837ea5d94be,0,3ffe5a7802fa4b719a4bd837ea5d94be,0,3ffe5a7802fa4b719a4bd837ea5d94be,0,0,3ffe5a7802fa4b719a4bd837ea5d94be,0,3ffe5a7802fa4b719a4bd837ea5d94be,84b2e4494bb2404da6bc312ee6efa11b,','查看|view|查看','UPDATE_LOG_VIEW','1',NULL,'000048000003000001',NULL,'0','tms:log:view',NULL,0,'1','2019-03-13 16:52:35','1','2019-03-13 16:52:35','查看','view'),('697c86ebd7ec4a1c925c1f78b4ddd058','7d97ddd1e9b64b67b5851450f904c6d2',' 0,7d97ddd1e9b64b67b5851450f904c6d2,','厂商信息|Suppliers Info|廠商信息','MAUNFACTURERINFO','1','fa fa-file-text','000031000001','/manuFacturer/index','0',NULL,'厂商管理',0,'1','2017-09-04 16:24:12','1','2018-11-15 14:58:17','廠商信息','Suppliers Info'),('71f2101ae72f4102840418753240b626','53db090be1f34af1b8be0a1c93746703',' 0,e9c2d1ec11654db8a4c83d0347dda8e2,0,0,0,e9c2d1ec11654db8a4c83d0347dda8e2,0,e9c2d1ec11654db8a4c83d0347dda8e2,53db090be1f34af1b8be0a1c93746703,','修改|Modify|修改','LOCATION_MANAGE','2',NULL,'000047000001000002',NULL,'0','sys:location:edit',NULL,0,'1','2018-07-09 15:36:32','1','2018-07-09 15:36:32','修改','Modify'),('732fbbb0b09a42609c6523a9d570d0c6','36ffcd79923143f2a1c0c80b0b01b860','0,774545113ead498d91615253f6713bbc,36ffcd79923143f2a1c0c80b0b01b860,','查看|To view|查看','APPROVALVIEW','2',NULL,'000043000004000001',NULL,'0','app:approval:view','查看',0,'1','2018-08-08 09:27:31','1','2018-08-08 09:27:31','查看','To view'),('774545113ead498d91615253f6713bbc','0',' 0,','App信息|App Info|App信息','APP_INFO','0','fa fa-chevron-left','000043',NULL,'0',NULL,NULL,0,'1','2017-09-13 10:23:19','1','2018-11-15 14:59:37','App信息','App info'),('7c4a86e5e33b4c82a88c971106194426','9cb2395fceea446db9ad42763274398e',' 0,7d97ddd1e9b64b67b5851450f904c6d2,9cb2395fceea446db9ad42763274398e,','修改|Modify|修改','STORE','2',NULL,'000030000007000002',NULL,'0','sys:store:edit',NULL,0,'1','2018-06-25 11:24:29','1','2019-11-15 14:46:26','修改','Modify'),('7d97ddd1e9b64b67b5851450f904c6d2','0',' 0,','基础数据|Basic Data|基礎數據','BASEDATA','0','fa fa-list-ul','000031',NULL,'0',NULL,'系统参数',0,'1','2017-03-16 09:39:41','1','2018-11-15 14:58:07','基礎數據','Basic data'),('7e6fa641510f462db1986992275a0cf6','c211740e4fbc4b58a37ba053f1a60896',' 0,51a292382110429c8b026eadeda03013,0,0,0,51a292382110429c8b026eadeda03013,0,51a292382110429c8b026eadeda03013,c211740e4fbc4b58a37ba053f1a60896,','修改|Modify|修改','ADVERTISEMENTEDIT','0','fa fa-battery-2','000035000001000002',NULL,'0','sys:advertisement:edit','修改',0,'1','2018-06-25 10:00:16','1','2018-06-25 10:00:16','修改','Modify'),('81bd6bd108a14cb39d64ea50fe08ac34','697c86ebd7ec4a1c925c1f78b4ddd058','0,7d97ddd1e9b64b67b5851450f904c6d2,697c86ebd7ec4a1c925c1f78b4ddd058,','查看|To view|查看','MAUNFACTURERINFOVIEW','2',NULL,'000031000001000001',NULL,'0','maun:view','厂商查看',0,'1','2017-12-08 09:31:08','1','2017-12-08 09:31:08','查看','To view'),('84b2e4494bb2404da6bc312ee6efa11b','3ffe5a7802fa4b719a4bd837ea5d94be',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,','日志查询|Log Search|日誌查詢','LOG_SEARCH','1','fa fa-recycle','000048000003','/tms/updateLog/index','0','tms:updateLog:view',NULL,0,'1','2019-03-13 16:02:04','1','2019-10-22 12:34:30','日誌查詢','log search'),('8678e7476499489f927d6e6ef6712123','4ae51e96b57d49a58d0d2788c212f08c',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,0,0,0,3ffe5a7802fa4b719a4bd837ea5d94be,4ae51e96b57d49a58d0d2788c212f08c,','修改|update|修改','UPDATE_ITEMS_UPDATE','1',NULL,'000048000001000002',NULL,'0','tms:updateItems:edit',NULL,0,'1','2019-03-13 16:49:47','1','2019-03-14 16:56:50','修改','update'),('874582a0a10d4375bc22ef2bf85f6e68','697c86ebd7ec4a1c925c1f78b4ddd058','0,7d97ddd1e9b64b67b5851450f904c6d2,697c86ebd7ec4a1c925c1f78b4ddd058,','修改|Modify|修改','MAUNFACTURERINFOEDIT','2',NULL,'000031000001000002',NULL,'0','maun:edit','厂商数据修改',0,'1','2017-12-08 09:31:58','1','2017-12-08 09:31:58','修改','Modify'),('8c9176d0325a43f3819d9045042d1d98','d44fa5a5f62b46fe977b532c3a879d78',' 0,d44fa5a5f62b46fe977b532c3a879d78,','App版本发布查看|Release Version View|App版本發佈查看','APP_VERSION_RELEASE','1','fa fa-play','000044000004','/appRecord/index','0',NULL,NULL,0,'1','2017-09-15 09:50:28','1','2018-11-15 15:01:26','App版本發佈查看','View version release'),('9a79ab48ae0241049192f837eefe9dbc','4028818a56d407950156d4160e390002','0,4028818a56d407950156d41352630000,4028818a56d407950156d4160e390002,','查看|To view|查看','DICTVIEW','2',NULL,'000030000002000003',NULL,'0','sys:dict:view',NULL,0,'1','2017-09-05 09:00:37','1','2017-09-05 09:00:37','查看','To view'),('9cb2395fceea446db9ad42763274398e','7d97ddd1e9b64b67b5851450f904c6d2',' 0,7d97ddd1e9b64b67b5851450f904c6d2,','门店管理|Store Management|門店管理','store_manage','1','fa fa-fonticons','000031000007','/store/index','0','sys:store:view','门店管理',0,'1','2018-06-22 15:43:35','1','2019-11-15 14:46:14','門店管理','Store MGMT'),('a763dc88848547db9e4a3528bf91a688','402880e958eb83230158eb85a30f0000','0,402880eb58d9a6d40158d9a7b21f0000,402880e958eb83230158eb85a30f0000,','查看|To view|查看','SYSLOGVIEW','2','','000028000001000001','','0','sys:log:view','',0,'1','2017-02-22 17:15:14','1','2017-02-22 17:15:14','查看','To view'),('aeb4bb332c2247a1a29350247d88f8e3','7d97ddd1e9b64b67b5851450f904c6d2',' 0,7d97ddd1e9b64b67b5851450f904c6d2,','设备型号|Equipment Model|設備型號','DEVICE_TYPE_MANAGER','1','fa fa-github-alt','000031000003','/deviceType/index','0',NULL,'设备型号管理',0,'1','2017-09-04 16:27:24','1','2018-11-15 14:58:26','設備型號','Equipment model'),('b37ea1c4899a400b9df85a6f8e684f60','4028818a56d407950156d4ecfafa0004','0,4028818a56d407950156d41352630000,4028818a56d407950156d4ecfafa0004,','修改|Modify|修改','roleedit','2','','000030000004000002','','0','sys:role:edit','权限修改',0,'1','2017-02-22 16:59:06','1','2017-02-23 09:32:52','修改','Modify'),('b7031652c4844503b39de71e4001a8b7','427b3426fc5b4439a7d8698ca313c909',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,0,0,3ffe5a7802fa4b719a4bd837ea5d94be,427b3426fc5b4439a7d8698ca313c909,','修改|update|修改','STRATEGY_UPDATE','1',NULL,'000048000002000002',NULL,'0','tms:updateStrategy:edit',NULL,0,'1','2019-03-13 16:51:42','1','2019-03-19 14:36:52','修改','update'),('b9f9ee5efe434f58b07a7cfb6863e2f3','0',' 0,','设备远程控制|Device Remote Control|設備遠程控制','DEVICE_REMOTE_CONTROL','0','fa fa-archive','000050',NULL,'0',NULL,NULL,0,'1','2017-10-13 10:55:41','1','2019-10-31 09:23:16','設備遠程控制','Remote control of equipment'),('c211740e4fbc4b58a37ba053f1a60896','51a292382110429c8b026eadeda03013',' 0,51a292382110429c8b026eadeda03013,','广告管理|Advertisement Management|廣告管理','ADVERTISING-MANAGEMENT','1','fa fa-black-tie','000035000001','/advertisement/index','0',NULL,'广告管理',0,'1','2018-06-23 18:03:06','1','2018-11-15 15:05:13','廣告管理','Advertising MGMT'),('c554479dbffe4955bac334478337cdd5','4028818a56d407950156d41435830001','0,4028818a56d407950156d41352630000,4028818a56d407950156d41435830001,','查看|To view|查看','userview','2','','000030000001000001','','0','sys:user:view','权限标识',0,'1','2017-02-22 16:53:34','1','2017-02-22 16:53:34','查看','To view'),('c878c5219deb4279adc7f8a819b5432e','0eb730a3962f48eab6b03c5e1cab1bd1','0,774545113ead498d91615253f6713bbc,0eb730a3962f48eab6b03c5e1cab1bd1,','查看|To view|查看','APPVERSIONVIEW','2',NULL,'000043000003000001',NULL,'0','app:version:view',NULL,0,'1','2017-12-08 09:42:02','1','2017-12-08 09:42:02','查看','To view'),('cfe24c81127445469a9bd853b74c553a','427b3426fc5b4439a7d8698ca313c909',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,0,0,3ffe5a7802fa4b719a4bd837ea5d94be,427b3426fc5b4439a7d8698ca313c909,','查看|view|查看','STRATEGY_VIEW','1',NULL,'000048000002000001',NULL,'0','tms:updateStrategy:view',NULL,0,'1','2019-03-13 16:51:07','1','2019-03-19 14:36:37','查看','view'),('d008459a8b1d428e8bb857b8f7afba8a','774545113ead498d91615253f6713bbc',' 0,774545113ead498d91615253f6713bbc,','App管理|App Management|App管理','APP_MANAGER','1','fa fa-play','000043000001','/appInfo/index','0',NULL,NULL,0,'1','2017-09-13 10:24:14','1','2018-11-15 14:59:44','App管理','App MGMT'),('d137a40c80b34da08de87ea61c8fc0ab','9cb2395fceea446db9ad42763274398e',' 0,7d97ddd1e9b64b67b5851450f904c6d2,9cb2395fceea446db9ad42763274398e,','查看|To view|查看','STORE','2',NULL,'000030000007000001',NULL,'0','sys:store:view',NULL,0,'1','2018-06-25 11:23:55','1','2019-11-15 14:46:20','查看','To view'),('d44fa5a5f62b46fe977b532c3a879d78','0',' 0,','App管理|App Management|App管理','APP_VERSION_REALEASE_MANAGER','0','fa fa-forward','000044',NULL,'0',NULL,NULL,0,'1','2017-09-14 11:22:17','1','2018-11-15 15:00:49','App管理','App MGMT'),('dac7798535964ab381a8a308cd13b628','aeb4bb332c2247a1a29350247d88f8e3','0,7d97ddd1e9b64b67b5851450f904c6d2,aeb4bb332c2247a1a29350247d88f8e3,','查看|To view|查看','DEVICETYPEVIEW','2',NULL,'000031000003000001',NULL,'0','device:type:view','设备型号修改',0,'1','2017-12-08 09:35:10','1','2017-12-08 09:35:10','查看','To view'),('dd8ef8f38bda4b889699a1dd2aa06e85','d44fa5a5f62b46fe977b532c3a879d78',' 0,d44fa5a5f62b46fe977b532c3a879d78,','设备更新App记录|App Update Record|設備更新App記錄','DEVICE_UPDATE_APP_RECORD','1','fa fa-play','000044000005','/appVersion/deviceAppIndex','0',NULL,NULL,0,'1','2017-09-15 13:26:52','1','2018-11-15 15:01:54','設備更新App記錄','Updates App record'),('e13d22c686444328aeae1c9704932bb4','ef60de0b167a47e3814fb28a3313cb27','0,48ebb2a7de204d04a41186adf57e5c89,ef60de0b167a47e3814fb28a3313cb27,','修改|Modify|修改','DEVICEEDIT','2',NULL,'000032000001000002',NULL,'0','device:edit','设备修改权限',0,'1','2017-12-08 09:27:45','1','2017-12-08 09:27:45','修改','Modify'),('e143b2ce5a7542359ff55a81d3e269d0','5a2b89a4e72643698ea10da25695274e','0,4028818a56d407950156d41352630000,5a2b89a4e72643698ea10da25695274e,','修改|Modify|修改','officeedit','2','','000030000005000002','','0','sys:office:edit','机构修改',0,'1','2017-02-22 17:00:45','1','2017-02-22 17:00:45','修改','Modify'),('e309db531fd947e69c9f9231273807ec','0eb730a3962f48eab6b03c5e1cab1bd1','0,774545113ead498d91615253f6713bbc,0eb730a3962f48eab6b03c5e1cab1bd1,','修改|Modify|修改','APPVERSIONEDIT','2',NULL,'000043000003000002',NULL,'0','app:version:edit','版本修改权限',0,'1','2017-12-08 09:42:59','1','2017-12-08 09:42:59','修改','Modify'),('e5ead8fcd86141019acb278f65a7c33f','d008459a8b1d428e8bb857b8f7afba8a','0,774545113ead498d91615253f6713bbc,d008459a8b1d428e8bb857b8f7afba8a,','修改|Modify|修改','APPINFOEDIT','2',NULL,'000043000001000002',NULL,'0','app:info:edit','应用信息修改',0,'1','2017-12-08 09:30:15','1','2017-12-08 09:30:15','修改','Modify'),('e5f7b1c64570402bba11440762404c1a','3ffe5a7802fa4b719a4bd837ea5d94be',' 0,3ffe5a7802fa4b719a4bd837ea5d94be,','设备类型|Device Type|設備類型','TMS_DEVICE_TYPE_MANAGE','1','fa fa-reorder','000048000004','/tms/deviceType/index','0',NULL,'Device Type Manage',0,'1','2019-08-07 16:19:11','1','2019-08-07 16:19:40','設備類型','Device Type'),('e9c2d1ec11654db8a4c83d0347dda8e2','0',' 0,','位置范围管理|Position Range Management|位置范围管理','LOCATION_MANAGE','0','fa fa-500px','000047',NULL,'0','sys:location:view',NULL,0,'1','2018-07-09 15:23:38','1','2018-11-15 15:02:22','位置范围管理','Position range MGMT'),('ef60de0b167a47e3814fb28a3313cb27','48ebb2a7de204d04a41186adf57e5c89','0,48ebb2a7de204d04a41186adf57e5c89,','设备管理|Equipment Management|設備管理','device','2','fa fa-square','000032000001','/device/index','0',NULL,NULL,0,'1','2017-08-18 08:55:38','1','2018-11-15 14:57:03','設備管理','Equipment MGMT'),('f659643faa1340c9975c70968148b84f','b9f9ee5efe434f58b07a7cfb6863e2f3',' 0,b9f9ee5efe434f58b07a7cfb6863e2f3,','设备信息|Device Message|設備信息','DEVICE_MESSAGE','1',NULL,'000050000001','/control/index','0',NULL,NULL,0,'1','2017-10-13 10:58:18','1','2019-10-31 09:23:29','設備信息','Equipment info'),('f9b658ea513b475f993dae22949a2813','ef60de0b167a47e3814fb28a3313cb27','0,48ebb2a7de204d04a41186adf57e5c89,ef60de0b167a47e3814fb28a3313cb27,','查看|To view|查看','DEVICEVIEW','2',NULL,'000032000001000001',NULL,'0','device:view','设备查看权限',0,'1','2017-12-08 09:27:03','1','2017-12-08 09:27:03','查看','To view');

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) DEFAULT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`area_id`,`code`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`USEABLE`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','Beijing Jiwen Technology','10','2','100000','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2019-01-02 15:46:24',NULL,'0'),('ea09378f60774c01a2ea809bb159409b','0','0,','Admin','0',NULL,'Admin','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2020-08-11 16:51:43','1','2020-08-11 16:51:43',NULL,'0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`is_sys`,`useable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','1','System Manager','sysadmin','security-role','2','0','1','1','2013-05-27 08:00:00','1','2019-12-03 15:31:58',NULL,'0'),('3c6cad312c3340cd9b59221a08b9b0c1','ea09378f60774c01a2ea809bb159409b','Admin','Admin','security-role','2','0','1','1','2020-08-11 16:52:14','1','2020-08-11 16:52:14',NULL,'0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values ('1','03a36ea58d6542fd8665cea51edbf54c'),('1','0eb730a3962f48eab6b03c5e1cab1bd1'),('1','13b5c928b2fe4a4383a01864818ecbf4'),('1','18f6a135c6e241aebc8872eface5c959'),('1','1ab69b86425441c19a4765e049052fa1'),('1','1b8c178e55874b4b947c602f3159ae5c'),('1','1c53bb34f778403ab4b1f613debe7a58'),('1','2334aada92d14bb899391d7b12a4459c'),('1','249be597d3f040048d9e0e62e189a898'),('1','2566121c199b4b3a9ea4726446775262'),('1','2c4d4751d49b48d18d1fa9a6e52f5c64'),('1','2cf114a84ef743afad23e6f7c40f4ed5'),('1','2d87a747cd0c4e58805f24dd3d164329'),('1','36ffcd79923143f2a1c0c80b0b01b860'),('1','3df8f51cfc4f4ba2bf62329669068bad'),('1','402880e958eb83230158eb85a30f0000'),('1','402880eb58d9a6d40158d9a7b21f0000'),('1','402880eb58d9a6d40158d9a995130001'),('1','4028818a56d407950156d41352630000'),('1','4028818a56d407950156d41435830001'),('1','4028818a56d407950156d4160e390002'),('1','4028818a56d407950156d41d32ab0003'),('1','4028818a56d407950156d4ecfafa0004'),('1','483bd6e02845453aa570731b996b30a2'),('1','48ebb2a7de204d04a41186adf57e5c89'),('1','4bd97b729c864ab2804fc0e5b3aecb6d'),('1','4d8b46bac10a45609756d6d6c4bd3dae'),('1','50692b8a4621423abd80327af830c0fe'),('1','51a292382110429c8b026eadeda03013'),('1','53db090be1f34af1b8be0a1c93746703'),('1','5a2b89a4e72643698ea10da25695274e'),('1','5b32d03f43664de5bc49ca76156163f8'),('1','5ef6770000614b95a05538f31ff1da23'),('1','697c86ebd7ec4a1c925c1f78b4ddd058'),('1','71f2101ae72f4102840418753240b626'),('1','732fbbb0b09a42609c6523a9d570d0c6'),('1','774545113ead498d91615253f6713bbc'),('1','7c4a86e5e33b4c82a88c971106194426'),('1','7d97ddd1e9b64b67b5851450f904c6d2'),('1','7e6fa641510f462db1986992275a0cf6'),('1','81bd6bd108a14cb39d64ea50fe08ac34'),('1','874582a0a10d4375bc22ef2bf85f6e68'),('1','8c9176d0325a43f3819d9045042d1d98'),('1','9a79ab48ae0241049192f837eefe9dbc'),('1','9cb2395fceea446db9ad42763274398e'),('1','a763dc88848547db9e4a3528bf91a688'),('1','aeb4bb332c2247a1a29350247d88f8e3'),('1','b37ea1c4899a400b9df85a6f8e684f60'),('1','c211740e4fbc4b58a37ba053f1a60896'),('1','c554479dbffe4955bac334478337cdd5'),('1','c878c5219deb4279adc7f8a819b5432e'),('1','d008459a8b1d428e8bb857b8f7afba8a'),('1','d137a40c80b34da08de87ea61c8fc0ab'),('1','d44fa5a5f62b46fe977b532c3a879d78'),('1','dac7798535964ab381a8a308cd13b628'),('1','dd8ef8f38bda4b889699a1dd2aa06e85'),('1','e13d22c686444328aeae1c9704932bb4'),('1','e143b2ce5a7542359ff55a81d3e269d0'),('1','e309db531fd947e69c9f9231273807ec'),('1','e5ead8fcd86141019acb278f65a7c33f'),('1','e9c2d1ec11654db8a4c83d0347dda8e2'),('1','ef60de0b167a47e3814fb28a3313cb27'),('1','f9b658ea513b475f993dae22949a2813'),('3c6cad312c3340cd9b59221a08b9b0c1','0eb730a3962f48eab6b03c5e1cab1bd1'),('3c6cad312c3340cd9b59221a08b9b0c1','1360e8bcba874bf7b388d1dd0db51c30'),('3c6cad312c3340cd9b59221a08b9b0c1','13b5c928b2fe4a4383a01864818ecbf4'),('3c6cad312c3340cd9b59221a08b9b0c1','18f6a135c6e241aebc8872eface5c959'),('3c6cad312c3340cd9b59221a08b9b0c1','1ab69b86425441c19a4765e049052fa1'),('3c6cad312c3340cd9b59221a08b9b0c1','1b8c178e55874b4b947c602f3159ae5c'),('3c6cad312c3340cd9b59221a08b9b0c1','1c53bb34f778403ab4b1f613debe7a58'),('3c6cad312c3340cd9b59221a08b9b0c1','2334aada92d14bb899391d7b12a4459c'),('3c6cad312c3340cd9b59221a08b9b0c1','249be597d3f040048d9e0e62e189a898'),('3c6cad312c3340cd9b59221a08b9b0c1','2cf114a84ef743afad23e6f7c40f4ed5'),('3c6cad312c3340cd9b59221a08b9b0c1','2d87a747cd0c4e58805f24dd3d164329'),('3c6cad312c3340cd9b59221a08b9b0c1','36ffcd79923143f2a1c0c80b0b01b860'),('3c6cad312c3340cd9b59221a08b9b0c1','3df8f51cfc4f4ba2bf62329669068bad'),('3c6cad312c3340cd9b59221a08b9b0c1','4028818a56d407950156d41352630000'),('3c6cad312c3340cd9b59221a08b9b0c1','4028818a56d407950156d41435830001'),('3c6cad312c3340cd9b59221a08b9b0c1','4028818a56d407950156d4ecfafa0004'),('3c6cad312c3340cd9b59221a08b9b0c1','483bd6e02845453aa570731b996b30a2'),('3c6cad312c3340cd9b59221a08b9b0c1','48ebb2a7de204d04a41186adf57e5c89'),('3c6cad312c3340cd9b59221a08b9b0c1','4bd97b729c864ab2804fc0e5b3aecb6d'),('3c6cad312c3340cd9b59221a08b9b0c1','4d8b46bac10a45609756d6d6c4bd3dae'),('3c6cad312c3340cd9b59221a08b9b0c1','50692b8a4621423abd80327af830c0fe'),('3c6cad312c3340cd9b59221a08b9b0c1','51a292382110429c8b026eadeda03013'),('3c6cad312c3340cd9b59221a08b9b0c1','53db090be1f34af1b8be0a1c93746703'),('3c6cad312c3340cd9b59221a08b9b0c1','5a2b89a4e72643698ea10da25695274e'),('3c6cad312c3340cd9b59221a08b9b0c1','5b32d03f43664de5bc49ca76156163f8'),('3c6cad312c3340cd9b59221a08b9b0c1','5ef6770000614b95a05538f31ff1da23'),('3c6cad312c3340cd9b59221a08b9b0c1','697c86ebd7ec4a1c925c1f78b4ddd058'),('3c6cad312c3340cd9b59221a08b9b0c1','71f2101ae72f4102840418753240b626'),('3c6cad312c3340cd9b59221a08b9b0c1','732fbbb0b09a42609c6523a9d570d0c6'),('3c6cad312c3340cd9b59221a08b9b0c1','774545113ead498d91615253f6713bbc'),('3c6cad312c3340cd9b59221a08b9b0c1','7c4a86e5e33b4c82a88c971106194426'),('3c6cad312c3340cd9b59221a08b9b0c1','7d97ddd1e9b64b67b5851450f904c6d2'),('3c6cad312c3340cd9b59221a08b9b0c1','7e6fa641510f462db1986992275a0cf6'),('3c6cad312c3340cd9b59221a08b9b0c1','81bd6bd108a14cb39d64ea50fe08ac34'),('3c6cad312c3340cd9b59221a08b9b0c1','874582a0a10d4375bc22ef2bf85f6e68'),('3c6cad312c3340cd9b59221a08b9b0c1','8c9176d0325a43f3819d9045042d1d98'),('3c6cad312c3340cd9b59221a08b9b0c1','9cb2395fceea446db9ad42763274398e'),('3c6cad312c3340cd9b59221a08b9b0c1','aeb4bb332c2247a1a29350247d88f8e3'),('3c6cad312c3340cd9b59221a08b9b0c1','b37ea1c4899a400b9df85a6f8e684f60'),('3c6cad312c3340cd9b59221a08b9b0c1','b9f9ee5efe434f58b07a7cfb6863e2f3'),('3c6cad312c3340cd9b59221a08b9b0c1','c211740e4fbc4b58a37ba053f1a60896'),('3c6cad312c3340cd9b59221a08b9b0c1','c554479dbffe4955bac334478337cdd5'),('3c6cad312c3340cd9b59221a08b9b0c1','c878c5219deb4279adc7f8a819b5432e'),('3c6cad312c3340cd9b59221a08b9b0c1','d008459a8b1d428e8bb857b8f7afba8a'),('3c6cad312c3340cd9b59221a08b9b0c1','d137a40c80b34da08de87ea61c8fc0ab'),('3c6cad312c3340cd9b59221a08b9b0c1','d44fa5a5f62b46fe977b532c3a879d78'),('3c6cad312c3340cd9b59221a08b9b0c1','dac7798535964ab381a8a308cd13b628'),('3c6cad312c3340cd9b59221a08b9b0c1','dd8ef8f38bda4b889699a1dd2aa06e85'),('3c6cad312c3340cd9b59221a08b9b0c1','e13d22c686444328aeae1c9704932bb4'),('3c6cad312c3340cd9b59221a08b9b0c1','e143b2ce5a7542359ff55a81d3e269d0'),('3c6cad312c3340cd9b59221a08b9b0c1','e309db531fd947e69c9f9231273807ec'),('3c6cad312c3340cd9b59221a08b9b0c1','e5ead8fcd86141019acb278f65a7c33f'),('3c6cad312c3340cd9b59221a08b9b0c1','e9c2d1ec11654db8a4c83d0347dda8e2'),('3c6cad312c3340cd9b59221a08b9b0c1','ef60de0b167a47e3814fb28a3313cb27'),('3c6cad312c3340cd9b59221a08b9b0c1','f659643faa1340c9975c70968148b84f'),('3c6cad312c3340cd9b59221a08b9b0c1','f9b658ea513b475f993dae22949a2813');

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

/*Data for the table `sys_role_office` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) DEFAULT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(256) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `is_developer` char(1) DEFAULT NULL COMMENT '是否是开发者 0:不是 1:是',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`is_developer`) values ('1','1','1','jw_admin','e3fa16f755abfda4f9b0a6d09bf2ea99e67ece904d4afbfe729e8b676c2aa5f7ded66f278be00dd8','0001','System Admin','thinkgem@163.com','8675','13212311232','0','','127.0.0.1','2020-08-11 16:50:26','1','1','2013-05-27 08:00:00','1','2018-11-30 11:24:15','System Admin','0',NULL),('2','1','1','sd_admin','c7efd9554b843c9b0def0a2a508f602ffb8c05239876028f0b5d9436d074ef2e28ac1d1fa2d3672f','0002','sd_admin','aaa@g.com','adfadfad','15110012321','2',NULL,'60.194.106.2, 10.123.199.10','2020-01-03 10:21:42','1','1','2013-05-27 08:00:00','1','2020-08-11 16:53:59','','0',NULL),('dc9901a3720c429db612950a8c558e74',NULL,'ea09378f60774c01a2ea809bb159409b','admin','39f85c234683449e05f678d175c6e52761321ef47fdefc39638f36afdea11c7807c61668364c2ac8',NULL,'admin','admin@admin.com',NULL,'18124328932','2',NULL,'127.0.0.1','2020-08-11 16:57:05','1','1','2020-08-11 16:55:46','1','2020-08-11 16:55:46',NULL,'0',NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('1','1'),('2','1'),('dc9901a3720c429db612950a8c558e74','3c6cad312c3340cd9b59221a08b9b0c1');

/*Table structure for table `t_advertisement` */

DROP TABLE IF EXISTS `t_advertisement`;

CREATE TABLE `t_advertisement` (
  `ad_id` varchar(64) NOT NULL COMMENT '编号',
  `organ_id` varchar(64) NOT NULL COMMENT '机构号',
  `mer_id` varchar(64) DEFAULT NULL COMMENT '商户号',
  `ad_name` varchar(96) NOT NULL COMMENT '广告名称',
  `ad_title` varchar(256) NOT NULL COMMENT '广告标题',
  `ad_desc` varchar(512) DEFAULT NULL COMMENT '广告介绍',
  `ad_type` varchar(10) DEFAULT NULL COMMENT '广告类型，T-文字、I-图片、V-视频、VO-语音',
  `ad_content` text COMMENT '广告内容，如果广告类型是图片或视频，则存放对应URL地址。',
  `ad_img` varchar(512) DEFAULT NULL COMMENT '图片，如果广告类型是图片或视频，则存放对应URL地址。',
  `ad_manufacturers` varchar(128) DEFAULT NULL COMMENT '广告商',
  `ad_status` varchar(1) DEFAULT NULL COMMENT '广告状态，0-无效、1-有效',
  `ad_platform` varchar(100) DEFAULT NULL COMMENT '广告投放终端，多个终端设备代码使用逗号分隔',
  `ad_start_time` datetime DEFAULT NULL COMMENT '广告发布开始时间',
  `ad_end_time` datetime DEFAULT NULL COMMENT '广告发布结束时间',
  `release_id` varchar(64) DEFAULT NULL COMMENT '最近一次广告发布申请id',
  `release_user` varchar(10) DEFAULT NULL COMMENT '最近一次发布人',
  `release_time` datetime DEFAULT NULL COMMENT '最近一次应用发布时间，格式：YYYY-MM-DD HH:MM:SS',
  `approval_status` varchar(1) DEFAULT NULL COMMENT '审核状态：0-未审核、1-创建、2-发布、3-审核通过、4-审核拒绝',
  `approval_user` varchar(32) DEFAULT NULL COMMENT '审核人',
  `approval_opinion` varchar(1000) DEFAULT NULL COMMENT '审核意见',
  `approval_time` datetime DEFAULT NULL COMMENT '审核时间，格式：YYYY-MM-DD HH:MM:SS',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人，即应用创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间，格式：YYYY-MM-DD HH:MM:SS',
  `updator` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间，格式：YYYY-MM-DD HH:MM:SS',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '广告删除标记',
  `ad_img1` varchar(512) DEFAULT NULL COMMENT '图片名字存放路径，只存图片名称',
  `ad_links` varchar(512) DEFAULT NULL COMMENT '网站链接',
  `ad_attribution` varchar(10) DEFAULT NULL COMMENT 'ad attribution  广告归属（DA桌面APP、CA收银台APP、SA应用商店APP）',
  PRIMARY KEY (`ad_id`),
  KEY `t_advertisement_organ_id` (`organ_id`),
  KEY `t_advertisement_ad_title` (`ad_title`),
  KEY `t_advertisement_ad_name` (`ad_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告信息表';

/*Data for the table `t_advertisement` */

/*Table structure for table `t_app_approval_record` */

DROP TABLE IF EXISTS `t_app_approval_record`;

CREATE TABLE `t_app_approval_record` (
  `app_id` varchar(40) NOT NULL COMMENT 'APP_ID',
  `app_name` varchar(256) DEFAULT NULL COMMENT '应用名称',
  `organ_id` varchar(40) NOT NULL COMMENT '审批机构',
  `organ_grade` char(1) DEFAULT NULL COMMENT '机构等级',
  `create_by` varchar(40) DEFAULT NULL COMMENT '审批人',
  `create_date` datetime DEFAULT NULL COMMENT '审批时间',
  `approve_remarks` varchar(512) DEFAULT NULL COMMENT '审批意见',
  `approve_flag` char(1) DEFAULT NULL COMMENT '0-通过，1-拒绝',
  `app_data_scope` char(1) DEFAULT NULL COMMENT 'app应用范围'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用审批记录表';

/*Data for the table `t_app_approval_record` */

/*Table structure for table `t_app_developer` */

DROP TABLE IF EXISTS `t_app_developer`;

CREATE TABLE `t_app_developer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '开发者名称',
  `company` varchar(60) NOT NULL COMMENT '所属公司单位',
  `address` varchar(60) NOT NULL COMMENT '地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发者信息';

/*Data for the table `t_app_developer` */

/*Table structure for table `t_app_device` */

DROP TABLE IF EXISTS `t_app_device`;

CREATE TABLE `t_app_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `apk_id` bigint(20) NOT NULL COMMENT 'app版本信息ID',
  `manu_no` varchar(20) NOT NULL COMMENT '厂商编号',
  `device_type` varchar(60) NOT NULL COMMENT '设备型号',
  `device_sn` varchar(20) DEFAULT NULL COMMENT '设备sn号',
  `app_record_id` bigint(20) DEFAULT NULL COMMENT '发布记录表',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `device_apk_version` varchar(64) DEFAULT NULL COMMENT '升级前版本',
  `apk_version_shifter` varchar(128) DEFAULT NULL COMMENT 'APK版本号变形',
  `strategy_desc` varchar(500) DEFAULT NULL COMMENT '策略描述',
  `upgrade_type` varchar(1) DEFAULT NULL COMMENT '0-安装，1-卸载',
  `upgrade_desc` varchar(1) DEFAULT NULL COMMENT '0-静默安装，1-提示更新，2-强制更新',
  PRIMARY KEY (`id`),
  KEY `ind_union` (`apk_id`,`manu_no`,`device_type`,`device_sn`) USING BTREE,
  KEY `ind_app_record_id` (`app_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='app发布关联关系表';

/*Data for the table `t_app_device` */

/*Table structure for table `t_app_device_type` */

DROP TABLE IF EXISTS `t_app_device_type`;

CREATE TABLE `t_app_device_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `apk_id` bigint(20) NOT NULL COMMENT 'App版本表id',
  `manu_no` varchar(20) NOT NULL COMMENT '厂商编号',
  `device_type` varchar(20) DEFAULT NULL COMMENT '设备型号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `ind_manu_no` (`manu_no`) USING BTREE,
  KEY `ind_app_device_type` (`device_type`) USING BTREE,
  KEY `ind_apk_id` (`apk_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app版本信息';

/*Data for the table `t_app_device_type` */

/*Table structure for table `t_app_info` */

DROP TABLE IF EXISTS `t_app_info`;

CREATE TABLE `t_app_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'APP_ID',
  `app_name` varchar(90) NOT NULL COMMENT 'App名称',
  `app_logo` varchar(512) NOT NULL COMMENT 'App图标logo',
  `app_img` varchar(1000) NOT NULL COMMENT 'APP图片[]',
  `app_package` varchar(500) NOT NULL COMMENT 'App包名  确定唯一',
  `app_developer` bigint(20) DEFAULT NULL COMMENT '所属开发者',
  `organ_id` varchar(40) NOT NULL COMMENT '机构号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `current_approve_flag` char(1) DEFAULT '1' COMMENT '0-已上线，1-审核中，2-审核未通过，3-已下线',
  `current_approve_grade` char(1) DEFAULT '9' COMMENT '当前审批级别',
  `category` varchar(12) DEFAULT NULL COMMENT '类别',
  `platform` varchar(12) DEFAULT NULL COMMENT '所属平台',
  `client_identification` varchar(40) NOT NULL COMMENT '客户标识/跟机构',
  PRIMARY KEY (`id`),
  KEY `ind_app_package` (`app_package`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='app基本信息';

/*Data for the table `t_app_info` */

/*Table structure for table `t_app_office_info` */

DROP TABLE IF EXISTS `t_app_office_info`;

CREATE TABLE `t_app_office_info` (
  `app_id` varchar(40) NOT NULL COMMENT 'APP_ID',
  `oragan_id` varchar(40) NOT NULL COMMENT '机构编号',
  `organ_grade` char(1) DEFAULT NULL COMMENT '机构等级',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用与机构关联信息表';

/*Data for the table `t_app_office_info` */

/*Table structure for table `t_app_record` */

DROP TABLE IF EXISTS `t_app_record`;

CREATE TABLE `t_app_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `apk_id` bigint(20) NOT NULL COMMENT 'app�汾id',
  `app_name` varchar(60) NOT NULL COMMENT 'app名称',
  `app_package` varchar(60) DEFAULT NULL COMMENT 'app包名',
  `app_version` varchar(64) NOT NULL COMMENT 'app版本',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `organ_id` varchar(40) DEFAULT NULL COMMENT '机构号',
  `upgrade_type` varchar(1) DEFAULT NULL COMMENT '0-安装，1-卸载',
  `upgrade_desc` varchar(1) DEFAULT NULL COMMENT '0-静默安装，1-提示更新，2-强制更新',
  `client_identification` varchar(40) DEFAULT NULL COMMENT '客户标识/跟机构',
  PRIMARY KEY (`id`),
  KEY `ind_app_name` (`app_name`) USING BTREE,
  KEY `ind_app_version` (`app_version`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='app发布流水表';

/*Data for the table `t_app_record` */

/*Table structure for table `t_app_search_log` */

DROP TABLE IF EXISTS `t_app_search_log`;

CREATE TABLE `t_app_search_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device_sn` varchar(64) DEFAULT NULL COMMENT '设备SN',
  `search_type` varchar(32) DEFAULT NULL COMMENT 'list-查询APP应用列表,new-查询最新APP,rank-查询APP排行,condition-根据条件查询APP（搜索条件、分类）',
  `app_name` varchar(256) DEFAULT NULL COMMENT '搜索关键词',
  `class_id` varchar(64) DEFAULT NULL COMMENT '搜索类别',
  `create_date` datetime DEFAULT NULL COMMENT '搜索时间',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) DEFAULT '0' COMMENT '0-有效，1-无效',
  `organ_id` varchar(64) DEFAULT NULL COMMENT '机构号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1475 DEFAULT CHARSET=utf8 COMMENT='应用搜索记录表';

/*Data for the table `t_app_search_log` */

/*Table structure for table `t_app_upgrade_record` */

DROP TABLE IF EXISTS `t_app_upgrade_record`;

CREATE TABLE `t_app_upgrade_record` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device_sn` varchar(64) DEFAULT NULL COMMENT '设备SN',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'APP_ID',
  `app_name` varchar(128) DEFAULT NULL COMMENT 'APP名称',
  `app_package` varchar(128) DEFAULT NULL COMMENT 'APP包名',
  `app_version` varchar(64) DEFAULT NULL COMMENT 'APP版本号',
  `app_file_path` varchar(512) DEFAULT NULL COMMENT 'APP文件路径',
  `app_file_name` varchar(256) DEFAULT NULL COMMENT 'APP文件名',
  `app_file_size` varchar(32) DEFAULT NULL COMMENT 'APP文件大小',
  `upgrade_date` datetime DEFAULT NULL COMMENT '下载时间',
  `remarks` varchar(128) DEFAULT NULL COMMENT '备注',
  `organ_id` varchar(64) DEFAULT NULL COMMENT '机构号',
  `del_flag` char(1) DEFAULT '0' COMMENT '0-有效，1-无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=538 DEFAULT CHARSET=utf8 COMMENT='APP下载记录表';

/*Data for the table `t_app_upgrade_record` */

/*Table structure for table `t_app_version` */

DROP TABLE IF EXISTS `t_app_version`;

CREATE TABLE `t_app_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_name` varchar(90) NOT NULL COMMENT 'App名称',
  `app_package` varchar(500) NOT NULL COMMENT 'App包名',
  `app_version` varchar(120) DEFAULT NULL COMMENT 'App版本号',
  `app_file` varchar(150) NOT NULL COMMENT 'App APK文件',
  `app_file_size` varchar(64) DEFAULT NULL COMMENT '文件大小',
  `app_md5` varchar(90) DEFAULT NULL COMMENT 'APK校验值',
  `app_description` varchar(400) DEFAULT NULL COMMENT 'APP升级信息描述',
  `organ_id` varchar(40) DEFAULT NULL COMMENT '机构号',
  `start_hard` varchar(64) DEFAULT '' COMMENT '开始硬件版本号',
  `end_hard` varchar(64) DEFAULT '' COMMENT '结束硬件版本号',
  `start_hard_shift` varchar(64) DEFAULT '' COMMENT '开始硬件版本号转换值',
  `end_hard_shift` varchar(64) DEFAULT NULL,
  `app_version_compare_val` varchar(120) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `upgrade_mode` int(10) DEFAULT NULL COMMENT '设备更新类型',
  `app_version_number` varchar(32) DEFAULT NULL COMMENT 'app版本值',
  `client_identification` varchar(40) NOT NULL COMMENT '客户标识/跟机构',
  PRIMARY KEY (`id`),
  KEY `ind_apk_package` (`app_package`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='app版本信息';

/*Data for the table `t_app_version` */

/*Table structure for table `t_device_app_version` */

DROP TABLE IF EXISTS `t_device_app_version`;

CREATE TABLE `t_device_app_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device_sn` varchar(40) NOT NULL COMMENT '设备sn',
  `device_type` varchar(20) NOT NULL COMMENT '设备类型',
  `client_identification` varchar(40) NOT NULL COMMENT '客户标识',
  `app_package` varchar(512) DEFAULT NULL COMMENT '应用包名',
  `app_version` varchar(128) DEFAULT NULL COMMENT '版本号',
  `version_hardware` varchar(512) DEFAULT NULL COMMENT '版本号变形',
  `report_date` datetime DEFAULT NULL COMMENT '上报时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_SN_PACKAGE` (`device_sn`,`app_package`),
  FULLTEXT KEY `device_sn_package_index` (`device_sn`,`app_package`),
  FULLTEXT KEY `ind_device_sn` (`device_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8 COMMENT='设备应用版本号信息表';

/*Data for the table `t_device_app_version` */

/*Table structure for table `t_device_info` */

DROP TABLE IF EXISTS `t_device_info`;

CREATE TABLE `t_device_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device_sn` varchar(60) NOT NULL COMMENT '设备SN号',
  `device_pn` varchar(60) DEFAULT '' COMMENT 'P/N',
  `device_type` varchar(21) NOT NULL DEFAULT '' COMMENT '设备类型',
  `device_os_version` varchar(64) DEFAULT '' COMMENT '设备系统版本',
  `os_version_shifter` varchar(64) DEFAULT NULL COMMENT '设备系统版本号的变形',
  `device_version` varchar(10) DEFAULT '' COMMENT '版本号',
  `tusn` varchar(100) DEFAULT '' COMMENT '银联唯一终端标识',
  `product_type_code` varchar(10) DEFAULT '' COMMENT '产品类型代码',
  `device_info` json DEFAULT NULL COMMENT '设备信息',
  `device_bank` varchar(60) DEFAULT '' COMMENT '设备所属单位',
  `client_no` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `manufacturer_no` varchar(50) NOT NULL COMMENT '厂商编号',
  `organ_id` varchar(40) NOT NULL COMMENT '机构号',
  `hardware_version` varchar(64) DEFAULT '' COMMENT '设备硬件版本',
  `hardware_shifter` varchar(64) DEFAULT '' COMMENT '硬件版本号变形 1.0.0 ——》001000000',
  `device_status` char(1) DEFAULT '0' COMMENT '设备状态 0-正常 1-不正常',
  `os_status` char(1) DEFAULT '0' COMMENT '版本更新状态 0-版本一致 1-版本不一致',
  `os_upgrade_type` char(1) DEFAULT '0' COMMENT '设备升级方式 0-被动 1-主动',
  `os_msg` varchar(80) DEFAULT '' COMMENT '更新结果状态描述',
  `app_info` json DEFAULT NULL COMMENT 'app信息',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `mer_id` varchar(32) DEFAULT NULL COMMENT '商户号',
  `shop_id` varchar(32) DEFAULT NULL COMMENT '门店号',
  `device_bund_state` char(1) DEFAULT '0' COMMENT '终端绑定状态，默认未绑定0，已绑定1',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `install_location` varchar(255) DEFAULT '' COMMENT '安装地址',
  `install_date` datetime DEFAULT NULL COMMENT '安装日期',
  `device_sort` varchar(255) DEFAULT 'Smart Terminal' COMMENT '设备类别',
  `mac_no` varchar(64) DEFAULT NULL,
  `scope_mode` char(1) DEFAULT NULL COMMENT '范围模式',
  `labels` varchar(700) DEFAULT NULL COMMENT '所属标签',
  `location` json DEFAULT NULL,
  `root_organ_id` varchar(40) NOT NULL COMMENT '所属根机构',
  PRIMARY KEY (`id`),
  KEY `ind_device_sn` (`device_sn`,`device_type`,`manufacturer_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='设备信息';

/*Data for the table `t_device_info` */

/*Table structure for table `t_device_login` */

DROP TABLE IF EXISTS `t_device_login`;

CREATE TABLE `t_device_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device_sn` varchar(32) NOT NULL COMMENT '设备SN',
  `password_err_num` int(11) NOT NULL COMMENT '密码错误计数',
  `last_login_success` datetime NOT NULL COMMENT '最后成功登录时间',
  `last_login_attempt` datetime NOT NULL COMMENT '最后尝试登录时间',
  `session_id` varchar(32) DEFAULT NULL COMMENT 'session',
  `last_operate_time` varchar(14) DEFAULT NULL COMMENT '最后操作时间yyyyMMddHHmmss',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=gbk COMMENT='用户登录控制表';

/*Data for the table `t_device_login` */

/*Table structure for table `t_device_merchant` */

DROP TABLE IF EXISTS `t_device_merchant`;

CREATE TABLE `t_device_merchant` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_sn` varchar(32) NOT NULL COMMENT '终端号',
  `store_id` varchar(32) DEFAULT NULL COMMENT '门店号',
  `mer_id` varchar(32) NOT NULL COMMENT '商户号',
  `reverse1` varchar(20) DEFAULT NULL COMMENT '备用字段',
  `reverse2` varchar(20) DEFAULT NULL COMMENT '备用字段',
  `reverse3` varchar(20) DEFAULT NULL COMMENT '备用字段',
  `reverse4` varchar(20) DEFAULT NULL COMMENT '备用字段',
  `reverse5` varchar(20) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`device_sn`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_device_merchant` */

/*Table structure for table `t_device_tag` */

DROP TABLE IF EXISTS `t_device_tag`;

CREATE TABLE `t_device_tag` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `device_sn` varchar(32) DEFAULT NULL COMMENT '设备编号',
  `tag_id` varchar(32) DEFAULT NULL COMMENT '标签ID',
  `org_id` varchar(32) DEFAULT NULL COMMENT '机构ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_device_tag` */

/*Table structure for table `t_device_type_info` */

DROP TABLE IF EXISTS `t_device_type_info`;

CREATE TABLE `t_device_type_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manufacturer_no` varchar(150) DEFAULT NULL COMMENT '厂商编号',
  `device_type` varchar(63) DEFAULT NULL COMMENT '设备类型',
  `create_by` varchar(192) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(192) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(765) DEFAULT NULL COMMENT '备注',
  `del_flag` char(3) DEFAULT '0',
  `alias` varchar(128) DEFAULT NULL,
  `organ_id` varchar(40) NOT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `t_device_type_info` */

/*Table structure for table `t_log_file` */

DROP TABLE IF EXISTS `t_log_file`;

CREATE TABLE `t_log_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` varchar(4) DEFAULT NULL COMMENT '版本号',
  `manufacturer_no` varchar(15) DEFAULT NULL COMMENT '厂商编号',
  `device_type` varchar(4) DEFAULT NULL COMMENT '设备型号',
  `sn` varchar(64) DEFAULT NULL COMMENT '设备序列号',
  `log_name` varchar(128) DEFAULT NULL COMMENT '日志文件名称',
  `log_md5` varchar(64) DEFAULT NULL COMMENT '日志文件MD5',
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `file_path` varchar(256) DEFAULT NULL COMMENT '文件路径',
  `rec_date` datetime DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志文件信息表';

/*Data for the table `t_log_file` */

/*Table structure for table `t_manufacturer_info` */

DROP TABLE IF EXISTS `t_manufacturer_info`;

CREATE TABLE `t_manufacturer_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `manufacturer_name` varchar(60) NOT NULL COMMENT '厂商名称',
  `manufacturer_no` varchar(20) NOT NULL COMMENT '厂商编号',
  `manufacturer_addr` varchar(100) DEFAULT '' COMMENT '厂商地址',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `organ_id` varchar(40) NOT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`),
  KEY `ind_manuno` (`manufacturer_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='厂商信息';

/*Data for the table `t_manufacturer_info` */

/*Table structure for table `t_merchant` */

DROP TABLE IF EXISTS `t_merchant`;

CREATE TABLE `t_merchant` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `mer_id` varchar(32) NOT NULL COMMENT '商户号',
  `mer_name` varchar(64) DEFAULT NULL COMMENT '商户名称',
  `org_id` varchar(32) NOT NULL COMMENT '所属机构',
  `link_man` varchar(32) DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(24) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `longitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) DEFAULT NULL COMMENT '纬度',
  `radius` int(10) DEFAULT NULL COMMENT '商户下属设备距离商户地址有效半径，单位米（m）',
  `reverse1` varchar(20) DEFAULT NULL COMMENT '备用字段',
  `reverse2` varchar(20) DEFAULT NULL COMMENT '备用字段',
  `reverse3` varchar(20) DEFAULT NULL COMMENT '备用字段',
  `reverse4` varchar(20) DEFAULT NULL COMMENT '备用字段',
  `reverse5` varchar(20) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_merchant` */

/*Table structure for table `t_os_rom_info` */

DROP TABLE IF EXISTS `t_os_rom_info`;

CREATE TABLE `t_os_rom_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `os_version` varchar(64) NOT NULL COMMENT '系统版本',
  `os_device_type` varchar(50) NOT NULL COMMENT '设备类型',
  `rom_hash` varchar(255) NOT NULL COMMENT '版本特征值',
  `rom_path` varchar(90) NOT NULL DEFAULT '' COMMENT '系统文件路径',
  `os_start` varchar(64) DEFAULT '' COMMENT '升级开始版本',
  `os_end` varchar(64) DEFAULT '' COMMENT '升级结束版本',
  `manufacturer_no` varchar(20) NOT NULL COMMENT '厂商编号',
  `client_identification` varchar(12) DEFAULT '' COMMENT '客户标识',
  `start_hard` varchar(64) DEFAULT '' COMMENT '开始硬件版本号',
  `end_hard` varchar(64) DEFAULT '' COMMENT '结束硬件版本号',
  `start_hard_shift` varchar(64) DEFAULT '' COMMENT '开始硬件版本号转换值',
  `end_hard_shift` varchar(64) DEFAULT NULL,
  `os_packet_type` char(1) DEFAULT '' COMMENT '升级包类型 0 全量包 1-差分包',
  `rom_file_size` bigint(20) NOT NULL COMMENT 'rom文件大小',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '系统升级信息描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `ind_device_type` (`os_device_type`) USING BTREE,
  KEY `ind_manu_no` (`manufacturer_no`) USING BTREE,
  KEY `ind_os_version` (`os_version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统版本信息';

/*Data for the table `t_os_rom_info` */

/*Table structure for table `t_push_rec` */

DROP TABLE IF EXISTS `t_push_rec`;

CREATE TABLE `t_push_rec` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `os_id` varchar(12) NOT NULL COMMENT '系统版本Id',
  `message_content` varchar(100) DEFAULT NULL COMMENT '消息内容',
  `device_id` varchar(90) NOT NULL DEFAULT '' COMMENT '设备id',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='推送流水';

/*Data for the table `t_push_rec` */

/*Table structure for table `t_record_info` */

DROP TABLE IF EXISTS `t_record_info`;

CREATE TABLE `t_record_info` (
  `id` varchar(20) NOT NULL COMMENT '记录ID  YYYYMMDDHHmmssSSS + 3位random',
  `parent_id` varchar(20) DEFAULT NULL COMMENT '上一级记录ID',
  `status` char(1) DEFAULT NULL COMMENT '状态 0-正常，1-获取中，9-失败',
  `package_info` json DEFAULT NULL COMMENT '本级包内信息',
  `record_datetime` varchar(14) DEFAULT NULL COMMENT '记录时间',
  `package_path` varchar(512) DEFAULT NULL COMMENT '本级包路径',
  `package_name` varchar(64) DEFAULT NULL COMMENT '本级包名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='获取日志流水表';

/*Data for the table `t_record_info` */

/*Table structure for table `t_record_rom_info` */

DROP TABLE IF EXISTS `t_record_rom_info`;

CREATE TABLE `t_record_rom_info` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `os_id` int(10) NOT NULL COMMENT '版本id',
  `os_version` varchar(64) NOT NULL COMMENT '系统版本',
  `os_version_shifter` varchar(60) DEFAULT NULL COMMENT '版本号变形',
  `os_device_type` varchar(50) DEFAULT NULL COMMENT '设备类型',
  `manufacturer_no` varchar(50) DEFAULT NULL COMMENT '商户编号',
  `create_by` varchar(64) NOT NULL COMMENT '发布人',
  `create_date` datetime NOT NULL COMMENT '发布时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统版本发布流水表';

/*Data for the table `t_record_rom_info` */

/*Table structure for table `t_rom_device` */

DROP TABLE IF EXISTS `t_rom_device`;

CREATE TABLE `t_rom_device` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `os_id` int(10) NOT NULL COMMENT '系统版本Id',
  `device_id` int(10) NOT NULL COMMENT '设备id',
  `device_version` varchar(64) NOT NULL COMMENT '升级前版本',
  `os_version_shifter` varchar(128) DEFAULT NULL COMMENT '系统版本号变形',
  `strategy_desc` varchar(500) DEFAULT NULL COMMENT '策略描述',
  `upgrade_type` char(1) DEFAULT '0' COMMENT '升级方式 0-被动 1-主动',
  `record_rom_id` bigint(20) NOT NULL COMMENT '发布流水记录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `ind_os_id` (`os_id`) USING BTREE,
  KEY `ind_device_id` (`device_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备与升级版本信息';

/*Data for the table `t_rom_device` */

/*Table structure for table `t_store` */

DROP TABLE IF EXISTS `t_store`;

CREATE TABLE `t_store` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `store_id` varchar(32) NOT NULL COMMENT '门店号',
  `store_name` varchar(64) DEFAULT NULL COMMENT '门店名称',
  `org_id` varchar(32) DEFAULT NULL COMMENT '所属机构',
  `mer_id` varchar(32) NOT NULL COMMENT '所属商户号',
  `link_man` varchar(64) DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `longitude` varchar(20) NOT NULL COMMENT '经度',
  `latitude` varchar(20) NOT NULL COMMENT '纬度',
  `radius` int(5) NOT NULL DEFAULT '500' COMMENT '终端有效半径',
  `reverse1` varchar(32) DEFAULT NULL COMMENT '备用字段',
  `reverse2` varchar(32) DEFAULT NULL COMMENT '备用字段',
  `reverse3` varchar(32) DEFAULT NULL COMMENT '备用字段',
  `reverse4` varchar(32) DEFAULT NULL COMMENT '备用字段',
  `reverse5` varchar(32) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_store` */

/*Table structure for table `t_strategy_info` */

DROP TABLE IF EXISTS `t_strategy_info`;

CREATE TABLE `t_strategy_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `strategy_name` varchar(50) DEFAULT NULL COMMENT '策略名称',
  `begin_date` datetime NOT NULL COMMENT '策略开始时间',
  `end_date` datetime NOT NULL COMMENT '策略结束时间',
  `strategy_desc` varchar(500) DEFAULT NULL COMMENT '策略描述',
  `upgrade_type` char(1) DEFAULT '0' COMMENT '升级方式 0-提示 1-强制',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `organ_id` varchar(40) DEFAULT NULL COMMENT '机构号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='策略基础信息';

/*Data for the table `t_strategy_info` */

/*Table structure for table `t_tag_info` */

DROP TABLE IF EXISTS `t_tag_info`;

CREATE TABLE `t_tag_info` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `tag_name` varchar(500) DEFAULT NULL COMMENT '标签名称',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `tag_status` varchar(2) DEFAULT '' COMMENT '标签状态',
  `org_id` varchar(32) NOT NULL COMMENT '机构ID',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签信息表';

/*Data for the table `t_tag_info` */

/*Table structure for table `t_tms_device_info` */

DROP TABLE IF EXISTS `t_tms_device_info`;

CREATE TABLE `t_tms_device_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device_sn` varchar(20) DEFAULT NULL COMMENT '设备sn',
  `manu_no` varchar(40) DEFAULT NULL COMMENT '厂商',
  `device_type` varchar(10) DEFAULT NULL COMMENT '设备型号',
  `mer_id` varchar(20) DEFAULT NULL COMMENT '商户号',
  `term_id` varchar(20) DEFAULT NULL COMMENT '终端号',
  `create_date` datetime DEFAULT NULL COMMENT '记录时间',
  `strategy_id` varchar(20) DEFAULT NULL COMMENT '策略ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='更新设备信息表';

/*Data for the table `t_tms_device_info` */

/*Table structure for table `t_tms_device_type_info` */

DROP TABLE IF EXISTS `t_tms_device_type_info`;

CREATE TABLE `t_tms_device_type_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manufacturer_no` varchar(450) DEFAULT NULL,
  `device_type` varchar(189) DEFAULT NULL,
  `create_by` varchar(576) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(576) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(2295) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  `organ_id` varchar(64) NOT NULL COMMENT '机构号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `t_tms_device_type_info` */

/*Table structure for table `t_tms_file` */

DROP TABLE IF EXISTS `t_tms_file`;

CREATE TABLE `t_tms_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '更新物文件ID',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名称',
  `manufacture_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '厂商编号',
  `file_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件类型',
  `file_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件大小',
  `file_version` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件版本',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件路径',
  `upload_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '描述',
  `organ_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机构号',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '有效标识',
  `md5` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件md5值',
  `root_organ_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属跟机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='更新物文件信息表';

/*Data for the table `t_tms_file` */

/*Table structure for table `t_tms_file_strategy` */

DROP TABLE IF EXISTS `t_tms_file_strategy`;

CREATE TABLE `t_tms_file_strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '更新物文件ID',
  `strategy_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '策略ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='更新文件策略关联表';

/*Data for the table `t_tms_file_strategy` */

/*Table structure for table `t_tms_log` */

DROP TABLE IF EXISTS `t_tms_log`;

CREATE TABLE `t_tms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `strategy_id` int(11) DEFAULT NULL COMMENT '策略ID',
  `strategy_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '策略名称',
  `begin_date` datetime DEFAULT NULL COMMENT '策略开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '策略结束时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '更新次数',
  `device_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备类型',
  `device_sn` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '设备SN',
  `mer_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商户号',
  `term_no` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '终端号',
  `operate_date` datetime DEFAULT NULL COMMENT '执行时间',
  `manufacture_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '厂商编号',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `upgrade_result` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '00-更新成功，99-更新失败',
  `organ_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构号',
  `root_organ_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属跟机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='更新日志表';

/*Data for the table `t_tms_log` */

/*Table structure for table `t_tms_strategy` */

DROP TABLE IF EXISTS `t_tms_strategy`;

CREATE TABLE `t_tms_strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strategy_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '策略名称',
  `begin_date` datetime NOT NULL COMMENT '策略开始时间',
  `end_date` datetime NOT NULL COMMENT '策略结束时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '更新次数 O:一次，M:多次',
  `device_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备类型',
  `device_sn_str` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '设备SN字符串',
  `manufacture_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '厂商编号',
  `mer_no` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商户号',
  `term_no` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '终端号',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `organ_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机构号',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `device_count` int(11) DEFAULT NULL COMMENT '设备数量',
  `root_organ_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属跟机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='策略文件信息表';

/*Data for the table `t_tms_strategy` */

/*Table structure for table `t_upgrade_translog` */

DROP TABLE IF EXISTS `t_upgrade_translog`;

CREATE TABLE `t_upgrade_translog` (
  `id` bigint(25) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID记录',
  `device_type` varchar(20) NOT NULL COMMENT '设备型号',
  `device_sn` varchar(20) NOT NULL COMMENT '设备SN',
  `manu_no` varchar(20) DEFAULT NULL COMMENT '厂商编号',
  `method_name` varchar(100) DEFAULT '' COMMENT '方法名称',
  `packet_info` json NOT NULL COMMENT 'json包信息',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291777 DEFAULT CHARSET=utf8 COMMENT='设备升级记录';

/*Data for the table `t_upgrade_translog` */

/*Tms menu*/
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','3ffe5a7802fa4b719a4bd837ea5d94be');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','0309ea986e244bff842f9a5f44a586f6');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','3f2b7770ffd74fdd95f3c83eb3b84411');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','427b3426fc5b4439a7d8698ca313c909');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','4ae51e96b57d49a58d0d2788c212f08c');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','4f310b8e94744aa8a94df75758f7e57c');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','5efcd30a607b452189a1d37f5b9266ad');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','84b2e4494bb2404da6bc312ee6efa11b');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','8678e7476499489f927d6e6ef6712123');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','b7031652c4844503b39de71e4001a8b7');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','cfe24c81127445469a9bd853b74c553a');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('1','e5f7b1c64570402bba11440762404c1a');

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','3ffe5a7802fa4b719a4bd837ea5d94be');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','0309ea986e244bff842f9a5f44a586f6');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','3f2b7770ffd74fdd95f3c83eb3b84411');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','427b3426fc5b4439a7d8698ca313c909');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','4ae51e96b57d49a58d0d2788c212f08c');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','4f310b8e94744aa8a94df75758f7e57c');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','5efcd30a607b452189a1d37f5b9266ad');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','84b2e4494bb2404da6bc312ee6efa11b');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','8678e7476499489f927d6e6ef6712123');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','b7031652c4844503b39de71e4001a8b7');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','cfe24c81127445469a9bd853b74c553a');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES('3c6cad312c3340cd9b59221a08b9b0c1','e5f7b1c64570402bba11440762404c1a');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

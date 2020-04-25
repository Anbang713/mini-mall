/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.22-log : Database - mall_product
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mall_product` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mall_product`;

/*Table structure for table `prod_goods` */

DROP TABLE IF EXISTS `prod_goods`;

CREATE TABLE `prod_goods` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `code` varchar(32) NOT NULL COMMENT '代码',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `remark` varchar(1024) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`uuid`),
  KEY `idx_goods_1` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

/*Data for the table `prod_goods` */

insert  into `prod_goods`(`uuid`,`code`,`name`,`state`,`remark`) values ('1241278127902240768','AJ-001','AJ1代篮球鞋','using','第一个商品上架啦。');

/*Table structure for table `prod_goods_inbound` */

DROP TABLE IF EXISTS `prod_goods_inbound`;

CREATE TABLE `prod_goods_inbound` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `bill_number` varchar(32) NOT NULL COMMENT '入库单号',
  `state` varchar(16) NOT NULL COMMENT '业务状态',
  `inbound_date` date NOT NULL COMMENT '入库日期',
  `warehouse` varchar(255) NOT NULL COMMENT '仓库',
  `goods_uuids` varchar(4056) NOT NULL COMMENT '商品uuid集合',
  `remark` varchar(1024) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`uuid`),
  KEY `idx_inbound_1` (`bill_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品入库表';

/*Data for the table `prod_goods_inbound` */

insert  into `prod_goods_inbound`(`uuid`,`bill_number`,`state`,`inbound_date`,`warehouse`,`goods_uuids`,`remark`) values ('1241599715671425024','1241599715533012992','effect','2020-03-22','北京仓库一','1241278127902240768','准备入库'),('1241604669719052288','1241604669584834560','effect','2020-03-22','北京仓库一','1241278127902240768',NULL),('1241606218449133568','1241606218310721536','effect','2020-03-22','北京仓库二','1241278127902240768',NULL),('1241606264989130752','1241606264859107328','effect','2020-03-22','北京仓库二','1241278127902240768',NULL),('1241607509778878464','1241607509640466432','effect','2020-03-01','上海仓库一','1241278127902240768','入库啦啦啦'),('1241876800457633792','1241876800285667328','effect','2020-03-23','北京仓库一','1241278127902240768',NULL),('1241877832231251968','1241877832088645632','effect','2020-03-23','北京仓库一','1241278127902240768',NULL),('1243538843690577920','1243538843531194368','effect','2020-03-27','深圳仓库一','1241278127902240768',NULL),('1243539059164557312','1243539059013562368','effect','2020-03-27','深圳仓库一','1241278127902240768',NULL),('1243540566328963072','1243540566169579520','effect','2020-03-27','深圳仓库一','1241278127902240768',NULL),('1243541939133022208','1243541938982027264','effect','2020-03-26','深圳仓库一','1241278127902240768','深圳仓库一，入库数量由1改成2，分布式事务成功执行，生效成功。'),('1243545149725954048','1243545149583347712','effect','2020-03-27','深圳仓库一','1241278127902240768','深圳仓库一，入库数量2，分布式事务成功执行，入库单生效。'),('1243548369173020672','1243548369026220032','effect','2020-03-27','深圳仓库一','1241278127902240768',''),('1243551832976080896','1243551832816697344','effect','2020-03-27','广州仓库一','1241278127902240768',NULL),('1243551963649622016','1243551963498627072','effect','2020-03-27','广州仓库一','1241278127902240768',NULL),('1243557986670186496','1243557986519191552','effect','2020-03-27','广州仓库一','1241278127902240768','123');

/*Table structure for table `prod_inbound_detail` */

DROP TABLE IF EXISTS `prod_inbound_detail`;

CREATE TABLE `prod_inbound_detail` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `goods_inbound_uuid` varchar(38) NOT NULL COMMENT '入库单uuid',
  `line_number` int(8) NOT NULL COMMENT '行号',
  `goods_uuid` varchar(38) NOT NULL COMMENT '商品uuid',
  `quantity` int(11) NOT NULL COMMENT '入库数量',
  `warehouse_qty` int(11) NOT NULL COMMENT '库存数量',
  PRIMARY KEY (`uuid`),
  KEY `idx_detail_1` (`goods_inbound_uuid`,`line_number`),
  KEY `idx_detail_2` (`goods_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品入库明细表';

/*Data for the table `prod_inbound_detail` */

insert  into `prod_inbound_detail`(`uuid`,`goods_inbound_uuid`,`line_number`,`goods_uuid`,`quantity`,`warehouse_qty`) values ('1241599715939860480','1241599715671425024',1,'1241278127902240768',1000,0),('1241604669974904832','1241604669719052288',1,'1241278127902240768',500,1000),('1241606218709180416','1241606218449133568',1,'1241278127902240768',100,0),('1241606265148514304','1241606264989130752',1,'1241278127902240768',200,0),('1241607510022148096','1241607509778878464',1,'1241278127902240768',1000,0),('1241876800759623680','1241876800457633792',1,'1241278127902240768',1,1000),('1241877832365469696','1241877832231251968',1,'1241278127902240768',1,1001),('1243538843904487424','1243538843690577920',1,'1241278127902240768',1,0),('1243539059323940864','1243539059164557312',1,'1241278127902240768',1,1),('1243540566538678272','1243540566328963072',1,'1241278127902240768',1,2),('1243541939443400704','1243541939133022208',1,'1241278127902240768',2,4),('1243545150006972416','1243545149725954048',1,'1241278127902240768',2,2),('1243548369357570048','1243548369173020672',1,'1241278127902240768',1,6),('1243551833273876480','1243551832976080896',1,'1241278127902240768',2,0),('1243551963813199872','1243551963649622016',1,'1241278127902240768',1,2),('1243557986858930176','1243557986670186496',1,'1241278127902240768',2,7);

/*Table structure for table `undo_log` */

DROP TABLE IF EXISTS `undo_log`;

CREATE TABLE `undo_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `undo_log` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

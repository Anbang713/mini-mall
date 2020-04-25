/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.22-log : Database - mall_sales
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mall_sales` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mall_sales`;

/*Table structure for table `sales_input` */

DROP TABLE IF EXISTS `sales_input`;

CREATE TABLE `sales_input` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `bill_number` varchar(32) NOT NULL COMMENT '单号',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `store_uuid` varchar(38) NOT NULL COMMENT '项目uuid',
  `tenant_uuid` varchar(38) NOT NULL COMMENT '商户uuid',
  `contract_uuid` varchar(38) NOT NULL COMMENT '合同uuid',
  `payment_type_uuid` varchar(38) NOT NULL COMMENT '付款方式uuid',
  `pay_total` decimal(19,2) NOT NULL COMMENT '付款金额',
  `goods_uuids` varchar(4096) NOT NULL COMMENT '商品uuid集合',
  `remark` varchar(1024) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`uuid`),
  KEY `idx_input_1` (`bill_number`),
  KEY `idx_input_2` (`store_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售数据录入表';

/*Data for the table `sales_input` */

insert  into `sales_input`(`uuid`,`bill_number`,`state`,`store_uuid`,`tenant_uuid`,`contract_uuid`,`payment_type_uuid`,`pay_total`,`goods_uuids`,`remark`) values ('1241883913766535168','1241883913623928832','effect','1241011323703345152','1241248298075152384','1241362100825239552','1241256133374763008','22000.00','1241278127902240768,1241278127902240768',NULL),('1241886508497227776','1241886508325261312','effect','1241011323703345152','1241248298075152384','1241362100825239552','1241256133374763008','20000.00','1241278127902240768',NULL),('1243716574973739008','1243716574826938368','effect','1241011323703345152','1241248298075152384','1241362100825239552','1241256133374763008','8000.00','1241278127902240768',NULL),('1243717727887245312','1243717727748833280','ineffect','1241011323703345152','1241248298075152384','1241362100825239552','1241256133374763008','2000.00','1241278127902240768',NULL),('1243774291570515968','1243774291432103936','effect','1243767915607711744','1243770904154169344','1243771286259458048','1241256854635655168','80000.00','1241278127902240768','海底捞也卖AJ了？');

/*Table structure for table `sales_input_detail` */

DROP TABLE IF EXISTS `sales_input_detail`;

CREATE TABLE `sales_input_detail` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `input_uuid` varchar(38) NOT NULL COMMENT '主表uuid',
  `line_number` int(8) NOT NULL COMMENT '行号',
  `sales_date` date NOT NULL COMMENT '销售日期',
  `goods_uuid` varchar(38) NOT NULL COMMENT '商品uuid',
  `warehouse_qty` int(11) NOT NULL COMMENT '商品仓库库存',
  `warehouse` varchar(255) NOT NULL COMMENT '仓库',
  `quantity` int(11) NOT NULL COMMENT '本次销售数量',
  `total` decimal(19,2) NOT NULL COMMENT '销售金额',
  `remark` varchar(1024) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`uuid`),
  KEY `idx_inputdetail_1` (`input_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售明细表';

/*Data for the table `sales_input_detail` */

insert  into `sales_input_detail`(`uuid`,`input_uuid`,`line_number`,`sales_date`,`goods_uuid`,`warehouse_qty`,`warehouse`,`quantity`,`total`,`remark`) values ('1241883913921724416','1241883913766535168',1,'2020-03-01','1241278127902240768',1002,'北京仓库一',2,'2000.00',NULL),('1241883913921724417','1241883913766535168',2,'2020-03-02','1241278127902240768',1000,'上海仓库一',20,'20000.00',NULL),('1241886508878909440','1241886508497227776',1,'2020-03-23','1241278127902240768',1000,'北京仓库一',20,'20000.00',NULL),('1243716575275728896','1243716574973739008',1,'2020-03-28','1241278127902240768',7,'深圳仓库一',5,'5000.00',NULL),('1243717728059211776','1243717727887245312',1,'2020-03-26','1241278127902240768',2,'深圳仓库一',1,'2000.00',NULL),('1243774291855728640','1243774291570515968',1,'2019-01-01','1241278127902240768',980,'北京仓库一',80,'80000.00',NULL);

/*Table structure for table `sales_paymenttype` */

DROP TABLE IF EXISTS `sales_paymenttype`;

CREATE TABLE `sales_paymenttype` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `code` varchar(32) NOT NULL COMMENT '代码',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `remark` varchar(1024) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`uuid`),
  KEY `idx_paymenttype_1` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='付款方式表';

/*Data for the table `sales_paymenttype` */

insert  into `sales_paymenttype`(`uuid`,`code`,`name`,`state`,`remark`) values ('1241256133374763008','001','支付宝','using','支付宝'),('1241256854635655168','002','微信支付','using','微信支付'),('1241256926765101056','003','银联支付','using','银联支付');

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

/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.22-log : Database - mall_account
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mall_account` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mall_account`;

/*Table structure for table `acc_statement` */

DROP TABLE IF EXISTS `acc_statement`;

CREATE TABLE `acc_statement` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `bill_number` varchar(38) NOT NULL COMMENT '单号',
  `state` varchar(16) NOT NULL COMMENT '业务状态',
  `pay_state` varchar(16) NOT NULL COMMENT '付款状态',
  `store_uuid` varchar(38) NOT NULL COMMENT '项目uuid',
  `tenant_uuid` varchar(38) NOT NULL COMMENT '商户uuid',
  `contract_uuid` varchar(38) NOT NULL COMMENT '合同uuid',
  `account_date` date NOT NULL COMMENT '记账日期',
  `sales_rate` decimal(19,4) NOT NULL COMMENT '销售提成率',
  `total` decimal(19,2) NOT NULL COMMENT '账单总金额',
  `tax` decimal(19,2) NOT NULL COMMENT '账单总税额',
  PRIMARY KEY (`uuid`),
  KEY `idx_statement_1` (`contract_uuid`),
  KEY `idx_statement_2` (`store_uuid`,`tenant_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单主表';

/*Data for the table `acc_statement` */

insert  into `acc_statement`(`uuid`,`bill_number`,`state`,`pay_state`,`store_uuid`,`tenant_uuid`,`contract_uuid`,`account_date`,`sales_rate`,`total`,`tax`) values ('1242799175114129408','1242799174958940160','effect','unPay','1241011323703345152','1241248298075152384','1241362100825239552','2020-03-25','0.0500','322.58','16.13');

/*Table structure for table `acc_statement_detail` */

DROP TABLE IF EXISTS `acc_statement_detail`;

CREATE TABLE `acc_statement_detail` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `statement_uuid` varchar(38) NOT NULL COMMENT '账单主表uuid',
  `line_number` int(8) NOT NULL COMMENT '行号',
  `begin_date` date NOT NULL COMMENT '结算起始日期',
  `end_date` date NOT NULL COMMENT '结算结束日期',
  `total` decimal(19,2) NOT NULL COMMENT '本次结算金额',
  `tax` decimal(19,2) NOT NULL COMMENT '本次结算税额',
  `sales_total` decimal(19,2) NOT NULL COMMENT '本次销售提成总额',
  `sales_tax` decimal(19,2) NOT NULL COMMENT '本次销售提成税额',
  `subject_uuid` varchar(38) NOT NULL COMMENT '科目uuid',
  `tax_rate` decimal(19,4) NOT NULL COMMENT '税率',
  PRIMARY KEY (`uuid`),
  KEY `idx_smdetail_1` (`statement_uuid`,`line_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单明细表';

/*Data for the table `acc_statement_detail` */

insert  into `acc_statement_detail`(`uuid`,`statement_uuid`,`line_number`,`begin_date`,`end_date`,`total`,`tax`,`sales_total`,`sales_tax`,`subject_uuid`,`tax_rate`) values ('1242799175357399040','1242799175114129408',1,'2019-08-31','2019-09-01','322.58','16.13','0.00','0.00','1241267802272423936','0.0500');

/*Table structure for table `acc_subject` */

DROP TABLE IF EXISTS `acc_subject`;

CREATE TABLE `acc_subject` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `code` varchar(32) NOT NULL COMMENT '代码',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `tax_rate` decimal(6,4) NOT NULL COMMENT '税率',
  `remark` varchar(1024) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`uuid`),
  KEY `idx_subject_1` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目表';

/*Data for the table `acc_subject` */

insert  into `acc_subject`(`uuid`,`code`,`name`,`state`,`tax_rate`,`remark`) values ('1241267802272423936','001','月固定科目','using','0.0500','第一个科目，见证奇迹的时刻到了。');

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

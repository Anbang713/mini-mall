/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.22-log : Database - mall_basis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mall_basis` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mall_basis`;

/*Table structure for table `basis_stock` */

DROP TABLE IF EXISTS `basis_stock`;

CREATE TABLE `basis_stock` (
  `uuid` varchar(38) NOT NULL COMMENT '唯一标识',
  `entity_key` varchar(255) NOT NULL COMMENT '实体唯一键',
  `warehouse` varchar(255) NOT NULL COMMENT '仓库',
  `quantity` int(11) NOT NULL COMMENT '库存数量',
  PRIMARY KEY (`uuid`),
  KEY `idx_stock_1` (`entity_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存表';

/*Data for the table `basis_stock` */

insert  into `basis_stock`(`uuid`,`entity_key`,`warehouse`,`quantity`) values ('1241606371969015808','mall:product:goods:1241278127902240768','北京仓库二',200),('1241607542326632448','mall:product:goods:1241278127902240768','上海仓库一',980),('1241877133531492352','mall:product:goods:1241278127902240768','北京仓库一',900),('1243538893913165824','mall:product:goods:1241278127902240768','深圳仓库一',2),('1243551855658807296','mall:product:goods:1241278127902240768','广州仓库一',9);

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

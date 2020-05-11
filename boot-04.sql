/*
SQLyog Enterprise - MySQL GUI v7.13 
MySQL - 5.6.26 : Database - 1908a_2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`1908a_2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `1908a_2`;

/*Table structure for table `t_books` */

DROP TABLE IF EXISTS `t_books`;

CREATE TABLE `t_books` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_author` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_type` int(11) DEFAULT NULL,
  `t_price` float DEFAULT NULL,
  `t_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_date` date DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_books` */

insert  into `t_books`(`t_id`,`t_name`,`t_author`,`t_type`,`t_price`,`t_desc`,`t_date`) values (17,'山东分公司','佛山分公司的',0,4336,'地方撒旦如果不','2020-04-27'),(18,'11的犯得上发射点','11发给对方',2,11564,'11梵蒂冈是法国','2011-04-14');

/*Table structure for table `t_menus` */

DROP TABLE IF EXISTS `t_menus`;

CREATE TABLE `t_menus` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_text` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_href` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_pid` int(11) DEFAULT '0',
  `t_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'tree',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_menus` */

insert  into `t_menus`(`t_id`,`t_text`,`t_href`,`t_pid`,`t_type`) values (1,'书籍管理','',0,'tree'),(3,'系统管理','',0,'tree'),(4,'档案管理',NULL,0,'tree'),(5,'查询书籍','/book/toList',1,'tree'),(6,'查询档案','/archive/toList',4,'tree'),(7,'权限管理',NULL,0,'tree'),(8,'查询菜单','/menu/toList',7,'tree'),(12,'dfsfg','dfsdg',4,'tree'),(17,'的发射点1','法撒旦1',3,'tree'),(18,'发的打法','士大夫似的',3,'tree'),(20,'风格豆腐干b','风格豆腐干',0,'tree'),(21,'士大夫十','大夫撒',20,'tree'),(22,'的说法是','法撒旦',20,'tree'),(23,'查询角色','/role/toList',7,'tree'),(24,'查询用户','/user/toList',7,'tree'),(28,'书籍列表','/book/list',1,'menu'),(29,'新增书籍','/book/toAdd',1,'menu'),(30,'保存书籍','/book/insert',1,'menu'),(31,'编辑书籍','/book/toEdit',1,'menu'),(32,'修改书籍','/book/update',1,'menu'),(33,'删除书籍','/book/deleteAll',1,'menu'),(34,'任务管理',NULL,0,'tree'),(35,'查询任务','/task/toList',34,'tree'),(36,'任务列表','/task/list',34,'menu'),(37,'新增任务','task/toAdd',34,'menu'),(38,'保存任务','task/insert',34,'menu');

/*Table structure for table `t_r_m_mids` */

DROP TABLE IF EXISTS `t_r_m_mids`;

CREATE TABLE `t_r_m_mids` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_role_id` int(11) DEFAULT NULL,
  `t_menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_r_m_mids` */

insert  into `t_r_m_mids`(`t_id`,`t_role_id`,`t_menu_id`) values (50,2,1),(51,2,5),(52,2,10),(53,2,11),(54,2,3),(55,2,17),(56,2,18),(57,2,4),(58,2,6),(59,2,12),(60,2,7),(61,2,8),(62,2,23),(63,2,20),(64,2,21),(65,2,22),(151,1,1),(152,1,5),(153,1,28),(154,1,29),(155,1,30),(156,1,31),(157,1,32),(158,1,3),(159,1,17),(160,1,18),(161,1,4),(162,1,6),(163,1,12),(164,1,7),(165,1,8),(166,1,23),(167,1,24),(168,1,20),(169,1,21),(170,1,22),(171,1,33),(172,1,34),(173,1,35),(174,1,36),(175,1,37),(176,1,38);

/*Table structure for table `t_roles` */

DROP TABLE IF EXISTS `t_roles`;

CREATE TABLE `t_roles` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_role` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_roles` */

insert  into `t_roles`(`t_id`,`t_name`,`t_role`) values (1,'超级管理','amdin'),(2,'管理员','normal'),(4,'测试角色',NULL),(5,'嘿嘿与哈哈',NULL);

/*Table structure for table `t_tasks` */

DROP TABLE IF EXISTS `t_tasks`;

CREATE TABLE `t_tasks` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_key` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_desc` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_cron` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_flag` int(11) DEFAULT '0',
  `t_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_method` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_tasks` */

insert  into `t_tasks`(`t_id`,`t_key`,`t_desc`,`t_cron`,`t_flag`,`t_class`,`t_method`,`t_create_date`,`t_update_date`) values (2,'任务二','描述二','40 * * * * ?',1,'com.jy.common.MyTask','drink','2020-04-30 15:30:48','2020-04-30 15:30:48'),(3,'任务三','描述三','30,10 * * * * ?',1,'com.jy.common.MyTask','eat','2020-04-30 15:30:57','2020-04-30 15:30:57'),(4,'任务四','描述四','25 * * * * ?',1,'com.jy.common.MyTask','drink','2020-04-30 16:48:09','2020-04-30 16:48:09'),(6,'立即执行121212','的风格和','0/10 * * * * ?',1,'com.jy.common.MyTask','eat','2020-05-06 15:16:29','2020-05-06 15:16:29'),(8,'不知道啥时候执行','山豆根山豆根','* * * * * ?',-1,'com.jy.common.MyTask','fasdfg','2020-05-06 15:19:28','2020-05-06 15:19:28'),(9,'感到十分古怪','一股科技推广','* * * * * ?',0,'com.jy.common.MyTask','的说法都是','2020-05-06 15:29:04','2020-05-06 15:29:04'),(10,'古古怪怪','烦烦烦','13,34 * * * * ?',1,'com.jy.common.MyTask','大方点撒b','2020-05-06 17:18:46','2020-05-06 17:18:46'),(11,'隐隐约约啊啊啊啊','肉粉色发','10-10 * * * * ?',1,'com.jy.common.MyTask','eat','2020-05-09 15:02:50','2020-05-09 15:02:50');

/*Table structure for table `t_u_m_mids` */

DROP TABLE IF EXISTS `t_u_m_mids`;

CREATE TABLE `t_u_m_mids` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_user_id` int(11) DEFAULT NULL,
  `t_menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_u_m_mids` */

insert  into `t_u_m_mids`(`t_id`,`t_user_id`,`t_menu_id`) values (1,1,1),(2,1,5),(3,2,1),(4,2,5),(5,2,4),(6,2,6),(7,1,2);

/*Table structure for table `t_u_r_mids` */

DROP TABLE IF EXISTS `t_u_r_mids`;

CREATE TABLE `t_u_r_mids` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_user_id` int(11) DEFAULT NULL,
  `t_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_u_r_mids` */

insert  into `t_u_r_mids`(`t_id`,`t_user_id`,`t_role_id`) values (2,2,2),(8,1,1),(9,1,2),(10,1,4),(11,3,4);

/*Table structure for table `t_users` */

DROP TABLE IF EXISTS `t_users`;

CREATE TABLE `t_users` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_account` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t_pwd` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_users` */

insert  into `t_users`(`t_id`,`t_account`,`t_pwd`) values (1,'张三','123'),(2,'李四','456'),(3,'王二狗','123'),(21,'王铁柱',NULL),(22,'电视公司的',NULL),(23,'涛涛涛涛',NULL),(24,'灌灌灌灌',NULL),(25,'血刀老祖','789'),(26,'张全蛋',NULL),(27,'张全蛋2',NULL),(28,'张全蛋3',NULL),(29,'张全蛋4',NULL),(30,'张全蛋5',NULL),(31,'张全蛋6',NULL),(32,'张全蛋7',NULL),(33,'张全蛋8',NULL),(34,'张全蛋9',NULL),(35,'张全蛋10',NULL),(36,'张全蛋11',NULL),(37,'张全蛋12',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

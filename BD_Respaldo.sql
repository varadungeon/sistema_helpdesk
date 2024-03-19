/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.7.32-log : Database - andercode_helpdesk
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`andercode_helpdesk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci */;

USE `andercode_helpdesk`;

/*Table structure for table `cargo` */

DROP TABLE IF EXISTS `cargo`;

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripción` varchar(250) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `cargo` */

insert  into `cargo`(`id`,`descripción`) values (0,'Administrador'),(1,'Usuario');

/*Table structure for table `estatus` */

DROP TABLE IF EXISTS `estatus`;

CREATE TABLE `estatus` (
  `id_estatus` int(10) NOT NULL AUTO_INCREMENT,
  `descrip_estatus` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `estatus` */

insert  into `estatus`(`id_estatus`,`descrip_estatus`) values (1,'Activo'),(2,'Cerrado');

/*Table structure for table `td_ticketdetalle` */

DROP TABLE IF EXISTS `td_ticketdetalle`;

CREATE TABLE `td_ticketdetalle` (
  `tickd_id` int(11) NOT NULL AUTO_INCREMENT,
  `tick_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `tickd_descrip` mediumtext COLLATE utf8mb4_spanish_ci NOT NULL,
  `fech_crea` datetime NOT NULL,
  `descrip_estatus` int(11) NOT NULL,
  PRIMARY KEY (`tickd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `td_ticketdetalle` */

insert  into `td_ticketdetalle`(`tickd_id`,`tick_id`,`usu_id`,`tickd_descrip`,`fech_crea`,`descrip_estatus`) values (1,1,2,'te respondo','2024-02-22 12:23:55',1),(2,1,1,'soy el usuario respondiendo','2024-02-22 12:25:33',1),(3,1,2,'para resolver tu problema reinicia tu equipo','2024-02-22 12:27:48',1),(4,1,1,'si con eso se resolvió el problema','2024-02-22 12:28:32',1),(5,1,1,'muchas gracias por su confirmación, cierre el ticket ','2024-02-22 12:40:30',1),(6,9,1,'hola, tengo este error mira...','2024-03-01 16:00:46',1),(7,9,2,'hola, si dime como te puedo ayudar ','2024-03-01 16:00:46',1);

/*Table structure for table `tm_categoria` */

DROP TABLE IF EXISTS `tm_categoria`;

CREATE TABLE `tm_categoria` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nom` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `est` int(11) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `tm_categoria` */

insert  into `tm_categoria`(`cat_id`,`cat_nom`,`est`) values (1,'Hardware',1),(2,'Software',1),(3,'Incidencia',1),(4,'petición de servicio',1);

/*Table structure for table `tm_ticket` */

DROP TABLE IF EXISTS `tm_ticket`;

CREATE TABLE `tm_ticket` (
  `tick_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `tick_titulo` varchar(250) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tick_descrip` varchar(9000) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `fk_estatus` int(11) DEFAULT '1',
  `fech_asig` datetime DEFAULT NULL,
  `usu_asig` int(11) DEFAULT NULL,
  PRIMARY KEY (`tick_id`),
  KEY `fk_estatus` (`fk_estatus`),
  CONSTRAINT `tm_ticket_ibfk_1` FOREIGN KEY (`fk_estatus`) REFERENCES `estatus` (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `tm_ticket` */

insert  into `tm_ticket`(`tick_id`,`usu_id`,`cat_id`,`tick_titulo`,`tick_descrip`,`fech_crea`,`fk_estatus`,`fech_asig`,`usu_asig`) values (1,1,1,'TEST','TEST','2024-02-05 11:28:30',1,'2024-03-11 13:27:59',2),(3,1,4,'test2','<p>loremmmmmm</p>','2024-02-20 11:28:35',2,'2024-03-12 11:22:16',4),(9,1,4,'test19','<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>','2024-02-26 11:28:39',1,'2024-03-12 11:17:54',2),(10,1,4,'tests','<p>dfsdgdfhfghhfjgjujgfhterger</p>','2024-02-16 11:31:15',1,NULL,NULL),(11,1,2,'tests2','<p>dlkfñdfjldskfufosñdjvbseubweu</p>','2024-02-16 11:32:17',1,NULL,NULL),(12,2,3,'prueba','<p>dfsdfdsfsfsdfsds</p>','2024-02-21 10:26:58',2,NULL,NULL),(14,1,4,'prueba 1001','<p>asdasdadasasdasdas</p>','2024-02-26 11:53:52',1,NULL,NULL),(15,1,2,'tester10','<p>aAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</p>','2024-02-26 12:27:19',1,NULL,NULL),(16,1,4,'','','2024-02-29 09:03:29',1,NULL,NULL),(17,1,2,'prueba de rellenar campos','<p>prueba de rellenar campos<br></p>','2024-02-29 09:10:49',1,NULL,NULL),(18,1,1,'error solucionado','<p><span style=\"background-color: rgb(255, 255, 0);\">error solucionado</span><br></p>','2024-02-29 09:34:25',1,NULL,NULL),(19,2,1,'ALEXIS','<p>NO GUARDA IMAGEN</p>','2024-03-11 12:46:18',1,NULL,NULL);

/*Table structure for table `tm_usuario` */

DROP TABLE IF EXISTS `tm_usuario`;

CREATE TABLE `tm_usuario` (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nom` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usu_ape` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usu_correo` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `usu_pass` longblob NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `fech_modi` datetime DEFAULT NULL,
  `fech_elim` datetime DEFAULT NULL,
  `est` int(11) NOT NULL,
  PRIMARY KEY (`usu_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `tm_usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `cargo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='Tabla Mantenedor de Usuarios';

/*Data for the table `tm_usuario` */

insert  into `tm_usuario`(`usu_id`,`usu_nom`,`usu_ape`,`usu_correo`,`usu_pass`,`rol_id`,`fech_crea`,`fech_modi`,`fech_elim`,`est`) values (1,'alexis','valencia','alexis.valencia92@unach.mx','ffc513139b12cba24895af7e099118bc8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1,'2024-02-08 09:28:47',NULL,NULL,1),(2,'marcos','master','marcosmas@gmail.com','149f8476f3bb147104317c508d54df108d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,'2024-02-19 10:28:55',NULL,NULL,1),(3,'luna','fonte','lunawin@gmail.com','',1,'2024-02-28 10:22:10',NULL,NULL,1),(4,'alejandro','alvarez','alejvarez@gmail.com','c700d5a946dfa3d622194e51ba776e258a9bcf1e51e812d0af8465a8dbcc9f741064bf0af3b3d08e6b0246437c19f7fb',0,'2024-03-06 09:43:17','2024-03-08 09:27:41','2024-03-08 09:15:52',1),(5,'sol','martinez','solmatiz@gmail.com','2b04f52c309a6c5e9af08664032d4f0a',1,'2024-03-06 13:42:16',NULL,NULL,1);

/* Procedure structure for procedure `sp_i_ticketdetalle_01` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_i_ticketdetalle_01` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`user_helpdesk`@`%` PROCEDURE `sp_i_ticketdetalle_01`(
	in xtick_id int,
    in xusu_id int
)
BEGIN
	INSERT INTO 
                td_ticketdetalle   
                    SET 
                        tickd_id =$xtick_id,
                        usu_id=$xusu_id,
                        tickd_descrip=$tickd_descrip,
                        fech_crea=now(),
                        est=1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_l_usuario_01` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_l_usuario_01` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`user_helpdesk`@`%` PROCEDURE `sp_l_usuario_01`()
BEGIN
	SELECT * FROM tm_usuario where est='1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_l_usuario_02` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_l_usuario_02` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`user_helpdesk`@`%` PROCEDURE `sp_l_usuario_02`(
	in xusu_id int
)
BEGIN
	SELECT * FROM tm_usuario where usu_id=xusu_id;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

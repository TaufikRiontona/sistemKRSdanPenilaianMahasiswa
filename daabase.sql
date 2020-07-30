# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29)
# Database: sistem_penilaian
# Generation Time: 2020-07-30 02:08:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tb_dosen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_dosen`;

CREATE TABLE `tb_dosen` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(60) NOT NULL DEFAULT '',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_dosen` WRITE;
/*!40000 ALTER TABLE `tb_dosen` DISABLE KEYS */;

INSERT INTO `tb_dosen` (`id`, `fullname`, `created_date`)
VALUES
	(1,'Dosen 1','2020-07-30 08:05:05'),
	(2,'Dosen 2','2020-07-30 08:05:05'),
	(3,'Dosen 3','2020-07-30 08:05:05'),
	(4,'Dosen 4','2020-07-30 08:05:05'),
	(5,'Dosen 5','2020-07-30 08:05:05'),
	(6,'Dosen 6','2020-07-30 08:05:05'),
	(7,'Dosen 7','2020-07-30 08:05:05');

/*!40000 ALTER TABLE `tb_dosen` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_dosen_pengampu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_dosen_pengampu`;

CREATE TABLE `tb_dosen_pengampu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dosen_id` int(11) unsigned NOT NULL,
  `matkul_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dosenId` (`dosen_id`),
  KEY `FK_matkul` (`matkul_id`),
  CONSTRAINT `FK_dosenId` FOREIGN KEY (`dosen_id`) REFERENCES `tb_dosen` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_matkul` FOREIGN KEY (`matkul_id`) REFERENCES `tb_matakuliah` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_dosen_pengampu` WRITE;
/*!40000 ALTER TABLE `tb_dosen_pengampu` DISABLE KEYS */;

INSERT INTO `tb_dosen_pengampu` (`id`, `dosen_id`, `matkul_id`)
VALUES
	(1,1,1),
	(2,1,3),
	(3,2,3),
	(4,3,3),
	(5,4,4),
	(6,4,5),
	(7,5,2),
	(8,6,2),
	(9,7,5);

/*!40000 ALTER TABLE `tb_dosen_pengampu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_mahasiswa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_mahasiswa`;

CREATE TABLE `tb_mahasiswa` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(60) NOT NULL DEFAULT '',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_mahasiswa` WRITE;
/*!40000 ALTER TABLE `tb_mahasiswa` DISABLE KEYS */;

INSERT INTO `tb_mahasiswa` (`id`, `fullname`, `created_date`)
VALUES
	(1,'Mahasiswa 1','2020-07-30 08:22:58'),
	(2,'Mahasiswa 2','2020-07-30 08:22:58'),
	(3,'Mahasiswa 3','2020-07-30 08:22:58'),
	(4,'Mahasiswa 4','2020-07-30 08:22:58'),
	(5,'Mahasiswa 5','2020-07-30 08:22:58');

/*!40000 ALTER TABLE `tb_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_mahasiswa_krs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_mahasiswa_krs`;

CREATE TABLE `tb_mahasiswa_krs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mahasiswa_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mahasiswa_id` (`mahasiswa_id`),
  CONSTRAINT `tb_mahasiswa_krs_ibfk_1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `tb_mahasiswa` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_matakuliah
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_matakuliah`;

CREATE TABLE `tb_matakuliah` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `bobot` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `sks` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_matakuliah` WRITE;
/*!40000 ALTER TABLE `tb_matakuliah` DISABLE KEYS */;

INSERT INTO `tb_matakuliah` (`id`, `name`, `bobot`, `sks`, `created_date`)
VALUES
	(1,'Kewarganegaraan','1','2','2020-07-30 07:57:10'),
	(2,'Fisika Dasar','3','3','2020-07-30 07:57:40'),
	(3,'Metode Numerik','2','2','2020-07-30 07:57:51'),
	(4,'Logika Matematika','5','4','2020-07-30 07:58:57'),
	(5,'Kalkulus','4','4','2020-07-30 08:00:08');

/*!40000 ALTER TABLE `tb_matakuliah` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.47-0+deb8u1)
# Database: tvster
# Generation Time: 2017-02-25 00:17:58 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table automated_search_config
# ------------------------------------------------------------
CREATE DATABASE tvster;
USE tvster;
CREATE TABLE `automated_search_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subtitles_enabled` tinyint(1) DEFAULT NULL,
  `download_starts_automatically` tinyint(1) DEFAULT NULL,
  `reference_date` datetime NOT NULL,
  `subtitles_languages` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `preferred_quality` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `preferred_format` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `content_language` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_checked_date` datetime DEFAULT NULL,
  `last_download_date` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table feed
# ------------------------------------------------------------

CREATE TABLE `feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_checked_date` datetime DEFAULT NULL,
  `last_download_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `automated_search_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_234044AB3AD86DE4` (`automated_search_config_id`),
  CONSTRAINT `FK_feed_automated_search` FOREIGN KEY (`automated_search_config_id`) REFERENCES `automated_search_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table mediacenter_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mediacenter_settings`;

CREATE TABLE `mediacenter_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_downloads_path` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `base_library_path` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_remote` tinyint(1) DEFAULT NULL,
  `xbmc_host_or_ip` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processing_temp_path` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `transcode_temp_path` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtitles_enabled` tinyint(1) DEFAULT NULL,
  `preferred_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `mediacenter_settings` WRITE;
/*!40000 ALTER TABLE `mediacenter_settings` DISABLE KEYS */;

INSERT INTO `mediacenter_settings` (`id`, `description`, `base_downloads_path`, `base_library_path`, `is_remote`, `xbmc_host_or_ip`, `processing_temp_path`, `transcode_temp_path`, `subtitles_enabled`, `preferred_language`)
VALUES
	(1,'Basic settings','/mediacenter/torrents','/mediacenter',0,'localhost','/mediacenter/temp','/mediacenter/transcode',NULL,NULL);

/*!40000 ALTER TABLE `mediacenter_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migration_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migration_versions`;

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;

INSERT INTO `migration_versions` (`version`)
VALUES
	('20140902000924'),
	('20140911234951'),
	('20140911235206'),
	('20140927000051'),
	('20140927011624'),
	('20141118231121'),
	('20141129181758'),
	('20141129190914'),
	('20141129191729'),
	('20141223123149'),
	('20141223130209'),
	('20150107224337'),
	('20150107224714'),
	('20150118171020'),
	('20150215162203'),
	('20150411174246'),
	('20150428223559'),
	('20150429223007'),
	('20150509142900'),
	('20150509143618'),
	('20150523205710'),
	('20150614152135'),
	('20150614155135'),
	('20150628224156'),
	('20150701210850'),
	('20150701212855'),
	('20150702233620'),
	('20150704004107'),
	('20150912133452'),
	('20150912145448'),
	('20151104082431'),
	('20151106081629');

/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table search_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_website`;

CREATE TABLE `search_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `main_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `torrent_date_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `structure_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `search_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `torrent_main_results_filter_string` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `torrent_titles_filter_string` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `torrent_files_filter_string` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `torrent_magnet_links_filter_string` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `torrent_attribute_filter_string` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `search_website` WRITE;
/*!40000 ALTER TABLE `search_website` DISABLE KEYS */;

INSERT INTO `search_website` (`id`, `site_name`, `main_url`, `site_id`, `torrent_date_type`, `structure_type`, `search_url`, `torrent_main_results_filter_string`, `torrent_titles_filter_string`, `torrent_files_filter_string`, `torrent_magnet_links_filter_string`, `torrent_attribute_filter_string`, `main_language`)
VALUES
	(1,'The Pirate Bay','https://tpbmirror.us','TPB','DATE','LIST','{baseUrl}/search/{searchQuery}/0/3/0','#main-content #searchResult tr','td > div.detName > a',NULL,'td > a','td > .detDesc','en'),
	(2,'Kickass torrents','https://kickass.unblocked.la','KT','AGE','LIST','{baseUrl}/usearch/{searchQuery}/?field=time_add&sorder=desc','div table.data tr','td div.torrentname div.markeredBlock a.cellMainLink',NULL,'td div.iaconbox a[title*=\"magnet\"]','td.center','en'),
	(3,'DivX Total','http://www.divxtotal.com','DT','DATE','MAIN_DETAIL','{baseUrl}/buscar.php?busqueda={searchQuery}&orden=1','table.fichserietabla tr','td.capitulonombre a','td.capitulonombre a',NULL,'td.capitulofecha','es');

/*!40000 ALTER TABLE `search_website` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SequelizeMeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SequelizeMeta`;

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;

INSERT INTO `SequelizeMeta` (`name`)
VALUES
	('20160221183843-mediacenter-settings-1.js');

/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table torrent
# ------------------------------------------------------------

CREATE TABLE `torrent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `magnet_link` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `asset` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_type` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transmission_id` int(11) DEFAULT NULL,
  `torrentName` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `torrent_file_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percent_done` double DEFAULT NULL,
  `renamed_path` varchar(15000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `seeds` int(11) DEFAULT NULL,
  `dateStarted` datetime DEFAULT NULL,
  `dateFinished` datetime DEFAULT NULL,
  `automated_search_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DCC7B7B63AD86DE4` (`automated_search_config_id`),
  CONSTRAINT `FK_DCC7B7B63AD86DE4` FOREIGN KEY (`automated_search_config_id`) REFERENCES `automated_search_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table torrent_search_result
# ------------------------------------------------------------

CREATE TABLE `torrent_search_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `magnet_link` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `date_found` datetime DEFAULT NULL,
  `state` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_type` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `torrent_file_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `seeds` int(11) DEFAULT NULL,
  `search_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table transmission_settings
# ------------------------------------------------------------

CREATE TABLE `transmission_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_or_host` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_downloads_dir` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

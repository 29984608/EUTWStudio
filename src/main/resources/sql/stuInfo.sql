-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: stuInfo
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_permission`
--

DROP TABLE IF EXISTS `t_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `icon` varchar(128) DEFAULT NULL COMMENT '资源icon',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` varchar(10) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  `percode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

LOCK TABLES `t_permission` WRITE;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` VALUES (1,'权限',' ','',NULL,0,'0/',NULL,'1',NULL),(2,'系统管理','menu','/systemManage','larry-xitongshezhi1',1,'0/1/','1','1','permissionManage:'),(4,'添加','permission','','',6,'0/1/2/6/','3','1','rolePermission:add'),(5,'系统设置','menu','/systemSetting','larry-xitongshezhi2',2,'0/1/2/','2','1','systemSetting:'),(6,'角色权限分配','menu','/userRole','larry-yonghuliebiao',2,'0/1/2/','2','1','rolePermission:'),(11,'用户角色分配','menu','/rolePermission','larry-quanxianguanli',2,'0/1/2/','2','1','userRole:'),(12,'报表管理','menu','/portManage','larry-lanmuguanli1',1,'0/1/','1','1','portManage:'),(13,'学生报表','menu','/studentPort','larry-neirongguanli',12,'0/1/12/','2','1','studentPort:'),(14,'成绩报表','menu','/resultPort','larry-neirongguanli',12,'0/1/12/','2','1','resultPort:'),(15,'信息管理','menu','/infoManage','larry-lanmuguanli1',1,'0/1/','1','1','infoManage:'),(16,'学生信息','menu','/student','larry-gereninfo',15,'0/1/15/','2','1','student:'),(17,'老师信息','menu','/teacher','larry-gereninfo',15,'0/1/15/','2','1','teacher:'),(18,'沟通信息','menu','/communication','larry-neirong',15,'0/1/15/','2','1','communication:'),(19,'系信息','menu','/department','larry-jiankong1',15,'0/1/15/','2','1','department:'),(20,'专业信息','menu','/profession','larry-hrrq_xtrz',15,'0/1/15/','2','1','profession:'),(21,'课程信息','menu','/course','larry-hrrq_xtrz',15,'0/1/15/','2','1','course:'),(22,'修改','perimission','','',6,'0/1/2/6/','3','1','rolePermission:update'),(23,'权限配置','permission',NULL,NULL,6,'0/1/2/6/','3','1','rolePermission:setting'),(24,'状态设置','permission',NULL,NULL,6,'0/1/2/6/','3','1','rolePermission:available'),(25,'角色修改','permission',NULL,NULL,11,'0/1/2/11/','3','1','userRole:update');
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `available` varchar(10) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'管理员','true'),(2,'老师','true'),(3,'学生','true'),(4,'毛毛','false');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_permission`
--

DROP TABLE IF EXISTS `t_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_role_id` int(11) NOT NULL COMMENT '角色id',
  `sys_permission_id` bigint(20) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permission`
--

LOCK TABLES `t_role_permission` WRITE;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` VALUES (9,1,2),(10,1,3),(12,1,5),(28,1,11),(55,1,6),(56,1,22),(69,1,15),(70,1,16),(71,1,17),(72,1,18),(73,1,19),(74,1,20),(75,1,21),(76,1,4),(77,2,12),(78,2,13),(79,2,14),(80,2,2),(81,2,11),(82,2,5),(83,2,6),(84,2,15),(85,2,16),(86,2,17),(87,2,18),(88,2,19),(89,2,20),(90,2,21),(91,1,12),(92,1,13),(93,1,14),(94,1,23),(95,1,24);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('111','111',2,1),('admin','admin',1,1);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-26 12:37:06

-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: 192.168.1.112    Database: stuinfo
-- ------------------------------------------------------
-- Server version	5.5.40

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
-- Table structure for table `t_classes`
--

DROP TABLE IF EXISTS `t_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_classes`
--

LOCK TABLES `t_classes` WRITE;
/*!40000 ALTER TABLE `t_classes` DISABLE KEYS */;
INSERT INTO `t_classes` VALUES (1,2015,'软件工程三班'),(2,2016,'通信工程一班');
/*!40000 ALTER TABLE `t_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_department`
--

DROP TABLE IF EXISTS `t_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_department`
--

LOCK TABLES `t_department` WRITE;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` VALUES (1,'199002','系包含专业'),(2,'199001','房地产服务系'),(3,'199003','文化休闲服务系'),(4,'199004','体育服务系'),(5,'199005','电子商务系');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_direction`
--

DROP TABLE IF EXISTS `t_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_direction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `department_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_direction`
--

LOCK TABLES `t_direction` WRITE;
/*!40000 ALTER TABLE `t_direction` DISABLE KEYS */;
INSERT INTO `t_direction` VALUES (1,'013350','金融服务方向','1'),(2,'013351','会计服务方向','2'),(3,'013352','建筑服务方向','2'),(4,'013353','管理方向','1'),(5,'013354','酒店方向','');
/*!40000 ALTER TABLE `t_direction` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

LOCK TABLES `t_permission` WRITE;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` VALUES (1,'权限',' ','',NULL,0,'0/',NULL,'1',NULL),(2,'系统管理','menu','/systemManage','larry-xitongshezhi1',1,'0/1/','1','1','permissionManage:'),(4,'添加','permission','','',6,'0/1/2/6/','3','1','rolePermission:add'),(6,'角色权限分配','menu','/userRole','larry-yonghuliebiao',2,'0/1/2/','2','1','rolePermission:'),(11,'用户角色分配','menu','/roleDistribute','larry-quanxianguanli',2,'0/1/2/','2','1','userRole:'),(12,'报表管理','menu','/portManage','larry-lanmuguanli1',1,'0/1/','1','1','portManage:'),(13,'学生报表','menu','/studentPort','larry-neirongguanli',12,'0/1/12/','2','1','studentPort:'),(14,'成绩报表','menu','/resultPort','larry-neirongguanli',12,'0/1/12/','2','1','resultPort:'),(15,'信息管理','menu','/infoManage','larry-lanmuguanli1',1,'0/1/','1','1','infoManage:'),(16,'学生信息','menu','/student','larry-gereninfo',15,'0/1/15/','2','1','student:'),(17,'教师信息','menu','/teacher','larry-gereninfo',15,'0/1/15/','2','1','teacher:'),(18,'沟通信息','menu','/communication','larry-neirong',15,'0/1/15/','2','1','communication:'),(19,'系信息维护','menu','/department','larry-jiankong1',15,'0/1/15/','2','1','department:'),(20,'专业维护','menu','/profession','larry-hrrq_xtrz',15,'0/1/15/','2','1','profession:'),(21,'课程信息','menu','/course','larry-hrrq_xtrz',15,'0/1/15/','2','1','course:'),(22,'修改','permission','','',6,'0/1/2/6/','3','1','rolePermission:update'),(23,'权限配置','permission',NULL,NULL,6,'0/1/2/6/','3','1','rolePermission:setting'),(24,'状态设置','permission',NULL,NULL,6,'0/1/2/6/','3','1','rolePermission:available'),(25,'角色修改','permission',NULL,NULL,11,'0/1/2/11/','3','1','userRole:update'),(26,'方向维护','menu','/direction','larry-hrrq_xtrz',15,'0/1/15/','2','1','direction:'),(27,'培养模块','menu','/courseModule','larry-kechengguanli',15,'0/1/15/','2','1','courseModule:'),(28,'添加','permission',NULL,NULL,27,'0/1/15/27/','3','1','courseModule:add'),(29,'修改','permission',NULL,NULL,27,'0/1/15/27/','3','1','courseModule:update'),(30,'删除','permission',NULL,NULL,27,'0/1/15/27/','3','1','courseModule:delete'),(31,'班级维护','menu','/classes','larry-tubiaozitimoban',15,'0/1/15/','2','1','classes:'),(32,'添加','permission',NULL,NULL,26,'0/1/15/26/','3','1','direction:add'),(33,'删除','permission',NULL,NULL,26,'0/1/15/26/','3','1','direction:delete'),(34,'修改','permission',NULL,NULL,26,'0/1/15/26/','3','1','direction:update'),(35,'添加','permission',NULL,NULL,20,'0/1/15/20/','3','1','profession:add'),(36,'删除','permission',NULL,NULL,20,'0/1/15/20/','3','1','profession:delete'),(37,'修改','permission',NULL,NULL,20,'0/1/15/20/','3','1','profession:update'),(38,'添加','permission',NULL,NULL,19,'0/1/15/19/','3','1','department:add'),(39,'删除','permission',NULL,NULL,19,'0/1/15/19/','3','1','department:delete'),(40,'修改','permission',NULL,NULL,19,'0/1/15/19/','3','1','department:update');
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_profession`
--

DROP TABLE IF EXISTS `t_profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `department_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profession`
--

LOCK TABLES `t_profession` WRITE;
/*!40000 ALTER TABLE `t_profession` DISABLE KEYS */;
INSERT INTO `t_profession` VALUES (1,'01550','物理贸易','1'),(2,'01551','房地产服务','1'),(3,'01552','土木工程','5'),(4,'01553','医疗美容','5'),(5,'01554','软件服务','1');
/*!40000 ALTER TABLE `t_profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_program_module_course`
--

DROP TABLE IF EXISTS `t_program_module_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_program_module_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `cource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_program_module_course`
--

LOCK TABLES `t_program_module_course` WRITE;
/*!40000 ALTER TABLE `t_program_module_course` DISABLE KEYS */;
INSERT INTO `t_program_module_course` VALUES (1,1,1,1),(2,1,2,3),(3,3,1,1),(4,2,1,2),(5,3,2,2);
/*!40000 ALTER TABLE `t_program_module_course` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permission`
--

LOCK TABLES `t_role_permission` WRITE;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` VALUES (9,1,2),(10,1,3),(12,1,5),(28,1,11),(55,1,6),(56,1,22),(69,1,15),(70,1,16),(71,1,17),(72,1,18),(75,1,21),(76,1,4),(80,2,2),(81,2,11),(82,2,5),(83,2,6),(84,2,15),(85,2,16),(86,2,17),(87,2,18),(88,2,19),(89,2,20),(90,2,21),(91,1,12),(92,1,13),(93,1,14),(94,1,23),(95,1,24),(96,1,25),(97,1,19),(98,1,20),(100,1,26),(101,1,27),(102,1,28),(103,1,29),(104,1,30),(105,1,31),(106,1,32),(107,1,33),(108,1,34),(109,1,35),(110,1,36),(111,1,37),(112,1,38),(113,1,39),(114,1,40);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student`
--

DROP TABLE IF EXISTS `t_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_student` (
  `no` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `t_student_no_uindex` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student`
--

LOCK TABLES `t_student` WRITE;
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
INSERT INTO `t_student` VALUES ('14420625150297','acey');
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_teacher`
--

DROP TABLE IF EXISTS `t_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_teacher` (
  `no` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `t_teacher_no_uindex` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_teacher`
--

LOCK TABLES `t_teacher` WRITE;
/*!40000 ALTER TABLE `t_teacher` DISABLE KEYS */;
INSERT INTO `t_teacher` VALUES ('111','111');
/*!40000 ALTER TABLE `t_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_train_module`
--

DROP TABLE IF EXISTS `t_train_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_train_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_train_module`
--

LOCK TABLES `t_train_module` WRITE;
/*!40000 ALTER TABLE `t_train_module` DISABLE KEYS */;
INSERT INTO `t_train_module` VALUES (3,'199003','岗位技能'),(4,'199004','能力拓展'),(11,'199001','通识教育'),(12,'199002','专业平台');
/*!40000 ALTER TABLE `t_train_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_train_program`
--

DROP TABLE IF EXISTS `t_train_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_train_program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `direction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_train_program`
--

LOCK TABLES `t_train_program` WRITE;
/*!40000 ALTER TABLE `t_train_program` DISABLE KEYS */;
INSERT INTO `t_train_program` VALUES (1,2015,1,1),(2,2015,1,2),(3,2016,2,1),(4,2014,3,3),(5,2015,3,1);
/*!40000 ALTER TABLE `t_train_program` ENABLE KEYS */;
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
  `available` tinyint(1) DEFAULT '1',
  `name` varchar(20) DEFAULT NULL,
  `staff` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('111','111',1,1,'111','老师'),('admin','admin',1,1,'admin','管理员'),('14420625150297','111',1,1,'acey','学生');
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

-- Dump completed on 2017-06-28  9:01:40

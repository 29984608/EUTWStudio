-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
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
-- Table structure for table `t_area`
--

DROP TABLE IF EXISTS `t_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_area`
--

LOCK TABLES `t_area` WRITE;
/*!40000 ALTER TABLE `t_area` DISABLE KEYS */;
INSERT INTO `t_area` VALUES (1,'西区1'),(2,'西区2'),(3,'西区3'),(4,'西区4'),(5,'北区1'),(6,'北区2'),(7,'北区3'),(8,'北区4'),(10,'东区1'),(13,'东区2'),(14,'东区3'),(15,'北区4');
/*!40000 ALTER TABLE `t_area` ENABLE KEYS */;
UNLOCK TABLES;

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
  `teacher_id` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_classes`
--

LOCK TABLES `t_classes` WRITE;
/*!40000 ALTER TABLE `t_classes` DISABLE KEYS */;
INSERT INTO `t_classes` VALUES (3,2016,'房地产1601','',30),(6,2015,'通信工程一班','',32),(7,2017,'通信工程1411班','8523212315',31),(8,2014,'软件2014','1458745236',29),(9,2016,'软件1701','werqw',29),(10,2016,'电信1601','',30),(11,2015,'网络1551','',33);
/*!40000 ALTER TABLE `t_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_communication`
--

DROP TABLE IF EXISTS `t_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_communication` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(20) DEFAULT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `talk_name` varchar(20) DEFAULT NULL,
  `direction` varchar(20) DEFAULT NULL,
  `content` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_communication`
--

LOCK TABLES `t_communication` WRITE;
/*!40000 ALTER TABLE `t_communication` DISABLE KEYS */;
INSERT INTO `t_communication` VALUES (9,'1542145263','61060404080031','1张三','质量跟踪','老毛$%$毛欢欢$%$','2017-07-28 07:41:55'),(10,'admin','61060404080031','张三','行为养成','毛欢欢天被毛欢欢2$%$毛欢欢说是的$%$','2017-07-23 06:54:44'),(11,'1542145263','61060404080031','acey','生活服务','阿斯顿$%$得到$%$','2017-07-28 07:41:55'),(12,'admin','61060404080031','张三','质量跟踪','版本$%$妮妮$%$','2017-07-23 06:54:44'),(13,'1542145263','61060404080031','张三','学业指导','你好？$%$好$%$','2017-07-23 09:11:52'),(14,'admin','61060404080031','张三','生活服务','哈哈$%$呵呵$%$','2017-07-23 06:54:44'),(15,'admin','61060404080031','张三','学业指导','阿阿啊$%$得到额$%$哦哦$%$往往$%$','2017-07-23 06:54:44'),(16,'admin','61060404080031','张红','学业指导','33$%$33$%$','2017-07-23 06:54:44'),(17,'1542145263','61060404080031','张红','学业指导','和啊哈$%$阿三$%$顶顶顶$%$顶顶顶$%$','2017-07-23 09:11:52'),(18,'admin','12130981110668','张三','学业指导','858985*$%$5293*96*96$%$','2017-07-23 06:54:44'),(19,'admin','12130981110668','米阳阳','学业指导','haha$%$呵呵$%$','2017-07-23 06:54:44'),(20,'admin','15642142536258','毛亮为','学业指导','nihao$%$hello word！$%$哈哈$%$哈哈$%$','2017-07-17 06:00:12'),(21,'admin','15642142536258','毛亮为','学业指导','qwe$%$qweq$%$','2017-07-17 07:49:19');
/*!40000 ALTER TABLE `t_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_course`
--

DROP TABLE IF EXISTS `t_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `school_score` int(11) DEFAULT NULL,
  `school_hours` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `nature` varchar(20) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course`
--

LOCK TABLES `t_course` WRITE;
/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;
INSERT INTO `t_course` VALUES (2,'312','java',3,20,2,'选修','12',11),(3,'12','c',21,12,1,'选修','13',11),(4,'1231','CC1',121,12,6,'选修','14',12),(5,'2','python',2,32,3,'必修','15',4),(6,'222','html',22,13,3,'选修','15',3),(7,'12','js',22,22,3,'必修','14',12),(8,'222','阿三',22,2,4,'必修','27',11);
/*!40000 ALTER TABLE `t_course` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_department`
--

LOCK TABLES `t_department` WRITE;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` VALUES (29,'G_2001','金融服务系'),(30,'G_2002','房地产服务系'),(31,'G_2003','文化休闲服务系'),(32,'G_2004','体育服务系'),(33,'G_2005','电子商务系');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dept`
--

DROP TABLE IF EXISTS `t_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dept`
--

LOCK TABLES `t_dept` WRITE;
/*!40000 ALTER TABLE `t_dept` DISABLE KEYS */;
INSERT INTO `t_dept` VALUES (2,'行政资源中心'),(3,'产学合作中心'),(4,'教与学运行中心');
/*!40000 ALTER TABLE `t_dept` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_direction`
--

LOCK TABLES `t_direction` WRITE;
/*!40000 ALTER TABLE `t_direction` DISABLE KEYS */;
INSERT INTO `t_direction` VALUES (9,'G_1001','财务','29'),(10,'G_1002','保险','29'),(11,'G_1003','证券','29'),(12,'G_1004','银行','29'),(13,'G_1005','房产','30'),(14,'G_1006','物业','30'),(15,'G_1007','工程管理','30'),(16,'G_1008','工程技术','30'),(17,'G_1009','酒店','31'),(18,'G_1010','餐饮','31'),(19,'G_1011','旅游','31'),(20,'G_1012','创业创新','31'),(21,'G_1013','英语教育','31'),(22,'G_1014','赛事运营','32'),(23,'G_1015','场地管理','32'),(24,'G_1016','健身健康','32'),(25,'G_1017','智慧物流','33'),(26,'G_1018','互联网运营\r\n','33'),(27,'G_1019','互联网营销','33'),(28,'G_1020','贸易实务','33'),(29,'','',NULL);
/*!40000 ALTER TABLE `t_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_floor`
--

DROP TABLE IF EXISTS `t_floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_floor`
--

LOCK TABLES `t_floor` WRITE;
/*!40000 ALTER TABLE `t_floor` DISABLE KEYS */;
INSERT INTO `t_floor` VALUES (1,'六楼',1),(2,'五楼',1),(3,'四楼',1),(4,'三楼',1),(6,'六楼',1),(7,'一楼',1),(8,'一楼',2),(9,'二楼',2),(10,'三楼',2),(11,'四楼',2),(12,'五楼',2),(13,'六楼',2),(14,'一楼',3),(15,'二楼',3),(16,'三楼',3),(17,'四楼',3),(18,'五楼',3),(19,'六楼',3),(20,'一楼',4),(21,'二楼',4),(22,'三楼',4),(23,'四楼',4),(24,'五楼',4),(25,'六楼',4),(26,'二楼',5),(27,'三楼',6),(28,'一楼',7),(29,'二楼',7),(30,'四楼',8);
/*!40000 ALTER TABLE `t_floor` ENABLE KEYS */;
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
  `menu_sort` int(11) DEFAULT NULL,
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `icon` varchar(128) DEFAULT NULL COMMENT '资源icon',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` varchar(10) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  `percode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

LOCK TABLES `t_permission` WRITE;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` VALUES (1,'权限',NULL,' ','',NULL,0,'0/',NULL,'1',NULL),(2,'系统管理',3,'menu','/systemManage','larry-xitongshezhi1',1,'0/1/','1','1','permissionManage:'),(4,'添加',NULL,'permission','','',6,'0/1/2/6/','3','1','rolePermission:add'),(6,'角色权限分配',1,'menu','/userRole','larry-yonghuliebiao',2,'0/1/2/','2','1','rolePermission:'),(11,'用户角色分配',2,'menu','/roleDistribute','larry-quanxianguanli',2,'0/1/2/','2','1','userRole:'),(12,'报表管理',2,'menu','/report','larry-lanmuguanli1',1,'0/1/','1','1','port:'),(13,'专业人数报表',1,'menu','/professionReport','larry-neirongguanli',12,'0/1/12/','2','1','professionPort:'),(14,'就业方向人数报表',2,'menu','/directionReport','larry-neirongguanli',12,'0/1/12/','2','1','directionPort:'),(15,'信息管理',1,'menu','/infoManage','larry-lanmuguanli1',1,'0/1/','1','1','infoManage:'),(16,'学生班级',9,'menu','/studentClass','larry-gereninfo',15,'0/1/15/','2','1','studentClass:'),(17,'行政管理',10,'menu','/teacher','larry-gereninfo',15,'0/1/15/','2','1','teacher:'),(18,'沟通反馈',14,'menu','/communication','larry-neirong',15,'0/1/15/','2','1','communication:'),(19,'系别名称',6,'menu','/department','larry-jiankong1',15,'0/1/15/','2','1','department:'),(20,'专业名称',1,'menu','/profession','larry-hrrq_xtrz',15,'0/1/15/','2','1','profession:'),(21,'课程信息',4,'menu','/course','larry-hrrq_xtrz',15,'0/1/15/','2','1','course:'),(22,'修改',NULL,'permission','','',6,'0/1/2/6/','3','1','rolePermission:update'),(23,'权限配置',NULL,'permission',NULL,NULL,6,'0/1/2/6/','3','1','rolePermission:setting'),(24,'状态设置',NULL,'permission',NULL,NULL,6,'0/1/2/6/','3','1','rolePermission:available'),(25,'角色修改',NULL,'permission',NULL,NULL,11,'0/1/2/11/','3','1','userRole:update'),(26,'方向维护',2,'menu','/direction','larry-hrrq_xtrz',15,'0/1/15/','2','1','direction:'),(27,'课程类别',3,'menu','/courseModule','larry-kechengguanli',15,'0/1/15/','2','1','courseModule:'),(28,'添加',NULL,'permission',NULL,NULL,27,'0/1/15/27/','3','1','courseModule:add'),(29,'修改',NULL,'permission',NULL,NULL,27,'0/1/15/27/','3','1','courseModule:update'),(30,'删除',NULL,'permission',NULL,NULL,27,'0/1/15/27/','3','1','courseModule:delete'),(31,'班级维护',8,'menu','/classes','larry-tubiaozitimoban',15,'0/1/15/','2','1','classes:'),(32,'添加',NULL,'permission',NULL,NULL,26,'0/1/15/26/','3','1','direction:add'),(33,'删除',NULL,'permission',NULL,NULL,26,'0/1/15/26/','3','1','direction:delete'),(34,'修改',NULL,'permission',NULL,NULL,26,'0/1/15/26/','3','1','direction:update'),(35,'添加',NULL,'permission',NULL,NULL,20,'0/1/15/20/','3','1','profession:add'),(36,'删除',NULL,'permission',NULL,NULL,20,'0/1/15/20/','3','1','profession:delete'),(37,'修改',NULL,'permission',NULL,NULL,20,'0/1/15/20/','3','1','profession:update'),(38,'添加',NULL,'permission',NULL,NULL,19,'0/1/15/19/','3','1','department:add'),(39,'删除',NULL,'permission',NULL,NULL,19,'0/1/15/19/','3','1','department:delete'),(40,'修改',NULL,'permission',NULL,NULL,19,'0/1/15/19/','3','1','department:update'),(41,'添加',NULL,'permission',NULL,NULL,31,'0/1/15/31/','3','1','classes:add'),(42,'删除',NULL,'permission',NULL,NULL,31,'0/1/15/31/','3','1','classes:delete'),(43,'修改',NULL,'permission',NULL,NULL,31,'0/1/15/31/','3','1','classes:update'),(44,'添加',NULL,'permission',NULL,NULL,17,'0/1/15/17/','3','1','teacher:add'),(45,'删除',NULL,'permission',NULL,NULL,17,'0/1/15/17/','3','1','teacher:delete'),(46,'修改',NULL,'permission',NULL,NULL,17,'0/1/15/17/','3','1','teacher:update'),(47,'培养方案',5,'menu','/trainProgram','larry-gerenxinxi4',15,'0/1/15/','2','1','trainProgram:'),(48,'学生信息',7,'menu','/student','larry-gerenxinxi4',15,'0/1/15/','2','1','student:'),(49,'学籍报表',3,'menu','/studentInfoReport','larry-neirongguanli',12,'0/1/12/','2','1','studentInfoPort:'),(50,'成绩报表',4,'menu','/resultReport','larry-neirongguanli',12,'0/1/12/','2','1','resultReport:'),(51,'新生入学登记表',5,'menu','/newStudentRegister','larry-neirongguanli',12,'0/1/12/','2','1',''),(52,'考核方式',13,'menu','/testMethod','larry-neirongguanli',15,'0/1/15/','2','1','testMethod:'),(53,'职能部门',12,'menu','/dept','larry-neirongguanli',15,'0/1/15/','2','1','dept:'),(57,'宿舍信息',11,'menu','/dorm','larry-neirongguanli',15,'0/1/15/','2','1','dorm:'),(58,'成绩排行',6,'menu','/result/rank','larry-neirongguanli',12,'0/1/12/','2','1',NULL),(59,'成绩查询',7,'menu','/result/search','larry-neirongguanli',12,'0/1/12/','2','1',NULL),(60,'成长记录',15,'menu','/growthRecord','larry-neirongguanli',15,'0/1/15/','2','1','growthRecord:'),(61,'宿舍报表',8,'menu','/dormRegister','larry-neirongguanli',12,'0/1/12/','2','1','dormRegister:'),(62,'沟通次数报表',9,'menu','/communicationReport','larry-neirongguanli',12,'0/1/12/','2','1',NULL),(63,'学习计划',16,'menu','/learnPlan','larry-neirongguanli',15,'0/1/15/','2','1','learnPlan:'),(64,'个人成绩单',17,'menu','/personResult','larry-neirongguanli',15,'0/1/15/','2','1','personResult:'),(65,'新生转专业报表',NULL,'menu','/turnProfessional','larry-neirongguanli',12,'0/1/12/','2','1','turnProfessional:');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profession`
--

LOCK TABLES `t_profession` WRITE;
/*!40000 ALTER TABLE `t_profession` DISABLE KEYS */;
INSERT INTO `t_profession` VALUES (7,'G_0001','财务管理','29'),(8,'G_0002','金融管理','29'),(9,'G_0003','投资与理财','29'),(10,'G_0004','房地产经营与管理','30'),(11,'G_0005','物业管理（社区运营）','30'),(12,'G_0006','物业管理（商业综合体）\r\n','30'),(13,'G_0007','工程造价\r\n','30'),(14,'G_0008','建筑智能化工程技术\r\n','30'),(15,'G_0009','建设工程管理','30'),(16,'G_0010','酒店管理','31'),(17,'G_0011','连锁经营管理','31'),(18,'G_0012','旅游管理','31'),(19,'G_0013','应用英语','31'),(20,'G_0014','体育运营与管理','32'),(21,'G_0015','健身指导与管理','32'),(22,'G_0016','物流管理','33'),(23,'G_0017','电子商务','33'),(24,'G_0018','国际经济与贸易','33');
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
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_program_module_course`
--

LOCK TABLES `t_program_module_course` WRITE;
/*!40000 ALTER TABLE `t_program_module_course` DISABLE KEYS */;
INSERT INTO `t_program_module_course` VALUES (223,56,3,2),(224,56,3,6),(225,56,4,5),(226,56,4,9),(227,56,11,3),(228,56,11,8),(229,56,12,4),(230,56,12,7);
/*!40000 ALTER TABLE `t_program_module_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_result`
--

DROP TABLE IF EXISTS `t_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_result` (
  `no` varchar(40) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `course_code` varchar(20) DEFAULT NULL,
  `course_name` varchar(200) DEFAULT NULL,
  `score` varchar(12) DEFAULT NULL,
  `test_entry_time` date DEFAULT NULL,
  `is_pass` int(11) DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `nature` int(11) DEFAULT NULL,
  `method` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生成绩(高职';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_result`
--

LOCK TABLES `t_result` WRITE;
/*!40000 ALTER TABLE `t_result` DISABLE KEYS */;
INSERT INTO `t_result` VALUES ('61060404080031','马成成',2016,'G384','英文会话','A','2017-01-16',1,2,0,'学期课'),('61060404080031','马成成',2016,'G146','房地产开发与经营','91.0','2017-01-16',1,2,1,'学期课'),('61060404080031','马成成',2016,'G322','韩语','60.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'G020','汉语','80.0','2017-02-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'G112','政府与非盈利组织会计','75.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'1503','礼仪与社交','60.0','2017-03-14',0,2,1,'学期课'),('61060404080031','马成成',2016,'2062','经济学基础','84.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'3306','金融基础','66.0','2017-07-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'1061','大学体育Ⅱ','68.0','2017-01-14',0,2,1,'学期课'),('61060404080031','马成成',2016,'G065','金融基础','88.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'W018','中华民族精神','63.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'G392','企业在岗位学习Ⅳ','66.0','2016-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'W022','用经济学智慧解读中国','69.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'G018','大学生心理健康教育','80.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'G183','统计学原理','98.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'W009','书法鉴赏','85.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'W022','用经济学智慧解读中国','68.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'W038','数学的思维方式与创新','68.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'W051','宪法的魅力','76.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'G144','成本会计','66.0','2017-01-14',1,2,1,'学期课'),('61060404080031','马成成',2016,'W038','数学的思维方式与创新','86.0','2017-01-14',1,2,1,'学期课'),('12130582110242','程肖',2017,'W038','成本会计','60','2017-01-14',0,2,1,'学期课'),('12130701110676','张闫',2017,'W038','数学的思维方式与创新','60','2017-01-14',1,2,1,'学期课');
/*!40000 ALTER TABLE `t_result` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'管理员','true'),(2,'职业导师','true'),(3,'学生','true'),(4,'社区辅导员','true'),(6,'行政','true');
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permission`
--

LOCK TABLES `t_role_permission` WRITE;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` VALUES (9,1,2),(10,1,3),(12,1,5),(28,1,11),(55,1,6),(56,1,22),(69,1,15),(70,1,16),(71,1,17),(72,1,18),(75,1,21),(76,1,4),(82,2,5),(84,2,15),(85,2,16),(87,2,18),(91,1,12),(92,1,13),(93,1,14),(94,1,23),(95,1,24),(96,1,25),(97,1,19),(98,1,20),(100,1,26),(101,1,27),(102,1,28),(103,1,29),(104,1,30),(105,1,31),(106,1,32),(107,1,33),(108,1,34),(109,1,35),(110,1,36),(111,1,37),(112,1,38),(113,1,39),(114,1,40),(115,1,41),(116,1,42),(117,1,43),(118,1,44),(119,1,45),(120,1,46),(121,1,47),(122,1,49),(123,1,48),(124,1,50),(126,1,52),(127,1,53),(131,3,15),(133,1,57),(134,1,58),(135,1,59),(136,1,56),(137,1,60),(139,1,51),(140,3,60),(141,1,61),(142,1,62),(143,4,12),(144,4,13),(145,4,49),(146,4,61),(147,4,62),(148,4,15),(149,4,26),(150,4,18),(152,2,12),(153,2,13),(154,2,14),(155,2,58),(156,2,59),(157,2,49),(158,2,50),(159,2,61),(160,2,51),(161,2,62),(162,2,47),(163,2,48),(166,3,63),(167,3,64),(168,1,65);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_room`
--

DROP TABLE IF EXISTS `t_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_room`
--

LOCK TABLES `t_room` WRITE;
/*!40000 ALTER TABLE `t_room` DISABLE KEYS */;
INSERT INTO `t_room` VALUES (1,'121',14),(5,'202',1),(6,'201',1),(7,'108',1),(8,'111',2),(9,'102',2),(10,'405',2),(11,'303',18),(12,'202',18),(13,'120',18),(14,'222',18),(19,'123',3),(20,'201',26),(21,'111',30),(22,'102',9),(26,'1111',8),(27,'11111',9),(28,'1121',17),(29,'15',9),(30,'1',21),(32,'12',27),(33,'303',16),(34,'416',1),(35,'111',11);
/*!40000 ALTER TABLE `t_room` ENABLE KEYS */;
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
  `gender` varchar(2) DEFAULT NULL,
  `department_id` varchar(20) DEFAULT NULL,
  `direction_id` varchar(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `classes_id` varchar(20) DEFAULT NULL,
  `profession_id` varchar(20) DEFAULT NULL,
  `parent_name` varchar(20) DEFAULT NULL,
  `origin_profession_id` varchar(20) DEFAULT NULL,
  `famous_family` varchar(20) DEFAULT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `born` varchar(20) DEFAULT NULL,
  `head_image` varchar(100) DEFAULT NULL,
  `student_type` varchar(20) DEFAULT NULL,
  `in_school` date DEFAULT NULL,
  `graduate_school` date DEFAULT NULL,
  `blood` varchar(20) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `political_status` varchar(20) DEFAULT NULL,
  `pre_school_education` varchar(20) DEFAULT NULL,
  `student_classify` varchar(20) DEFAULT NULL,
  `idcard_address` varchar(50) DEFAULT NULL,
  `actual_address` varchar(50) DEFAULT NULL,
  `origin_address` varchar(50) DEFAULT NULL,
  `family_phone` varchar(20) DEFAULT NULL,
  `family_zip_code` varchar(20) DEFAULT NULL,
  `student_contact_method` varchar(20) DEFAULT NULL,
  `emergency_contact_name` varchar(20) DEFAULT NULL,
  `emergency_contact_method` varchar(20) DEFAULT NULL,
  `account_in` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `area_origin_name` varchar(20) DEFAULT NULL,
  `sat_score` double DEFAULT NULL,
  `pre_school_file_where_location` varchar(50) DEFAULT NULL,
  `file_in` varchar(50) DEFAULT NULL,
  `pre_school_name` varchar(20) DEFAULT NULL,
  `pre_school_account_where_station` varchar(50) DEFAULT NULL,
  `pre_school_work` varchar(50) DEFAULT NULL,
  `pre_school_staff` varchar(20) DEFAULT NULL,
  `own_experience` varchar(200) DEFAULT NULL,
  `own_punishment` varchar(200) DEFAULT NULL,
  `student_status` varchar(20) DEFAULT NULL,
  `payment_status_first_year` varchar(50) DEFAULT NULL,
  `payment_status_second_year` varchar(50) DEFAULT NULL,
  `payment_status_third_year` varchar(50) DEFAULT NULL,
  `practice_learning_type` varchar(20) DEFAULT NULL,
  `stay_type` varchar(20) DEFAULT NULL COMMENT '1,代表校内住宿\n2,代表校外住宿',
  `off_school_stay_address` varchar(50) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `counselor_id` int(11) DEFAULT NULL,
  `is_out` varchar(20) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `hard_type` varchar(20) DEFAULT NULL,
  `native_place` varchar(50) DEFAULT NULL,
  `is_marry` varchar(10) DEFAULT NULL,
  `health_status` varchar(10) DEFAULT NULL,
  `arrears_first_year` double DEFAULT NULL COMMENT '欠费金额字段',
  `arrears_third_year` double DEFAULT NULL,
  `arrears_second_year` double DEFAULT NULL,
  `teacher_id` varchar(20) DEFAULT NULL,
  `community_teacher_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `t_student_no_uindex` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student`
--

LOCK TABLES `t_student` WRITE;
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
INSERT INTO `t_student` VALUES ('1111111111114','李四','男','29','17',2017,'8','7','李某某','12','汉族','6104341564561216354','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'退学',NULL,NULL,NULL,'合作企业','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('12130402134001','米羊羊','男','29','17',2016,'9','15','马某某','16','汉族','14420845646453718',NULL,'user.jpg',NULL,'2017-07-13','2017-07-10',NULL,NULL,NULL,'党员',NULL,NULL,NULL,NULL,'河北省-邢台市-乾县',NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'入伍',NULL,NULL,NULL,'其它','1',NULL,1,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),('12130503111022','祝青青','男','33','18',2015,'7','9','祝某某','9','汉族','415362461043526354',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'休学',NULL,NULL,NULL,'创新创业','1',NULL,2,10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('12130582110242','程肖','女','29','11',2015,'8','8','程某某','12','汉族','610434153624526354',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'入伍',NULL,NULL,NULL,'创新创业','1',NULL,3,3,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),('12130602134464','张启业','男','31','21',2015,'8','8','张某某','7','汉族','263546104341536245',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'休学',NULL,NULL,NULL,'合作企业','1',NULL,4,2,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('12130614134232','张浩','女','29','11',2016,'9','14','张某某','14','汉族','610487987924526354',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'入伍',NULL,NULL,NULL,'自主实习','1',NULL,5,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),('12130642134104','宋芳','男','33','18',2016,'11','18','宋某某','18','汉族','6104325442426354',NULL,NULL,NULL,NULL,NULL,'请选择血型',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'流失',NULL,NULL,NULL,'其它','2',NULL,5,4,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL),('12130701110676','张闫','男','33','18',2016,'10','18','张某某','13','汉族','610434153624526354',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'退学',NULL,NULL,NULL,'专升本','1',NULL,4,3,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('12130803150296','张亚男','男','33','26',2016,'6','7','张某某','7','汉族','61047897547897',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'复学',NULL,NULL,NULL,'其它','2',NULL,5,2,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('12130823139033','李兴嘉','男','30','12',2016,'7','11','李某某','11','汉族','6104344564524526354',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'复学',NULL,NULL,NULL,'专升本','1',NULL,6,2,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('12130828110946','邓超','男','30','18',2015,'8','11','邓某某','7','汉族','61043445645354',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'流失',NULL,NULL,NULL,'其它','1',NULL,3,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('12130981110668','朱春晓','女','31','22',2014,'8','15','朱某某','16','汉族','61043414564564526354',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'退学',NULL,NULL,NULL,'专升本','2',NULL,2,4,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('15642142536258','毛亮为','男','31','14',2016,'8','15','毛某某','15','汉族','61043445645654526354',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'共青团员',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'入伍',NULL,NULL,NULL,'创新创业','1',NULL,2,2,8,NULL,NULL,NULL,NULL,'陕西西安','否',NULL,NULL,NULL,NULL,NULL,NULL),('3151321531212','张三','男','29','17',2016,'9','15','张某某','16','汉族','610434145646526354',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13654125365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'休学',NULL,NULL,NULL,'自主实习','1',NULL,1,2,1,NULL,NULL,NULL,NULL,NULL,'是',NULL,NULL,NULL,NULL,'admin',NULL),('61060404080031','马成成','男','30','15',2016,'8','7','张三','12','汉族','536246104341526354','1996-03-02','/4954c680-2026-43a6-9bb8-9af84558ad3b.jpg','高考录取','2014-06-29','2017-06-30','O型',165,450,'中共党员','高中','综合评价','河北省邢台市乾县','河北省-石家庄市-长安区-丈八路幼儿园','河北省-邢台市-乾县','15823101452','713366','13654125365','张老师','15874523654','否','821459653@qq.com','9779866310','农村',387,'河北省-邢台市-乾县-新新小区','是','河北省邢台市第五中学','河北省-邢台市-乾县-新新小区','邢台市第五中学','学生','共产党','2017年07月19日 获得陕西蓝桥杯二等奖','退学','欠费','全额','分期','合作企业123','1','无校外住址',1,2,9,0,'否','佛教','一般','陕西西安','否','良好',5000,0,0,'8523212315','1014449029');
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student_experience`
--

DROP TABLE IF EXISTS `t_student_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_student_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(20) NOT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `work_place` varchar(200) DEFAULT NULL,
  `staff` varchar(100) DEFAULT NULL,
  `witness` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student_experience`
--

LOCK TABLES `t_student_experience` WRITE;
/*!40000 ALTER TABLE `t_student_experience` DISABLE KEYS */;
INSERT INTO `t_student_experience` VALUES (1,'61060404080031','2011-07-30','2016-07-30','西安市铁一中','组长123','马欢欢'),(2,'61060404080031','2011-07-30','2016-07-30','西安市铁一中','组长123','毛战神'),(3,'61060404080031','2011-07-30','2016-07-30','西安市铁一中','组长123','mbenben');
/*!40000 ALTER TABLE `t_student_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student_family`
--

DROP TABLE IF EXISTS `t_student_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_student_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(20) DEFAULT NULL,
  `relationship` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `political_status` varchar(100) DEFAULT NULL,
  `staff` varchar(100) DEFAULT NULL,
  `work_place` varchar(200) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student_family`
--

LOCK TABLES `t_student_family` WRITE;
/*!40000 ALTER TABLE `t_student_family` DISABLE KEYS */;
INSERT INTO `t_student_family` VALUES (1,'61060404080031','父亲','米某某','党派','教师','西安传智播客','15832453625'),(2,'61060404080031','母亲','张某某','预备党员','导师','西安尚学堂','15784523645'),(3,'61060404080031','爷爷','米某某','共青团员','教师','西安欧亚学院','15291194274'),(4,'61060404080031','奶奶','李某某','预备党员','无','无','15291194274'),(5,'61060404080031','1','工作1','预备党员','1','1','1'),(6,'61060404080031','1','张三','预备党员','工商银行','工商银行','15291194274');
/*!40000 ALTER TABLE `t_student_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_teacher`
--

DROP TABLE IF EXISTS `t_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_teacher` (
  `no` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `direction_id` int(11) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `classify` varchar(20) DEFAULT NULL,
  `identityCard` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_teacher`
--

LOCK TABLES `t_teacher` WRITE;
/*!40000 ALTER TABLE `t_teacher` DISABLE KEYS */;
INSERT INTO `t_teacher` VALUES ('1014449029','欢先生',0,0,'男',0,'社区辅导员','610424185632145236'),('1458745236','马欢欢',29,9,'女',0,'职业导师','610414199874521453'),('1542145263','沈老师',0,0,'男',4,'行政','6104241856321789456'),('234123412','阿双方首发',0,0,'男',3,'行政','123412343241234112'),('32542345','小红',0,0,'女',3,'行政','610424185632123456'),('333333333','张三',0,0,'女',0,'社区辅导员','610424185632316424'),('821453366','马欢',0,0,'男',3,'行政','610424185632145236'),('8523212315','张学伟',31,17,'女',0,'职业导师','610424185632145236'),('888888','88888888',0,0,'男',0,'社区辅导员','888888888888888888'),('896541254','黄森',0,0,'男',0,'社区辅导员','610424185632145236'),('admin','acey',29,11,'男',0,'职业导师','610424185632145236'),('qqq','设施',31,17,'男',0,'职业导师','610424185632145236'),('qwerqw','小东',29,9,'女',0,'职业导师','610424185632145236'),('sss','设施是',31,17,'男',0,'职业导师','610424185632145236'),('werqw','qwerqwer',29,9,'女',0,'职业导师','610424185632145236');
/*!40000 ALTER TABLE `t_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_teacher_community`
--

DROP TABLE IF EXISTS `t_teacher_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_teacher_community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(20) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_teacher_community`
--

LOCK TABLES `t_teacher_community` WRITE;
/*!40000 ALTER TABLE `t_teacher_community` DISABLE KEYS */;
INSERT INTO `t_teacher_community` VALUES (1,'',2,8),(2,'',2,10),(3,'',2,12),(4,'',2,8),(5,'1q',2,8),(6,'1q',2,10),(7,'',3,14),(8,'',3,15),(9,'',3,16),(10,'',2,8),(11,'',2,10),(12,'',2,12),(13,'',2,13),(14,'',1,1),(15,'',1,7),(16,'',1,1),(17,'',1,7),(18,'123123',2,9),(19,'123123',2,10),(20,'123123',2,11),(21,'123123',2,12),(22,'',1,1),(23,'',1,6),(24,'',1,7),(25,'',1,1),(26,'',1,3),(27,'',1,6),(28,'',1,7),(29,'',1,1),(30,'',1,3),(31,'',1,4),(32,'',1,6),(33,'',1,7),(34,'',1,1),(35,'',1,2),(36,'',1,3),(37,'',1,4),(38,'',1,6),(39,'',1,7),(40,'896541254',3,14),(41,'896541254',3,15),(42,'896541254',3,16),(43,'896541254',3,17),(44,'896541254',3,18),(45,'',1,1),(46,'',1,2),(47,'',1,3),(48,'',1,4),(49,'',1,6),(50,'333333333',2,8),(51,'333333333',2,9),(52,'124536521452',2,8),(53,'124536521452',2,9),(54,'124536521452',2,10),(55,'124536521452',2,11),(56,'888888',1,1),(57,'888888',1,2),(58,'1014449029',1,1),(59,'1014449029',1,2),(60,'1014449029',1,3),(61,'1014449029',1,4);
/*!40000 ALTER TABLE `t_teacher_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_test_method`
--

DROP TABLE IF EXISTS `t_test_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_test_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='考核方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_test_method`
--

LOCK TABLES `t_test_method` WRITE;
/*!40000 ALTER TABLE `t_test_method` DISABLE KEYS */;
INSERT INTO `t_test_method` VALUES (12,'大作业'),(13,'笔试'),(14,'机考'),(15,'课堂作业');
/*!40000 ALTER TABLE `t_test_method` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_train_module`
--

LOCK TABLES `t_train_module` WRITE;
/*!40000 ALTER TABLE `t_train_module` DISABLE KEYS */;
INSERT INTO `t_train_module` VALUES (3,'1990031','通识教育'),(4,'199004','专业平台'),(11,'199001','岗位技能'),(12,'199002','能力拓展');
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
  `level` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `direction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_train_program`
--

LOCK TABLES `t_train_program` WRITE;
/*!40000 ALTER TABLE `t_train_program` DISABLE KEYS */;
INSERT INTO `t_train_program` VALUES (56,2016,30,15);
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
INSERT INTO `t_user` VALUES ('111','111',2,1,'111','教师'),('admin','admin',1,1,'admin','管理员'),('14420625150297','111',3,1,'acey','学生'),('15642142536258','111',3,1,'mbb','学生'),('61060404080031','111',3,1,'马成成','学生'),('234123412','234112',6,1,'阿双方首发','教师'),('888888','888888',4,1,'88888888','老师');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tttttt`
--

DROP TABLE IF EXISTS `tttttt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tttttt` (
  `no` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `rename` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `blood_type` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `famous_family` varchar(20) DEFAULT NULL,
  `student_type` varchar(20) DEFAULT NULL,
  `admission_school_time` date DEFAULT NULL,
  `graduation_school_time` date DEFAULT NULL,
  `is_marry` varchar(20) DEFAULT NULL,
  `political_status` varchar(20) DEFAULT NULL,
  `pre_school_education` varchar(20) DEFAULT NULL,
  `student_classify` varchar(20) DEFAULT NULL,
  `idcard_address` text,
  `actual_address` text,
  `origin_address` text,
  `family_phone` varchar(20) DEFAULT NULL,
  `family_zip_code` varchar(20) DEFAULT NULL,
  `student_contact_method` varchar(20) DEFAULT NULL,
  `emergency_contact_name_1` varchar(20) DEFAULT NULL,
  `emergency_contact_method_1` varchar(20) DEFAULT NULL,
  `emergency_contact_name_2` varchar(20) DEFAULT NULL,
  `emergency_contact_method_2` varchar(20) DEFAULT NULL,
  `area_origin_name` varchar(20) DEFAULT NULL,
  `sat_score` double DEFAULT NULL,
  `pre_school_file_where_location` text,
  `pre_school_account_where_station` text,
  `origin_profession_id` varchar(20) DEFAULT NULL,
  `profession_id` varchar(20) DEFAULT NULL,
  `direction` varchar(20) DEFAULT NULL,
  `classes` varchar(20) DEFAULT NULL,
  `career_teacher` varchar(20) DEFAULT NULL,
  `student_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `practice_learning_type` varchar(20) DEFAULT NULL,
  `community` varchar(20) DEFAULT NULL,
  `community_teacher` varchar(20) DEFAULT NULL,
  `dorm_room` varchar(20) DEFAULT NULL,
  `religon` varchar(20) DEFAULT NULL,
  `hard_student_classify` varchar(20) DEFAULT NULL,
  `school_system` int(11) DEFAULT NULL,
  `in_school_status` varchar(20) DEFAULT NULL,
  `mobile_phone` varchar(20) DEFAULT NULL,
  `chinese_name` varchar(20) DEFAULT NULL,
  `place_of_birth` text,
  `country` text,
  `country_name` varchar(20) DEFAULT NULL,
  `canditate_number` varchar(20) DEFAULT NULL,
  `native_place` varchar(20) DEFAULT NULL,
  `travel_interval` text,
  `head_image` varchar(20) DEFAULT NULL,
  `employment_record` varchar(20) DEFAULT NULL,
  `company_roster` varchar(20) DEFAULT NULL,
  `is_job` varchar(20) DEFAULT NULL,
  `job_start_time` date DEFAULT NULL,
  `work_natute` varchar(20) DEFAULT NULL,
  `nature_name` varchar(20) DEFAULT NULL,
  `duty_classify` varchar(20) DEFAULT NULL,
  `classify_name` varchar(20) DEFAULT NULL,
  `job_title` varchar(20) DEFAULT NULL,
  `job_department` varchar(20) DEFAULT NULL,
  `company_phone` varchar(20) DEFAULT NULL,
  `company_fax` varchar(20) DEFAULT NULL,
  `company_zip_code` varchar(20) DEFAULT NULL,
  `company_address` text,
  `job_remark` text,
  `pre_school_learning_record` text,
  `retreat_record` text,
  `master_read_record` text,
  `turn_professional_record` text,
  `will_choose_department_record` text,
  `drop_out_school_record` text,
  `graduation_record` text,
  `repair_record` text,
  `exchange_student_record` text,
  `auxiliary_record` text,
  `repeat_record` text,
  `bank` varchar(20) DEFAULT NULL,
  `bank_account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tttttt`
--

LOCK TABLES `tttttt` WRITE;
/*!40000 ALTER TABLE `tttttt` DISABLE KEYS */;
INSERT INTO `tttttt` VALUES ('10212','asdasd','15416','2017-07-13','asdasd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('123','张三','张三丰','2017-07-08','3221546122',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('123231','asdf','asdfasdf','2017-07-18','4568756967',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('124','李四','null','2017-07-18','1561231612316',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('125','王五','null','2017-09-12','4567869',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('23','asd','asd','2017-07-28','15613153',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('321','asd','asd','2017-07-13','415613',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('456456','32131','456456','2017-07-30','fghjf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4845615','1561','78965','2017-07-06','asdas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('645','15616','54654','2017-07-25','5132213',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8978','asdasdasd','23123','2017-07-06','asdasd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tttttt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-01 21:08:16

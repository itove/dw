-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dw
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conf`
--

DROP TABLE IF EXISTS `conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `keywords` longtext DEFAULT NULL COMMENT '(DC2Type:simple_array)',
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `icp` varchar(20) NOT NULL,
  `weibo` varchar(20) DEFAULT NULL,
  `wx` varchar(20) DEFAULT NULL,
  `twitter` varchar(20) DEFAULT NULL,
  `facebook` varchar(20) DEFAULT NULL,
  `linkedin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf`
--

LOCK TABLES `conf` WRITE;
/*!40000 ALTER TABLE `conf` DISABLE KEYS */;
INSERT INTO `conf` VALUES (1,'湖北多维信息技术有限公司','多维,多维信息,数据服务,财务系统,软件服务,智慧数据','湖北多维为您提供软件支持、智慧数据等专业服务','湖北省十堰市张湾区凯旋大道188号十堰小微企业创新创业园3楼E67号','+86 138 8888 8888','support@hbdwxx.cn','鄂ICP备15003690号-3',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230425010737','2023-04-25 01:07:59',75);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230505091258','2023-05-05 09:13:08',34);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230505095122','2023-05-05 09:51:25',25);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230507031027','2023-05-07 03:10:32',59);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230507031323','2023-05-07 03:13:38',405);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230507031830','2023-05-07 03:18:36',31);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230507033801','2023-05-07 03:38:44',19);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230507055850','2023-05-07 05:59:04',70);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230507065531','2023-05-07 06:55:34',19);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230508002424','2023-05-08 00:24:42',30);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230508014503','2023-05-08 01:45:08',18);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230508022851','2023-05-08 02:28:54',17);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230508023140','2023-05-08 02:31:43',19);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230508055446','2023-05-08 05:55:03',19);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230508060720','2023-05-08 06:07:41',96);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230508063058','2023-05-08 06:31:15',41);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230508064259','2023-05-08 06:43:05',32);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230508074342','2023-05-08 07:43:46',16);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `body` longtext DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `synopsis` longtext NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_857FE84598260155` (`region_id`),
  CONSTRAINT `FK_857FE84598260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'公司简介','2023-05-05 09:41:03',NULL,NULL,NULL,'我们坚持以“技术创新、服务为本”为经营理念，深耕信息技术领域，为不同行业、不同规模、不同成长阶段的企事业单位提供优质、专业的信息化解决方案和落地服务；深耕内控体系建设领域，为不同层级的行政事业单位提供内控体系建设服务。',1,NULL);
INSERT INTO `node` VALUES (2,'企业愿景','2023-05-05 09:44:04',NULL,'receipt',NULL,'持续不断让客户体验到我们致力于为每个客户创造价值',1,NULL);
INSERT INTO `node` VALUES (3,'企业文化','2023-05-05 09:45:51',NULL,'cube-alt',NULL,'尊重规则流程，一次把事情做对；发挥员工潜能，持续改进',1,NULL);
INSERT INTO `node` VALUES (4,'服务宗旨','2023-05-05 09:46:35',NULL,'images',NULL,'承诺向客户提供高质量的产品、服务和解决方案',1,NULL);
INSERT INTO `node` VALUES (5,'质量方针','2023-05-05 09:47:17',NULL,'shield',NULL,'把客户要求与期望准确传递到整个价值链，共同构建质量',1,NULL);
INSERT INTO `node` VALUES (6,'客户满意度','2023-05-05 09:53:42',NULL,'emoji-smile',NULL,'232',1,NULL);
INSERT INTO `node` VALUES (7,'项目经验','2023-05-05 09:55:29',NULL,'journal-richtext',NULL,'521',1,NULL);
INSERT INTO `node` VALUES (8,'小时客户支持','2023-05-05 09:56:16',NULL,'headset',NULL,'1463',1,NULL);
INSERT INTO `node` VALUES (9,'团队成员','2023-05-05 09:57:17',NULL,'people',NULL,'15',1,NULL);
INSERT INTO `node` VALUES (10,'产品及服务','2023-05-05 09:57:49',NULL,NULL,NULL,'服务是高尚的使命、服务是热忱的行动、服务是生存的根本、服务是永恒的主题！',2,NULL);
INSERT INTO `node` VALUES (11,'内控体系建设','2023-05-05 09:58:49',NULL,'briefcase',NULL,'建立健全内部控制体制，完善内部控制相关制度，提高资金使用效率，保证财务信息真实完整。保证各项资产安全和有效使用。',8,NULL);
INSERT INTO `node` VALUES (12,'电子会计档案','2023-05-05 09:59:41',NULL,'card-checklist',NULL,'提高单位会计档案信息化管理水平，符合单位内控管理要求。注重用户体验，零培训、轻松使用。实现电子会计档案全生命周期管理。',8,NULL);
INSERT INTO `node` VALUES (13,'数据服务','2023-05-05 10:00:34',NULL,'bar-chart',NULL,'为企业、行政事业单位提供数据资源深度融合、行业主题数据分析、行业监测及预警以及数据挖掘服务，让数据发声，智慧决策。',8,NULL);
INSERT INTO `node` VALUES (14,'协同办公','2023-05-05 10:01:37',NULL,'binoculars',NULL,'全新的设计理念，全新的管理思维，为中大型组织架设高效办公模式，让组织内部的沟通协作畅通无阻，流程落地有效执行，让人员少跑路，满足各类读懂办公需要。',8,NULL);
INSERT INTO `node` VALUES (15,'集成服务','2023-05-05 10:02:24',NULL,'brightness-high',NULL,'汇聚行业和领域经验，深化应用，为15个大行业，68个细分行业，提供涵盖财务、供应链、制造、营销、人力资本等7大领域，23个细分领域的行业实践。',8,NULL);
INSERT INTO `node` VALUES (16,'政府财务','2023-05-05 10:03:04',NULL,'calendar4-week','slide-2-6459bd12b7c89423702307.jpg','行业内率先推出满足政府新会计制度要求的新一代财务管理解决方案，旨在为广大财务人员提供设计规范、操作便捷的信息化产品和服务。',8,'2023-05-09 03:25:06');
INSERT INTO `node` VALUES (17,'我们的优势','2023-05-05 10:03:55',NULL,NULL,NULL,'协助企业完成数据质量治理，实现企业内部、外部数据资源的深度整合，数据互通互融，构建企业数据资源池，实现数据的监测与预警，实现数据应用价值的深度挖掘。让数据鲜活、灵动。让数据发声，智慧管理。',7,NULL);
INSERT INTO `node` VALUES (18,'深厚的技术力量','2023-05-05 10:04:22',NULL,NULL,NULL,'敬业务实的专业人员，科学化的团队管理，高效的运营理念',9,NULL);
INSERT INTO `node` VALUES (19,'丰富的行业经验','2023-05-05 10:04:50',NULL,NULL,NULL,'凭借多年的行业实践经验，把握行业的发展趋势，形成自己的独特见解',9,NULL);
INSERT INTO `node` VALUES (20,'完善的服务体系','2023-05-05 10:05:13',NULL,NULL,NULL,'从问题发现一直到问题得到解决的端到端横向拉通的流程，实际落到具体业务体系',9,NULL);
INSERT INTO `node` VALUES (21,'典型案例','2023-05-05 10:05:39',NULL,NULL,NULL,'我们坚持以“技术创新、服务为本”为经营理念，深耕信息技术领域，为不同行业、不同规模、不同成长阶段的企事业单位提供优质、专业的信息化解决方案和落地服务。',3,NULL);
INSERT INTO `node` VALUES (22,'案例1','2023-05-07 05:17:24',NULL,NULL,'portfolio-1-64587e584b853168552994.jpg','案例1',10,'2023-05-08 04:45:12');
INSERT INTO `node` VALUES (23,'案例2','2023-05-07 05:17:46',NULL,NULL,'portfolio-2-64587e6a4261d854653517.jpg','案例2',10,'2023-05-08 04:45:30');
INSERT INTO `node` VALUES (24,'案例3','2023-05-07 05:18:03',NULL,NULL,'portfolio-3-64587e784957c567265404.jpg','案例3',10,'2023-05-08 04:45:44');
INSERT INTO `node` VALUES (25,'案例4','2023-05-07 05:17:24',NULL,NULL,'portfolio-4-64587e84c7175677545699.jpg','案例4',10,'2023-05-08 04:45:56');
INSERT INTO `node` VALUES (26,'案例5','2023-05-07 05:17:24',NULL,NULL,'portfolio-5-64587e93884e8689733877.jpg','案例5',10,'2023-05-08 04:46:11');
INSERT INTO `node` VALUES (27,'案例6','2023-05-07 05:17:24',NULL,NULL,'portfolio-6-64587ea1249f7651644699.jpg','案例6',10,'2023-05-08 04:46:25');
INSERT INTO `node` VALUES (28,'案例7','2023-05-07 05:17:24',NULL,NULL,'portfolio-7-64587eaf2ca0e172227700.jpg','案例7',10,'2023-05-08 04:46:39');
INSERT INTO `node` VALUES (29,'案例8','2023-05-07 05:17:24',NULL,NULL,'portfolio-8-64587ebc8b64c623471294.jpg','案例8',10,'2023-05-08 04:46:52');
INSERT INTO `node` VALUES (30,'案例9','2023-05-07 05:17:24',NULL,NULL,'portfolio-9-64587ed0e4f9c572187579.jpg','案例9',10,'2023-05-08 04:47:12');
INSERT INTO `node` VALUES (31,'团队成员','2023-05-07 05:23:39',NULL,NULL,NULL,'凝聚于心、专攻于业、尊重个人、客户至上。助力客户成功，成就员工梦想！',4,NULL);
INSERT INTO `node` VALUES (32,'刘备','2023-05-07 05:17:24',NULL,NULL,'team-1-645869282e1e7433343011.jpg','CEO',11,'2023-05-08 03:14:48');
INSERT INTO `node` VALUES (33,'小乔','2023-05-07 05:17:24',NULL,NULL,'team-2-6458695b47f07220751748.jpg','产品经理',11,'2023-05-08 03:15:39');
INSERT INTO `node` VALUES (34,'诸葛亮','2023-05-07 05:17:24',NULL,NULL,'team-3-64586988e84ae754084828.jpg','总经理',11,'2023-05-08 03:16:24');
INSERT INTO `node` VALUES (35,'孙尚香','2023-05-07 05:17:24',NULL,NULL,'team-4-645869b1a272d463521223.jpg','会计',11,'2023-05-08 03:17:05');
INSERT INTO `node` VALUES (36,'产品价格','2023-05-07 05:30:41',NULL,NULL,NULL,'我们会根据您的具体需求定制针对性的实施策略，并采用合理灵活的定价方案。',12,NULL);
INSERT INTO `node` VALUES (37,'常见问题','2023-05-07 05:38:07',NULL,NULL,NULL,'如果您有任何疑问，可参考常见问题。如果常见问题不能解答您的疑问，请与我们联系。',14,NULL);
INSERT INTO `node` VALUES (38,'联系我们','2023-05-07 05:38:34',NULL,NULL,NULL,'如果您有任何关于产品/解决方案的需求，请与我们联系。期待您的支持、反馈与建议。您也可以在下面填写您的详细信息，我们将使用您填写的信息为您提供服务。 请注意，我们重视并尊重您的隐私，仅将您填写的个人信息用于服务目的，不会与第三方共享。 如您想了解更多信息，请详细阅读隐私声明。',6,NULL);
INSERT INTO `node` VALUES (39,'常见问题1','2023-05-07 05:59:24',NULL,NULL,NULL,'常见问题1',15,NULL);
INSERT INTO `node` VALUES (40,'常见问题2','2023-05-07 05:59:40',NULL,NULL,NULL,'常见问题2',15,NULL);
INSERT INTO `node` VALUES (41,'常见问题3','2023-05-07 05:59:46',NULL,NULL,NULL,'常见问题3',15,NULL);
INSERT INTO `node` VALUES (42,'常见问题4','2023-05-07 06:00:05',NULL,NULL,NULL,'常见问题4',15,NULL);
INSERT INTO `node` VALUES (43,'常见问题5','2023-05-07 06:00:13',NULL,NULL,NULL,'常见问题5',15,NULL);
INSERT INTO `node` VALUES (44,'地址','2023-05-07 06:06:53',NULL,NULL,NULL,'湖北省十堰市张湾区凯旋大道188号十堰小微企业创新创业园3楼E67号',16,NULL);
INSERT INTO `node` VALUES (45,'电话','2023-05-07 06:07:12',NULL,NULL,NULL,'+86 138 8888 8888',16,NULL);
INSERT INTO `node` VALUES (46,'邮箱','2023-05-07 06:07:29',NULL,NULL,NULL,'support@hbdwxx.cn',16,NULL);
INSERT INTO `node` VALUES (47,'开放、合作、共赢','2023-05-07 09:09:02','<figure class=\"image\"><img src=\"/img/6459ca1b172fe-slide-1.jpg\"></figure><figure class=\"image\"><img src=\"/img/6459ca12a0c21-slide-3.jpg\"></figure><p>&nbsp;</p>',NULL,'slide-3-645883a78b374712391188.jpg','与不同行业的合作，促进跨领域、跨技术和跨手段的交流和协作，携手构建适应产业健康和谐发展的生态环境，推动数字经济发展。',5,'2023-05-08 05:07:51');
INSERT INTO `node` VALUES (49,'用户为本，科技向善','2023-05-07 07:23:22',NULL,NULL,'slide-2-6458839c029af971078891.jpg','一切以用户价值为依归，将社会责任融入产品及服务之中；推动科技创新与文化传承，助力各行各业升级，促进社会的可持续发展。',5,'2023-05-08 05:07:40');
INSERT INTO `node` VALUES (52,'科技创造美好未来','2023-05-07 06:31:48','<p>科学探索与技术创新是推动人类文明进步和社会发展的主要力量。创新开创未来，实干成就梦想。</p><p>科学探索与技术创新是推动人类文明进步和社会发展的主要力量。创新开创未来，实干成就梦想。</p>',NULL,'slide-1-645883929ebac385535569.jpg','科学探索与技术创新是推动人类文明进步和社会发展的主要力量。创新开创未来，实干成就梦想。',5,'2023-05-08 05:07:30');
INSERT INTO `node` VALUES (57,'免费','2023-05-08 03:48:47','<ul><li>Aida dere</li><li>Nec feugiat nisl</li><li>Nulla at volutpat dola</li><li>Pharetra massa</li><li>Massa ultricies mi</li></ul>',NULL,NULL,'0',13,NULL);
INSERT INTO `node` VALUES (58,'商务','2023-05-08 03:49:13','<ul><li>Aida dere</li><li>Nec feugiat nisl</li><li>Nulla at volutpat dola</li><li>Pharetra massa</li><li>Massa ultricies mi</li></ul>',NULL,NULL,'19',13,NULL);
INSERT INTO `node` VALUES (59,'开发','2023-05-08 03:49:31','<ul><li>Aida dere</li><li>Nec feugiat nisl</li><li>Nulla at volutpat dola</li><li>Pharetra massa</li><li>Massa ultricies mi</li></ul>',NULL,NULL,'29',13,NULL);
INSERT INTO `node` VALUES (68,'用户条款','2023-05-09 03:47:02','<p>用户条款正文</p>',NULL,NULL,'用户条款概要',17,NULL);
INSERT INTO `node` VALUES (69,'隐私声明','2023-05-09 03:47:44','<p>隐私声明正文</p>',NULL,NULL,'隐私声明概要',17,NULL);
INSERT INTO `node` VALUES (70,'行业动态1','2023-05-09 07:22:03','<p>行业动态1正文</p>',NULL,'slide-2-6459f49b765bd193217099.jpg','行业动态1概要',5,'2023-05-09 07:22:03');
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_tag`
--

DROP TABLE IF EXISTS `node_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_tag` (
  `node_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`node_id`,`tag_id`),
  KEY `IDX_70AC95F8460D9FD7` (`node_id`),
  KEY `IDX_70AC95F8BAD26311` (`tag_id`),
  CONSTRAINT `FK_70AC95F8460D9FD7` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_70AC95F8BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_tag`
--

LOCK TABLES `node_tag` WRITE;
/*!40000 ALTER TABLE `node_tag` DISABLE KEYS */;
INSERT INTO `node_tag` VALUES (22,4);
INSERT INTO `node_tag` VALUES (23,5);
INSERT INTO `node_tag` VALUES (24,6);
INSERT INTO `node_tag` VALUES (25,4);
INSERT INTO `node_tag` VALUES (25,5);
INSERT INTO `node_tag` VALUES (25,6);
INSERT INTO `node_tag` VALUES (26,4);
INSERT INTO `node_tag` VALUES (26,5);
INSERT INTO `node_tag` VALUES (27,6);
INSERT INTO `node_tag` VALUES (28,4);
INSERT INTO `node_tag` VALUES (29,5);
INSERT INTO `node_tag` VALUES (29,6);
INSERT INTO `node_tag` VALUES (30,4);
INSERT INTO `node_tag` VALUES (30,5);
INSERT INTO `node_tag` VALUES (47,1);
INSERT INTO `node_tag` VALUES (47,2);
INSERT INTO `node_tag` VALUES (49,1);
INSERT INTO `node_tag` VALUES (49,2);
INSERT INTO `node_tag` VALUES (49,3);
INSERT INTO `node_tag` VALUES (52,1);
INSERT INTO `node_tag` VALUES (52,2);
INSERT INTO `node_tag` VALUES (52,3);
INSERT INTO `node_tag` VALUES (68,7);
INSERT INTO `node_tag` VALUES (69,8);
INSERT INTO `node_tag` VALUES (70,3);
/*!40000 ALTER TABLE `node_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `label` varchar(20) NOT NULL,
  `menu` tinyint(1) NOT NULL,
  `count` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'关于我们','about',0,-10);
INSERT INTO `region` VALUES (2,'产品方案','product',0,0);
INSERT INTO `region` VALUES (3,'典型案例','portfolio',0,0);
INSERT INTO `region` VALUES (4,'团队介绍','team',0,0);
INSERT INTO `region` VALUES (5,'企业动态','news_list',0,3);
INSERT INTO `region` VALUES (6,'联系我们','contact',0,0);
INSERT INTO `region` VALUES (7,'我们的优势','why',0,0);
INSERT INTO `region` VALUES (8,'产品列表','product_list',0,6);
INSERT INTO `region` VALUES (9,'优势列表','why_list',0,3);
INSERT INTO `region` VALUES (10,'典型案例列表','portfolio_list',0,9);
INSERT INTO `region` VALUES (11,'团队成员','member_list',0,-4);
INSERT INTO `region` VALUES (12,'产品价格','price',0,0);
INSERT INTO `region` VALUES (13,'价格列表','price_list',0,-3);
INSERT INTO `region` VALUES (14,'常见问题','faq',0,0);
INSERT INTO `region` VALUES (15,'问题列表','faq_list',0,5);
INSERT INTO `region` VALUES (16,'联系信息','contact_list',0,3);
INSERT INTO `region` VALUES (17,'term','term',0,0);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `label` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'轮播图','carousel');
INSERT INTO `tag` VALUES (2,'公司新闻','news');
INSERT INTO `tag` VALUES (3,'行业动态','industry');
INSERT INTO `tag` VALUES (4,'智慧办公','portfolio-office');
INSERT INTO `tag` VALUES (5,'智慧数据','portfolio-data');
INSERT INTO `tag` VALUES (6,'智慧财务','portfolio-accounting');
INSERT INTO `tag` VALUES (7,'用户条款','term-policy');
INSERT INTO `tag` VALUES (8,'隐私声明','term-privacy');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `plain_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'al','[\"ROLE_SUPER_ADMIN\"]','$2y$13$OLyzsTfEdbGY6UfmZ8Nd3.i1bZaoP5s2pWsM0Rsemrn6foBdxfD7W',NULL);
INSERT INTO `user` VALUES (2,'admin','[\"ROLE_ADMIN\"]','$2y$13$O5FMXGP6ofZLSKB4KoNaeOx8MMPbd9c58EAYdJujZjCBkqNpyIiwG',NULL);
INSERT INTO `user` VALUES (4,'u1','[]','$2y$13$0xYTmoQWPRkf2udWHVbnZOLy1Cl4VzVgXAf6ihvNGSOM7r8vKt8n.',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-09 15:57:47

-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: duowei
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
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
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
  `label` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `body` longtext DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `synopsis` longtext NOT NULL,
  `tags` longtext DEFAULT NULL COMMENT '(DC2Type:simple_array)',
  `region_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_857FE84598260155` (`region_id`),
  CONSTRAINT `FK_857FE84598260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'湖北多维信息技术有限公司','company_name','2023-05-05 09:41:03',NULL,NULL,NULL,'我们坚持以“技术创新、服务为本”为经营理念，深耕信息技术领域，为不同行业、不同规模、不同成长阶段的企事业单位提供优质、专业的信息化解决方案和落地服务；深耕内控体系建设领域，为不同层级的行政事业单位提供内控体系建设服务。',NULL,1,NULL);
INSERT INTO `node` VALUES (2,'企业愿景','about_1','2023-05-05 09:44:04',NULL,'receipt',NULL,'持续不断让客户体验到我们致力于为每个客户创造价值',NULL,1,NULL);
INSERT INTO `node` VALUES (3,'企业文化','about_2','2023-05-05 09:45:51',NULL,'cube-alt',NULL,'尊重规则流程，一次把事情做对；发挥员工潜能，持续改进',NULL,1,NULL);
INSERT INTO `node` VALUES (4,'服务宗旨','about_3','2023-05-05 09:46:35',NULL,'images',NULL,'承诺向客户提供高质量的产品、服务和解决方案',NULL,1,NULL);
INSERT INTO `node` VALUES (5,'质量方针','about_4','2023-05-05 09:47:17',NULL,'shield',NULL,'把客户要求与期望准确传递到整个价值链，共同构建质量',NULL,1,NULL);
INSERT INTO `node` VALUES (6,'客户满意度','counts_1','2023-05-05 09:53:42',NULL,'emoji-smile',NULL,'232',NULL,1,NULL);
INSERT INTO `node` VALUES (7,'项目经验','counts_2','2023-05-05 09:55:29',NULL,'journal-richtext',NULL,'521',NULL,1,NULL);
INSERT INTO `node` VALUES (8,'小时客户支持','counts_3','2023-05-05 09:56:16',NULL,'headset',NULL,'1463',NULL,1,NULL);
INSERT INTO `node` VALUES (9,'团队成员','counts_4','2023-05-05 09:57:17',NULL,'people',NULL,'15',NULL,1,NULL);
INSERT INTO `node` VALUES (10,'产品及服务','product_header','2023-05-05 09:57:49',NULL,NULL,NULL,'服务是高尚的使命、服务是热忱的行动、服务是生存的根本、服务是永恒的主题！',NULL,2,NULL);
INSERT INTO `node` VALUES (11,'内控体系建设','product_1','2023-05-05 09:58:49',NULL,'briefcase',NULL,'建立健全内部控制体制，完善内部控制相关制度，提高资金使用效率，保证财务信息真实完整。保证各项资产安全和有效使用。',NULL,2,NULL);
INSERT INTO `node` VALUES (12,'电子会计档案','product_2','2023-05-05 09:59:41',NULL,'card-checklist',NULL,'提高单位会计档案信息化管理水平，符合单位内控管理要求。注重用户体验，零培训、轻松使用。实现电子会计档案全生命周期管理。',NULL,2,NULL);
INSERT INTO `node` VALUES (13,'数据服务','product_3','2023-05-05 10:00:34',NULL,'bar-chart',NULL,'为企业、行政事业单位提供数据资源深度融合、行业主题数据分析、行业监测及预警以及数据挖掘服务，让数据发声，智慧决策。',NULL,2,NULL);
INSERT INTO `node` VALUES (14,'协同办公','product_4','2023-05-05 10:01:37',NULL,'binoculars',NULL,'全新的设计理念，全新的管理思维，为中大型组织架设高效办公模式，让组织内部的沟通协作畅通无阻，流程落地有效执行，让人员少跑路，满足各类读懂办公需要。',NULL,2,NULL);
INSERT INTO `node` VALUES (15,'集成服务','product_5','2023-05-05 10:02:24',NULL,'brightness-high',NULL,'汇聚行业和领域经验，深化应用，为15个大行业，68个细分行业，提供涵盖财务、供应链、制造、营销、人力资本等7大领域，23个细分领域的行业实践。',NULL,2,NULL);
INSERT INTO `node` VALUES (16,'政府财务','product_6','2023-05-05 10:03:04',NULL,'calendar4-week',NULL,'行业内率先推出满足政府新会计制度要求的新一代财务管理解决方案，旨在为广大财务人员提供设计规范、操作便捷的信息化产品和服务。',NULL,2,NULL);
INSERT INTO `node` VALUES (17,'我们的优势','whyus_header','2023-05-05 10:03:55',NULL,NULL,NULL,'协助企业完成数据质量治理，实现企业内部、外部数据资源的深度整合，数据互通互融，构建企业数据资源池，实现数据的监测与预警，实现数据应用价值的深度挖掘。让数据鲜活、灵动。让数据发声，智慧管理。',NULL,7,NULL);
INSERT INTO `node` VALUES (18,'深厚的技术力量','whyus_1','2023-05-05 10:04:22',NULL,NULL,NULL,'敬业务实的专业人员，科学化的团队管理，高效的运营理念',NULL,9,NULL);
INSERT INTO `node` VALUES (19,'丰富的行业经验','whyus_2','2023-05-05 10:04:50',NULL,NULL,NULL,'凭借多年的行业实践经验，把握行业的发展趋势，形成自己的独特见解',NULL,9,NULL);
INSERT INTO `node` VALUES (20,'完善的服务体系','whyus_3','2023-05-05 10:05:13',NULL,NULL,NULL,'从问题发现一直到问题得到解决的端到端横向拉通的流程，实际落到具体业务体系',NULL,9,NULL);
INSERT INTO `node` VALUES (21,'典型案例','portfolio_header','2023-05-05 10:05:39',NULL,NULL,NULL,'我们坚持以“技术创新、服务为本”为经营理念，深耕信息技术领域，为不同行业、不同规模、不同成长阶段的企事业单位提供优质、专业的信息化解决方案和落地服务。',NULL,3,NULL);
INSERT INTO `node` VALUES (22,'案例1','portfolio_1','2023-05-07 05:17:24',NULL,NULL,NULL,'案例1',NULL,10,NULL);
INSERT INTO `node` VALUES (23,'案例2','portfolio_2','2023-05-07 05:17:46',NULL,NULL,NULL,'案例2',NULL,10,NULL);
INSERT INTO `node` VALUES (24,'案例3','portfolio_3','2023-05-07 05:18:03',NULL,NULL,NULL,'案例3',NULL,10,NULL);
INSERT INTO `node` VALUES (25,'案例4','portfolio_4','2023-05-07 05:17:24',NULL,NULL,NULL,'案例4',NULL,10,NULL);
INSERT INTO `node` VALUES (26,'案例5','portfolio_5','2023-05-07 05:17:24',NULL,NULL,NULL,'案例5',NULL,10,NULL);
INSERT INTO `node` VALUES (27,'案例6','portfolio_6','2023-05-07 05:17:24',NULL,NULL,NULL,'案例6',NULL,10,NULL);
INSERT INTO `node` VALUES (28,'案例7','portfolio_7','2023-05-07 05:17:24',NULL,NULL,NULL,'案例7',NULL,10,NULL);
INSERT INTO `node` VALUES (29,'案例8','portfolio_8','2023-05-07 05:17:24',NULL,NULL,NULL,'案例8',NULL,10,NULL);
INSERT INTO `node` VALUES (30,'案例9','portfolio_9','2023-05-07 05:17:24',NULL,NULL,NULL,'案例9',NULL,10,NULL);
INSERT INTO `node` VALUES (31,'团队成员','team','2023-05-07 05:23:39',NULL,NULL,NULL,'凝聚于心、专攻于业、尊重个人、客户至上。助力客户成功，成就员工梦想！',NULL,4,NULL);
INSERT INTO `node` VALUES (32,'成员1','member_1','2023-05-07 05:17:24',NULL,NULL,NULL,'成员1',NULL,11,NULL);
INSERT INTO `node` VALUES (33,'成员2','member_2','2023-05-07 05:17:24',NULL,NULL,NULL,'成员2',NULL,11,NULL);
INSERT INTO `node` VALUES (34,'成员3','member_3','2023-05-07 05:17:24',NULL,NULL,NULL,'成员3',NULL,11,NULL);
INSERT INTO `node` VALUES (35,'成员4','member_4','2023-05-07 05:17:24',NULL,NULL,NULL,'成员4',NULL,11,NULL);
INSERT INTO `node` VALUES (36,'产品价格','price','2023-05-07 05:30:41',NULL,NULL,NULL,'我们会根据您的具体需求定制针对性的实施策略，并采用合理灵活的定价方案。',NULL,12,NULL);
INSERT INTO `node` VALUES (37,'常见问题','faq','2023-05-07 05:38:07',NULL,NULL,NULL,'如果您有任何疑问，可参考常见问题。如果常见问题不能解答您的疑问，请与我们联系。',NULL,14,NULL);
INSERT INTO `node` VALUES (38,'联系我们','contact','2023-05-07 05:38:34',NULL,NULL,NULL,'如果您有任何关于产品/解决方案的需求，请与我们联系。期待您的支持、反馈与建议。您也可以在下面填写您的详细信息，我们将使用您填写的信息为您提供服务。 请注意，我们重视并尊重您的隐私，仅将您填写的个人信息用于服务目的，不会与第三方共享。 如您想了解更多信息，请详细阅读隐私声明。',NULL,6,NULL);
INSERT INTO `node` VALUES (39,'常见问题1',NULL,'2023-05-07 05:59:24',NULL,NULL,NULL,'常见问题1',NULL,15,NULL);
INSERT INTO `node` VALUES (40,'常见问题2',NULL,'2023-05-07 05:59:40',NULL,NULL,NULL,'常见问题2',NULL,15,NULL);
INSERT INTO `node` VALUES (41,'常见问题3',NULL,'2023-05-07 05:59:46',NULL,NULL,NULL,'常见问题3',NULL,15,NULL);
INSERT INTO `node` VALUES (42,'常见问题4',NULL,'2023-05-07 06:00:05',NULL,NULL,NULL,'常见问题4',NULL,15,NULL);
INSERT INTO `node` VALUES (43,'常见问题5',NULL,'2023-05-07 06:00:13',NULL,NULL,NULL,'常见问题5',NULL,15,NULL);
INSERT INTO `node` VALUES (44,'地址',NULL,'2023-05-07 06:06:53',NULL,NULL,NULL,'湖北省十堰市张湾区凯旋大道188号十堰小微企业创新创业园3楼E67号',NULL,16,NULL);
INSERT INTO `node` VALUES (45,'电话',NULL,'2023-05-07 06:07:12',NULL,NULL,NULL,'+86 138 8888 8888',NULL,16,NULL);
INSERT INTO `node` VALUES (46,'邮箱',NULL,'2023-05-07 06:07:29',NULL,NULL,NULL,'support@hbdwxx.cn',NULL,16,NULL);
INSERT INTO `node` VALUES (47,'新闻1',NULL,'2023-05-07 06:31:48',NULL,NULL,NULL,'新闻1',NULL,NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'关于我们','about');
INSERT INTO `region` VALUES (2,'产品方案','product');
INSERT INTO `region` VALUES (3,'典型案例','portfolio');
INSERT INTO `region` VALUES (4,'团队介绍','team');
INSERT INTO `region` VALUES (5,'企业动态','news');
INSERT INTO `region` VALUES (6,'联系我们','contact');
INSERT INTO `region` VALUES (7,'我们的优势','why');
INSERT INTO `region` VALUES (8,'产品列表','product_list');
INSERT INTO `region` VALUES (9,'我们的优势列表','why_list');
INSERT INTO `region` VALUES (10,'典型案例列表','portfolio_list');
INSERT INTO `region` VALUES (11,'团队介绍','team_list');
INSERT INTO `region` VALUES (12,'产品价格','price');
INSERT INTO `region` VALUES (13,'价格列表','price_list');
INSERT INTO `region` VALUES (14,'常见问题','faq');
INSERT INTO `region` VALUES (15,'问题列表','faq_list');
INSERT INTO `region` VALUES (16,'联系信息','contact_list');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'轮播图','carousel');
INSERT INTO `tag` VALUES (2,'公司新闻','news_company');
INSERT INTO `tag` VALUES (3,'行业动态','news_industry');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','[\"ROLE_ADMIN\"]','$2y$13$OLyzsTfEdbGY6UfmZ8Nd3.i1bZaoP5s2pWsM0Rsemrn6foBdxfD7W');
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

-- Dump completed on 2023-05-07 14:55:06

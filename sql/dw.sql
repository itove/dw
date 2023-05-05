-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: duowei
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB

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
  `label` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `body` longtext DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `synopsis` longtext NOT NULL,
  `tags` longtext DEFAULT NULL COMMENT '(DC2Type:simple_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'湖北多维信息技术有限公司','company_name','2023-05-05 09:41:03',NULL,NULL,NULL,'我们坚持以“技术创新、服务为本”为经营理念，深耕信息技术领域，为不同行业、不同规模、不同成长阶段的企事业单位提供优质、专业的信息化解决方案和落地服务；深耕内控体系建设领域，为不同层级的行政事业单位提供内控体系建设服务。',NULL);
INSERT INTO `node` VALUES (2,'企业愿景','about_1','2023-05-05 09:44:04',NULL,'receipt',NULL,'持续不断让客户体验到我们致力于为每个客户创造价值',NULL);
INSERT INTO `node` VALUES (3,'企业文化','about_2','2023-05-05 09:45:51',NULL,'cube-alt',NULL,'尊重规则流程，一次把事情做对；发挥员工潜能，持续改进',NULL);
INSERT INTO `node` VALUES (4,'服务宗旨','about_3','2023-05-05 09:46:35',NULL,'images',NULL,'承诺向客户提供高质量的产品、服务和解决方案',NULL);
INSERT INTO `node` VALUES (5,'质量方针','about_4','2023-05-05 09:47:17',NULL,'shield',NULL,'把客户要求与期望准确传递到整个价值链，共同构建质量',NULL);
INSERT INTO `node` VALUES (6,'客户满意度','counts_1','2023-05-05 09:53:42',NULL,'emoji-smile',NULL,'232',NULL);
INSERT INTO `node` VALUES (7,'项目经验','counts_2','2023-05-05 09:55:29',NULL,'journal-richtext',NULL,'521',NULL);
INSERT INTO `node` VALUES (8,'小时客户支持','counts_3','2023-05-05 09:56:16',NULL,'headset',NULL,'1463',NULL);
INSERT INTO `node` VALUES (9,'团队成员','counts_4','2023-05-05 09:57:17',NULL,'people',NULL,'15',NULL);
INSERT INTO `node` VALUES (10,'产品及服务','product_header','2023-05-05 09:57:49',NULL,NULL,NULL,'服务是高尚的使命、服务是热忱的行动、服务是生存的根本、服务是永恒的主题！',NULL);
INSERT INTO `node` VALUES (11,'内控体系建设','product_1','2023-05-05 09:58:49',NULL,'briefcase',NULL,'建立健全内部控制体制，完善内部控制相关制度，提高资金使用效率，保证财务信息真实完整。保证各项资产安全和有效使用。',NULL);
INSERT INTO `node` VALUES (12,'电子会计档案','product_2','2023-05-05 09:59:41',NULL,'card-checklist',NULL,'提高单位会计档案信息化管理水平，符合单位内控管理要求。注重用户体验，零培训、轻松使用。实现电子会计档案全生命周期管理。',NULL);
INSERT INTO `node` VALUES (13,'数据服务','product_3','2023-05-05 10:00:34',NULL,'bar-chart',NULL,'为企业、行政事业单位提供数据资源深度融合、行业主题数据分析、行业监测及预警以及数据挖掘服务，让数据发声，智慧决策。',NULL);
INSERT INTO `node` VALUES (14,'协同办公','product_4','2023-05-05 10:01:37',NULL,'binoculars',NULL,'全新的设计理念，全新的管理思维，为中大型组织架设高效办公模式，让组织内部的沟通协作畅通无阻，流程落地有效执行，让人员少跑路，满足各类读懂办公需要。',NULL);
INSERT INTO `node` VALUES (15,'集成服务','product_5','2023-05-05 10:02:24',NULL,'brightness-high',NULL,'汇聚行业和领域经验，深化应用，为15个大行业，68个细分行业，提供涵盖财务、供应链、制造、营销、人力资本等7大领域，23个细分领域的行业实践。',NULL);
INSERT INTO `node` VALUES (16,'政府财务','product_6','2023-05-05 10:03:04',NULL,'calendar4-week',NULL,'行业内率先推出满足政府新会计制度要求的新一代财务管理解决方案，旨在为广大财务人员提供设计规范、操作便捷的信息化产品和服务。',NULL);
INSERT INTO `node` VALUES (17,'我们的优势','whyus_header','2023-05-05 10:03:55',NULL,NULL,NULL,'协助企业完成数据质量治理，实现企业内部、外部数据资源的深度整合，数据互通互融，构建企业数据资源池，实现数据的监测与预警，实现数据应用价值的深度挖掘。让数据鲜活、灵动。让数据发声，智慧管理。',NULL);
INSERT INTO `node` VALUES (18,'深厚的技术力量','whyus_1','2023-05-05 10:04:22',NULL,NULL,NULL,'敬业务实的专业人员，科学化的团队管理，高效的运营理念',NULL);
INSERT INTO `node` VALUES (19,'丰富的行业经验','whyus_2','2023-05-05 10:04:50',NULL,NULL,NULL,'凭借多年的行业实践经验，把握行业的发展趋势，形成自己的独特见解',NULL);
INSERT INTO `node` VALUES (20,'完善的服务体系','whyus_3','2023-05-05 10:05:13',NULL,NULL,NULL,'从问题发现一直到问题得到解决的端到端横向拉通的流程，实际落到具体业务体系',NULL);
INSERT INTO `node` VALUES (21,'典型案例','portfolio_header','2023-05-05 10:05:39',NULL,NULL,NULL,'我们坚持以“技术创新、服务为本”为经营理念，深耕信息技术领域，为不同行业、不同规模、不同成长阶段的企事业单位提供优质、专业的信息化解决方案和落地服务。',NULL);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
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

-- Dump completed on 2023-05-05 18:08:24

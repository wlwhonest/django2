/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : db_lab_drug

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 12/09/2023 21:11:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 学生信息表', 7, 'add_commonuser');
INSERT INTO `auth_permission` VALUES (26, 'Can change 学生信息表', 7, 'change_commonuser');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 学生信息表', 7, 'delete_commonuser');
INSERT INTO `auth_permission` VALUES (28, 'Can view 学生信息表', 7, 'view_commonuser');
INSERT INTO `auth_permission` VALUES (29, 'Can add 文件信息表', 8, 'add_doc');
INSERT INTO `auth_permission` VALUES (30, 'Can change 文件信息表', 8, 'change_doc');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 文件信息表', 8, 'delete_doc');
INSERT INTO `auth_permission` VALUES (32, 'Can view 文件信息表', 8, 'view_doc');
INSERT INTO `auth_permission` VALUES (33, 'Can add 仪器信息表', 9, 'add_instrument');
INSERT INTO `auth_permission` VALUES (34, 'Can change 仪器信息表', 9, 'change_instrument');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 仪器信息表', 9, 'delete_instrument');
INSERT INTO `auth_permission` VALUES (36, 'Can view 仪器信息表', 9, 'view_instrument');
INSERT INTO `auth_permission` VALUES (37, 'Can add 实验室信息表', 10, 'add_lab');
INSERT INTO `auth_permission` VALUES (38, 'Can change 实验室信息表', 10, 'change_lab');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 实验室信息表', 10, 'delete_lab');
INSERT INTO `auth_permission` VALUES (40, 'Can view 实验室信息表', 10, 'view_lab');
INSERT INTO `auth_permission` VALUES (41, 'Can add 药品信息表', 11, 'add_medicine');
INSERT INTO `auth_permission` VALUES (42, 'Can change 药品信息表', 11, 'change_medicine');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 药品信息表', 11, 'delete_medicine');
INSERT INTO `auth_permission` VALUES (44, 'Can view 药品信息表', 11, 'view_medicine');
INSERT INTO `auth_permission` VALUES (45, 'Can add 借用仪器记录', 12, 'add_insborrow');
INSERT INTO `auth_permission` VALUES (46, 'Can change 借用仪器记录', 12, 'change_insborrow');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 借用仪器记录', 12, 'delete_insborrow');
INSERT INTO `auth_permission` VALUES (48, 'Can view 借用仪器记录', 12, 'view_insborrow');
INSERT INTO `auth_permission` VALUES (49, 'Can add 借用药品记录表', 13, 'add_borrow');
INSERT INTO `auth_permission` VALUES (50, 'Can change 借用药品记录表', 13, 'change_borrow');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 借用药品记录表', 13, 'delete_borrow');
INSERT INTO `auth_permission` VALUES (52, 'Can view 借用药品记录表', 13, 'view_borrow');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$C91NdvdcTlzg$lZlb4gMfHomVm1ufJqOQLqKiEqCuabv/rf2t2Jz3FlM=', '2023-09-12 12:55:38.117921', 1, 'admin', '', '', '', 1, 1, '2023-09-08 15:05:35.308949');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$150000$BFAKinCkRue4$kbGioNSeUgEI52D7ticVuzEgSkI3BIanuVRZ+yk5X+o=', '2023-09-12 12:53:46.070594', 0, '20230910', '', '', '666666@qq.com', 0, 1, '2023-09-10 14:08:28.234877');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$150000$RWMySSrZe2Qs$UtF95dy4CYZ02F36UOkTcQpZq0uXpcvgst9jzbpOSE4=', '2023-09-12 12:41:57.487343', 0, '20230912', '', '', '666666@qq.com', 0, 1, '2023-09-12 12:41:56.844915');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicineUsedNum` int(10) UNSIGNED NOT NULL,
  `boDate` datetime NOT NULL,
  `lab_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `borrow_medicine_id_40ed6ee2_fk_medicine_id`(`medicine_id`) USING BTREE,
  INDEX `borrow_user_id_3339d8e1_fk_common_user_id`(`user_id`) USING BTREE,
  INDEX `borrow_lab_id_b4300efd_fk_lab_id`(`lab_id`) USING BTREE,
  CONSTRAINT `borrow_lab_id_b4300efd_fk_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_medicine_id_40ed6ee2_fk_medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_user_id_3339d8e1_fk_common_user_id` FOREIGN KEY (`user_id`) REFERENCES `common_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (1, 20, '2023-09-11 07:22:06.865489', 1, 1, 2);
INSERT INTO `borrow` VALUES (2, 100, '2023-09-12 12:49:34.653407', 2, 2, 3);
INSERT INTO `borrow` VALUES (3, 500, '2023-09-12 12:49:55.311197', 1, 3, 3);
INSERT INTO `borrow` VALUES (4, 666, '2023-09-12 12:54:58.641059', 2, 3, 2);

-- ----------------------------
-- Table structure for common_user
-- ----------------------------
DROP TABLE IF EXISTS `common_user`;
CREATE TABLE `common_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate` tinyint(1) NOT NULL,
  `faculty` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `common_user_user_id_a89b6bb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_user
-- ----------------------------
INSERT INTO `common_user` VALUES (2, '兵慌码乱666', 1, '软件工程学院', 3);
INSERT INTO `common_user` VALUES (3, '高启强', 1, '软件工程学院', 4);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2023-09-10 12:44:57.166388', '1', '烧杯', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (2, '2023-09-10 12:45:55.550690', '1', '盐酸', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (3, '2023-09-11 07:03:32.748708', '1', '一号化学实验室', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (4, '2023-09-11 11:54:35.964765', '1', '实验室简介', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (5, '2023-09-11 12:00:51.040187', '2', '实验室工作条例', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (6, '2023-09-11 12:01:08.256472', '3', '实验室工作规范', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (7, '2023-09-12 12:23:21.837289', '2', '二号化学实验室', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (8, '2023-09-12 12:27:17.950649', '2', '氯化钠溶液', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (9, '2023-09-12 12:27:55.829336', '3', '蒸馏水', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (10, '2023-09-12 12:33:21.564020', '2', '氯化钠溶液', 2, '[{\"changed\": {\"fields\": [\"nowtotal\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-09-12 12:35:10.167275', '2', '天平', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (12, '2023-09-12 12:35:46.275844', '3', '酒精灯', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (13, '2023-09-12 12:36:58.787016', '4', '项目说明', 1, '[{\"added\": {}}]', 8, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (13, 'Lab', 'borrow');
INSERT INTO `django_content_type` VALUES (7, 'Lab', 'commonuser');
INSERT INTO `django_content_type` VALUES (8, 'Lab', 'doc');
INSERT INTO `django_content_type` VALUES (12, 'Lab', 'insborrow');
INSERT INTO `django_content_type` VALUES (9, 'Lab', 'instrument');
INSERT INTO `django_content_type` VALUES (10, 'Lab', 'lab');
INSERT INTO `django_content_type` VALUES (11, 'Lab', 'medicine');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-09-08 15:05:09.033281');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-09-08 15:05:09.403080');
INSERT INTO `django_migrations` VALUES (3, 'Lab', '0001_initial', '2023-09-08 15:05:10.752904');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0001_initial', '2023-09-08 15:05:11.562214');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0002_logentry_remove_auto_add', '2023-09-08 15:05:11.769789');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-08 15:05:11.785316');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2023-09-08 15:05:11.950378');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2023-09-08 15:05:12.054932');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2023-09-08 15:05:12.170762');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2023-09-08 15:05:12.231230');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2023-09-08 15:05:12.371083');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2023-09-08 15:05:12.381086');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2023-09-08 15:05:12.400618');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2023-09-08 15:05:12.511402');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2023-09-08 15:05:12.935964');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2023-09-08 15:05:13.071522');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2023-09-08 15:05:13.089580');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2023-09-08 15:05:13.146673');
INSERT INTO `django_migrations` VALUES (19, 'Lab', '0002_auto_20230911_1543', '2023-09-11 07:43:13.346147');
INSERT INTO `django_migrations` VALUES (20, 'Lab', '0003_remove_insborrow_ins_tudata', '2023-09-11 07:44:02.614494');
INSERT INTO `django_migrations` VALUES (21, 'Lab', '0002_auto_20230911_1548', '2023-09-11 07:48:25.555862');
INSERT INTO `django_migrations` VALUES (22, 'Lab', '0003_insborrow_ins_tudata', '2023-09-11 07:48:43.193458');
INSERT INTO `django_migrations` VALUES (23, 'Lab', '0004_remove_doc_file_path', '2023-09-11 11:57:02.923741');
INSERT INTO `django_migrations` VALUES (24, 'Lab', '0005_auto_20230911_2033', '2023-09-11 12:33:34.321959');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('54oxlbp70532i6fd1rufj0nroo5dvupw', 'OWU5MGFkNzk3OTBkOTlkMDRmZTAyY2U2YTA3MDJhZjZmYzk1MjM5Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZjc0ZjBiMTFjYTM5YTg4YTlkZGQxNWQyMDg5YmYwZjY4MGVhZGRkIn0=', '2023-09-25 13:28:40.100870');
INSERT INTO `django_session` VALUES ('h74ezubssaa2yz2ery66ui7iuh0ouac1', 'NjIzZmY4ZDVlYjVlNWI4YmI3ODA2NjMxNDc4MDU4NzAwNTAzZGU0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZGFiNGYwYTU0YmIyYzgzZjUzZTdhYTI1NTk3ZGFjMGJiNDQzMmQ2IiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJMYWJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTRlZWFcXHU1NjY4XFx1NGZlMVxcdTYwNmZcXHU4ODY4XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vTGFiL2luc3RydW1lbnQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL0xhYi9pbnN0cnVtZW50L2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkxhYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NGVlYVxcdTU2NjhcXHU0ZmUxXFx1NjA2ZlxcdTg4NjhcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDJ9LCB7XCJuYW1lXCI6IFwiXFx1NTAxZlxcdTc1MjhcXHU0ZWVhXFx1NTY2OFxcdThiYjBcXHU1ZjU1XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vTGFiL2luc2JvcnJvdy9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vTGFiL2luc2JvcnJvdy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJMYWJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTUwMWZcXHU3NTI4XFx1NGVlYVxcdTU2NjhcXHU4YmIwXFx1NWY1NVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwM30sIHtcIm5hbWVcIjogXCJcXHU1MDFmXFx1NzUyOFxcdTgzNmZcXHU1NGMxXFx1OGJiMFxcdTVmNTVcXHU4ODY4XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vTGFiL2JvcnJvdy9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vTGFiL2JvcnJvdy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJMYWJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTUwMWZcXHU3NTI4XFx1ODM2ZlxcdTU0YzFcXHU4YmIwXFx1NWY1NVxcdTg4NjhcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDR9LCB7XCJuYW1lXCI6IFwiXFx1NWI5ZVxcdTlhOGNcXHU1YmE0XFx1NGZlMVxcdTYwNmZcXHU4ODY4XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vTGFiL2xhYi9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vTGFiL2xhYi9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJMYWJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTViOWVcXHU5YThjXFx1NWJhNFxcdTRmZTFcXHU2MDZmXFx1ODg2OFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwNX0sIHtcIm5hbWVcIjogXCJcXHU2NTg3XFx1NGVmNlxcdTRmZTFcXHU2MDZmXFx1ODg2OFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL0xhYi9kb2MvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL0xhYi9kb2MvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiTGFiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2NTg3XFx1NGVmNlxcdTRmZTFcXHU2MDZmXFx1ODg2OFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwNn0sIHtcIm5hbWVcIjogXCJcXHU4MzZmXFx1NTRjMVxcdTRmZTFcXHU2MDZmXFx1ODg2OFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL0xhYi9tZWRpY2luZS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vTGFiL21lZGljaW5lL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkxhYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1ODM2ZlxcdTU0YzFcXHU0ZmUxXFx1NjA2ZlxcdTg4NjhcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDd9XSwgXCJlaWRcIjogMTAwMX0sIHtcIm5hbWVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wiLCBcImljb25cIjogXCJmYXMgZmEtc2hpZWxkLWFsdFwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XCIsIFwiaWNvblwiOiBcImZhciBmYS11c2VyXCIsIFwidXJsXCI6IFwiL2FkbWluL2F1dGgvdXNlci9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vYXV0aC91c2VyL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCJ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcIiwgXCJpY29uXCI6IFwiZmFyIGZhLXVzZXJcIn1dLCBcImVpZFwiOiAxMDA5fSwge1wibmFtZVwiOiBcIlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCJ9LCB7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCJ9XSwgXCJlaWRcIjogMTAxMH1dLCBcImVpZFwiOiAxMDA4fSwge1wibmFtZVwiOiBcIlxcdTUzZWZcXHU4OWM2XFx1NTMxNlwiLCBcImljb25cIjogXCJmYSBmYS1maWxlXCIsIFwibW9kZWxzXCI6IFt7XCJuYW1lXCI6IFwiXFx1NjAzYlxcdTg5YzhcIiwgXCJ1cmxcIjogXCJjaGFydDFcIiwgXCJpY29uXCI6IFwiZmFyIGZhLXN1cnByaXNlXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJcXHU1M2VmXFx1ODljNlxcdTUzMTZcIiwgXCJpY29uXCI6IFwiZmEgZmEtZmlsZVwifSwge1wibmFtZVwiOiBcIlxcdTYwM2JcXHU4OWM4XCIsIFwiaWNvblwiOiBcImZhciBmYS1zdXJwcmlzZVwifV0sIFwiZWlkXCI6IDEwMTJ9LCB7XCJuYW1lXCI6IFwiXFx1OGZkMVxcdTRlMDBcXHU2NzA4XCIsIFwidXJsXCI6IFwiY2hhcnQyXCIsIFwiaWNvblwiOiBcImZhYiBmYS1naXRodWJcIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdTUzZWZcXHU4OWM2XFx1NTMxNlwiLCBcImljb25cIjogXCJmYSBmYS1maWxlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1OGZkMVxcdTRlMDBcXHU2NzA4XCIsIFwiaWNvblwiOiBcImZhYiBmYS1naXRodWJcIn1dLCBcImVpZFwiOiAxMDEzfSwge1wibmFtZVwiOiBcIlxcdTk4ODRcXHU4YjY2XFx1OTg3NVxcdTk3NjJcIiwgXCJ1cmxcIjogXCJwcmVkaWN0XCIsIFwiaWNvblwiOiBcImZhYiBmYS1naXRodWJcIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdTUzZWZcXHU4OWM2XFx1NTMxNlwiLCBcImljb25cIjogXCJmYSBmYS1maWxlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1OTg4NFxcdThiNjZcXHU5ODc1XFx1OTc2MlwiLCBcImljb25cIjogXCJmYWIgZmEtZ2l0aHViXCJ9XSwgXCJlaWRcIjogMTAxNH1dLCBcImVpZFwiOiAxMDExfV0iLCJzaW1wbGV1aV8yMDIzMDkwOCI6dHJ1ZX0=', '2023-09-22 15:21:32.612037');
INSERT INTO `django_session` VALUES ('mjd4u4a99agzubkczsf9lr7ck0bok4o1', 'MWNlMWQ3MTUyZmQ5M2QzZjE4ZmY0MjI2OTU0OTliNWRjMzM4OWU2YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZGFiNGYwYTU0YmIyYzgzZjUzZTdhYTI1NTk3ZGFjMGJiNDQzMmQ2IiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJMYWJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTRlZWFcXHU1NjY4XFx1NGZlMVxcdTYwNmZcXHU4ODY4XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vTGFiL2luc3RydW1lbnQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL0xhYi9pbnN0cnVtZW50L2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkxhYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NGVlYVxcdTU2NjhcXHU0ZmUxXFx1NjA2ZlxcdTg4NjhcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDJ9LCB7XCJuYW1lXCI6IFwiXFx1NTAxZlxcdTc1MjhcXHU0ZWVhXFx1NTY2OFxcdThiYjBcXHU1ZjU1XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vTGFiL2luc2JvcnJvdy9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vTGFiL2luc2JvcnJvdy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJMYWJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTUwMWZcXHU3NTI4XFx1NGVlYVxcdTU2NjhcXHU4YmIwXFx1NWY1NVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwM30sIHtcIm5hbWVcIjogXCJcXHU1MDFmXFx1NzUyOFxcdTgzNmZcXHU1NGMxXFx1OGJiMFxcdTVmNTVcXHU4ODY4XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vTGFiL2JvcnJvdy9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vTGFiL2JvcnJvdy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJMYWJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTUwMWZcXHU3NTI4XFx1ODM2ZlxcdTU0YzFcXHU4YmIwXFx1NWY1NVxcdTg4NjhcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDR9LCB7XCJuYW1lXCI6IFwiXFx1NWI5ZVxcdTlhOGNcXHU1YmE0XFx1NGZlMVxcdTYwNmZcXHU4ODY4XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vTGFiL2xhYi9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vTGFiL2xhYi9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJMYWJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTViOWVcXHU5YThjXFx1NWJhNFxcdTRmZTFcXHU2MDZmXFx1ODg2OFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwNX0sIHtcIm5hbWVcIjogXCJcXHU2NTg3XFx1NGVmNlxcdTRmZTFcXHU2MDZmXFx1ODg2OFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL0xhYi9kb2MvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL0xhYi9kb2MvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiTGFiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2NTg3XFx1NGVmNlxcdTRmZTFcXHU2MDZmXFx1ODg2OFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwNn0sIHtcIm5hbWVcIjogXCJcXHU4MzZmXFx1NTRjMVxcdTRmZTFcXHU2MDZmXFx1ODg2OFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL0xhYi9tZWRpY2luZS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vTGFiL21lZGljaW5lL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkxhYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1ODM2ZlxcdTU0YzFcXHU0ZmUxXFx1NjA2ZlxcdTg4NjhcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDd9XSwgXCJlaWRcIjogMTAwMX0sIHtcIm5hbWVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wiLCBcImljb25cIjogXCJmYXMgZmEtc2hpZWxkLWFsdFwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XCIsIFwiaWNvblwiOiBcImZhciBmYS11c2VyXCIsIFwidXJsXCI6IFwiL2FkbWluL2F1dGgvdXNlci9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vYXV0aC91c2VyL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCJ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcIiwgXCJpY29uXCI6IFwiZmFyIGZhLXVzZXJcIn1dLCBcImVpZFwiOiAxMDA5fSwge1wibmFtZVwiOiBcIlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCJ9LCB7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCJ9XSwgXCJlaWRcIjogMTAxMH1dLCBcImVpZFwiOiAxMDA4fSwge1wibmFtZVwiOiBcIlxcdTUzZWZcXHU4OWM2XFx1NTMxNlwiLCBcImljb25cIjogXCJmYXMgZmEtY29kZVwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTYwM2JcXHU4OWM4XCIsIFwidXJsXCI6IFwiY2hhcnQxXCIsIFwiaWNvblwiOiBcImZhIGZhLWJhcnNcIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdTUzZWZcXHU4OWM2XFx1NTMxNlwiLCBcImljb25cIjogXCJmYXMgZmEtY29kZVwifSwge1wibmFtZVwiOiBcIlxcdTYwM2JcXHU4OWM4XCIsIFwiaWNvblwiOiBcImZhIGZhLWJhcnNcIn1dLCBcImVpZFwiOiAxMDEyfSwge1wibmFtZVwiOiBcIlxcdThmZDFcXHU0ZTAwXFx1NjcwOFwiLCBcInVybFwiOiBcImNoYXJ0MlwiLCBcImljb25cIjogXCJmYSBmYS1ncmFkdWF0aW9uLWNhcFwiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiXFx1NTNlZlxcdTg5YzZcXHU1MzE2XCIsIFwiaWNvblwiOiBcImZhcyBmYS1jb2RlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1OGZkMVxcdTRlMDBcXHU2NzA4XCIsIFwiaWNvblwiOiBcImZhIGZhLWdyYWR1YXRpb24tY2FwXCJ9XSwgXCJlaWRcIjogMTAxM30sIHtcIm5hbWVcIjogXCJcXHU5ODg0XFx1OGI2NlxcdTk4NzVcXHU5NzYyXCIsIFwidXJsXCI6IFwicHJlZGljdFwiLCBcImljb25cIjogXCJmYSBmYS1leGNsYW1hdGlvbi1jaXJjbGVcIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdTUzZWZcXHU4OWM2XFx1NTMxNlwiLCBcImljb25cIjogXCJmYXMgZmEtY29kZVwifSwge1wibmFtZVwiOiBcIlxcdTk4ODRcXHU4YjY2XFx1OTg3NVxcdTk3NjJcIiwgXCJpY29uXCI6IFwiZmEgZmEtZXhjbGFtYXRpb24tY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxNH1dLCBcImVpZFwiOiAxMDExfV0iLCJzaW1wbGV1aV8yMDIzMDkxMiI6dHJ1ZX0=', '2023-09-26 12:57:13.318355');
INSERT INTO `django_session` VALUES ('tja1zj7h454y25gywmtito8pyogqyuaa', 'YjMxMWYzOGQxYWU5MTlmODkyOTEyZjFjZDc1OWE3NTU5OThhYjNkZDp7fQ==', '2023-09-24 14:03:19.981514');

-- ----------------------------
-- Table structure for doc
-- ----------------------------
DROP TABLE IF EXISTS `doc`;
CREATE TABLE `doc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_obj` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upload_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc
-- ----------------------------
INSERT INTO `doc` VALUES (1, '实验室简介', 'files/实验室简介.txt', '2023-09-11 11:54:35.961761');
INSERT INTO `doc` VALUES (2, '实验室工作条例', 'files/高校实验室工作条例.doc', '2023-09-11 12:00:51.038683');
INSERT INTO `doc` VALUES (3, '实验室工作规范', 'files/实验室工作规范.pdf', '2023-09-11 12:01:08.254969');
INSERT INTO `doc` VALUES (4, '项目说明', 'files/04项目说明.txt', '2023-09-12 12:36:58.784011');

-- ----------------------------
-- Table structure for ins_borrow
-- ----------------------------
DROP TABLE IF EXISTS `ins_borrow`;
CREATE TABLE `ins_borrow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_boNum` int(10) UNSIGNED NOT NULL,
  `ins_boDate` datetime NOT NULL,
  `ins_user_id` int(11) NOT NULL,
  `instrument_id` int(11) NOT NULL,
  `ins_tuData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ins_borrow_ins_user_id_a4cdb93b_fk_common_user_id`(`ins_user_id`) USING BTREE,
  INDEX `ins_borrow_instrument_id_680e4644_fk_instrument_id`(`instrument_id`) USING BTREE,
  CONSTRAINT `ins_borrow_ins_user_id_a4cdb93b_fk_common_user_id` FOREIGN KEY (`ins_user_id`) REFERENCES `common_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ins_borrow_instrument_id_680e4644_fk_instrument_id` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ins_borrow
-- ----------------------------
INSERT INTO `ins_borrow` VALUES (1, 0, '2023-09-11 07:22:17.796799', 2, 1, '2023-09-11 22:50:19');
INSERT INTO `ins_borrow` VALUES (2, 2, '2023-09-11 14:44:23.400648', 2, 1, '暂未归还');
INSERT INTO `ins_borrow` VALUES (3, 0, '2023-09-12 12:50:16.784859', 3, 1, '2023-09-12 20:52:09');
INSERT INTO `ins_borrow` VALUES (4, 2, '2023-09-12 12:50:20.706563', 3, 2, '暂未归还');
INSERT INTO `ins_borrow` VALUES (5, 3, '2023-09-12 12:50:30.808249', 3, 3, '暂未归还');

-- ----------------------------
-- Table structure for instrument
-- ----------------------------
DROP TABLE IF EXISTS `instrument`;
CREATE TABLE `instrument`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_no` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ins_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ins_detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ins_nowtotal` int(11) NOT NULL,
  `ins_bototal` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ins_no`(`ins_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of instrument
-- ----------------------------
INSERT INTO `instrument` VALUES (1, '1', '烧杯', '大烧杯', 8, 2);
INSERT INTO `instrument` VALUES (2, '2', '天平', '测量工具，用来称重', 8, 2);
INSERT INTO `instrument` VALUES (3, '3', '酒精灯', '杀毒灭菌使用，请注意使用安全', 2, 3);

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES (1, '一号化学实验室', '一号化学实验室，位于学校实验楼二楼');
INSERT INTO `lab` VALUES (2, '二号化学实验室', '二号化学实验室，位于学校实验楼三楼');

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nowtotal` int(11) NOT NULL,
  `usedtotal` int(11) NOT NULL,
  `riskfactor` int(11) NOT NULL,
  `user_risk` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES (1, '1', '盐酸', '盐酸', 80, 20, 9, 8);
INSERT INTO `medicine` VALUES (2, '2', '氯化钠溶液', '氯化钠溶液，生理盐水', 899, 100, 3, 6);
INSERT INTO `medicine` VALUES (3, '3', '蒸馏水', '蒸馏水做实验用的', 1834, 1166, 1, 2);

SET FOREIGN_KEY_CHECKS = 1;

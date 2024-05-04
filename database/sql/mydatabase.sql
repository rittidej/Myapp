-- Adminer 4.8.1 MySQL 8.0.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1,	'Can add log entry',	1,	'add_logentry'),
(2,	'Can change log entry',	1,	'change_logentry'),
(3,	'Can delete log entry',	1,	'delete_logentry'),
(4,	'Can view log entry',	1,	'view_logentry'),
(5,	'Can add permission',	2,	'add_permission'),
(6,	'Can change permission',	2,	'change_permission'),
(7,	'Can delete permission',	2,	'delete_permission'),
(8,	'Can view permission',	2,	'view_permission'),
(9,	'Can add group',	3,	'add_group'),
(10,	'Can change group',	3,	'change_group'),
(11,	'Can delete group',	3,	'delete_group'),
(12,	'Can view group',	3,	'view_group'),
(13,	'Can add user',	4,	'add_user'),
(14,	'Can change user',	4,	'change_user'),
(15,	'Can delete user',	4,	'delete_user'),
(16,	'Can view user',	4,	'view_user'),
(17,	'Can add content type',	5,	'add_contenttype'),
(18,	'Can change content type',	5,	'change_contenttype'),
(19,	'Can delete content type',	5,	'delete_contenttype'),
(20,	'Can view content type',	5,	'view_contenttype'),
(21,	'Can add session',	6,	'add_session'),
(22,	'Can change session',	6,	'change_session'),
(23,	'Can delete session',	6,	'delete_session'),
(24,	'Can view session',	6,	'view_session'),
(25,	'Can add position',	7,	'add_position'),
(26,	'Can change position',	7,	'change_position'),
(27,	'Can delete position',	7,	'delete_position'),
(28,	'Can view position',	7,	'view_position'),
(29,	'Can add positions',	8,	'add_positions'),
(30,	'Can change positions',	8,	'change_positions'),
(31,	'Can delete positions',	8,	'delete_positions'),
(32,	'Can view positions',	8,	'view_positions'),
(33,	'Can add employee',	9,	'add_employee'),
(34,	'Can change employee',	9,	'change_employee'),
(35,	'Can delete employee',	9,	'delete_employee'),
(36,	'Can view employee',	9,	'view_employee'),
(37,	'Can add hobby',	10,	'add_hobby'),
(38,	'Can change hobby',	10,	'change_hobby'),
(39,	'Can delete hobby',	10,	'delete_hobby'),
(40,	'Can view hobby',	10,	'view_hobby'),
(41,	'Can add employees',	11,	'add_employees'),
(42,	'Can change employees',	11,	'change_employees'),
(43,	'Can delete employees',	11,	'delete_employees'),
(44,	'Can view employees',	11,	'view_employees');

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1,	'pbkdf2_sha256$600000$OtuIymusvpO3JmxgksF5CL$9vDhG+5LRbsXfDFuFz7p986atcuncQRWHJ7czv/3mtQ=',	'2023-05-30 09:07:40.741747',	1,	'admin',	'',	'',	'',	1,	1,	'2023-04-28 11:33:30.000000'),
(16,	'pbkdf2_sha256$600000$qL2D983j1RfZd65WSig2vv$PE+oAxbEIa9kR4eh+IljNzYeoqtWLO8WLj+YSAPCUUw=',	'2023-05-12 08:17:40.000000',	0,	'root',	'',	'',	'',	1,	1,	'2023-05-02 16:42:56.000000'),
(17,	'pbkdf2_sha256$600000$92CxFy1bYzmXc6sCfLFijV$+XaXSxKG/BhR1W2Cnb8Nrwh97tLXrp6mIYsuwwWZFcs=',	'2023-05-18 16:22:34.952971',	1,	'superuser',	'',	'',	'',	1,	1,	'2023-05-18 16:12:11.656479');

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1,	'2023-05-18 16:12:43.799726',	'16',	'root',	2,	'[{\"changed\": {\"fields\": [\"Staff status\", \"Date joined\"]}}]',	4,	17);

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1,	'admin',	'logentry'),
(3,	'auth',	'group'),
(2,	'auth',	'permission'),
(4,	'auth',	'user'),
(5,	'contenttypes',	'contenttype'),
(9,	'employees',	'employee'),
(11,	'employees',	'employees'),
(10,	'employees',	'hobby'),
(7,	'positions',	'position'),
(8,	'positions',	'positions'),
(6,	'sessions',	'session');

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1,	'contenttypes',	'0001_initial',	'2023-05-18 07:35:16.672521'),
(2,	'auth',	'0001_initial',	'2023-05-18 07:35:17.366960'),
(3,	'admin',	'0001_initial',	'2023-05-18 07:35:17.532820'),
(4,	'admin',	'0002_logentry_remove_auto_add',	'2023-05-18 07:35:17.543150'),
(5,	'admin',	'0003_logentry_add_action_flag_choices',	'2023-05-18 07:35:17.553120'),
(6,	'contenttypes',	'0002_remove_content_type_name',	'2023-05-18 07:35:17.636237'),
(7,	'auth',	'0002_alter_permission_name_max_length',	'2023-05-18 07:35:17.711989'),
(8,	'auth',	'0003_alter_user_email_max_length',	'2023-05-18 07:35:17.741569'),
(9,	'auth',	'0004_alter_user_username_opts',	'2023-05-18 07:35:17.751907'),
(10,	'auth',	'0005_alter_user_last_login_null',	'2023-05-18 07:35:17.804044'),
(11,	'auth',	'0006_require_contenttypes_0002',	'2023-05-18 07:35:17.810047'),
(12,	'auth',	'0007_alter_validators_add_error_messages',	'2023-05-18 07:35:17.819473'),
(13,	'auth',	'0008_alter_user_username_max_length',	'2023-05-18 07:35:17.892485'),
(14,	'auth',	'0009_alter_user_last_name_max_length',	'2023-05-18 07:35:17.957199'),
(15,	'auth',	'0010_alter_group_name_max_length',	'2023-05-18 07:35:17.980940'),
(16,	'auth',	'0011_update_proxy_permissions',	'2023-05-18 07:35:17.992768'),
(17,	'auth',	'0012_alter_user_first_name_max_length',	'2023-05-18 07:35:18.068777'),
(19,	'sessions',	'0001_initial',	'2023-05-18 07:35:18.146811'),
(26,	'positions',	'0001_initial',	'2023-05-18 11:38:58.600066'),
(29,	'employees',	'0001_initial',	'2023-05-18 11:58:05.525813'),
(30,	'employees',	'0002_rename_position_employees_positions',	'2023-05-18 12:27:55.888693'),
(31,	'employees',	'0003_remove_employees_profile_image_and_more',	'2023-05-18 14:46:16.634905'),
(32,	'employees',	'0004_employees_avatar_image',	'2023-05-19 04:48:10.348791');

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('i2mm093mkmjp6v5yf8e6jyvomvoiw0ef',	'.eJxVjMsOwiAQRf-FtSEM5enSvd9AgBmkaiAp7cr479qkC93ec859sRC3tYZt0BJmZGcG7PS7pZgf1HaA99hunefe1mVOfFf4QQe_dqTn5XD_Dmoc9VtLmETRQskJEiXUBKI4kbSZEGyGDEUYsMYbTMKh8dk5Zb2WpKNVyhF7fwC_Izbh:1q3vKO:OKRTRsuUiiqHHuFGkEiYW8FJ18rVh5GhfNNmeqf1Rqw',	'2023-06-13 09:07:40.748059'),
('ivbmmbu7yhaop8drgi0n7loyxaw7xk00',	'.eJxVjMsOwiAQRf-FtSEM5enSvd9AgBmkaiAp7cr479qkC93ec859sRC3tYZt0BJmZGcG7PS7pZgf1HaA99hunefe1mVOfFf4QQe_dqTn5XD_Dmoc9VtLmETRQskJEiXUBKI4kbSZEGyGDEUYsMYbTMKh8dk5Zb2WpKNVyhF7fwC_Izbh:1q1fZA:6fMVKu_VmXSWuORf9O1Mtx-LYYmqQmLpAlsffTHaTX4',	'2023-06-07 03:53:36.750137'),
('qbdbzfdlac5ee14rst85np74wkoxlyta',	'.eJxVjMsOwiAQRf-FtSEM5enSvd9AgBmkaiAp7cr479qkC93ec859sRC3tYZt0BJmZGcG7PS7pZgf1HaA99hunefe1mVOfFf4QQe_dqTn5XD_Dmoc9VtLmETRQskJEiXUBKI4kbSZEGyGDEUYsMYbTMKh8dk5Zb2WpKNVyhF7fwC_Izbh:1pzsZl:hcULvMk4G9HU6b2kfWPq8mBviw1he1ZS2qLENidHS_Y',	'2023-06-02 05:22:49.642116');

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `sex` varchar(1) NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `date_of_birth` date NOT NULL,
  `is_resign` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `positions_id` bigint NOT NULL,
  `avatar_image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_positions_id_638f367e_fk_positions_id` (`positions_id`),
  CONSTRAINT `employees_positions_id_638f367e_fk_positions_id` FOREIGN KEY (`positions_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `employees` (`id`, `name`, `address`, `sex`, `salary`, `date_of_birth`, `is_resign`, `created`, `updated`, `positions_id`, `avatar_image`) VALUES
(2,	'K.Somchai',	'Bangkok 10700',	'm',	39000.00,	'2023-05-18',	0,	'2023-05-18 15:00:48.000000',	'2023-05-30 11:54:34.894889',	2,	'avatar_image/1_ihU6oNm.png'),
(3,	'MRS. SOMYING BUABUT',	'USA THAILAND',	'f',	80000.00,	'2013-01-31',	1,	'2023-05-18 15:11:05.934531',	'2023-05-30 11:44:43.447063',	5,	'avatar_image/2.png'),
(4,	'K.Ball',	'Ball World USA',	'm',	50000.00,	'2023-05-31',	0,	'2023-05-30 11:55:57.491397',	'2023-05-30 11:56:11.205308',	4,	'avatar_image/2_82tLiy5.jpg');

DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `positions` (`id`, `name`, `created`, `updated`) VALUES
(1,	'Devops',	'2023-05-18 11:39:13.691322',	'2023-05-18 11:39:13.691361'),
(2,	'Software Engineer',	'2023-05-18 11:39:40.562102',	'2023-05-18 11:39:40.562133'),
(3,	'Tester',	'2023-05-18 11:39:47.891906',	'2023-05-30 14:31:42.055838'),
(4,	'Software Operation',	'2023-05-18 11:39:59.021333',	'2023-05-18 11:39:59.021363'),
(5,	'IT Manager',	'2023-05-18 11:40:03.691589',	'2023-05-18 11:40:07.673010');

-- 2023-05-30 14:37:15

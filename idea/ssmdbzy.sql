/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : ssmdbzy

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 01/07/2022 14:55:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_root_curriculum
-- ----------------------------
DROP TABLE IF EXISTS `tb_root_curriculum`;
CREATE TABLE `tb_root_curriculum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `curriculum_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curriculum_teacher_id` varchar(50) NOT NULL,
  `curriculum_date` date NOT NULL,
  `curriculum_place` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curriculum_week` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curriculum_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curriculum_credit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`,`curriculum_teacher_id`),
  KEY `teacher_id` (`curriculum_teacher_id`),
  CONSTRAINT `teacher_id` FOREIGN KEY (`curriculum_teacher_id`) REFERENCES `tb_root_teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tb_root_curriculum
-- ----------------------------
BEGIN;
INSERT INTO `tb_root_curriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`) VALUES (5, 'C语言程序设计', '1001', '2021-12-03', '图信楼306', '18', '必修课', '4');
INSERT INTO `tb_root_curriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`) VALUES (6, 'Python爬虫', '1001', '2021-12-04', '崇理楼506', '18', '必修课', '4');
INSERT INTO `tb_root_curriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`) VALUES (7, 'Java数据结构', '1001', '2021-12-16', '崇理楼402', '18', '必修课', '4');
INSERT INTO `tb_root_curriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`) VALUES (8, '机器学习', '1002', '2021-12-21', '崇理楼504', '18', '必修课', '2');
INSERT INTO `tb_root_curriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`) VALUES (9, '计算机操作系统', '1004', '2021-12-15', '机电楼103', '18', '必修课', '3');
INSERT INTO `tb_root_curriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`) VALUES (24, 'PS视频剪辑', '1003', '2022-06-15', '机电楼102', '12', '选修课', '2');
COMMIT;

-- ----------------------------
-- Table structure for tb_root_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_root_student`;
CREATE TABLE `tb_root_student` (
  `student_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `student_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `student_gender` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `student_birth_year` date NOT NULL COMMENT '出生年份',
  `student_entrance` date NOT NULL COMMENT '入学时间',
  `student_college` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学院',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tb_root_student
-- ----------------------------
BEGIN;
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('213012020516', '测试1', '男', '1999-11-21', '2021-12-02', '数理与电子信息工程学院', '4297f44b13955235245b2497399d7a93', '809945573@qq.com', 1);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('213012020509', '测试2', '男', '2000-06-08', '2021-12-17', '数理与电子信息工程学院', '4297f44b13955235245b2497399d7a93', '', 2);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('213012020511', 'cc成', '女', '2022-06-03', '2022-06-03', '数理与电子信息工程学院', '4297f44b13955235245b2497399d7a93', '809945573@qq.com', 3);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('124', '124', '男', '2022-06-03', '2022-06-03', '124', '4297f44b13955235245b2497399d7a93', '', 4);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('12', '12', '男', '2022-06-03', '2022-06-03', '34', '4297f44b13955235245b2497399d7a93', '', 5);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('1', '1', '女', '2022-06-03', '2022-06-03', '133', '4297f44b13955235245b2497399d7a93', '', 6);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('asd', 'asd', '女', '2022-06-02', '2022-07-01', '哈哈1123', '4297f44b13955235245b2497399d7a93', '', 7);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('1', '2', '男', '2022-06-24', '2022-07-08', '3', '4297f44b13955235245b2497399d7a93', '', 8);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('123', '123', '男', '2022-06-03', '2022-07-01', '132', NULL, NULL, 9);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('2', '2', '男', '2022-06-04', '2022-07-07', '2', NULL, NULL, 10);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('1', '1', '男', '2022-06-02', '2022-06-09', '3', NULL, NULL, 11);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('123', '123', '男', '2022-06-04', '2022-07-07', '123', NULL, NULL, 12);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('1', '1', '男', '2022-06-03', '2022-06-16', '1', NULL, NULL, 13);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('1', '1', '2', '2022-06-03', '2022-06-30', '1', NULL, NULL, 14);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('123', '123', '123', '2022-06-14', '2022-06-29', '123123', NULL, NULL, 15);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('1231', '12312', '12312', '2022-06-01', '2022-06-30', '123213', NULL, NULL, 16);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('123', '123', '123', '2022-06-09', '2022-12-23', '123', NULL, NULL, 17);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('123', '123', '213', '2022-06-08', '2022-06-20', '124', NULL, NULL, 18);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('12', '23', '124', '2022-06-16', '2022-06-07', '3', NULL, NULL, 19);
INSERT INTO `tb_root_student` (`student_id`, `student_name`, `student_gender`, `student_birth_year`, `student_entrance`, `student_college`, `password`, `email`, `id`) VALUES ('为', '23 ', '123', '2022-06-16', '2022-06-27', '嘿嘿嘿', NULL, NULL, 20);
COMMIT;

-- ----------------------------
-- Table structure for tb_root_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_root_teacher`;
CREATE TABLE `tb_root_teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teacher_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teacher_gender` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teacher_birth_year` date NOT NULL,
  `teacher_education` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teacher_title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teacher_entrydate` date NOT NULL,
  `teacher_college` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tb_root_teacher
-- ----------------------------
BEGIN;
INSERT INTO `tb_root_teacher` (`id`, `teacher_id`, `teacher_name`, `teacher_gender`, `teacher_birth_year`, `teacher_education`, `teacher_title`, `teacher_entrydate`, `teacher_college`, `password`, `email`) VALUES (4, '1001', '张老师', '男', '1990-11-03', '硕士', '教授', '2015-11-03', '数理与电子信息工程学院', '4297f44b13955235245b2497399d7a93', '809945573@qq.com');
INSERT INTO `tb_root_teacher` (`id`, `teacher_id`, `teacher_name`, `teacher_gender`, `teacher_birth_year`, `teacher_education`, `teacher_title`, `teacher_entrydate`, `teacher_college`, `password`, `email`) VALUES (5, '1002', '黄老师', '男', '1998-10-16', '本科', '普通教师', '2003-10-15', '数理与电子信息工程学院', '4297f44b13955235245b2497399d7a93', '602352850@qq.com');
INSERT INTO `tb_root_teacher` (`id`, `teacher_id`, `teacher_name`, `teacher_gender`, `teacher_birth_year`, `teacher_education`, `teacher_title`, `teacher_entrydate`, `teacher_college`, `password`, `email`) VALUES (6, '1003', '李老师', '女', '1994-11-12', '硕士', '科研主任', '2000-06-23', '数理与电子信息工程学院', '4297f44b13955235245b2497399d7a93', '');
INSERT INTO `tb_root_teacher` (`id`, `teacher_id`, `teacher_name`, `teacher_gender`, `teacher_birth_year`, `teacher_education`, `teacher_title`, `teacher_entrydate`, `teacher_college`, `password`, `email`) VALUES (9, '1004', '陈老师', '男', '1999-11-21', '本科', '普通教师', '2022-06-04', '数理与电子信息工程学院', '4297f44b13955235245b2497399d7a93', '809945573@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for tb_root_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_root_user`;
CREATE TABLE `tb_root_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tb_root_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_root_user` (`id`, `username`, `password`, `role`) VALUES (1, 'root', '63a9f0ea7bb98050796b649e85481845', '管理员');
INSERT INTO `tb_root_user` (`id`, `username`, `password`, `role`) VALUES (2, 'test', '63a9f0ea7bb98050796b649e85481845', '测试');
INSERT INTO `tb_root_user` (`id`, `username`, `password`, `role`) VALUES (3, 'me', '63a9f0ea7bb98050796b649e85481845', '学生');
INSERT INTO `tb_root_user` (`id`, `username`, `password`, `role`) VALUES (4, 'th', '63a9f0ea7bb98050796b649e85481845', '教师');
COMMIT;

-- ----------------------------
-- Table structure for tb_student_selectedcurriculum
-- ----------------------------
DROP TABLE IF EXISTS `tb_student_selectedcurriculum`;
CREATE TABLE `tb_student_selectedcurriculum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `curriculum_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curriculum_teacher_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curriculum_date` date NOT NULL,
  `curriculum_place` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curriculum_week` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curriculum_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `curriculum_credit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `curriculum_success` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tb_student_selectedcurriculum
-- ----------------------------
BEGIN;
INSERT INTO `tb_student_selectedcurriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`, `student_id`, `curriculum_success`) VALUES (14, 'C语言程序设计', '1001', '2021-12-03', '图信楼306', '18', '必修课', '4', '213012020516', '67');
INSERT INTO `tb_student_selectedcurriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`, `student_id`, `curriculum_success`) VALUES (15, 'Python爬虫', '1001', '2021-12-04', '崇理楼506', '18', '必修课', '4', '213012020516', NULL);
INSERT INTO `tb_student_selectedcurriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`, `student_id`, `curriculum_success`) VALUES (18, '1', '1', '2021-12-06', '1', '1', '1', '1', '1', NULL);
INSERT INTO `tb_student_selectedcurriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`, `student_id`, `curriculum_success`) VALUES (20, 'Java数据结构', '1001', '2021-12-16', '崇理楼402', '18', '必修课', '4', '213012020516', NULL);
INSERT INTO `tb_student_selectedcurriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`, `student_id`, `curriculum_success`) VALUES (21, '计算机操作系统', '1003', '2021-12-15', '机电楼103', '18', '必修课', '3', '213012020516', NULL);
INSERT INTO `tb_student_selectedcurriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`, `student_id`, `curriculum_success`) VALUES (22, 'PS视频剪辑', '1003', '2022-06-15', '机电楼102', '12', '选修课', '2', NULL, NULL);
INSERT INTO `tb_student_selectedcurriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`, `student_id`, `curriculum_success`) VALUES (23, 'PS视频剪辑', '1003', '2022-06-15', '机电楼102', '12', '选修课', '2', NULL, NULL);
INSERT INTO `tb_student_selectedcurriculum` (`id`, `curriculum_name`, `curriculum_teacher_id`, `curriculum_date`, `curriculum_place`, `curriculum_week`, `curriculum_type`, `curriculum_credit`, `student_id`, `curriculum_success`) VALUES (24, 'PS视频剪辑', '1003', '2022-06-15', '机电楼102', '12', '选修课', '2', '213012020516', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mat_db
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `assignmentId` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `assignmentFile` mediumblob,
  `fileName` varchar(45) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`classId`),
  UNIQUE KEY `classId_UNIQUE` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class_has_course`
--

DROP TABLE IF EXISTS `class_has_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_has_course` (
  `class_classId` int(11) NOT NULL,
  `course_courseId` int(11) NOT NULL,
  `teacher_teacherId` int(11) DEFAULT NULL,
  `teacher_user_id` int(11) DEFAULT NULL,
  `semester_semesterId` int(11) NOT NULL,
  PRIMARY KEY (`class_classId`,`course_courseId`),
  KEY `fk_class_has_course_course1_idx` (`course_courseId`),
  KEY `fk_class_has_course_class1_idx` (`class_classId`),
  KEY `fk_class_has_course_teacher1_idx` (`teacher_teacherId`,`teacher_user_id`),
  KEY `fk_class_has_course_semester1_idx` (`semester_semesterId`),
  CONSTRAINT `fk_class_has_course_class1` FOREIGN KEY (`class_classId`) REFERENCES `class` (`classId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_course_course1` FOREIGN KEY (`course_courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_course_semester1` FOREIGN KEY (`semester_semesterId`) REFERENCES `semester` (`semesterId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_course_teacher1` FOREIGN KEY (`teacher_teacherId`, `teacher_user_id`) REFERENCES `teacher` (`teacherId`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class_has_course_has_assignment`
--

DROP TABLE IF EXISTS `class_has_course_has_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_has_course_has_assignment` (
  `class_has_course_class_classId` int(11) NOT NULL,
  `class_has_course_course_courseId` int(11) NOT NULL,
  `assignment_assignmentId` int(11) NOT NULL,
  `semester_semesterId` int(11) NOT NULL,
  PRIMARY KEY (`class_has_course_class_classId`,`class_has_course_course_courseId`,`assignment_assignmentId`),
  KEY `fk_class_has_course_has_assignment_assignment1_idx` (`assignment_assignmentId`),
  KEY `fk_class_has_course_has_assignment_class_has_course1_idx` (`class_has_course_class_classId`,`class_has_course_course_courseId`),
  KEY `fk_class_has_course_has_assignment_semester1_idx` (`semester_semesterId`),
  CONSTRAINT `fk_class_has_course_has_assignment_assignment1` FOREIGN KEY (`assignment_assignmentId`) REFERENCES `assignment` (`assignmentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_course_has_assignment_class_has_course1` FOREIGN KEY (`class_has_course_class_classId`, `class_has_course_course_courseId`) REFERENCES `class_has_course` (`class_classId`, `course_courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_course_has_assignment_semester1` FOREIGN KEY (`semester_semesterId`) REFERENCES `semester` (`semesterId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class_has_student`
--

DROP TABLE IF EXISTS `class_has_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_has_student` (
  `class_classId` int(11) NOT NULL,
  `student_idstudent` int(11) NOT NULL,
  `student_user_id` int(11) NOT NULL,
  `semester_semesterId` int(11) NOT NULL,
  PRIMARY KEY (`class_classId`,`student_idstudent`,`student_user_id`),
  KEY `fk_class_has_student_student1_idx` (`student_idstudent`,`student_user_id`),
  KEY `fk_class_has_student_class1_idx` (`class_classId`),
  KEY `fk_class_has_student_semester1_idx` (`semester_semesterId`),
  CONSTRAINT `fk_class_has_student_class1` FOREIGN KEY (`class_classId`) REFERENCES `class` (`classId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_student_semester1` FOREIGN KEY (`semester_semesterId`) REFERENCES `semester` (`semesterId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_student_student1` FOREIGN KEY (`student_idstudent`, `student_user_id`) REFERENCES `student` (`idstudent`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `teachingunit_teachingUnitId` int(11) NOT NULL,
  PRIMARY KEY (`courseId`,`teachingunit_teachingUnitId`),
  UNIQUE KEY `courseId_UNIQUE` (`courseId`),
  KEY `fk_course_teachingunit1_idx` (`teachingunit_teachingUnitId`),
  CONSTRAINT `fk_course_teachingunit1` FOREIGN KEY (`teachingunit_teachingUnitId`) REFERENCES `teachingunit` (`teachingUnitId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `finished_course_detailes`
--

DROP TABLE IF EXISTS `finished_course_detailes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finished_course_detailes` (
  `finished_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `isFinished` tinyint(4) DEFAULT '0',
  `grade` int(11) DEFAULT '0',
  `semester` int(11) DEFAULT '0',
  `isNew` int(11) DEFAULT '0',
  PRIMARY KEY (`finished_course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `parentId` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`parentId`,`user_id`),
  KEY `fk_parent_user1_idx` (`user_id`),
  CONSTRAINT `fk_parent_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parent_has_student`
--

DROP TABLE IF EXISTS `parent_has_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_has_student` (
  `parent_parentId` int(11) NOT NULL,
  `student_idstudent` int(11) NOT NULL,
  `student_user_id` int(11) NOT NULL,
  `isBlocked` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`parent_parentId`,`student_idstudent`,`student_user_id`),
  KEY `fk_parent_has_student_student1_idx` (`student_idstudent`,`student_user_id`),
  KEY `fk_parent_has_student_parent1_idx` (`parent_parentId`),
  CONSTRAINT `fk_parent_has_student_parent1` FOREIGN KEY (`parent_parentId`) REFERENCES `parent` (`parentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parent_has_student_student1` FOREIGN KEY (`student_idstudent`, `student_user_id`) REFERENCES `student` (`idstudent`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prev_requested_course`
--

DROP TABLE IF EXISTS `prev_requested_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prev_requested_course` (
  `course_courseId` int(11) NOT NULL,
  `course_teachingunit_teachingUnitId` int(11) NOT NULL,
  `course_courseId1` int(11) NOT NULL,
  `course_teachingunit_teachingUnitId1` int(11) NOT NULL,
  PRIMARY KEY (`course_courseId`,`course_courseId1`,`course_teachingunit_teachingUnitId`,`course_teachingunit_teachingUnitId1`),
  KEY `fk_course_has_course_course2_idx` (`course_courseId1`,`course_teachingunit_teachingUnitId1`),
  KEY `fk_course_has_course_course1_idx` (`course_courseId`,`course_teachingunit_teachingUnitId`),
  CONSTRAINT `fk_course_has_course_course1` FOREIGN KEY (`course_courseId`, `course_teachingunit_teachingUnitId`) REFERENCES `course` (`courseId`, `teachingunit_teachingUnitId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_has_course_course2` FOREIGN KEY (`course_courseId1`, `course_teachingunit_teachingUnitId1`) REFERENCES `course` (`courseId`, `teachingunit_teachingUnitId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `requestId` int(11) NOT NULL AUTO_INCREMENT,
  `requestType` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `isHandled` tinyint(4) DEFAULT '0',
  `isConfirmed` tinyint(4) DEFAULT '0',
  `semester_semesterId` int(11) NOT NULL,
  PRIMARY KEY (`requestId`),
  KEY `fk_request_semester1_idx` (`semester_semesterId`),
  CONSTRAINT `fk_request_semester1` FOREIGN KEY (`semester_semesterId`) REFERENCES `semester` (`semesterId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `semesterId` int(11) NOT NULL AUTO_INCREMENT,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `isCurrent` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`semesterId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `idstudent` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idstudent`,`user_id`),
  UNIQUE KEY `idstudent_UNIQUE` (`idstudent`),
  KEY `fk_student_user1_idx` (`user_id`),
  CONSTRAINT `fk_student_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_has_assignment`
--

DROP TABLE IF EXISTS `student_has_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_assignment` (
  `studentHasCourseId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `studentUserID` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `assignmentId` int(11) NOT NULL,
  `isHandled` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`studentHasCourseId`,`studentId`,`studentUserID`,`courseId`,`assignmentId`),
  KEY `fk_student_has_course_has_assignment_assignment1_idx` (`assignmentId`),
  KEY `fk_student_has_course_has_assignment_student_has_course1_idx` (`studentHasCourseId`,`studentId`,`studentUserID`,`courseId`),
  CONSTRAINT `fk_student_has_course_has_assignment_assignment1` FOREIGN KEY (`assignmentId`) REFERENCES `assignment` (`assignmentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_has_assignment_student_has_course1` FOREIGN KEY (`studentHasCourseId`, `studentId`, `studentUserID`, `courseId`) REFERENCES `student_has_course` (`student_has_courseId`, `student_idstudent`, `student_user_id`, `course_courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_has_course`
--

DROP TABLE IF EXISTS `student_has_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_course` (
  `student_has_courseId` int(11) NOT NULL AUTO_INCREMENT,
  `student_idstudent` int(11) NOT NULL,
  `student_user_id` int(11) NOT NULL,
  `course_courseId` int(11) NOT NULL,
  `finished_course_detailes_finished_course_id` int(11) NOT NULL,
  `semester_semesterId` int(11) NOT NULL,
  `class_classId` int(11) NOT NULL,
  PRIMARY KEY (`student_has_courseId`,`student_idstudent`,`student_user_id`,`course_courseId`),
  KEY `fk_student_has_course_course1_idx` (`course_courseId`),
  KEY `fk_student_has_course_student1_idx` (`student_idstudent`,`student_user_id`),
  KEY `fk_student_has_course_finished_course_detailes1_idx` (`finished_course_detailes_finished_course_id`),
  KEY `fk_student_has_course_semester1_idx` (`semester_semesterId`),
  KEY `fk_student_has_course_class1_idx` (`class_classId`),
  CONSTRAINT `fk_student_has_course_class1` FOREIGN KEY (`class_classId`) REFERENCES `class` (`classId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_course1` FOREIGN KEY (`course_courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_finished_course_detailes1` FOREIGN KEY (`finished_course_detailes_finished_course_id`) REFERENCES `finished_course_detailes` (`finished_course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_semester1` FOREIGN KEY (`semester_semesterId`) REFERENCES `semester` (`semesterId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_student1` FOREIGN KEY (`student_idstudent`, `student_user_id`) REFERENCES `student` (`idstudent`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_has_course_has_submission`
--

DROP TABLE IF EXISTS `student_has_course_has_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_course_has_submission` (
  `student_has_course_student_has_courseId` int(11) NOT NULL,
  `student_has_course_student_idstudent` int(11) NOT NULL,
  `student_has_course_student_user_id` int(11) NOT NULL,
  `student_has_course_course_courseId` int(11) NOT NULL,
  `submission_submissionId` int(11) NOT NULL,
  `semester_semesterId` int(11) NOT NULL,
  `isHandled` tinyint(4) DEFAULT '0',
  `grade` tinyint(4) DEFAULT '0',
  `isLate` tinyint(4) DEFAULT '0',
  `submission_responseId` int(11) DEFAULT NULL,
  `teacherComment` varchar(256) DEFAULT NULL,
  `assignmentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_has_course_student_has_courseId`,`student_has_course_student_idstudent`,`student_has_course_student_user_id`,`student_has_course_course_courseId`,`submission_submissionId`),
  KEY `fk_student_has_course_has_submission_submission1_idx` (`submission_submissionId`),
  KEY `fk_student_has_course_has_submission_student_has_course1_idx` (`student_has_course_student_has_courseId`,`student_has_course_student_idstudent`,`student_has_course_student_user_id`,`student_has_course_course_courseId`),
  KEY `fk_student_has_course_has_submission_semester1_idx` (`semester_semesterId`),
  KEY `fk_submission_responseId_submission1_idx` (`submission_responseId`),
  CONSTRAINT `fk_student_has_course_has_submission_semester1` FOREIGN KEY (`semester_semesterId`) REFERENCES `semester` (`semesterId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_has_submission_student_has_course1` FOREIGN KEY (`student_has_course_student_has_courseId`, `student_has_course_student_idstudent`, `student_has_course_student_user_id`, `student_has_course_course_courseId`) REFERENCES `student_has_course` (`student_has_courseId`, `student_idstudent`, `student_user_id`, `course_courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_has_submission_submission1` FOREIGN KEY (`submission_submissionId`) REFERENCES `submission` (`submissionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_submission_responseId_submission1` FOREIGN KEY (`submission_responseId`) REFERENCES `submission` (`submissionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission` (
  `submissionId` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `file` mediumblob,
  `fileName` varchar(45) DEFAULT NULL,
  `assignment_assignmentId` int(11) NOT NULL,
  PRIMARY KEY (`submissionId`),
  KEY `fk_submission_assignment1_idx` (`assignment_assignmentId`),
  CONSTRAINT `fk_submission_assignment1` FOREIGN KEY (`assignment_assignmentId`) REFERENCES `assignment` (`assignmentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `maxHours` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `teachingUnit_teachingUnitId` int(11) NOT NULL,
  PRIMARY KEY (`teacherId`,`user_id`),
  UNIQUE KEY `teacherId_UNIQUE` (`teacherId`),
  KEY `fk_teacher_user_idx` (`user_id`),
  KEY `fk_teacher_teachingUnit1_idx` (`teachingUnit_teachingUnitId`),
  CONSTRAINT `fk_teacher_teachingUnit1` FOREIGN KEY (`teachingUnit_teachingUnitId`) REFERENCES `teachingunit` (`teachingUnitId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teachingunit`
--

DROP TABLE IF EXISTS `teachingunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachingunit` (
  `teachingUnitId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`teachingUnitId`),
  UNIQUE KEY `teachingUnitId_UNIQUE` (`teachingUnitId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `isLocked` tinyint(4) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `isLogged` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-01 20:37:11

# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_medicare
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2023-05-09 16:55:44
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_medicare'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_medicare" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_medicare";


#
# Table structure for table 'tbn_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbn_admin" (
  "admin_id" int(11) NOT NULL auto_increment,
  "admin_name" varchar(100) default NULL,
  "admin_email" varchar(100) default NULL,
  "admin_password" varchar(100) default NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbn_admin'
#

LOCK TABLES "tbn_admin" WRITE;
/*!40000 ALTER TABLE "tbn_admin" DISABLE KEYS;*/
REPLACE INTO "tbn_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	(1,'Junsila','Junsila@adminmc.com','admin@mc');
/*!40000 ALTER TABLE "tbn_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbn_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbn_complaint" (
  "complaint_id" int(10) unsigned NOT NULL auto_increment,
  "complaint_date" date default NULL,
  "complaint_title" varchar(50) default NULL,
  "complaint_details" varchar(100) default NULL,
  "complaint_status" varchar(50) default '0',
  "complaint_reply" varchar(50) default '0',
  "user_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbn_complaint'
#

# No data found.



#
# Table structure for table 'tbn_diet'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbn_diet" (
  "diet_id" int(10) unsigned NOT NULL auto_increment,
  "sugar_min" int(10) unsigned default '0',
  "sugar_max" int(10) unsigned default '0',
  "pressure_min" int(10) unsigned default '0',
  "pressure_max" int(10) unsigned default '0',
  "thyroid_min" int(10) unsigned default '0',
  "thyroid_max" int(10) unsigned default '0',
  "pcod_min" int(10) unsigned default '0',
  "pcod_max" int(10) unsigned default '0',
  "diet_plan" varchar(100) default NULL,
  "cholesterol_min" int(10) unsigned default '0',
  "cholesterol_max" int(10) unsigned default '0',
  "exercise_plan" varchar(100) default NULL,
  PRIMARY KEY  ("diet_id"),
  KEY "pcod_min" ("pcod_min")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbn_diet'
#

LOCK TABLES "tbn_diet" WRITE;
/*!40000 ALTER TABLE "tbn_diet" DISABLE KEYS;*/
REPLACE INTO "tbn_diet" ("diet_id", "sugar_min", "sugar_max", "pressure_min", "pressure_max", "thyroid_min", "thyroid_max", "pcod_min", "pcod_max", "diet_plan", "cholesterol_min", "cholesterol_max", "exercise_plan") VALUES
	('3','100','200','100','200','100','200','100','200','Diet1691.pdf','100','200','exercise1640.mp4');
/*!40000 ALTER TABLE "tbn_diet" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbn_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbn_district" (
  "district_id" int(11) NOT NULL auto_increment,
  "district_name" varchar(50) default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbn_district'
#

LOCK TABLES "tbn_district" WRITE;
/*!40000 ALTER TABLE "tbn_district" DISABLE KEYS;*/
REPLACE INTO "tbn_district" ("district_id", "district_name") VALUES
	(2,'kannur');
REPLACE INTO "tbn_district" ("district_id", "district_name") VALUES
	(5,'Thrissur');
REPLACE INTO "tbn_district" ("district_id", "district_name") VALUES
	(6,'Ernakulam');
REPLACE INTO "tbn_district" ("district_id", "district_name") VALUES
	(7,'Kollam');
REPLACE INTO "tbn_district" ("district_id", "district_name") VALUES
	(8,'Wayanad');
/*!40000 ALTER TABLE "tbn_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbn_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbn_feedback" (
  "user_id" int(10) unsigned default NULL,
  "feedback_details" varchar(100) default NULL,
  "feedback_date" date default NULL
);



#
# Dumping data for table 'tbn_feedback'
#

# No data found.



#
# Table structure for table 'tbn_health'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbn_health" (
  "health_id" int(10) unsigned NOT NULL auto_increment,
  "user_id" int(10) unsigned default NULL,
  "sugar_level" varchar(50) default '0',
  "pressure_level" varchar(50) default '0',
  "cholestrol_level" varchar(50) default '0',
  "thyroid_level" varchar(50) default '0',
  "pcod_level" varchar(50) default '0',
  "result_date" date default NULL,
  PRIMARY KEY  ("health_id")
) AUTO_INCREMENT=25;



#
# Dumping data for table 'tbn_health'
#

LOCK TABLES "tbn_health" WRITE;
/*!40000 ALTER TABLE "tbn_health" DISABLE KEYS;*/
REPLACE INTO "tbn_health" ("health_id", "user_id", "sugar_level", "pressure_level", "cholestrol_level", "thyroid_level", "pcod_level", "result_date") VALUES
	('24','17','200','0','0','0','0','2023-05-02');
/*!40000 ALTER TABLE "tbn_health" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbn_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbn_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) default NULL,
  "place_pincode" varchar(50) default NULL,
  "district_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbn_place'
#

LOCK TABLES "tbn_place" WRITE;
/*!40000 ALTER TABLE "tbn_place" DISABLE KEYS;*/
REPLACE INTO "tbn_place" ("place_id", "place_name", "place_pincode", "district_id") VALUES
	('6','Peringottukara','680766',5);
/*!40000 ALTER TABLE "tbn_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbn_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbn_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) default NULL,
  "user_email" varchar(50) default NULL,
  "user_dob" date default NULL,
  "user_contact" varchar(50) default NULL,
  "user_gender" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "user_photo" varchar(50) default NULL,
  "user_address" varchar(100) NOT NULL,
  "user_password" varchar(50) default NULL,
  "user_status" varchar(50) default '0',
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=18;



#
# Dumping data for table 'tbn_user'
#

LOCK TABLES "tbn_user" WRITE;
/*!40000 ALTER TABLE "tbn_user" DISABLE KEYS;*/
REPLACE INTO "tbn_user" ("user_id", "user_name", "user_email", "user_dob", "user_contact", "user_gender", "place_id", "user_photo", "user_address", "user_password", "user_status") VALUES
	('17','Tanzeeh','tanzi@gmail.com','1996-02-14','8564329872','male','6','User1209.jpg','Tanzi manzil','tanzi','1');
/*!40000 ALTER TABLE "tbn_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/

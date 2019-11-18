--------------------------------------------------------
--  파일이 생성됨 - 월요일-11월-18-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AIRCRAFT
--------------------------------------------------------

  CREATE TABLE "AIRCRAFT" 
   (	"ID_TYPE" VARCHAR2(20)
   )
--------------------------------------------------------
--  DDL for Table AIRPORT
--------------------------------------------------------

  CREATE TABLE "AIRPORT" 
   (	"LOCATION" VARCHAR2(20)
   )
--------------------------------------------------------
--  DDL for Table AUTH_GROUP
--------------------------------------------------------

  CREATE TABLE "AUTH_GROUP" 
   (	"ID" NUMBER(11,0), 
	"NAME" NVARCHAR2(80)
   )
--------------------------------------------------------
--  DDL for Table AUTH_GROUP_PERMISSIONS
--------------------------------------------------------

  CREATE TABLE "AUTH_GROUP_PERMISSIONS" 
   (	"ID" NUMBER(11,0), 
	"GROUP_ID" NUMBER(11,0), 
	"PERMISSION_ID" NUMBER(11,0)
   )
--------------------------------------------------------
--  DDL for Table AUTH_PERMISSION
--------------------------------------------------------

  CREATE TABLE "AUTH_PERMISSION" 
   (	"ID" NUMBER(11,0), 
	"NAME" NVARCHAR2(255), 
	"CONTENT_TYPE_ID" NUMBER(11,0), 
	"CODENAME" NVARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table AUTH_USER
--------------------------------------------------------

  CREATE TABLE "AUTH_USER" 
   (	"ID" NUMBER(*,0), 
	"PASSWORD" NVARCHAR2(128), 
	"LAST_LOGIN" TIMESTAMP (6), 
	"IS_SUPERUSER" NUMBER(1,0), 
	"USERNAME" NVARCHAR2(45), 
	"FIRST_NAME" NVARCHAR2(30), 
	"LAST_NAME" NVARCHAR2(30), 
	"EMAIL" NVARCHAR2(254), 
	"IS_STAFF" NUMBER(1,0), 
	"IS_ACTIVE" NUMBER(1,0), 
	"DATE_JOINED" TIMESTAMP (6)
   )
--------------------------------------------------------
--  DDL for Table AUTH_USER_GROUPS
--------------------------------------------------------

  CREATE TABLE "AUTH_USER_GROUPS" 
   (	"ID" NUMBER(11,0), 
	"USER_ID" NUMBER(11,0), 
	"GROUP_ID" NUMBER(11,0)
   )
--------------------------------------------------------
--  DDL for Table AUTH_USER_USER_PERMISSIONS
--------------------------------------------------------

  CREATE TABLE "AUTH_USER_USER_PERMISSIONS" 
   (	"ID" NUMBER(11,0), 
	"USER_ID" NUMBER(11,0), 
	"PERMISSION_ID" NUMBER(11,0)
   )
--------------------------------------------------------
--  DDL for Table DJANGO_ADMIN_LOG
--------------------------------------------------------

  CREATE TABLE "DJANGO_ADMIN_LOG" 
   (	"ID" NUMBER(11,0), 
	"ACTION_TIME" TIMESTAMP (6), 
	"OBJECT_ID" NCLOB, 
	"OBJECT_REPR" NVARCHAR2(200), 
	"ACTION_FLAG" NUMBER(11,0), 
	"CHANGE_MESSAGE" NCLOB, 
	"CONTENT_TYPE_ID" NUMBER(11,0), 
	"USER_ID" NUMBER(11,0)
   )
--------------------------------------------------------
--  DDL for Table DJANGO_CONTENT_TYPE
--------------------------------------------------------

  CREATE TABLE "DJANGO_CONTENT_TYPE" 
   (	"ID" NUMBER(11,0), 
	"APP_LABEL" NVARCHAR2(100), 
	"MODEL" NVARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table DJANGO_MIGRATIONS
--------------------------------------------------------

  CREATE TABLE "DJANGO_MIGRATIONS" 
   (	"ID" NUMBER(11,0), 
	"APP" NVARCHAR2(255), 
	"NAME" NVARCHAR2(255), 
	"APPLIED" TIMESTAMP (6)
   )
--------------------------------------------------------
--  DDL for Table DJANGO_SESSION
--------------------------------------------------------

  CREATE TABLE "DJANGO_SESSION" 
   (	"SESSION_KEY" NVARCHAR2(40), 
	"SESSION_DATA" NCLOB, 
	"EXPIRE_DATE" TIMESTAMP (6)
   )
--------------------------------------------------------
--  DDL for Table FLIGHT_SCHEDULE
--------------------------------------------------------

  CREATE TABLE "FLIGHT_SCHEDULE" 
   (	"ID" NUMBER, 
	"ID_AIRCRAFT" VARCHAR2(20), 
	"DEPART_AIRPORT" VARCHAR2(20), 
	"ARRIVE_AIRPORT" VARCHAR2(20), 
	"DEPART_TIME" DATE, 
	"ARRIVE_TIME" DATE, 
	"ECONOMY_PRICE" NUMBER, 
	"BUSINESS_PRICE" NUMBER
   )
--------------------------------------------------------
--  DDL for Table ORDER
--------------------------------------------------------

  CREATE TABLE "ORDER" 
   (	"ID_SEAT" NUMBER(*,0), 
	"ID_USER" NUMBER, 
	"ID_FLIGHT_SCHEDULE" NUMBER(*,0), 
	"IS_ADULT" NUMBER(1,0)
   )
--------------------------------------------------------
--  DDL for Table SEAT
--------------------------------------------------------

  CREATE TABLE "SEAT" 
   (	"ID" NUMBER, 
	"ID_AIRCRAFT" VARCHAR2(20), 
	"SEAT_COL" CHAR(1), 
	"SEAT_NUM" NUMBER(2,0), 
	"SEAT_GRADE" NUMBER(1,0), 
	"RESERVATIED" CHAR(1)
   )
REM INSERTING into AIRCRAFT
SET DEFINE OFF;
Insert into AIRCRAFT (ID_TYPE) values ('CS_AIRCRAFT_1');
Insert into AIRCRAFT (ID_TYPE) values ('CS_AIRCRAFT_2');
Insert into AIRCRAFT (ID_TYPE) values ('CS_AIRCRAFT_3');
commit;
REM INSERTING into AIRPORT
SET DEFINE OFF;
Insert into AIRPORT (LOCATION) values ('광주');
Insert into AIRPORT (LOCATION) values ('군산');
Insert into AIRPORT (LOCATION) values ('김포');
Insert into AIRPORT (LOCATION) values ('대구');
Insert into AIRPORT (LOCATION) values ('무안');
Insert into AIRPORT (LOCATION) values ('부산(김해)');
Insert into AIRPORT (LOCATION) values ('사천');
Insert into AIRPORT (LOCATION) values ('양양');
Insert into AIRPORT (LOCATION) values ('여수');
Insert into AIRPORT (LOCATION) values ('울산');
Insert into AIRPORT (LOCATION) values ('원주');
Insert into AIRPORT (LOCATION) values ('인천');
Insert into AIRPORT (LOCATION) values ('제주');
Insert into AIRPORT (LOCATION) values ('청주');
Insert into AIRPORT (LOCATION) values ('포항');
commit;
REM INSERTING into AUTH_GROUP
SET DEFINE OFF;
REM INSERTING into AUTH_GROUP_PERMISSIONS
SET DEFINE OFF;
REM INSERTING into AUTH_PERMISSION
SET DEFINE OFF;
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (1,'Can add log entry',1,'add_logentry');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (2,'Can change log entry',1,'change_logentry');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (3,'Can delete log entry',1,'delete_logentry');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (4,'Can add permission',2,'add_permission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (5,'Can change permission',2,'change_permission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (6,'Can delete permission',2,'delete_permission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (7,'Can add group',3,'add_group');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (8,'Can change group',3,'change_group');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (9,'Can delete group',3,'delete_group');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (10,'Can add user',4,'add_user');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (11,'Can change user',4,'change_user');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (12,'Can delete user',4,'delete_user');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (13,'Can add content type',5,'add_contenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (14,'Can change content type',5,'change_contenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (15,'Can delete content type',5,'delete_contenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (16,'Can add session',6,'add_session');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (17,'Can change session',6,'change_session');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (18,'Can delete session',6,'delete_session');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (21,'Can add aircraft',21,'add_aircraft');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (22,'Can change aircraft',21,'change_aircraft');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (23,'Can delete aircraft',21,'delete_aircraft');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (24,'Can add auth group',22,'add_authgroup');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (25,'Can change auth group',22,'change_authgroup');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (26,'Can delete auth group',22,'delete_authgroup');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (27,'Can add auth group permissions',23,'add_authgrouppermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (28,'Can change auth group permissions',23,'change_authgrouppermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (29,'Can delete auth group permissions',23,'delete_authgrouppermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (30,'Can add auth permission',24,'add_authpermission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (31,'Can change auth permission',24,'change_authpermission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (32,'Can delete auth permission',24,'delete_authpermission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (33,'Can add auth user',25,'add_authuser');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (34,'Can change auth user',25,'change_authuser');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (35,'Can delete auth user',25,'delete_authuser');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (36,'Can add auth user groups',26,'add_authusergroups');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (37,'Can change auth user groups',26,'change_authusergroups');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (38,'Can delete auth user groups',26,'delete_authusergroups');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (39,'Can add auth user user permissions',27,'add_authuseruserpermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (40,'Can change auth user user permissions',27,'change_authuseruserpermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (41,'Can delete auth user user permissions',27,'delete_authuseruserpermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (42,'Can add django admin log',28,'add_djangoadminlog');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (43,'Can change django admin log',28,'change_djangoadminlog');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (44,'Can delete django admin log',28,'delete_djangoadminlog');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (45,'Can add django content type',29,'add_djangocontenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (46,'Can change django content type',29,'change_djangocontenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (47,'Can delete django content type',29,'delete_djangocontenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (48,'Can add django migrations',30,'add_djangomigrations');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (49,'Can change django migrations',30,'change_djangomigrations');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (50,'Can delete django migrations',30,'delete_djangomigrations');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (51,'Can add django session',31,'add_djangosession');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (52,'Can change django session',31,'change_djangosession');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (53,'Can delete django session',31,'delete_djangosession');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (54,'Can add order',32,'add_order');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (55,'Can change order',32,'change_order');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (56,'Can delete order',32,'delete_order');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (57,'Can add passenger',33,'add_passenger');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (58,'Can change passenger',33,'change_passenger');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (59,'Can delete passenger',33,'delete_passenger');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (60,'Can add seat',34,'add_seat');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (61,'Can change seat',34,'change_seat');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (62,'Can delete seat',34,'delete_seat');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (81,'Can add airport',41,'add_airport');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (82,'Can change airport',41,'change_airport');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (83,'Can delete airport',41,'delete_airport');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (84,'Can add flight schedule',42,'add_flightschedule');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (85,'Can change flight schedule',42,'change_flightschedule');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (86,'Can delete flight schedule',42,'delete_flightschedule');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (87,'Can add aircraft',43,'add_aircraft');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (88,'Can change aircraft',43,'change_aircraft');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (89,'Can delete aircraft',43,'delete_aircraft');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (90,'Can add airport',44,'add_airport');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (91,'Can change airport',44,'change_airport');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (92,'Can delete airport',44,'delete_airport');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (93,'Can add auth group',45,'add_authgroup');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (94,'Can change auth group',45,'change_authgroup');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (95,'Can delete auth group',45,'delete_authgroup');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (96,'Can add auth group permissions',46,'add_authgrouppermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (97,'Can change auth group permissions',46,'change_authgrouppermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (98,'Can delete auth group permissions',46,'delete_authgrouppermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (99,'Can add auth permission',47,'add_authpermission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (100,'Can change auth permission',47,'change_authpermission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (101,'Can delete auth permission',47,'delete_authpermission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (102,'Can add auth user',48,'add_authuser');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (103,'Can change auth user',48,'change_authuser');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (104,'Can delete auth user',48,'delete_authuser');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (105,'Can add auth user groups',49,'add_authusergroups');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (106,'Can change auth user groups',49,'change_authusergroups');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (107,'Can delete auth user groups',49,'delete_authusergroups');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (108,'Can add auth user user permissions',50,'add_authuseruserpermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (109,'Can change auth user user permissions',50,'change_authuseruserpermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (110,'Can delete auth user user permissions',50,'delete_authuseruserpermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (111,'Can add django admin log',51,'add_djangoadminlog');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (112,'Can change django admin log',51,'change_djangoadminlog');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (113,'Can delete django admin log',51,'delete_djangoadminlog');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (114,'Can add django content type',52,'add_djangocontenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (115,'Can change django content type',52,'change_djangocontenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (116,'Can delete django content type',52,'delete_djangocontenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (117,'Can add django migrations',53,'add_djangomigrations');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (118,'Can change django migrations',53,'change_djangomigrations');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (119,'Can delete django migrations',53,'delete_djangomigrations');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (120,'Can add django session',54,'add_djangosession');
commit;
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (121,'Can change django session',54,'change_djangosession');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (122,'Can delete django session',54,'delete_djangosession');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (123,'Can add flight schedule',55,'add_flightschedule');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (124,'Can change flight schedule',55,'change_flightschedule');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (125,'Can delete flight schedule',55,'delete_flightschedule');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (126,'Can add order',56,'add_order');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (127,'Can change order',56,'change_order');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (128,'Can delete order',56,'delete_order');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (129,'Can add seat',57,'add_seat');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (130,'Can change seat',57,'change_seat');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (131,'Can delete seat',57,'delete_seat');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (132,'Can add aircraft',58,'add_aircraft');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (133,'Can change aircraft',58,'change_aircraft');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (134,'Can delete aircraft',58,'delete_aircraft');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (135,'Can add airport',59,'add_airport');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (136,'Can change airport',59,'change_airport');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (137,'Can delete airport',59,'delete_airport');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (138,'Can add auth group',60,'add_authgroup');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (139,'Can change auth group',60,'change_authgroup');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (140,'Can delete auth group',60,'delete_authgroup');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (141,'Can add auth group permissions',61,'add_authgrouppermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (142,'Can change auth group permissions',61,'change_authgrouppermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (143,'Can delete auth group permissions',61,'delete_authgrouppermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (144,'Can add auth permission',62,'add_authpermission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (145,'Can change auth permission',62,'change_authpermission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (146,'Can delete auth permission',62,'delete_authpermission');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (147,'Can add auth user',63,'add_authuser');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (148,'Can change auth user',63,'change_authuser');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (149,'Can delete auth user',63,'delete_authuser');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (150,'Can add auth user groups',64,'add_authusergroups');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (151,'Can change auth user groups',64,'change_authusergroups');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (152,'Can delete auth user groups',64,'delete_authusergroups');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (153,'Can add auth user user permissions',65,'add_authuseruserpermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (154,'Can change auth user user permissions',65,'change_authuseruserpermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (155,'Can delete auth user user permissions',65,'delete_authuseruserpermissions');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (156,'Can add django admin log',66,'add_djangoadminlog');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (157,'Can change django admin log',66,'change_djangoadminlog');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (158,'Can delete django admin log',66,'delete_djangoadminlog');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (159,'Can add django content type',67,'add_djangocontenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (160,'Can change django content type',67,'change_djangocontenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (161,'Can delete django content type',67,'delete_djangocontenttype');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (162,'Can add django migrations',68,'add_djangomigrations');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (163,'Can change django migrations',68,'change_djangomigrations');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (164,'Can delete django migrations',68,'delete_djangomigrations');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (165,'Can add django session',69,'add_djangosession');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (166,'Can change django session',69,'change_djangosession');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (167,'Can delete django session',69,'delete_djangosession');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (168,'Can add flight schedule',70,'add_flightschedule');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (169,'Can change flight schedule',70,'change_flightschedule');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (170,'Can delete flight schedule',70,'delete_flightschedule');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (171,'Can add seat',71,'add_seat');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (172,'Can change seat',71,'change_seat');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (173,'Can delete seat',71,'delete_seat');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (174,'Can add order',72,'add_order');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (175,'Can change order',72,'change_order');
Insert into AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values (176,'Can delete order',72,'delete_order');
commit;
REM INSERTING into AUTH_USER
SET DEFINE OFF;
Insert into AUTH_USER (ID,PASSWORD,LAST_LOGIN,IS_SUPERUSER,USERNAME,FIRST_NAME,LAST_NAME,EMAIL,IS_STAFF,IS_ACTIVE,DATE_JOINED) values (1,'pbkdf2_sha256$36000$g2cY7cQcFf9t$5EXzOjT+RjI9C5YrI/Lpbn/uhadW8hR8TwFsygeQ4KI=',to_timestamp('19/11/12 15:54:08.501419000','RR/MM/DD HH24:MI:SSXFF'),1,'airseat',null,null,null,1,1,to_timestamp('19/11/06 12:09:55.412294000','RR/MM/DD HH24:MI:SSXFF'));
commit;
REM INSERTING into AUTH_USER_GROUPS
SET DEFINE OFF;
REM INSERTING into AUTH_USER_USER_PERMISSIONS
SET DEFINE OFF;
REM INSERTING into DJANGO_ADMIN_LOG
SET DEFINE OFF;
Insert into DJANGO_ADMIN_LOG (ID,ACTION_TIME,OBJECT_REPR,ACTION_FLAG,CONTENT_TYPE_ID,USER_ID) values (1,to_timestamp('19/11/10 06:56:25.753372000','RR/MM/DD HH24:MI:SSXFF'),'1 ee ',3,21,1);
Insert into DJANGO_ADMIN_LOG (ID,ACTION_TIME,OBJECT_REPR,ACTION_FLAG,CONTENT_TYPE_ID,USER_ID) values (2,to_timestamp('19/11/10 08:11:10.350462000','RR/MM/DD HH24:MI:SSXFF'),'Aircraft object',1,21,1);
Insert into DJANGO_ADMIN_LOG (ID,ACTION_TIME,OBJECT_REPR,ACTION_FLAG,CONTENT_TYPE_ID,USER_ID) values (3,to_timestamp('19/11/10 08:35:22.896409000','RR/MM/DD HH24:MI:SSXFF'),'Aircraft object',1,21,1);
Insert into DJANGO_ADMIN_LOG (ID,ACTION_TIME,OBJECT_REPR,ACTION_FLAG,CONTENT_TYPE_ID,USER_ID) values (4,to_timestamp('19/11/10 09:27:37.711746000','RR/MM/DD HH24:MI:SSXFF'),'Seat object',1,34,1);
Insert into DJANGO_ADMIN_LOG (ID,ACTION_TIME,OBJECT_REPR,ACTION_FLAG,CONTENT_TYPE_ID,USER_ID) values (5,to_timestamp('19/11/10 09:31:28.010929000','RR/MM/DD HH24:MI:SSXFF'),'Seat object',1,34,1);
Insert into DJANGO_ADMIN_LOG (ID,ACTION_TIME,OBJECT_REPR,ACTION_FLAG,CONTENT_TYPE_ID,USER_ID) values (6,to_timestamp('19/11/10 09:31:44.079700000','RR/MM/DD HH24:MI:SSXFF'),'Seat object',2,34,1);
Insert into DJANGO_ADMIN_LOG (ID,ACTION_TIME,OBJECT_REPR,ACTION_FLAG,CONTENT_TYPE_ID,USER_ID) values (7,to_timestamp('19/11/10 10:15:36.168702000','RR/MM/DD HH24:MI:SSXFF'),'Seat object',2,34,1);
Insert into DJANGO_ADMIN_LOG (ID,ACTION_TIME,OBJECT_REPR,ACTION_FLAG,CONTENT_TYPE_ID,USER_ID) values (8,to_timestamp('19/11/10 10:15:44.377435000','RR/MM/DD HH24:MI:SSXFF'),'Seat object',2,34,1);
commit;
REM INSERTING into DJANGO_CONTENT_TYPE
SET DEFINE OFF;
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (1,'admin','logentry');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (2,'auth','permission');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (3,'auth','group');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (4,'auth','user');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (5,'contenttypes','contenttype');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (6,'sessions','session');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (21,'AirSeatApp','aircraft');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (22,'AirSeatApp','authgroup');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (23,'AirSeatApp','authgrouppermissions');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (24,'AirSeatApp','authpermission');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (25,'AirSeatApp','authuser');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (26,'AirSeatApp','authusergroups');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (27,'AirSeatApp','authuseruserpermissions');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (28,'AirSeatApp','djangoadminlog');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (29,'AirSeatApp','djangocontenttype');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (30,'AirSeatApp','djangomigrations');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (31,'AirSeatApp','djangosession');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (32,'AirSeatApp','order');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (33,'AirSeatApp','passenger');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (34,'AirSeatApp','seat');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (41,'AirSeatApp','airport');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (42,'AirSeatApp','flightschedule');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (43,'AirSeatServer','aircraft');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (44,'AirSeatServer','airport');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (45,'AirSeatServer','authgroup');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (46,'AirSeatServer','authgrouppermissions');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (47,'AirSeatServer','authpermission');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (48,'AirSeatServer','authuser');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (49,'AirSeatServer','authusergroups');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (50,'AirSeatServer','authuseruserpermissions');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (51,'AirSeatServer','djangoadminlog');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (52,'AirSeatServer','djangocontenttype');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (53,'AirSeatServer','djangomigrations');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (54,'AirSeatServer','djangosession');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (55,'AirSeatServer','flightschedule');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (56,'AirSeatServer','order');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (57,'AirSeatServer','seat');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (58,'accounts','aircraft');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (59,'accounts','airport');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (60,'accounts','authgroup');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (61,'accounts','authgrouppermissions');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (62,'accounts','authpermission');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (63,'accounts','authuser');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (64,'accounts','authusergroups');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (65,'accounts','authuseruserpermissions');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (66,'accounts','djangoadminlog');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (67,'accounts','djangocontenttype');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (68,'accounts','djangomigrations');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (69,'accounts','djangosession');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (70,'accounts','flightschedule');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (71,'accounts','seat');
Insert into DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values (72,'accounts','order');
commit;
REM INSERTING into DJANGO_MIGRATIONS
SET DEFINE OFF;
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (2,'contenttypes','0001_initial',to_timestamp('19/11/06 12:03:06.902259000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (3,'auth','0001_initial',to_timestamp('19/11/06 12:03:07.395958000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (4,'admin','0001_initial',to_timestamp('19/11/06 12:03:07.572851000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (5,'admin','0002_logentry_remove_auto_add',to_timestamp('19/11/06 12:03:07.592839000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (6,'contenttypes','0002_remove_content_type_name',to_timestamp('19/11/06 12:03:08.184815000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (7,'auth','0002_alter_permission_name_max_length',to_timestamp('19/11/06 12:03:08.254772000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (8,'auth','0003_alter_user_email_max_length',to_timestamp('19/11/06 12:03:08.277758000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (9,'auth','0004_alter_user_username_opts',to_timestamp('19/11/06 12:03:08.300745000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (10,'auth','0005_alter_user_last_login_null',to_timestamp('19/11/06 12:03:08.326728000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (11,'auth','0006_require_contenttypes_0002',to_timestamp('19/11/06 12:03:08.338721000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (12,'auth','0007_alter_validators_add_error_messages',to_timestamp('19/11/06 12:03:08.356711000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (13,'auth','0008_alter_user_username_max_length',to_timestamp('19/11/06 12:03:08.378696000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (14,'sessions','0001_initial',to_timestamp('19/11/06 12:03:08.425668000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (21,'AirSeatApp','0001_initial',to_timestamp('19/11/09 07:52:03.805263000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (41,'AirSeatApp','0002_user',to_timestamp('19/11/11 16:48:18.740655000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (42,'AirSeatApp','0003_auto_20191118_2042',to_timestamp('19/11/18 11:42:58.564477000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_MIGRATIONS (ID,APP,NAME,APPLIED) values (43,'accounts','0001_initial',to_timestamp('19/11/18 11:42:58.780354000','RR/MM/DD HH24:MI:SSXFF'));
commit;
REM INSERTING into DJANGO_SESSION
SET DEFINE OFF;
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('8ophmfnrq7nbmi971505c05yyjb9owcr',to_timestamp('19/11/24 06:35:52.556038000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('0vyqwdetvqanh9hn6xoktcgtwmb6y4bf',to_timestamp('19/11/25 18:30:45.438237000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('a7rlv4knc92vsfgypw4iqhmyvw9c2f1g',to_timestamp('19/11/25 18:20:01.834490000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('0m1gbl46td7z8nbb4wfyk9axucz0mu4r',to_timestamp('19/11/26 10:22:08.587417000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('cqxfkx1tze6a48bsskg8uzbhdiucztaf',to_timestamp('19/11/26 09:16:47.415771000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('qdl9g68ybz5n9ih3aojzppusw569swqj',to_timestamp('19/11/25 18:34:58.515333000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('ldfc4rjgm58u3odzhrrlbvjr7yffkwcp',to_timestamp('19/11/26 15:29:49.510153000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('i80o0h8mxldqhxgf99udv1x941acjsz7',to_timestamp('19/11/26 15:34:12.311792000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('vhhla7hxfhynp05gmzhr9rfh88xyjslm',to_timestamp('19/11/26 16:58:37.319013000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('l926s235k5hcw4k4yk64c9vz47f3m4t9',to_timestamp('19/11/26 15:31:16.307199000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('adesdogtkf9povsyugnnp4vnixqtdltj',to_timestamp('19/11/27 16:52:11.304620000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('gp7rngxk6kktl67o0yz86atspgpvrh7d',to_timestamp('19/11/26 18:02:47.588518000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('nl1bheqcjxwlqe0n639khcsmx3xk3a1l',to_timestamp('19/11/30 20:37:04.678122000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('wn5gq238rm5p6uunjdgc5vjhntqhoa0x',to_timestamp('19/12/01 06:45:56.035512000','RR/MM/DD HH24:MI:SSXFF'));
Insert into DJANGO_SESSION (SESSION_KEY,EXPIRE_DATE) values ('8eyvca2wxjrxib8rd1iv6tid3g8mri4w',to_timestamp('19/12/02 11:54:02.467831000','RR/MM/DD HH24:MI:SSXFF'));
commit;
REM INSERTING into FLIGHT_SCHEDULE
SET DEFINE OFF;
Insert into FLIGHT_SCHEDULE (ID,ID_AIRCRAFT,DEPART_AIRPORT,ARRIVE_AIRPORT,DEPART_TIME,ARRIVE_TIME,ECONOMY_PRICE,BUSINESS_PRICE) values (1,'CS_AIRCRAFT_1','부산(김해)','김포',to_date('19/12/15','RR/MM/DD'),to_date('19/12/15','RR/MM/DD'),51600,157000);
Insert into FLIGHT_SCHEDULE (ID,ID_AIRCRAFT,DEPART_AIRPORT,ARRIVE_AIRPORT,DEPART_TIME,ARRIVE_TIME,ECONOMY_PRICE,BUSINESS_PRICE) values (2,'CS_AIRCRAFT_2','김포','부산(김해)',to_date('19/12/15','RR/MM/DD'),to_date('19/12/15','RR/MM/DD'),53200,159500);
Insert into FLIGHT_SCHEDULE (ID,ID_AIRCRAFT,DEPART_AIRPORT,ARRIVE_AIRPORT,DEPART_TIME,ARRIVE_TIME,ECONOMY_PRICE,BUSINESS_PRICE) values (3,'CS_AIRCRAFT_3','김포','부산(김해)',to_date('19/12/20','RR/MM/DD'),to_date('19/12/20','RR/MM/DD'),51200,153000);
commit;
REM INSERTING into "ORDER"
SET DEFINE OFF;
REM INSERTING into SEAT
SET DEFINE OFF;
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (3,'CS_AIRCRAFT_1','A',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (4,'CS_AIRCRAFT_1','B',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (5,'CS_AIRCRAFT_1','B',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (6,'CS_AIRCRAFT_1','B',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (7,'CS_AIRCRAFT_1','D',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (8,'CS_AIRCRAFT_1','D',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (9,'CS_AIRCRAFT_1','D',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (10,'CS_AIRCRAFT_1','E',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (11,'CS_AIRCRAFT_1','E',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (12,'CS_AIRCRAFT_1','E',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (13,'CS_AIRCRAFT_1','A',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (14,'CS_AIRCRAFT_1','A',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (15,'CS_AIRCRAFT_1','A',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (16,'CS_AIRCRAFT_1','A',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (17,'CS_AIRCRAFT_1','A',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (18,'CS_AIRCRAFT_1','A',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (19,'CS_AIRCRAFT_1','A',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (20,'CS_AIRCRAFT_1','A',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (21,'CS_AIRCRAFT_1','A',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (22,'CS_AIRCRAFT_1','A',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (23,'CS_AIRCRAFT_1','A',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (24,'CS_AIRCRAFT_1','A',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (25,'CS_AIRCRAFT_1','A',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (26,'CS_AIRCRAFT_1','A',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (27,'CS_AIRCRAFT_1','A',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (28,'CS_AIRCRAFT_1','A',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (29,'CS_AIRCRAFT_1','A',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (30,'CS_AIRCRAFT_1','A',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (31,'CS_AIRCRAFT_1','A',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (32,'CS_AIRCRAFT_1','A',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (33,'CS_AIRCRAFT_1','B',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (34,'CS_AIRCRAFT_1','B',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (35,'CS_AIRCRAFT_1','B',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (36,'CS_AIRCRAFT_1','B',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (37,'CS_AIRCRAFT_1','B',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (38,'CS_AIRCRAFT_1','B',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (39,'CS_AIRCRAFT_1','B',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (40,'CS_AIRCRAFT_1','B',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (41,'CS_AIRCRAFT_1','B',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (42,'CS_AIRCRAFT_1','B',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (43,'CS_AIRCRAFT_1','B',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (44,'CS_AIRCRAFT_1','B',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (45,'CS_AIRCRAFT_1','B',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (46,'CS_AIRCRAFT_1','B',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (47,'CS_AIRCRAFT_1','B',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (48,'CS_AIRCRAFT_1','B',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (49,'CS_AIRCRAFT_1','B',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (50,'CS_AIRCRAFT_1','B',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (51,'CS_AIRCRAFT_1','B',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (52,'CS_AIRCRAFT_1','B',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (53,'CS_AIRCRAFT_1','C',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (54,'CS_AIRCRAFT_1','C',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (55,'CS_AIRCRAFT_1','C',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (56,'CS_AIRCRAFT_1','C',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (57,'CS_AIRCRAFT_1','C',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (58,'CS_AIRCRAFT_1','C',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (59,'CS_AIRCRAFT_1','C',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (60,'CS_AIRCRAFT_1','C',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (61,'CS_AIRCRAFT_1','C',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (62,'CS_AIRCRAFT_1','C',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (63,'CS_AIRCRAFT_1','C',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (64,'CS_AIRCRAFT_1','C',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (65,'CS_AIRCRAFT_1','C',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (66,'CS_AIRCRAFT_1','C',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (67,'CS_AIRCRAFT_1','C',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (68,'CS_AIRCRAFT_1','C',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (69,'CS_AIRCRAFT_1','C',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (70,'CS_AIRCRAFT_1','C',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (71,'CS_AIRCRAFT_1','C',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (72,'CS_AIRCRAFT_1','C',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (73,'CS_AIRCRAFT_1','D',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (74,'CS_AIRCRAFT_1','D',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (75,'CS_AIRCRAFT_1','D',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (76,'CS_AIRCRAFT_1','D',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (77,'CS_AIRCRAFT_1','D',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (78,'CS_AIRCRAFT_1','D',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (79,'CS_AIRCRAFT_1','D',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (80,'CS_AIRCRAFT_1','D',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (81,'CS_AIRCRAFT_1','D',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (82,'CS_AIRCRAFT_1','D',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (83,'CS_AIRCRAFT_1','D',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (84,'CS_AIRCRAFT_1','D',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (85,'CS_AIRCRAFT_1','D',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (86,'CS_AIRCRAFT_1','D',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (87,'CS_AIRCRAFT_1','D',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (88,'CS_AIRCRAFT_1','D',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (89,'CS_AIRCRAFT_1','D',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (90,'CS_AIRCRAFT_1','D',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (91,'CS_AIRCRAFT_1','D',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (92,'CS_AIRCRAFT_1','D',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (93,'CS_AIRCRAFT_1','E',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (94,'CS_AIRCRAFT_1','E',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (95,'CS_AIRCRAFT_1','E',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (96,'CS_AIRCRAFT_1','E',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (97,'CS_AIRCRAFT_1','E',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (98,'CS_AIRCRAFT_1','E',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (99,'CS_AIRCRAFT_1','E',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (100,'CS_AIRCRAFT_1','E',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (101,'CS_AIRCRAFT_1','E',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (102,'CS_AIRCRAFT_1','E',10,0,'0');
commit;
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (103,'CS_AIRCRAFT_1','E',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (104,'CS_AIRCRAFT_1','E',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (105,'CS_AIRCRAFT_1','E',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (106,'CS_AIRCRAFT_1','E',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (107,'CS_AIRCRAFT_1','E',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (108,'CS_AIRCRAFT_1','E',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (109,'CS_AIRCRAFT_1','E',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (110,'CS_AIRCRAFT_1','E',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (111,'CS_AIRCRAFT_1','E',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (112,'CS_AIRCRAFT_1','E',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (113,'CS_AIRCRAFT_1','F',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (114,'CS_AIRCRAFT_1','F',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (115,'CS_AIRCRAFT_1','F',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (116,'CS_AIRCRAFT_1','F',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (117,'CS_AIRCRAFT_1','F',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (118,'CS_AIRCRAFT_1','F',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (119,'CS_AIRCRAFT_1','F',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (120,'CS_AIRCRAFT_1','F',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (121,'CS_AIRCRAFT_1','F',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (122,'CS_AIRCRAFT_1','F',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (123,'CS_AIRCRAFT_1','F',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (124,'CS_AIRCRAFT_1','F',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (125,'CS_AIRCRAFT_1','F',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (126,'CS_AIRCRAFT_1','F',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (127,'CS_AIRCRAFT_1','F',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (128,'CS_AIRCRAFT_1','F',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (129,'CS_AIRCRAFT_1','F',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (130,'CS_AIRCRAFT_1','F',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (131,'CS_AIRCRAFT_1','F',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (132,'CS_AIRCRAFT_1','F',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (133,'CS_AIRCRAFT_2','A',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (134,'CS_AIRCRAFT_2','A',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (135,'CS_AIRCRAFT_2','A',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (136,'CS_AIRCRAFT_2','B',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (137,'CS_AIRCRAFT_2','B',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (138,'CS_AIRCRAFT_2','B',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (139,'CS_AIRCRAFT_2','D',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (140,'CS_AIRCRAFT_2','D',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (141,'CS_AIRCRAFT_2','D',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (142,'CS_AIRCRAFT_2','E',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (143,'CS_AIRCRAFT_2','E',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (144,'CS_AIRCRAFT_2','E',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (145,'CS_AIRCRAFT_2','A',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (146,'CS_AIRCRAFT_2','A',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (147,'CS_AIRCRAFT_2','A',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (148,'CS_AIRCRAFT_2','A',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (149,'CS_AIRCRAFT_2','A',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (150,'CS_AIRCRAFT_2','A',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (151,'CS_AIRCRAFT_2','A',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (152,'CS_AIRCRAFT_2','A',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (153,'CS_AIRCRAFT_2','A',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (154,'CS_AIRCRAFT_2','A',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (155,'CS_AIRCRAFT_2','A',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (156,'CS_AIRCRAFT_2','A',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (157,'CS_AIRCRAFT_2','A',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (158,'CS_AIRCRAFT_2','A',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (159,'CS_AIRCRAFT_2','A',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (160,'CS_AIRCRAFT_2','A',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (161,'CS_AIRCRAFT_2','A',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (162,'CS_AIRCRAFT_2','A',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (163,'CS_AIRCRAFT_2','A',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (164,'CS_AIRCRAFT_2','A',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (165,'CS_AIRCRAFT_2','B',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (166,'CS_AIRCRAFT_2','B',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (167,'CS_AIRCRAFT_2','B',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (168,'CS_AIRCRAFT_2','B',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (169,'CS_AIRCRAFT_2','B',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (170,'CS_AIRCRAFT_2','B',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (171,'CS_AIRCRAFT_2','B',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (172,'CS_AIRCRAFT_2','B',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (173,'CS_AIRCRAFT_2','B',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (174,'CS_AIRCRAFT_2','B',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (175,'CS_AIRCRAFT_2','B',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (176,'CS_AIRCRAFT_2','B',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (177,'CS_AIRCRAFT_2','B',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (178,'CS_AIRCRAFT_2','B',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (179,'CS_AIRCRAFT_2','B',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (180,'CS_AIRCRAFT_2','B',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (181,'CS_AIRCRAFT_2','B',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (182,'CS_AIRCRAFT_2','B',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (183,'CS_AIRCRAFT_2','B',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (184,'CS_AIRCRAFT_2','B',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (185,'CS_AIRCRAFT_2','C',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (186,'CS_AIRCRAFT_2','C',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (187,'CS_AIRCRAFT_2','C',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (188,'CS_AIRCRAFT_2','C',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (189,'CS_AIRCRAFT_2','C',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (190,'CS_AIRCRAFT_2','C',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (191,'CS_AIRCRAFT_2','C',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (192,'CS_AIRCRAFT_2','C',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (193,'CS_AIRCRAFT_2','C',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (194,'CS_AIRCRAFT_2','C',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (195,'CS_AIRCRAFT_2','C',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (196,'CS_AIRCRAFT_2','C',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (197,'CS_AIRCRAFT_2','C',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (198,'CS_AIRCRAFT_2','C',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (199,'CS_AIRCRAFT_2','C',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (200,'CS_AIRCRAFT_2','C',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (201,'CS_AIRCRAFT_2','C',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (202,'CS_AIRCRAFT_2','C',18,0,'0');
commit;
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (203,'CS_AIRCRAFT_2','C',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (204,'CS_AIRCRAFT_2','C',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (205,'CS_AIRCRAFT_2','D',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (206,'CS_AIRCRAFT_2','D',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (1,'CS_AIRCRAFT_1','A',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (2,'CS_AIRCRAFT_1','A',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (207,'CS_AIRCRAFT_2','D',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (208,'CS_AIRCRAFT_2','D',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (209,'CS_AIRCRAFT_2','D',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (210,'CS_AIRCRAFT_2','D',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (211,'CS_AIRCRAFT_2','D',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (212,'CS_AIRCRAFT_2','D',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (213,'CS_AIRCRAFT_2','D',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (214,'CS_AIRCRAFT_2','D',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (215,'CS_AIRCRAFT_2','D',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (216,'CS_AIRCRAFT_2','D',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (217,'CS_AIRCRAFT_2','D',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (218,'CS_AIRCRAFT_2','D',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (219,'CS_AIRCRAFT_2','D',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (220,'CS_AIRCRAFT_2','D',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (221,'CS_AIRCRAFT_2','D',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (222,'CS_AIRCRAFT_2','D',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (223,'CS_AIRCRAFT_2','D',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (224,'CS_AIRCRAFT_2','D',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (225,'CS_AIRCRAFT_2','E',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (226,'CS_AIRCRAFT_2','E',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (227,'CS_AIRCRAFT_2','E',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (228,'CS_AIRCRAFT_2','E',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (229,'CS_AIRCRAFT_2','E',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (230,'CS_AIRCRAFT_2','E',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (231,'CS_AIRCRAFT_2','E',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (232,'CS_AIRCRAFT_2','E',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (233,'CS_AIRCRAFT_2','E',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (234,'CS_AIRCRAFT_2','E',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (235,'CS_AIRCRAFT_2','E',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (236,'CS_AIRCRAFT_2','E',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (237,'CS_AIRCRAFT_2','E',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (238,'CS_AIRCRAFT_2','E',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (239,'CS_AIRCRAFT_2','E',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (240,'CS_AIRCRAFT_2','E',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (241,'CS_AIRCRAFT_2','E',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (242,'CS_AIRCRAFT_2','E',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (243,'CS_AIRCRAFT_2','E',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (244,'CS_AIRCRAFT_2','E',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (245,'CS_AIRCRAFT_2','F',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (246,'CS_AIRCRAFT_2','F',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (247,'CS_AIRCRAFT_2','F',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (248,'CS_AIRCRAFT_2','F',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (249,'CS_AIRCRAFT_2','F',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (250,'CS_AIRCRAFT_2','F',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (251,'CS_AIRCRAFT_2','F',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (252,'CS_AIRCRAFT_2','F',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (253,'CS_AIRCRAFT_2','F',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (254,'CS_AIRCRAFT_2','F',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (255,'CS_AIRCRAFT_2','F',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (256,'CS_AIRCRAFT_2','F',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (257,'CS_AIRCRAFT_2','F',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (258,'CS_AIRCRAFT_2','F',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (259,'CS_AIRCRAFT_2','F',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (260,'CS_AIRCRAFT_2','F',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (261,'CS_AIRCRAFT_2','F',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (262,'CS_AIRCRAFT_2','F',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (263,'CS_AIRCRAFT_2','F',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (264,'CS_AIRCRAFT_2','F',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (265,'CS_AIRCRAFT_3','A',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (266,'CS_AIRCRAFT_3','A',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (267,'CS_AIRCRAFT_3','A',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (268,'CS_AIRCRAFT_3','B',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (269,'CS_AIRCRAFT_3','B',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (270,'CS_AIRCRAFT_3','B',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (271,'CS_AIRCRAFT_3','D',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (272,'CS_AIRCRAFT_3','D',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (273,'CS_AIRCRAFT_3','D',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (274,'CS_AIRCRAFT_3','E',1,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (275,'CS_AIRCRAFT_3','E',2,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (276,'CS_AIRCRAFT_3','E',3,1,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (277,'CS_AIRCRAFT_3','A',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (278,'CS_AIRCRAFT_3','A',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (279,'CS_AIRCRAFT_3','A',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (280,'CS_AIRCRAFT_3','A',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (281,'CS_AIRCRAFT_3','A',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (282,'CS_AIRCRAFT_3','A',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (283,'CS_AIRCRAFT_3','A',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (284,'CS_AIRCRAFT_3','A',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (285,'CS_AIRCRAFT_3','A',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (286,'CS_AIRCRAFT_3','A',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (287,'CS_AIRCRAFT_3','A',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (288,'CS_AIRCRAFT_3','A',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (289,'CS_AIRCRAFT_3','A',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (290,'CS_AIRCRAFT_3','A',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (291,'CS_AIRCRAFT_3','A',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (292,'CS_AIRCRAFT_3','A',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (293,'CS_AIRCRAFT_3','A',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (294,'CS_AIRCRAFT_3','A',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (295,'CS_AIRCRAFT_3','A',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (296,'CS_AIRCRAFT_3','A',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (297,'CS_AIRCRAFT_3','B',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (298,'CS_AIRCRAFT_3','B',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (299,'CS_AIRCRAFT_3','B',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (300,'CS_AIRCRAFT_3','B',4,0,'0');
commit;
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (301,'CS_AIRCRAFT_3','B',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (302,'CS_AIRCRAFT_3','B',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (303,'CS_AIRCRAFT_3','B',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (304,'CS_AIRCRAFT_3','B',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (305,'CS_AIRCRAFT_3','B',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (306,'CS_AIRCRAFT_3','B',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (307,'CS_AIRCRAFT_3','B',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (308,'CS_AIRCRAFT_3','B',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (309,'CS_AIRCRAFT_3','B',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (310,'CS_AIRCRAFT_3','B',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (311,'CS_AIRCRAFT_3','B',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (312,'CS_AIRCRAFT_3','B',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (313,'CS_AIRCRAFT_3','B',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (314,'CS_AIRCRAFT_3','B',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (315,'CS_AIRCRAFT_3','B',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (316,'CS_AIRCRAFT_3','B',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (317,'CS_AIRCRAFT_3','C',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (318,'CS_AIRCRAFT_3','C',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (319,'CS_AIRCRAFT_3','C',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (320,'CS_AIRCRAFT_3','C',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (321,'CS_AIRCRAFT_3','C',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (322,'CS_AIRCRAFT_3','C',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (323,'CS_AIRCRAFT_3','C',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (324,'CS_AIRCRAFT_3','C',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (325,'CS_AIRCRAFT_3','C',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (326,'CS_AIRCRAFT_3','C',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (327,'CS_AIRCRAFT_3','C',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (328,'CS_AIRCRAFT_3','C',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (329,'CS_AIRCRAFT_3','C',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (330,'CS_AIRCRAFT_3','C',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (331,'CS_AIRCRAFT_3','C',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (332,'CS_AIRCRAFT_3','C',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (333,'CS_AIRCRAFT_3','C',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (334,'CS_AIRCRAFT_3','C',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (335,'CS_AIRCRAFT_3','C',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (336,'CS_AIRCRAFT_3','C',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (337,'CS_AIRCRAFT_3','D',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (338,'CS_AIRCRAFT_3','D',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (339,'CS_AIRCRAFT_3','D',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (340,'CS_AIRCRAFT_3','D',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (341,'CS_AIRCRAFT_3','D',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (342,'CS_AIRCRAFT_3','D',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (343,'CS_AIRCRAFT_3','D',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (344,'CS_AIRCRAFT_3','D',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (345,'CS_AIRCRAFT_3','D',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (346,'CS_AIRCRAFT_3','D',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (347,'CS_AIRCRAFT_3','D',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (348,'CS_AIRCRAFT_3','D',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (349,'CS_AIRCRAFT_3','D',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (350,'CS_AIRCRAFT_3','D',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (351,'CS_AIRCRAFT_3','D',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (352,'CS_AIRCRAFT_3','D',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (353,'CS_AIRCRAFT_3','D',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (354,'CS_AIRCRAFT_3','D',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (355,'CS_AIRCRAFT_3','D',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (356,'CS_AIRCRAFT_3','D',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (357,'CS_AIRCRAFT_3','E',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (358,'CS_AIRCRAFT_3','E',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (359,'CS_AIRCRAFT_3','E',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (360,'CS_AIRCRAFT_3','E',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (361,'CS_AIRCRAFT_3','E',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (362,'CS_AIRCRAFT_3','E',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (363,'CS_AIRCRAFT_3','E',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (364,'CS_AIRCRAFT_3','E',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (365,'CS_AIRCRAFT_3','E',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (366,'CS_AIRCRAFT_3','E',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (367,'CS_AIRCRAFT_3','E',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (368,'CS_AIRCRAFT_3','E',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (369,'CS_AIRCRAFT_3','E',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (370,'CS_AIRCRAFT_3','E',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (371,'CS_AIRCRAFT_3','E',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (372,'CS_AIRCRAFT_3','E',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (373,'CS_AIRCRAFT_3','E',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (374,'CS_AIRCRAFT_3','E',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (375,'CS_AIRCRAFT_3','E',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (376,'CS_AIRCRAFT_3','E',20,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (377,'CS_AIRCRAFT_3','F',1,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (378,'CS_AIRCRAFT_3','F',2,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (379,'CS_AIRCRAFT_3','F',3,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (380,'CS_AIRCRAFT_3','F',4,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (381,'CS_AIRCRAFT_3','F',5,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (382,'CS_AIRCRAFT_3','F',6,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (383,'CS_AIRCRAFT_3','F',7,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (384,'CS_AIRCRAFT_3','F',8,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (385,'CS_AIRCRAFT_3','F',9,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (386,'CS_AIRCRAFT_3','F',10,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (387,'CS_AIRCRAFT_3','F',11,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (388,'CS_AIRCRAFT_3','F',12,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (389,'CS_AIRCRAFT_3','F',13,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (390,'CS_AIRCRAFT_3','F',14,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (391,'CS_AIRCRAFT_3','F',15,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (392,'CS_AIRCRAFT_3','F',16,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (393,'CS_AIRCRAFT_3','F',17,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (394,'CS_AIRCRAFT_3','F',18,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (395,'CS_AIRCRAFT_3','F',19,0,'0');
Insert into SEAT (ID,ID_AIRCRAFT,SEAT_COL,SEAT_NUM,SEAT_GRADE,RESERVATIED) values (396,'CS_AIRCRAFT_3','F',20,0,'0');
commit;
--------------------------------------------------------
--  DDL for Index AIRCRAFT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AIRCRAFT_PK" ON "AIRCRAFT" ("ID_TYPE")
--------------------------------------------------------
--  DDL for Index AIRPORT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AIRPORT_PK" ON "AIRPORT" ("LOCATION")
--------------------------------------------------------
--  DDL for Index SYS_C007074
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007074" ON "AUTH_GROUP" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007075
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007075" ON "AUTH_GROUP" ("NAME")
--------------------------------------------------------
--  DDL for Index SYS_C007079
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007079" ON "AUTH_GROUP_PERMISSIONS" ("ID")
--------------------------------------------------------
--  DDL for Index AUTH_GROU_GROUP_ID__0CD325B0_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTH_GROU_GROUP_ID__0CD325B0_U" ON "AUTH_GROUP_PERMISSIONS" ("GROUP_ID", "PERMISSION_ID")
--------------------------------------------------------
--  DDL for Index AUTH_GROUP_GROUP_ID_B120CBF9
--------------------------------------------------------

  CREATE INDEX "AUTH_GROUP_GROUP_ID_B120CBF9" ON "AUTH_GROUP_PERMISSIONS" ("GROUP_ID")
--------------------------------------------------------
--  DDL for Index AUTH_GROUP_PERMISSION_84C5C92E
--------------------------------------------------------

  CREATE INDEX "AUTH_GROUP_PERMISSION_84C5C92E" ON "AUTH_GROUP_PERMISSIONS" ("PERMISSION_ID")
--------------------------------------------------------
--  DDL for Index SYS_C007072
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007072" ON "AUTH_PERMISSION" ("ID")
--------------------------------------------------------
--  DDL for Index AUTH_PERM_CONTENT_T_01AB375A_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTH_PERM_CONTENT_T_01AB375A_U" ON "AUTH_PERMISSION" ("CONTENT_TYPE_ID", "CODENAME")
--------------------------------------------------------
--  DDL for Index AUTH_PERMI_CONTENT_TY_2F476E4B
--------------------------------------------------------

  CREATE INDEX "AUTH_PERMI_CONTENT_TY_2F476E4B" ON "AUTH_PERMISSION" ("CONTENT_TYPE_ID")
--------------------------------------------------------
--  DDL for Index AUTH_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTH_USER_PK" ON "AUTH_USER" ("ID")
--------------------------------------------------------
--  DDL for Index AUTH_USER_UK_USERNAME
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTH_USER_UK_USERNAME" ON "AUTH_USER" ("USERNAME")
--------------------------------------------------------
--  DDL for Index SYS_C007094
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007094" ON "AUTH_USER_GROUPS" ("ID")
--------------------------------------------------------
--  DDL for Index AUTH_USER_USER_ID_G_94350C0C_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTH_USER_USER_ID_G_94350C0C_U" ON "AUTH_USER_GROUPS" ("USER_ID", "GROUP_ID")
--------------------------------------------------------
--  DDL for Index AUTH_USER__USER_ID_6A12ED8B
--------------------------------------------------------

  CREATE INDEX "AUTH_USER__USER_ID_6A12ED8B" ON "AUTH_USER_GROUPS" ("USER_ID")
--------------------------------------------------------
--  DDL for Index AUTH_USER__GROUP_ID_97559544
--------------------------------------------------------

  CREATE INDEX "AUTH_USER__GROUP_ID_97559544" ON "AUTH_USER_GROUPS" ("GROUP_ID")
--------------------------------------------------------
--  DDL for Index SYS_C007098
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007098" ON "AUTH_USER_USER_PERMISSIONS" ("ID")
--------------------------------------------------------
--  DDL for Index AUTH_USER_USER_ID_P_14A6B632_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTH_USER_USER_ID_P_14A6B632_U" ON "AUTH_USER_USER_PERMISSIONS" ("USER_ID", "PERMISSION_ID")
--------------------------------------------------------
--  DDL for Index AUTH_USER__USER_ID_A95EAD1B
--------------------------------------------------------

  CREATE INDEX "AUTH_USER__USER_ID_A95EAD1B" ON "AUTH_USER_USER_PERMISSIONS" ("USER_ID")
--------------------------------------------------------
--  DDL for Index AUTH_USER__PERMISSION_1FBB5F2C
--------------------------------------------------------

  CREATE INDEX "AUTH_USER__PERMISSION_1FBB5F2C" ON "AUTH_USER_USER_PERMISSIONS" ("PERMISSION_ID")
--------------------------------------------------------
--  DDL for Index SYS_C007115
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007115" ON "DJANGO_ADMIN_LOG" ("ID")
--------------------------------------------------------
--  DDL for Index DJANGO_ADM_CONTENT_TY_C4BCE8EB
--------------------------------------------------------

  CREATE INDEX "DJANGO_ADM_CONTENT_TY_C4BCE8EB" ON "DJANGO_ADMIN_LOG" ("CONTENT_TYPE_ID")
--------------------------------------------------------
--  DDL for Index DJANGO_ADM_USER_ID_C564EBA6
--------------------------------------------------------

  CREATE INDEX "DJANGO_ADM_USER_ID_C564EBA6" ON "DJANGO_ADMIN_LOG" ("USER_ID")
--------------------------------------------------------
--  DDL for Index SYS_C007068
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007068" ON "DJANGO_CONTENT_TYPE" ("ID")
--------------------------------------------------------
--  DDL for Index DJANGO_CO_APP_LABEL_76BD3D3B_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "DJANGO_CO_APP_LABEL_76BD3D3B_U" ON "DJANGO_CONTENT_TYPE" ("APP_LABEL", "MODEL")
--------------------------------------------------------
--  DDL for Index SYS_C007066
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007066" ON "DJANGO_MIGRATIONS" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007120
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007120" ON "DJANGO_SESSION" ("SESSION_KEY")
--------------------------------------------------------
--  DDL for Index DJANGO_SES_EXPIRE_DAT_A5C62663
--------------------------------------------------------

  CREATE INDEX "DJANGO_SES_EXPIRE_DAT_A5C62663" ON "DJANGO_SESSION" ("EXPIRE_DATE")
--------------------------------------------------------
--  DDL for Index FLIGHT_SCHEDULE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FLIGHT_SCHEDULE_PK" ON "FLIGHT_SCHEDULE" ("ID")
--------------------------------------------------------
--  DDL for Index ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDER_PK" ON "ORDER" ("ID_SEAT")
--------------------------------------------------------
--  DDL for Index SEAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEAT_PK" ON "SEAT" ("ID")
--------------------------------------------------------
--  DDL for Trigger AUTH_GROUP_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "AUTH_GROUP_TR" 
BEFORE INSERT ON "AUTH_GROUP"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_GROUP_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

ALTER TRIGGER "AUTH_GROUP_TR" ENABLE
--------------------------------------------------------
--  DDL for Trigger AUTH_GROUP_PERMISSIONS_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "AUTH_GROUP_PERMISSIONS_TR" 
BEFORE INSERT ON "AUTH_GROUP_PERMISSIONS"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_GROUP_PERMISSIONS_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

ALTER TRIGGER "AUTH_GROUP_PERMISSIONS_TR" ENABLE
--------------------------------------------------------
--  DDL for Trigger AUTH_PERMISSION_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "AUTH_PERMISSION_TR" 
BEFORE INSERT ON "AUTH_PERMISSION"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_PERMISSION_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

ALTER TRIGGER "AUTH_PERMISSION_TR" ENABLE
--------------------------------------------------------
--  DDL for Trigger AUTH_USER_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "AUTH_USER_TR" 
BEFORE INSERT ON "AUTH_USER"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_USER_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

ALTER TRIGGER "AUTH_USER_TR" ENABLE
--------------------------------------------------------
--  DDL for Trigger AUTH_USER_GROUPS_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "AUTH_USER_GROUPS_TR" 
BEFORE INSERT ON "AUTH_USER_GROUPS"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_USER_GROUPS_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

ALTER TRIGGER "AUTH_USER_GROUPS_TR" ENABLE
--------------------------------------------------------
--  DDL for Trigger AUTH_USER_USER_PERMISSI17F3
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "AUTH_USER_USER_PERMISSI17F3" 
BEFORE INSERT ON "AUTH_USER_USER_PERMISSIONS"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_USER_USER_PERMISSI7B1E".nextval
        INTO :new."ID" FROM dual;
    END;

ALTER TRIGGER "AUTH_USER_USER_PERMISSI17F3" ENABLE
--------------------------------------------------------
--  DDL for Trigger DJANGO_ADMIN_LOG_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DJANGO_ADMIN_LOG_TR" 
BEFORE INSERT ON "DJANGO_ADMIN_LOG"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "DJANGO_ADMIN_LOG_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

ALTER TRIGGER "DJANGO_ADMIN_LOG_TR" ENABLE
--------------------------------------------------------
--  DDL for Trigger DJANGO_CONTENT_TYPE_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DJANGO_CONTENT_TYPE_TR" 
BEFORE INSERT ON "DJANGO_CONTENT_TYPE"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "DJANGO_CONTENT_TYPE_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

ALTER TRIGGER "DJANGO_CONTENT_TYPE_TR" ENABLE
--------------------------------------------------------
--  DDL for Trigger DJANGO_MIGRATIONS_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DJANGO_MIGRATIONS_TR" 
BEFORE INSERT ON "DJANGO_MIGRATIONS"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "DJANGO_MIGRATIONS_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

ALTER TRIGGER "DJANGO_MIGRATIONS_TR" ENABLE
--------------------------------------------------------
--  Constraints for Table AIRCRAFT
--------------------------------------------------------

  ALTER TABLE "AIRCRAFT" ADD CONSTRAINT "AIRCRAFT_PK" PRIMARY KEY ("ID_TYPE") ENABLE
  ALTER TABLE "AIRCRAFT" MODIFY ("ID_TYPE" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table AIRPORT
--------------------------------------------------------

  ALTER TABLE "AIRPORT" MODIFY ("LOCATION" NOT NULL ENABLE)
  ALTER TABLE "AIRPORT" ADD CONSTRAINT "AIRPORT_PK" PRIMARY KEY ("LOCATION") ENABLE
--------------------------------------------------------
--  Constraints for Table AUTH_GROUP
--------------------------------------------------------

  ALTER TABLE "AUTH_GROUP" ADD UNIQUE ("NAME") ENABLE
  ALTER TABLE "AUTH_GROUP" ADD PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "AUTH_GROUP" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table AUTH_GROUP_PERMISSIONS
--------------------------------------------------------

  ALTER TABLE "AUTH_GROUP_PERMISSIONS" ADD CONSTRAINT "AUTH_GROU_GROUP_ID__0CD325B0_U" UNIQUE ("GROUP_ID", "PERMISSION_ID") ENABLE
  ALTER TABLE "AUTH_GROUP_PERMISSIONS" ADD PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "AUTH_GROUP_PERMISSIONS" MODIFY ("PERMISSION_ID" NOT NULL ENABLE)
  ALTER TABLE "AUTH_GROUP_PERMISSIONS" MODIFY ("GROUP_ID" NOT NULL ENABLE)
  ALTER TABLE "AUTH_GROUP_PERMISSIONS" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table AUTH_PERMISSION
--------------------------------------------------------

  ALTER TABLE "AUTH_PERMISSION" ADD CONSTRAINT "AUTH_PERM_CONTENT_T_01AB375A_U" UNIQUE ("CONTENT_TYPE_ID", "CODENAME") ENABLE
  ALTER TABLE "AUTH_PERMISSION" ADD PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "AUTH_PERMISSION" MODIFY ("CONTENT_TYPE_ID" NOT NULL ENABLE)
  ALTER TABLE "AUTH_PERMISSION" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table AUTH_USER
--------------------------------------------------------

  ALTER TABLE "AUTH_USER" ADD CONSTRAINT "AUTH_USER_UK_USERNAME" UNIQUE ("USERNAME") ENABLE
  ALTER TABLE "AUTH_USER" ADD CONSTRAINT "AUTH_USER_PK" PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "AUTH_USER" ADD CHECK ("IS_ACTIVE" IN (0,1)) ENABLE
  ALTER TABLE "AUTH_USER" ADD CHECK ("IS_STAFF" IN (0,1)) ENABLE
  ALTER TABLE "AUTH_USER" ADD CHECK ("IS_SUPERUSER" IN (0,1)) ENABLE
  ALTER TABLE "AUTH_USER" MODIFY ("USERNAME" NOT NULL ENABLE)
  ALTER TABLE "AUTH_USER" MODIFY ("PASSWORD" NOT NULL ENABLE)
  ALTER TABLE "AUTH_USER" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table AUTH_USER_GROUPS
--------------------------------------------------------

  ALTER TABLE "AUTH_USER_GROUPS" ADD CONSTRAINT "AUTH_USER_USER_ID_G_94350C0C_U" UNIQUE ("USER_ID", "GROUP_ID") ENABLE
  ALTER TABLE "AUTH_USER_GROUPS" ADD PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "AUTH_USER_GROUPS" MODIFY ("GROUP_ID" NOT NULL ENABLE)
  ALTER TABLE "AUTH_USER_GROUPS" MODIFY ("USER_ID" NOT NULL ENABLE)
  ALTER TABLE "AUTH_USER_GROUPS" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table AUTH_USER_USER_PERMISSIONS
--------------------------------------------------------

  ALTER TABLE "AUTH_USER_USER_PERMISSIONS" ADD CONSTRAINT "AUTH_USER_USER_ID_P_14A6B632_U" UNIQUE ("USER_ID", "PERMISSION_ID") ENABLE
  ALTER TABLE "AUTH_USER_USER_PERMISSIONS" ADD PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "AUTH_USER_USER_PERMISSIONS" MODIFY ("PERMISSION_ID" NOT NULL ENABLE)
  ALTER TABLE "AUTH_USER_USER_PERMISSIONS" MODIFY ("USER_ID" NOT NULL ENABLE)
  ALTER TABLE "AUTH_USER_USER_PERMISSIONS" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table DJANGO_ADMIN_LOG
--------------------------------------------------------

  ALTER TABLE "DJANGO_ADMIN_LOG" ADD PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "DJANGO_ADMIN_LOG" ADD CHECK ("ACTION_FLAG" >= 0) ENABLE
  ALTER TABLE "DJANGO_ADMIN_LOG" MODIFY ("USER_ID" NOT NULL ENABLE)
  ALTER TABLE "DJANGO_ADMIN_LOG" MODIFY ("ACTION_FLAG" NOT NULL ENABLE)
  ALTER TABLE "DJANGO_ADMIN_LOG" MODIFY ("ACTION_TIME" NOT NULL ENABLE)
  ALTER TABLE "DJANGO_ADMIN_LOG" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table DJANGO_CONTENT_TYPE
--------------------------------------------------------

  ALTER TABLE "DJANGO_CONTENT_TYPE" ADD CONSTRAINT "DJANGO_CO_APP_LABEL_76BD3D3B_U" UNIQUE ("APP_LABEL", "MODEL") ENABLE
  ALTER TABLE "DJANGO_CONTENT_TYPE" ADD PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "DJANGO_CONTENT_TYPE" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table DJANGO_MIGRATIONS
--------------------------------------------------------

  ALTER TABLE "DJANGO_MIGRATIONS" ADD PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "DJANGO_MIGRATIONS" MODIFY ("APPLIED" NOT NULL ENABLE)
  ALTER TABLE "DJANGO_MIGRATIONS" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table DJANGO_SESSION
--------------------------------------------------------

  ALTER TABLE "DJANGO_SESSION" ADD PRIMARY KEY ("SESSION_KEY") ENABLE
  ALTER TABLE "DJANGO_SESSION" MODIFY ("EXPIRE_DATE" NOT NULL ENABLE)
  ALTER TABLE "DJANGO_SESSION" MODIFY ("SESSION_KEY" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table FLIGHT_SCHEDULE
--------------------------------------------------------

  ALTER TABLE "FLIGHT_SCHEDULE" MODIFY ("BUSINESS_PRICE" NOT NULL ENABLE)
  ALTER TABLE "FLIGHT_SCHEDULE" MODIFY ("ECONOMY_PRICE" NOT NULL ENABLE)
  ALTER TABLE "FLIGHT_SCHEDULE" MODIFY ("ARRIVE_TIME" NOT NULL ENABLE)
  ALTER TABLE "FLIGHT_SCHEDULE" MODIFY ("DEPART_TIME" NOT NULL ENABLE)
  ALTER TABLE "FLIGHT_SCHEDULE" MODIFY ("ARRIVE_AIRPORT" NOT NULL ENABLE)
  ALTER TABLE "FLIGHT_SCHEDULE" MODIFY ("DEPART_AIRPORT" NOT NULL ENABLE)
  ALTER TABLE "FLIGHT_SCHEDULE" ADD CONSTRAINT "FLIGHT_SCHEDULE_PK" PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "FLIGHT_SCHEDULE" MODIFY ("ID_AIRCRAFT" NOT NULL ENABLE)
  ALTER TABLE "FLIGHT_SCHEDULE" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ORDER
--------------------------------------------------------

  ALTER TABLE "ORDER" MODIFY ("IS_ADULT" NOT NULL ENABLE)
  ALTER TABLE "ORDER" MODIFY ("ID_FLIGHT_SCHEDULE" NOT NULL ENABLE)
  ALTER TABLE "ORDER" ADD CONSTRAINT "ORDER_PK" PRIMARY KEY ("ID_SEAT") ENABLE
  ALTER TABLE "ORDER" MODIFY ("ID_USER" NOT NULL ENABLE)
  ALTER TABLE "ORDER" MODIFY ("ID_SEAT" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table SEAT
--------------------------------------------------------

  ALTER TABLE "SEAT" MODIFY ("RESERVATIED" NOT NULL ENABLE)
  ALTER TABLE "SEAT" MODIFY ("SEAT_GRADE" NOT NULL ENABLE)
  ALTER TABLE "SEAT" MODIFY ("SEAT_COL" NOT NULL ENABLE)
  ALTER TABLE "SEAT" ADD CONSTRAINT "SEAT_PK" PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "SEAT" MODIFY ("SEAT_NUM" NOT NULL ENABLE)
  ALTER TABLE "SEAT" MODIFY ("ID_AIRCRAFT" NOT NULL ENABLE)
  ALTER TABLE "SEAT" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table AUTH_GROUP_PERMISSIONS
--------------------------------------------------------

  ALTER TABLE "AUTH_GROUP_PERMISSIONS" ADD CONSTRAINT "AUTH_GROU_GROUP_ID_B120CBF9_F" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "AUTH_GROUP" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE
  ALTER TABLE "AUTH_GROUP_PERMISSIONS" ADD CONSTRAINT "AUTH_GROU_PERMISSIO_84C5C92E_F" FOREIGN KEY ("PERMISSION_ID")
	  REFERENCES "AUTH_PERMISSION" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE
--------------------------------------------------------
--  Ref Constraints for Table AUTH_PERMISSION
--------------------------------------------------------

  ALTER TABLE "AUTH_PERMISSION" ADD CONSTRAINT "AUTH_PERM_CONTENT_T_2F476E4B_F" FOREIGN KEY ("CONTENT_TYPE_ID")
	  REFERENCES "DJANGO_CONTENT_TYPE" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE
--------------------------------------------------------
--  Ref Constraints for Table AUTH_USER_GROUPS
--------------------------------------------------------

  ALTER TABLE "AUTH_USER_GROUPS" ADD CONSTRAINT "AUTH_USER_GROUP_ID_97559544_F" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "AUTH_GROUP" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE
  ALTER TABLE "AUTH_USER_GROUPS" ADD CONSTRAINT "AUTH_USER_USER_ID_6A12ED8B_F" FOREIGN KEY ("USER_ID")
	  REFERENCES "AUTH_USER" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE
--------------------------------------------------------
--  Ref Constraints for Table AUTH_USER_USER_PERMISSIONS
--------------------------------------------------------

  ALTER TABLE "AUTH_USER_USER_PERMISSIONS" ADD CONSTRAINT "AUTH_USER_PERMISSIO_1FBB5F2C_F" FOREIGN KEY ("PERMISSION_ID")
	  REFERENCES "AUTH_PERMISSION" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE
  ALTER TABLE "AUTH_USER_USER_PERMISSIONS" ADD CONSTRAINT "AUTH_USER_USER_ID_A95EAD1B_F" FOREIGN KEY ("USER_ID")
	  REFERENCES "AUTH_USER" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE
--------------------------------------------------------
--  Ref Constraints for Table DJANGO_ADMIN_LOG
--------------------------------------------------------

  ALTER TABLE "DJANGO_ADMIN_LOG" ADD CONSTRAINT "DJANGO_AD_CONTENT_T_C4BCE8EB_F" FOREIGN KEY ("CONTENT_TYPE_ID")
	  REFERENCES "DJANGO_CONTENT_TYPE" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE
  ALTER TABLE "DJANGO_ADMIN_LOG" ADD CONSTRAINT "DJANGO_AD_USER_ID_C564EBA6_F" FOREIGN KEY ("USER_ID")
	  REFERENCES "AUTH_USER" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE
--------------------------------------------------------
--  Ref Constraints for Table FLIGHT_SCHEDULE
--------------------------------------------------------

  ALTER TABLE "FLIGHT_SCHEDULE" ADD CONSTRAINT "FLIGHT_SCHEDULE_FK_AIRCRAFT" FOREIGN KEY ("ID_AIRCRAFT")
	  REFERENCES "AIRCRAFT" ("ID_TYPE") ENABLE
  ALTER TABLE "FLIGHT_SCHEDULE" ADD CONSTRAINT "FLIGHT_SCHEDULE_FK_AIRPORT1" FOREIGN KEY ("DEPART_AIRPORT")
	  REFERENCES "AIRPORT" ("LOCATION") ENABLE
  ALTER TABLE "FLIGHT_SCHEDULE" ADD CONSTRAINT "FLIGHT_SCHEDULE_FK_AIRPORT2" FOREIGN KEY ("ARRIVE_AIRPORT")
	  REFERENCES "AIRPORT" ("LOCATION") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDER
--------------------------------------------------------

  ALTER TABLE "ORDER" ADD CONSTRAINT "ORDER_FK_FLIGHT_SCHEDULE" FOREIGN KEY ("ID_FLIGHT_SCHEDULE")
	  REFERENCES "FLIGHT_SCHEDULE" ("ID") ENABLE
  ALTER TABLE "ORDER" ADD CONSTRAINT "ORDER_FK_SEAT" FOREIGN KEY ("ID_SEAT")
	  REFERENCES "SEAT" ("ID") ENABLE
  ALTER TABLE "ORDER" ADD CONSTRAINT "ORDER_FK_USER" FOREIGN KEY ("ID_USER")
	  REFERENCES "AUTH_USER" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table SEAT
--------------------------------------------------------

  ALTER TABLE "SEAT" ADD CONSTRAINT "SEAT_FK_AIRCRAFT" FOREIGN KEY ("ID_AIRCRAFT")
	  REFERENCES "AIRCRAFT" ("ID_TYPE") ENABLE

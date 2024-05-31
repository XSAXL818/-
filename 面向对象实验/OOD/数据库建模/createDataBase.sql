CREATE DATABASE experiment_db;

USE experiment_db;

DROP DATABASE experiment;


DROP TABLE USER;

DROP TABLE laboratory;

DROP TABLE equipment;

DROP TABLE user_lab_book;

DROP TABLE user_equ_book;


CREATE TABLE `user`(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	user_account VARCHAR(25) NOT NULL UNIQUE,
	user_name VARCHAR(20) NOT NULL,
	user_password VARCHAR(18) NOT NULL,
	user_identity VARCHAR(10) NOT NULL,
	user_status VARCHAR(10) NOT NULL, 
	user_phone CHAR(11),
	user_score INT	
);


CREATE TABLE laboratory(
	lab_id INT PRIMARY KEY AUTO_INCREMENT,
	lab_name VARCHAR(20) NOT NULL,
	lab_location VARCHAR(20) NOT NULL,
	lab_status VARCHAR(10) NOT NULL,
	lab_charge INT,
	CONSTRAINT fk_lab_user FOREIGN KEY(lab_charge) REFERENCES `user`(user_id)
);

CREATE TABLE equipment(
	equ_id INT PRIMARY KEY AUTO_INCREMENT,
	lab_id INT,
	equ_name VARCHAR(25) NOT NULL,
	equ_ser VARCHAR(25) NOT NULL,
	equ_status VARCHAR(10) NOT NULL,
	equ_class VARCHAR(10) NOT NULL,
	equ_date DATE,
	equ_location VARCHAR(25) NOT NULL,
	equ_producer VARCHAR(25),
	equ_type VARCHAR(25),
	equ_charge INT REFERENCES `user`(user_id),
	CONSTRAINT fk_equ_user FOREIGN KEY(equ_charge) REFERENCES `user`(user_id),
	CONSTRAINT fk_equ_lab FOREIGN KEY(lab_id) REFERENCES laboratory(lab_id)
);


CREATE TABLE user_lab_book(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
	lab_id INT,
	user_id INT,
	start_time DATETIME,
	end_time DATETIME,
	CONSTRAINT fk_book_lab FOREIGN KEY(lab_id) REFERENCES laboratory(lab_id),
	CONSTRAINT fk_book_user FOREIGN KEY(user_id) REFERENCES `user`(user_id)
);

CREATE TABLE user_equ_book(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	equ_id INT,
	start_time DATETIME,
	end_time DATETIME,
	CONSTRAINT fk_book_user1 FOREIGN KEY(user_id) REFERENCES `user`(user_id),
	CONSTRAINT fk_book_equ FOREIGN KEY(equ_id) REFERENCES equipment(equ_id)
);



DELETE FROM USER;

SELECT * FROM USER;

#用户 插入部分数据
INSERT INTO `user`(user_account,user_name,user_password,user_identity,user_status,user_phone,user_score)
VALUES("202131603243","xsaxl","123456","管理员","sober","110","80"),
("202131603217","曹尚睿","123456","中级用户","normal","120","90"),
("202131603246","拜卜丹","123456","高级用户","normal","119","100"),
("202131603247","何欢欢","123456","普通用户","normal","122","80"),
("202131603245","郝奕辰","123456","负责人","loser","12315","80"),
("202131603201","负责人1号","123456","负责人","normal","151151","80"),
("202131603202","负责人2号","123456","负责人","normal","818818","80");


SELECT * FROM laboratory;

DELETE FROM laboratory;

#实验室
INSERT INTO laboratory(lab_name,lab_location,lab_status,lab_charge)
VALUES("药学公共科研平台","综合楼501室","开放",6),
("材料科学与工程实验教学中心","综合楼502室","开放",7),
("神经所平台","综合楼401室","维修",6),
("建筑智能建造实验室","综合楼301室","开放",7),
("体育学系实验室","综合楼201室","维修",6),
("光学成像检测工程研究所","综合楼101室","开放",5),
("微纳光子学研究所","综合楼402室","开放",5);



SELECT * FROM equipment;

#仪器
INSERT INTO equipment(equ_name,lab_id,equ_ser,equ_status,equ_class,equ_date,equ_location,equ_producer,equ_type,equ_charge)
VALUES("核磁共振仪",1,"0900683G","开放","未知",CURTIME(),"综合楼501","中国","定制",1),
("实时定量PCR仪",1,"17019133","开放","未知",CURTIME(),"综合楼501","中国","定制",2),
("蛋白纯化系统",1,"17019134","开放","未知",CURTIME(),"综合楼501","中国","定制",3),
("热态试验炉",1,"0000354Q","开放","未知","20001231","综合楼3楼仪器室321","中国","定制",4),
("超速冷冻离心机",NULL,"0000417B","开放","未知",CURTIME(),"紫金区C301","中国","定制",5),
("电化学分析系统",NULL,"0000568X","开放","未知","20001231","西溪区教学楼406","中国","CHI",6);

INSERT INTO equipment(equ_name,lab_id,equ_ser,equ_status,equ_class,equ_date,equ_location,equ_producer,equ_type,equ_charge)
VALUES("测试数据1",2,"0900683G","开放","未知",CURTIME(),"综合楼501","中国","定制",1),
("测试数据2",3,"17019133","开放","未知",CURTIME(),"综合楼501","中国","定制",2),
("测试数据3",3,"17019134","开放","未知",CURTIME(),"综合楼501","中国","定制",3),
("测试数据4",3,"0000354Q","开放","未知","20001231","综合楼3楼仪器室321","中国","定制",4),
("测试数据5",2,"0000417B","开放","未知",CURTIME(),"紫金区C301","中国","定制",5),
("测试数据6",2,"0000568X","开放","未知","20001231","西溪区教学楼406","中国","CHI",6);




UPDATE equipment
SET lab_id = 2
WHERE equ_id = 29

UPDATE laboratory
SET lab_status = "开放"
WHERE lab_status = "open";


SELECT lab_id,lab_name,lab_location,user_name,user_phone 
FROM laboratory,USER
WHERE lab_charge = user_id

DELETE FROM laboratory
WHERE lab_id > 6


SELECT equ_id,equ_name,equ_ser,equ_status,equ_class,equ_date,equ_location,equ_producer,equ_type FROM equipment

DELETE FROM user_lab_book;

INSERT INTO user_lab_book( user_id,lab_id,start_time,end_time )
VALUES( 1,1,"2023-06-27 8:24:12","2023-06-27 20:24:12" ),
( 1,2,"2023-06-27 15:24:12","2023-06-27 12:24:12" ),
( 1,4,"2023-06-27 13:24:12","2023-06-27 15:24:12" );

SELECT * FROM user_lab_book;



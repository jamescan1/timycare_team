
use spring;

-- drop table userinfo;
-- drop table warning;

SELECT * FROM userinfo;
SELECT * FROM warning;
update userinfo set emerg = '1' where timySerialNo = '1';
update userinfo set emerg = null where timySerialNo = '1';
--drop table userinfo 
create table userinfo
(
	timySerialNo 	VARCHAR(50) PRIMARY KEY,
    username 		VARCHAR(12) NOT NULL,
	yearofbirth 	VARCHAR(4)  NOT NULL,
	gender 			VARCHAR(2)  NOT NULL,
    addr			VARCHAR(50) NOT NULL,
	illness 		VARCHAR(50),
	mobile1 		VARCHAR(12),
	mobile2 		VARCHAR(12),
	emerg			VARCHAR(1)
);
--drop table warning
create table warning
(
	timySerialNo VARCHAR(50),
    warningDate	datetime DEFAULT NOW(),
	solYN char(1),
    primary key(timySerialNo, warningDate)
);

INSERT INTO userinfo VALUES ('1','이승기','1940','남','서울특별시','고혈압','01000000000','01000000000', NULL);
INSERT INTO userinfo VALUES ('2','싸이','1941','남','서울특별시','치매','01000000000','01000000000', NULL);
INSERT INTO userinfo VALUES ('3','박진영','1942','남','서울특별시','저혈압','01000000000','01000000000', NULL);
INSERT INTO userinfo VALUES ('4','이지현','1943','여','서울특별시','관절염','01000000000','01000000000', NULL);
INSERT INTO userinfo VALUES ('5','상남자','1944','남','서울특별시','당뇨','01000000000','01000000000', NULL);

INSERT INTO warning(timySerialNo, solYN) VALUES ('1','N');
INSERT INTO warning(timySerialNo, solYN) VALUES ('2','N');
INSERT INTO warning(timySerialNo, solYN) VALUES ('3','N');
INSERT INTO warning(timySerialNo, solYN) VALUES ('4','N');
INSERT INTO warning(timySerialNo, solYN) VALUES ('5','N');


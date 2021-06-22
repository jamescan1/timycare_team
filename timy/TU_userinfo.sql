/* ------------userinfo update trigger------------------------
CRE : 2021.06.18
MOD : 20201.06.19
DESC : 	userinfo TBL emrg = null update --> warning TBL solYN = 'Y'
		userinfo TBL emrg = '1' update --> warning TBL insert
-------------------------------------------------------------*/
use spring;
--DROP TRIGGER TU_userinfo;
DELIMITER //
CREATE TRIGGER TU_userinfo
AFTER UPDATE ON userinfo
FOR EACH ROW    
BEGIN
	IF NEW.emerg = '1' THEN 
		insert into warning(timySerialNo, solYN) values(NEW.timySerialNo, 'N');
 	ELSE
		UPDATE	warning
		SET		solYN = 'Y'
		WHERE	timySerialNo = NEW.timySerialNo
		AND		warningDate >= (SELECT Z.NINDATE FROM (select min(W.warningDate) AS NINDATE from warning AS W where W.timySerialNo = NEW.timySerialNo AND W.solYN = 'N') Z)
		AND 	solYN = 'N';
	END IF;
END;
//
DELIMITER ;
-- ------------------------------------
SHOW TRIGGERS;	-- 만들어진 트리거 조회
-- ------------------------------------
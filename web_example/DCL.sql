USE MYSQL;

SELECT *
FROM USER;
-- 사용자 아이디 및 비밀번호 생성
CREATE USER 'TEST'@LOCALHOST IDENTIFIED BY 'TEST';

SELECT *
FROM USER;

SET password FOR 'TEST'@LOCALHOST = '1234';

-- 권한 부여 및 제거
-- 권환 : CREATE, ALTER, DROP, INSERT, DELETE, UPDATE, SELECT 등
-- 특정 권한 부여
grant SELECT, DELETE ON Practice.회원테이블 TO 'TEST'@LOCALHOST;

-- 특정 권한 제거
REVOKE DELETE ON Practice.회원테이블 from 'TEST'@LOCALHOST;

-- 모든 권한 부여
GRANT ALL ON practice.회원테이블 to 'TEST'@LOCALHOST;

-- 모든 권한 제거
REVOKE ALL ON practice.회원테이블 FROM 'TEST'@LOCALHOST;

-- 사용자 삭제
DROP USER 'TEST'@LOCALHOST;

SELECT *
FROM USER;

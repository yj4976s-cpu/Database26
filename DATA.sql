CREATE DATABASE DATA DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
SHOW DATABASES; -- DB 리스트 
USE DATA;		-- LMS DB를 사용

-- 사용할 계정 생성 및 권한 부여
drop user 'yjs'@'192.168.0.%'; -- 이미 있거나 잘못 만들면 삭제
CREATE USER 'yjs'@'192.168.0.%' IDENTIFIED BY '2345';
-- 				ID	 접속권한 PC					PW

GRANT ALL PRIVILEGES ON DATA.* TO 'yjs'@'192.168.0.%';
-- 권한부여 모든권한	DB명.모든 테이블 ID @ 접속권한
FLUSH PRIVILEGES; -- 즉시 적용
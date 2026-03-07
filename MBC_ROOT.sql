-- 파일 첨부용 게시판을 사용하기 위해 DB를 새로 생성한다.

CREATE DATABASE mbc DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
SHOW DATABASES; -- DB 리스트 보여줘~~
USE mbc;		-- MBC DB를 사용할 께!!

-- 사용할 계정 생성 및 권한 부여
drop user 'kkk'@'192.168.0.%'; -- 이미 있거나 잘못 만들면 삭제
CREATE USER 'kkk'@'192.168.0.%' IDENTIFIED BY '1234';
-- 				ID	 접속권한 PC					PW

GRANT ALL PRIVILEGES ON mbc.* TO 'kkk'@'192.168.0.%';
-- 권한부여 모든권한	DB명.모든 테이블 ID @ 접속권한
FLUSH PRIVILEGES; -- 즉시 적용
-- 파일 게시판용 테이블 생성 및 fk 연결

-- 게시글용 테이블
CREATE TABLE posts (
 id INT AUTO_INCREMENT PRIMARY KEY,
 member_id INT NOT NULL,           -- 작성자 (members 테이블 외래키)
 title VARCHAR(200) NOT NULL,
 content TEXT NOT NULL,
 view_count INT DEFAULT 0,         -- 조회수 추가
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE
);    -- members(id)가 삭제되면 posts 테이블 자료도 삭제 : ON DELETE CASCADE

-- 첨부파일용 테이블
CREATE TABLE attachments ( 
 id INT AUTO_INCREMENT PRIMARY KEY,
 post_id INT NOT NULL,             -- 어떤 게시글의 파일인지
 origin_name VARCHAR(255) NOT NULL, -- 사용자가 올린 실제 파일명
 save_name VARCHAR(255) NOT NULL,   -- 서버에 저장된 고유 파일명 (중복방지)
 file_path VARCHAR(500) NOT NULL,   -- 저장된 경로
 file_size INT,                    -- 파일 용량(Byte)
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

select * from posts;
SELECT * FROM  ;
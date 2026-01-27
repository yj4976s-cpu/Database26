select @@hostname;

-- 이창은 메모장처럼 사용됨
-- 스크립트를 1줄씩 실행하는 것이 기본임 (ctrl + enter)
-- 만약 더미데이터를 20개 입력한다 (블럭설정 ctrl + shift + enter)

use sakila; -- sakila 데이터베이스에 가서 사용할께!!
select * from actor; -- actor 테이블에 모든 값을 가져와~

use world; -- world 데이터베이스에 가서 사용할께!!
select * from city; -- city 테이블에 모든 값을 가져와~

CREATE DATABASE DoItSQL; -- create 문으로 데이터베이스 생성

DROP DATABASE doitsql; -- drop 문으로 데이터베이스 색제
CREATE DATABASE doitsql; -- 데이터베이스 생성 후 선택
use doitsql;


--  create 문으로 테이블 생성
create table doit_create_table (
col_1 int,
col_2 varchar(50),
col_3 datetime
);

-- drop문으로 테이블 삭제
drop table doit_create_table;

-- insert 문으로 데이터 삽입
create table doit_dml (
col_1 int,
col_2 varchar(50),
col_3 datetime
);
insert into doit_dml (col_1, col_2, col_3) values(1,'doitsql','2023-01-01');

-- 테이블 조회하여 삽입한 데이터 확인
select * from doit_dml;

-- 데이터 유형불일치로 인한 오류발생 예
insert into doit_dml(col_1) values('문자입력');

-- 열 이름 생략하고 데이터 삽입
insert into doit_dml values(2, '열 이름 생략', '2023-01-02');

-- 삽입된 데이터 확인
select * from doit_dml;

-- 열 개수 불일치로 인한 오류 발생
insert into doit_dml values (3, 'col_3 값 생략');

-- 특정 열에만 데이터 삽입
INSERT INTO doit_dml(col_1,col_2) values(3, 'col_3 값 생략');
select * from doit_dml;

-- 삽입할 데이터의 순서 변경
INSERT INTO doit_dml(col_1, col_3, col_2) VALUES (4,'2023-01-03', '열순서 변경');
select * from doit_dml;

-- 여러 데이터 한 번에 삽입
INSERT INTO doit_dml(col_1, col_2, col_3) VALUES (5, '데이터 입력5', '2023-01-03'), (6, '데이터 입력6', '2023-01-03'), (7, '데이터 입력7', '2023-01-03');

-- NULL을 허용하지 않는 테이블 생성 후 NULL 삽입 시 오류가 발생한 예
CREATE TABLE doit_notnull (
col_1 INT,
col_2 VARCHAR(50) NOT NULL
);
INSERT INTO doit_notnull (col_1) VALUES (1);
DROP TABLE doit_notnull;

-- UPDATE 문으로 데이터 수정 1
UPDATE doit_dml SET col_2 = '데이터 수정'
WHERE col_1 = 4;

-- UPDATE 문으로 데이터 수정 2
UPDATE doit_dml SET col_2 = '데이터 수정'
WHERE col_1 = 4;
select * from doit_dml;

-- UPDATE 문으로 테이블 전체 데이터 수정
update doit_dml set col_1 = col_1 + 10;
select * from doit_dml;


set sql_safe_updates = 0;
set sql_safe_updates = 1;
set sql_safe_updates = 0;

/* MYSQL 공식 문서에 소개된 CREATE 문
CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
[create_option]...

create_option: [DEFAULT] {
	CHARACTER SET [=] charset_name
	| COLLATE [=] collation_name
	| ENCRYPTION [=] {'y' | 'n'}
} */

-- DELETE문으로 데이터 수정
delete from doit_dml where col_1 = 14;

-- DELETE 문으로 테이블 전체 데이터 삭제
delete from doit_dml;

-- TRUNCATE문으로 전체데이터 삭제(roleback이 되지않는다.)
truncate table doit_dml;
select * from doit_dml;

-- 1줄주석

 /*
 select1
 여러 줄 주석
 */

/* ! 실행가능한 주석코드 작성 */
-- select 1 /*! +1 */

-- /*!##### 실행가능한 주석코드 작성 */

/* MYSQL 공식 문서에 소개된 SELECT 문
select
	[ALL | DISTINCT | DISTINCTROW]
    [HIGH_PRIORITY]
    [STRAIGHT_JOIN]
    [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]
    [SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]
    select_expr [, select_expr] ...
    [into_option]
    [FROM table_references
		[PARTITION partition_list]]
	[WHERE where_condition]
    [GROUP BY {col_name | expr | position}, ... WITH ROLLUP]]
    [HAVIING where_condition]
    [WINDOW window_name AS (window_spec)
		[, window_name AS (window_spec)]...]
	[ORDER BY {col_name | expr | position}
      [ASC | DESC], ... [WITH ROLLUP]]
	[LIMIT {[offset,] row_count | row_count OFFSET offset}]
    [into_option]
    [FOR {UPDATE | SHARE}
		[OF tbl_name [, tbl_name]...]
        [NOWAIT | SKIP LOCKED]
	  | LOCK IN SHARE MODE]
	[into_option]
    
into_option; {
	INTO OUTFILE 'file_name'
	[CHRACTER SET charset_name]
	export_options
 | INTO DUMPFILE 'file_name'
 | INTO var_name [, var_name] ...
}*/
    
-- first_name 열을 조회
select first_name from customer;

-- 2개의 열을 조회
select first_name, last_name from customer;

-- 모든 열을 조회
select * from customer;

-- customer 테이블의 열 정보를 조회
show columns from sakila.customer;

-- WHERE 문, = 연산자로 특정 값 조회
select * from customer where first_name = 'maria';

-- address_id가 200인 행을 조회
select * from customer where address_id = 200;

-- address_id가 200 미만인 행을 조회
select * from customer where address_id < 200;

-- first_name이 MARIA인 행을 조회
select * from customer where first_name = 'maria';

-- first_name이 MARIA 미만인 행을 조회
select * from customer where first_name < 'maria';

-- payment_date가 2005-07-09 13:24:07인 행을 조회
select * from payment where payment_date = '2005-07-09 13:24:07';

-- payment_date가 2005년 7월 9일 미만인 행을 조회
select * from payment where payment_date < '2005-7-09';

-- 정해진 범위에 해당하는 데이터 조회
select * from customer where address_id between 5 and 10;

-- 2005년 6월 17일~2005년 7월 19일을 포함한 날짜 조회
select * from payment where payment_date between '2005-06-17' and '2005-07-19';

-- 정확한 날짜를 조회
select * from payment where payment_date='2005-07-08 07:33:56';

-- first_name 열에서 M~O 범위의 데이터 조회
select * from customer where first_name between 'm' and 'o';

-- first_name 열에서 M~O 범위의 값을 제외한 데이터 조회
select * from customer where first_name not between 'm' and 'o';

-- 두 조건을 만족하는 데이터 조회
select * from city where city = 'sunnyvale' and country_id = 103;

-- 두 개의 비교 연산식을 만족하는 데이터 조회
select * from payment where payment_date >= '2005-06-01' and payment_date <= '2005-07-05';

-- 한 조건을 만족한 경우 데이터 조회
select * from customer where first_name = 'maria' or first_name = 'linda';

-- OR를 두 개 이상 사용한 경우
select * from customer where first_name = 'maria' or first_name = 'linda' or first_name = 'nancy';

-- IN을 활용한 데이터 조회
select * from customer where first_name in ('maria', 'linda', 'nancy'); 

-- 요구 사항을 반영해 작성한 쿼리
select * from city where country_id = 103 or country_id = 86 and city in('cheju','sunnyvale', 'dallas');

-- 쿼리 순서를 변경
select * from city where country_id = 86 or country_id = 103 and city in('cheju','sunnyvale', 'dallas');

-- 소괄호로 우선순위를 다시 정해 데이터를 조회

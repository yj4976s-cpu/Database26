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
SELECT * FROM city
where (country_id = 103 OR country_id = 86)
	And city IN ('cheju', 'Sunnyvale', 'Dallas');
 
 -- IN, AND를 결합하여 조회
select * from city
where country_id in(103, 86)
	and city in ('cheju', 'Sunnyvale', 'Dallas');
    
-- Null이 있는 테이블 조회
select * from address;

-- = 연산자를 사용해 Null 데이터 조회
select * from address where address2 = Null;

-- address2 열에서 Null인 데이터 조회
select * from address where address2 is null;

-- address2 열에서 Null이 아닌 데이터 조회
select * from address where address2 is not null;

-- address2 열에서 ''인 데이터 조회
select * from address where address2 = '';

-- first_name 열을 기준으로 정렬
select * from customer order by first_name;

-- last_name 열을 기준으로 정렬
select * from customer order by last_name;

-- store_id, first_name 순으로 데이터 정렬
select * from customer order by store_id, first_name;

-- first_name, store_id 순으로 데이터 정렬
select * from customer order by first_name, store_id;

-- first_name을 오름차순으로 정렬
select * from customer order by first_name asc;

-- first_name을 내림차순으로 정렬
select * from customer order by first_name desc;

-- ASC와 DESC를 조합하여 데이터 정렬
select * from customer order by store_id desc, first_name asc;

-- LIMIT으로 상위 10개의 데이터 조회
select * from customer order by store_id desc, first_name asc limit 10;

-- LIMIT으로 101번째부터 10개의 데이터 조회
select * from customer order by customer_id asc limit 100, 10;

-- 데이터 100개를 건너뛰고 데이터 10개 조회
select * from customer order by customer_id asc limit 10 offset 100;

-- 첫 번째 글자가 A로 시작하는 데이터 조회
select * from customer where first_name like 'A%';

-- 첫 번째 글자가 AA로 시작하는 데이터 조회
select * from customer where first_name like 'AA%';

-- A로 끝나는 모든 데이터 조회
select * from customer where first_name like '%A';

-- RA로 끝나는 모든 데이터 조회
select * from customer where first_name like '%RA';

-- A를 포함한 모든 데이터 조회
select * from customer where first_name like '%a%';

-- 첫 번째 글자가 A로 시작하지 않는 데이터만 조회
select * from customer where first_name not like 'A%';

-- 특수문자를 포함한 임의의 테이블 생성
WITH CTE (col_1) AS(
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL # 공통테이블 표현식
SELECT 'ABC'
)

select * from cte; # CTE 테이블을 조회하여 데이터 확인

-- 특수문자 %를 포함한 데이터 조회
WITH CTE (col_1) AS(
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)

select * from cte where col_1 like '%';

-- ESCAPE로 특수문자 %를 포함한 데이터 조회
WITH CTE (col_1) AS(
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)

select * from cte where col_1 like '%#%%' escape '#';

-- ESCAPE와 !로 특수 문자 %를 포함한 데이터 조회
WITH CTE (col_1) AS(
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)

select * from cte where col_1 like '%!%%' escape '!';

-- A로 시작하면서 문자열 길이가 2인 데이터 조회
select * from customer where first_name like 'a_';

-- A로 시작하면서 문자열 길이가 3인 데이터 조회
select * from customer where first_name like 'a__';

-- A로 끝나면서 문자열 길이가 3인 데이터 조회
select * from customer where first_name like '__a';

-- A로 시작하고 A로 끝나면서 문자열 길이가 4인 데이터 조회
select * from customer where first_name like 'a__a';

-- 문자열 길이가 5인 데이터 조회
select * from customer where first_name like '_____';

-- A_R로 시작하는 문자열 조회
select * from customer where first_name like 'A_R%';

-- __R로 시작하는 문자열 조회
select * from customer where first_name like '__R%';

-- A로 시작하면서 R_로 끝나는 문자열 조회
select * from customer where first_name like 'A%R_';

-- ^,|,$를 사용해 데이터 조회
select * from customer where first_name regexp '^k|n$';

-- [^...]을 사용해 데이터 조회
select * from customer where first_name regexp 'k[l-n]';

-- [^...]를 사용해 데이터 조회
select * from customer where first_name regexp 'k[^l-n]';

-- %와 [..]을 사용해 데이터 조회
select * from customer where first_name like 'S%' and first_name regexp 'a[l-n]';

-- 와일드카드 조합으로 데이터 조회
select * from customer where first_name like '_______'
and first_name regexp 'a[l-n]'
and first_name regexp 'o$';

-- special_features 열의 데이터를 그룹화
select special_features from film group by special_features;

-- rating 열의 데이터를 그룹화
select rating from film group by rating;

-- special_features, rating 열 순서로 데이터를 그룹화
select special_features, rating from film group by special_features, rating;

-- rating, special_features 열 순서로 데이터를 그룹화
select rating, special_features from film group by rating, special_features;

-- count 함수로 그룹에 속한 데이터 개수 세기
select special_features, count(*) as cnt from film group by special_features;

-- 두 열의 데이터 그룹에 속한 데이터 개수 세기
select special_features, rating, count(*) as cnt from film
group by special_features, rating order by special_features, rating, cnt desc;
 
-- select문과 group by 절의 열 이름을 달리할 경우 오류발생
select special_feactures, rating, count(*) as cnt from film group by rating;

-- rating 열에서 G인 데이터만 필터링
select 
	special_features, rating
from film
group by special_features, rating
having rating = 'g';

-- special_features 열에서 데이터 개수가 70보다 큰 것만 필터링
select special_features, count(*) as cnt from film
group by special_features
having cnt > 70;
 
-- 그룹화 하지 않은 열을 필터링할 경우 오류 발생
select special_features, count(*) as cnt from film
group by special_features
having rating = 'g';
 
-- 오류 없이 필터링 할 경우
select special_features, rating, count(*) as cnt from film
group by special_features, rating
having rating = 'r' and cnt > 8;
 
-- 두 열의 데이터 중복 제거
 select distinct special_features, rating from film;
 
-- group by 절로 두 열을 그룹화 한 경우
select special_features, rating from film
group by special_features, rating;
 
-- distinct 문에 count함수를 사용할 경우 오류발생
select distinct special_features, rating, count(*) as cnt from film;
 
create database if not exists doitsql; -- 데이터베이스가 없을 경우

-- 첫 번째 열에 AUTO_INCREMENT 적용
use doitsql;
 
create table doit_increment(
col_1 int auto_increment primary key,
col_2 varchar(50),
col_3 int
);
 
insert into doit_increment(col_2, col_3) values('1 자동 입력', 1);
insert into doit_increment(col_2, col_3) values('2 자동 입력', 2);
 
select * from doit_increment;
 
 -- 자동 입력되는 값과 동일한 값을 입력한 경우
insert into doit_increment(col_1, col_2, col_3) values(3, '3 자동 입력', 3);

select * from doit_increment;

-- 자동 입력되는 값보다 큰 값을 입력한 경우
insert into doit_increment (col_1, col_2, col_3) values(5, '4 건너뛰고 5 자동 입력', 5);

select * from doit_increment;

-- 1열을 제외하고 데이터 입력한 경우
insert into doit_increment (col_2, col_3) values('어디까지 입력되었을까?', 0);

select * from doit_increment;

-- AUTO_INCREMENT가 적용된 열의 마지막 데이터 조회
select last_insert_id();

-- 자동으로 입력되는 값을 100부터 시작
alter table doit_increment auto_increment=100;
insert into doit_increment (col_2, col_3) values('시작값이 변경되었을까?', 0);

select * from doit_increment;

-- 자동으로 입력되는 값이 5씩 증가
set @@auto_increment_increment = 5;
insert into doit_increment (col_2, col_3) values('5씩 증가할까? (1)', 0);
insert into doit_increment (col_2, col_3) values('5씩 증가할까? (2)', 0);

select * from doit_increment;

-- insert into와 select로 다른 테이블에 결과 입력
create table doit_insert_select_from (
col_1 int,
col_2 varchar(10)
);

create table doit_insert_select_to (
col_1 int,
col_2 varchar(10)
);

insert into doit_insert_select_from values(1, 'Do');
insert into doit_insert_select_from values(2, 'It');
insert into doit_insert_select_from values(3, 'MySQL');

insert into doit_insert_select_to
select * from doit_insert_select_from;

select *from doit_insert_select_to;

-- insert into와 select로 다른 테이블에 결과 입력
create table doit_select_new as (select * from doit_insert_select_from);

select * from doit_select_new;

-- 부모 테이블과 자식 테이블 생성
create table doit_parent (col_1 int primary key);
create table doit_child (col_1 int);

alter table doit_child
add foreign key (col_1) references doit_parent(col_1);

-- 자식 테이블에 데이터 입력 시 부모 테이블에 해당 데이터가 없는 경우 오류 발생
insert into doit_child values (1);

-- 부모 테이블에 데이터 입력 후 자식 테이블에도 데이터 입력
insert into doit_parent values (1);
insert into doit_child values (1);

select * from doit_parent;
select * from doit_child;

-- 부모 테이블에서만 데이터를 삭제한 경우 오류발생
delete from doit_parent where col_1 = 1;

-- 자식 테이블의 데이터 삭제 후 부모 테이블의 데이터 삭제
delete from doit_child where col_1 = 1;
delete from doit_parent where col_1 = 1;

-- 부모 테이블을 삭제할 경우 오류 발생
drop table doit_parent;

-- 하위테이블 삭제 후 상위테이블 삭제
drop table doit_child;
drop table doit_parent;

-- 자식테이블의 데이터를 유지하며 부모테이블을 삭제하는 경우
-- 부모테이블 생성 후 제약 조건 확인
create table doit_parent (col_1 int primary key);
create table doit_child (col_1 int);
alter table doit_child add foreign key (col_1) references doit_parent(col_1);

show create table doit_child;

-- 제약조건 제거 후 상위테이블 삭제
alter table doit_child
drop constraint doit_child_ibfk_1; # doit_child의 외래키

drop table doit_parent;
drop table doit_child;
/*
외래키 비활성
set foreign_key_checks=0

외래키 활성
set foreign_key_checks=1
*/

-- 실수형 데이터가 있는 테이블 생성
use doitsql;

create table doit_float (col_1 float);
insert into doit_float values(0.7);

select * from doit_float where col_1 = 0.7;

-- 암시적 형 변환으로 계산 결과가 출력된 예
select 10/3;
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

-- 문자열 데이터의 길이와 크기 확인
USE doitsql;
create table doit_char_varchar(
col_1 char(5),
col_2 varchar(5)
);

insert into doit_char_varchar values('12345', '12345');
insert into doit_char_varchar values('ABCDE', 'ABCDE');
insert into doit_char_varchar values('가나다라마', '가나다라마');
insert into doit_char_varchar values('hello', '안녕하세요');
insert into doit_char_varchar values('安寧安寧安', '安寧安寧安');

select
col_1, char_length(col_1) as char_length, length(col_1) as char_byte,
col_2, char_length(col_2) as char_length, length(col_2) as char_byte
from doit_char_varchar;

-- 저장공간을 초과한 예
USE doitsql;

-- 생성 성공
create table doit_table_byte(
col_1 varchar(16383)
);
drop table doit_table_byte;

-- 생성 실패
create table doit_table_byte(
col_1 varchar(16383),
col_2 varchar(10)
);

-- MYSQL의 문자집합 확인
show character set;

-- 콜레이션에 따른 정렬순서 비교를 위한 테이블 생성
create table doit_collation(

col_latin1_general_ci varchar(10) collate latin1_general_ci,
col_latin1_general_cs varchar(10) collate latin1_general_cs, -- 콜레이션 설정
col_latin1_bin varchar(10) collate latin1_bin,
col_latin7_general_ci varchar(10) collate latin7_general_ci
);
insert into doit_collation values('a', 'a', 'a', 'a');
insert into doit_collation values('b', 'b', 'b', 'b');
insert into doit_collation values('A', 'A', 'A', 'A');
insert into doit_collation values('B', 'B', 'B', 'B');
insert into doit_collation values('*', '*', '*', '*'); -- 여러 유형의 데이터를 테이블에 삽입
insert into doit_collation values('_', '_', '_', '_');
insert into doit_collation values('!', '!', '!', '!');
insert into doit_collation values('1', '1', '1', '1');
insert into doit_collation values('2', '2', '2', '2');

-- 콜레이션에 따른 정렬순서 확인
select col_latin1_general_ci from doit_collation order by col_latin1_general_ci;
select col_latin1_general_cs from doit_collation order by col_latin1_general_cs;
select col_latin1_bin from doit_collation order by col_latin1_bin;
select col_latin7_general_ci from doit_collation order by col_latin7_general_ci;

-- 데이터 유형에 따른 현재 시간 조회
create table date_table(
justdate date,
justtime time,
justdatetime datetime,
justtimestamp timestamp);

insert into date_table values (now(), now(), now(), now());

select *from date_table;

-- world 데이터베이스의 country 테이블에서 code가 kor인 데이터를 조회하는 쿼리
use world;
select * from country where code = 'kor';

-- world 데이터베이스의 country 테이블에서 region열에 asia라는 글자를 포함하는 데이터를 조회하는 쿼리
select * from country where region like '%asia%';

-- world 데이터베이스의 country 테이블에서 name 열의 데이터가 5글자인 데이터를 조회하는 쿼리
select * from country where name like '_____';

-- world 데이터베이스의 country 테이블에서 Population열을 숫자가 높은 순으로 정렬해 조회하는 쿼리
select * from country where population order by population desc;

-- world 데이터베이스의 country 테이블에서 lifeexpectancy열의 데이터가 60 이상 70 이하인 데이터를 조회하는 쿼리
select * from country where lifeexpectancy between 60 and 70;

-- world 데이터베이스의 country 테이블에서 region열의 데이터가 asia를 포함하지 않으며 name열에서 g또는 u글자를 포함하는 데이터를 population열의 내림차순으로 조회하는 쿼리
select * from country where region not like '%asia%' and name regexp '[g, u]'
order by population desc;

-- world 데이터베이스에서 country 테이블에서 region 그룹별로 개수를 구하고, 개수가 높은 순서데로 조회하는 쿼리
select region, count(*) as cnt from country
group by region order by cnt desc;

-- 내부 조인한 테이블에서 조건에 맞는 데이터 조회
use sakila;

select
 a.customer_id, a.store_id, a.first_name, a.last_name, a.email, a.address_id
 as a_address_id,
	b.address_id as b_address_id, b.address, b.district, b.city_id, b.postal_code,
b.phone, b.location
from customer as a
	inner join address as b on a.address_id = b.address_id
where a.first_name = 'rosa';

-- 열 이름이 유일하지 않은 경우
select
	address_id
from customer as a
	inner join address as b on a.address_id = b.address_id
where a.first_name = 'rosa';

-- 2개의 조인 조건으로 조인한 테이블에서 조건에 맞는 데이터 조회
select
	a.customer_id, a.first_name, a.last_name,
    b.address_id, b.address, b.district, b.postal_code
from customer as a
	inner join address as b on a.address_id = b.address_id and a.create_date = 
b.last_update
where a.first_name = 'rosa';

-- 3개의 테이블을 조인한 테이블에서 조건에 맞는 데이터 조회
select
	a.customer_id, a.first_name, a.last_name,
    b.address_id, b.address, b.district, b.postal_code,
    c.city_id, c.city
from customer as a
	inner join address as b on a.address_id = b.address_id
    inner join city as c on b.city_id = c.city_id
where a.first_name = 'rosa';

-- LEFT OUTER JOIN한 결과 조회
select
	a.address, a.address_id as a_address_id,
	b.address_id as b_address_id, b.store_id
from address as a
	left outer join store as b on a.address_id = b.address_id;
    
-- LEFT OUTER JOIN으로 조회한 결과에서 NULL만 조회
select
	a.address, a.address_id as a_address_id,
    b.address_id as b_address_id, b.store_id
from address as a
	left outer join store as b on a.address_id = b.address_id
where b.address_id is null;

-- RIGHT OUTER JOIN한 결과조회

select
	a.address, a.address_id as a_address_id,
    b.address_id as b_address_id, b.store_id
from address as a
	right outer join store as b on a.address_id = b.address_id;
    
-- RIGHT OUTER JOIN으로 조회한 결과에서 NULL만 조회
select
	a.address_id as a_address_id, a.store_id,
    b.address, b.address_id as b_address_id
from store as a
	right outer join address as b on a.address_id = b.address_id
where a.address_id is null;

-- FULL OUTER JOIN한 결과 조회
select
	a.address_id as a_address_id, a_store_id,
    b.address, b.address_id as b_address_id
from store as a
	left outer join address as b on a.address_id = b.address_id
    
union

select
	a.address_id as a_address_id, a_store_id,
    b.address, b.address_id as b_address_id
from store as a
	right outer join address as b on a.address_id = b.address_id;
    
-- full outer join으로 조회한 결과에서 null만 조회
select
	a.address_id as a_address_id, a.store_id,
    b.address, b.address_id as b_address_id
from store as a
	left outer join address as b on a.address_id = b.address_id
where b.address_id is null

union

select
	a.address_id as a_address_id, a.store_id,
    b.address, b.address_id as b_address_id
from store as a
	right outer join address as b on a.address_id = b.address_id
where a.address_id is null;

-- 샘플 데이터 생성
create table doit_cross1(num int);
create table doit_cross2(name varchar(10));

insert into doit_cross1 values (1), (2), (3);
insert into doit_cross2 values ('do'), ('it'), ('sql');

-- cross join을 적용한 쿼리
select 
	a.num, b.name
from doit_cross1 as a
	cross join doit_cross2 as b
order by a.num;

-- where 절을 사용한 cross join
select
 a.num, b.name
from doit_cross1 as a
	cross join doit_cross2 as b
where a.num = 1;

-- 셀프조인의 경우 별칭을 사용하지 않으면 오류발생
-- self join을 적용한 쿼리 1
select a.customer_id as a_customer_id, b.customer_id as b_customer_id
from customer as a
	inner join customer as b on a.customer_id = b.customer_id;
    
-- self join을 적용한 쿼리 2
select
	a.payment_id, a.amount, b.payment_id, b.amount, b.amount - a.amount as profit_amount
    from payment as a
		left outer join payment as b  on a.payment_id = b.payment_id -1;
        
-- 단일 행 서브쿼리 적용
select * from customer
where customer_id = (select customer_id from customer where first_name = 'rosa');

-- 잘못된 단일 행 서브쿼리 적용시 오류 발생 예
select * from customer
where customer_id = (select customer_id from customer where first_name in ('rosa', 'ana'));

-- in을 활용한 다중 행 서브쿼리 적용 1
select * from customer
where first_name in('rosa', 'ana');

-- in을 활용한 다중 행 서브쿼리 적용 2
select * from customer
where customer_id in (select customer_id from customer where first_name in ('rosa', 'ana'));

-- 테이블 3개를 조인하는 쿼리
select
	a.film_id, a.title
from film as a
	inner join film_category as b on a.film_id = b.film_id
	inner join category as c on b.category_id = c.category_id
where c.name = 'action';

-- in을 활용한 서브쿼리 적용
select
	film_id, title
from film
where film_id in(
	select a.film_id
    from film_category as a
		inner join category as b on a.category_id = b.category_id
	where b.name = 'action');

-- not in을 활용한 서브 쿼리 적용
select
	film_id, title
from film
where film_id not in(
	select a.film_id
    from film_category as a
		inner join category as b on a.category_id = b.category_id
	where b.name = 'action');
    
-- =any를 활용한 서브쿼리 적용
select * from customer
where customer_id = any (select customer_id from customer where first_name in 
('rosa', 'ana'));

-- <any를 활용한 서브쿼리 적용
select * from customer
where customer_id < any (select customer_id from customer where first_name in ('rosa', 'ana'));

-- >any를 활용한 서브쿼리 적용
select * from customer
where customer_id > any (select customer_id from customer where first_name in ('rosa', 'ana'));

-- exists를 활용한 서브쿼리 적용: True를 반환하는 경우
select * from customer
where exists (select customer_id from customer where first_name in('rosa', 'ana'));

-- exists를 활용한 서브쿼리 적용: false를 반환하는 경우
select * from customer
where exists(select customer_id from customer where first_name in ('kang'));

-- not exists를 활용한 서브쿼리 적용: True를 반환하는 경우
select * from customer
where not exists(select customer_id from customer where first_name in ('kang'));

-- all을 활용한 서브 쿼리 적용
select * from customer
where customer_id = all(select customer_id from customer where first_name in ('rosa', 'ana'));

-- 테이블 조인
select
	a.film_id, a.title, a.special_features, c.name
from film as a
	inner join film_category as b on a.film_id = b.film_id
    inner join category as c on b.category_id = c.category_id
where a.film_id > 10 and a.film_id < 20;

-- from 절에 서브쿼리 적용
select 
	a.film_id, a.title, a.special_features, x.name
from film as a
	inner join(
    select
		b.film_id, c.name
	from film_category as b
		inner join category as c on b.category_id = c.category_id
	where b.film_id > 10 and b.film_id < 20) as x on a.film_id = x.film_id;
        
-- 테이블 조인
select
	a.film_id, a.title, a.special_features, c.name
    
from film as a
	inner join film_category as b on a.film_id = b.film_id
    inner join category as c on b.category_id = c.category_id

where a.film_id  and a.film_id < 20;

-- select 절에 서브쿼리 적용
select
	a.film_id, a.title, a.special_features, (select c.name from film_category as
    b inner join category as c on b.category_id = c.category_id where a.film_id =
    b.film_id) as name
from film as a
where a.film_id > 10 and a.film_id <20;

-- 일반 CTE로 데이터 조회
with cte_customer(customer_id, first_name, email)
as
(
	select customer_id, first_name, email from customer where customer_id >= 10
    and customer_id < 100
)

select * from cte_customer;

-- 일반 CTE에서 열 불일치로 인한 오류 발생 예
with cte_customer (customer_id, first_name, email)
as
( 
	select customer_id, first_name, last_name, email from customer where customer_id >= 10
    and customer_id < 100
)

select * from cte_customer;

-- union all로 cte 결합
with cte_customer (customer_id, first_name, email)
as
( 
	select customer_id, first_name, email from customer where customer_id >= 10
    and customer_id <= 15
    union all
    select customer_id, first_name, email from customer where customer_id >= 25
    and customer_id <=30
)

select * from cte_customer;

-- intersect로 cte 결합
WITH cte_customer (customer_id, first_name, email)
AS
(
	SELECT customer_id, first_name, email FROM customer WHERE customer_id >= 10 AND customer_id <= 15
	
	INTERSECT
	
	SELECT customer_id, first_name, email FROM customer WHERE customer_id >= 12 AND customer_id <= 20
)

SELECT * FROM cte_customer;

-- EXCEPT으로 CTE 결합해보기1
with cte_customer(customer_id, first_name, email)
AS
(
	SELECT customer_id, first_name, email FROM customer WHERE customer_id >=10
    And customer_id<=15
	EXCEPT
    SELECT customer_id, first_name, email From customer Where customer_id>=12
    AND customer_id<=20
    )
    
   SELECT * FROM cte_customer; 

-- EXCEPT으로 CTE 결합해보기2   
   with cte_customer(customer_id, first_name, email)
AS
(
	SELECT customer_id, first_name, email FROM customer WHERE customer_id >=12
    And customer_id<=20
	EXCEPT
    SELECT customer_id, first_name, email From customer Where customer_id>=10
    AND customer_id<=15
    )
    
   SELECT * FROM cte_customer; 
   
   -- 재귀 CTE로 피보나치 수열 생성
   WITH RECURSIVE fibonacci_number(n, fibonacci_n, next_fibonacci_n)
   AS(
		SELECT 1, 0, 1
        UNION ALL
        SELECT n+1, next_fibonacci_n, fibonacci_n + next_fibonacci_n
				FROM fibonacci_number WHERE n <20
)
SELECT * FROM fibonacci_number;

SELECT a.*, b.*
FROM country AS a
	INNER JOIN city AS b ON a.Code = b.CountryCode
WHERE a.name = 'United States';

SELECT
	a.Name AS city_name, a.CountryCode, a.District, a.Population,
    b.name AS country_name, b.Population, b.LifeExpectancy, b.GNP
FROM city AS a
	INNER JOIN country AS b ON a.CountryCode = b.code
    ORDER BY a.Population DESC LIMIT 10;
    
SELECT
	a.Name AS city_name, a.CountryCode, a.District, a.Population,
    b.name AS country_name, b.Population, b.LifeExpectancy, b.GNP
FROM(
SELECT
	Name, CountryCode, District, Population
From city
ORDER BY Population DESC LIMIT 10
) AS a
 INNER JOIN country AS b ON a.CountryCode = b.code;
 
 SELECT b.*
 FROM countrylanguage AS a
	INNER JOIN country AS b ON a.CountryCode = b.Code
WHERE a.Language = 'EngLish';

SELECT
	a.first_name, a.last_name, c.title, c.release_year, e.name
    AS category_name
FROM actor AS a
	INNER JOIN film_actor AS b ON a.actor_id=b.actor_id
    INNER JOIN film AS c ON b.film_id = c.film_id
    INNER JOIN film_category AS d ON c.film_id = d.film_id
    INNER JOIN category AS e ON d.category_id = e.category_id
WHERE e.name = 'Action'
ORDER BY title;

WITH cte_film(film_id, title, category_name)
AS (
SELECT a.film_id, a.title, c.name as category_name
FRom film as a
		INNER JOIN film_category AS b ON a.film_id = b.film_id
        INNER JOIN category AS c ON b.category_id = c.category_id), cte_payment (customer_id, amount, film_id)
AS (
SELECT a.customer_id, b.amount, c.film_id
FROM rental AS a
INNER JOIN payment AS b on a.rental_id = b.rental_id
INNER JOIN inventory AS c ON a.inventory_id = c.inventory_id
)

SELECT
	a.customer_id, a.first_name, a.last_name,
    c.category_name,
    COUNT(*) AS rental_count,
    Sum(b.amount) AS amount
FROM customer AS a
	INNER JOIN cte_payment AS b on a.customer_id = b.customer_id
    INNER JOIN cte_film AS c ON b.film_id = c.film_id
GROUP BY a.customer_id, a.first_name, a.last_name, c.category_name
ORDER BY a.customer_id;
CREATE TABLE emp
(employee_id int NOT NULL PRIMARY KEY,
employee_name varchar(50) NOT NULL,
manager_id int NULL
);


INSERT INTO emp VALUES (101, '이지연', NULL);
INSERT INTO emp VALUES (102, '강정훈', 101);
INSERT INTO emp VALUES (103, '임도환', 101);
INSERT INTO emp VALUES (104, '민가영', 102);
INSERT INTO emp VALUES (105, '김민찬', 102);
INSERT INTO emp VALUES (106, '장민선', 103);
INSERT INTO emp VALUES (107, '김시영', 103);
INSERT INTO emp VALUES (108, '이재윤', 105);
INSERT INTO emp VALUES (109, '오하나', 105);
INSERT INTO emp VALUES (110, '심성우', 106);

WITH RECURSIVE cte_emp(employee_id, employee_name, manager_id, employee_level)
AS 
(
    SELECT
        employee_id, employee_name, manager_id, 1 AS employee_level
    FROM emp
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id, e.employee_name, e.manager_id, r.employee_level + 1
    FROM emp AS e
    INNER JOIN cte_emp AS r ON e.manager_id = r.employee_id
)
    
SELECT
    employee_name, 
    employee_level,
    (SELECT employee_name FROM emp WHERE employee_id = cte_emp.manager_id) AS Manager
FROM cte_emp
ORDER BY employee_level, employee_id;

--  CONCAT 함수로 열 이름과 문자열 연결
select concat(first_name,',', last_name) AS customer_name from customer;

-- CONCAT_WS 함수로 구분자 지정
select concat_ws(',', first_name, last_name, email) AS customer_name From customer;

-- CONCAT함수로 NULL과 열 이름 연결
select concat(Null,',', last_name) AS customer_name from customer;

-- CONCAT_WS인자로 NULL이 있는 겅우
select concat_ws(',', first_name,Null,last_name) as customer_name from customer;

-- 문자열을 부호 없는 정수형으로 변경
select
4/'2',
4 /2,
4/cast('2' as unsigned);

-- NOW함수로 현재 날짜와 시간 출력
select now();

-- CAST함수로 날짜형을 숫자형으로 변환
select cast(now() as signed);

-- CAST함수로 숫자형을 날짜형으로 전환
select cast(20230819 as date);

-- CAST함수로 숫자형을 문자열로 변환
select cast(20230819 as char);

-- CONVERT함수로 날짜형을 정수형으로 변환
select convert(now(),signed);

-- CONVERT함수로 숫자형을 날짜형으로 변환
select convert(20230819, DATE);

-- CHAR로 데이터 길이 지정
select convert(20230819, char(5));

-- 오버플로 발생 예
SELECT 9223372036854775807 + 1;

-- CAST함수로 오버플로 방지
SELECT CAST(9223372036854775807 AS unsigned)+1;

-- CONVERT함수로 오버플로 방지
SELECT convert(9223372036854775807 , unsigned)+1;

CREATE TABLE doit_null(
col_1 INT,
col_2 VARCHAR(10),
col_3 VARCHAR(10),
col_4 VARCHAR(10),
col_5 VARCHAR(10)
);

insert into doit_null values (1, NULL, 'col_3', 'col_4', 'col_5');
insert into doit_null values (2, NULL, 'col_3', 'col_4', 'col_5');
insert into doit_null values (2, NULL, NULL, NULL, 'col_5');
insert into doit_null values (3, NULL, NULL, NULL, NULL);

-- IFNULL함수로 col_2열의 NULL대체
select col_1, ifnull(col_2, '') AS col_2, col_3, col_4, col_5
FROM doit_null WHERE col_1 = 1;

-- IFNULL 함수로 col_3열의 NULL대체
select col_1, ifnull(col_2, col_3) AS col_2, col_3, col_4, col_5
FROM doit_null WHERE col_1 = 1;

-- COALESCE 함수로 NULL을 다른 데이터로 대체: 마지막 인자에 데이터가 있는 경우
select col_1, coalesce(col_2, col_3, col_4, col_5)
FROM doit_null WHERE col_1 = 2;

-- COALESCE 함수로 NULL을 다른 데이터로 대체: 마지막 인자까지도 NULL이 있는 경우
select col_1, coalesce(col_2, col_3, col_4, col_5)
FROM doit_null WHERE col_1 = 3;


-- LOWER 함수로 소문자를, UPPER 함수로 대문자로 변경
SELECT 'Do it SQL', LOWER('DO it! SQL'), UPPER('Do it! SQL');

-- LOWER 함수로 소문자를, UPPER 함수로 대문자로 변경
SELECT email, LOWER(email), UPPER(email) from customer;

-- LTRIM함수로 왼쪽 공백 제거
select '    DO it! MYSQL', ltrim('    DO it! MYSQL');

-- RTRIM함수로 오른쪽 공백 제거
select 'DO it! MYSQL   ', rtrim('DO it! MYSQL   ');

-- TRIM 함수로 양쪽 문자 제거
select trim(both '#' from '#    DO it! MYSQL    #');

-- LENGTH 함수로 문자열의 크기 반환
select length('DO it! MYSQL'), length('두잇 마이에스큐엘');

-- LENGTH로 다양한 문자의 크기 반환
select length('A'), length('강'), length('漢'), length('◁'), length(' ');

-- CHAR_LENGTH 함수로 문자열의 개수 반환
select char_length('DO it! MYSQL'), char_length('두잇 마이에스큐엘');

-- LENGTH와 CHAR_LENGTH 함수에 열 이름 전달
SELECT first_name, LENGTH(first_name), CHAR_LENGTH(first_name) from customer;

-- POSITION함수로 특정 문자까지의 크기 반환
select 'DO it! SQL', position('!' in 'DO it! MYSQL');

-- 탐색문자가 없는 경우
select 'DO it! SQL', position('#' in 'DO it! MYSQL');

-- LEFT와 RIGHT 함수로 왼쪼과 오른쪽 2개의 문자열 반환
select 'DO it! MYSQL', LEFT('DO it! MYSQL',2), right('DO it! MYSQL',2);

-- SUBSTRING함수로 지정한 범위의 문자열 반환
select 'DO it! MYSQL', substring('DO it! MYSQL', 4, 2);

-- SUBSTRING함수에 열 이름 전달
SELECT first_name, substring(first_name, 2, 3) from customer;

-- SUBSTRING과 POSITOIN 함수 조합
select substring('abc@email.com', 1 , position('@' in 'abc@email.com')-1);

-- REPLACE함수로 문자 변경
SELECT first_name, replace(first_name, 'A', 'C')
from customer where first_name like 'A%';

-- REPEAT함수로 문자반복
select repeat('0', 10);

-- REPEAT과 REPLACE 함수 조합
SELECT first_name, replace(first_name, 'A', repeat('C',10))
from customer where first_name like '%A%';

-- SPACE 함수로 공백문자 반복
SELECT CONCAT(first_name, space(10), last_name) from customer;

-- REVERSE 함수로 문자열을 역순으로 반환
SELECT 'DO it! SQL', REVERSE('DO it! MYSQL');

-- REVERSE 함수와 다른 여러 함수 조합
WITH ip_list(ip)
AS(
	SELECT '192.168.0.1' UNIOn all
    SELECT '10.6.100.99' UNIOn all
    SELECT '8.8.8.8' UNIOn all
    SELECT '192.200.212.113'
    )
    select ip, substring(ip, 1, char_length(ip) - position('.' IN reverse(ip)))
    from ip_list;
    
-- STRCMP 함수로 두 문자열을 비교: 동일한경우
select strcmp('DO it! MYSQL', 'DO it! MYSQL');

-- STRCMP 함수로 두 문자열을 비교: 동일하지 않은 경우
select strcmp('DO it! MYSQL', 'DO it! MYSQL!');

-- 날짜함수로 현재 날짜나 시간 반환
select current_date(), current_time(),current_timestamp(), now();

-- 정밀한 시각을 반환
select current_date(), current_time(3),current_timestamp(3), now(3);

-- UTC_DATE,UTC_TIME,UTC_TIMESTAMP 함수로 세계 표준 날짜나 시간 반환
select current_timestamp(3), utc_date(), utc_time(3), utc_timestamp(3);

-- DATE_ADD함수로 1년 증가한 날짜 반환
select now(), date_add(now(), interval 1 year);

-- DATE_ADD함수로 1년 감소한 날짜 반환
select now(), date_add(now(), interval -1 year);

-- DATE_SUB함수로ㅗ 1년 감소한 날짜 반환
select now(), date_sub(now(), interval +1 year), date_sub(now(), interval -1 year);

-- DATEDIFF함수로 날짜 간의 일수 차 반환
select datediff('2023-12-31 23:59:59.9999999', '2023-01-01 00:00:00.0000000');

-- TIMESTAMPDIFF함수로 날짜 간의 일수 차 반환
select TIMESTAMPDIFf(month, '2023-12-31 23:59:59.9999999', '2023-01-01 00:00:00.0000000');

-- DAYNAME함수로 특정 날짜의 요일 반환
select dayname('2023-08-20');

-- YEAR, MONTH, WEEK, DAY함수로 연, 월, 주, 일을 별도의 값으로 반환
select
	year('2023-08-20'),
	month('2023-08-20'),
	week('2023-08-20'),
	day('2023-08-20');
    
    
-- DATE_FORMAT 함수로 날짜 형식 변경
select date_format('2023-08-20 20:23:01', '%m/%d/%y');

-- GET_FORMAT 함수로 국가나 지역별 날짜 형식 확인

select get_format(date,'usa') as usa,
get_format(date, 'jis') as jis,
get_format(date, 'eur') as europe,
get_format(date, 'iso') as iso,
get_format(date, 'internal') as internal;

-- DATE_FORMAT과 GET_FORMAT 함수 조합
select date_format(now(), get_format(DATE, 'usa')) as usa,
date_format(now(), get_format(DATE, 'jis')) as jis,
date_format(now(), get_format(DATE, 'eur')) as europe,
date_format(now(), get_format(DATE, 'iso')) as iso,
date_format(now(), get_format(DATE, 'internal')) as internal;

-- count 함수로 데이터 개수 집계
select count(*) from customer; 

-- count 함수와 GROUP BY절 조합
select store_id, count(*) as cnt from customer group by store_id;

-- count 함수와 GROUP BY절 조합 : 열 2개 활용
select store_id, active, count(*) as cnt from customer group by store_id, active;

-- NULL을 제외한 집계 확인
SELECT count(*) AS all_cnt,
COUNT(address2) AS ex_null from address;


-- COUNT함수와 DISTINCT문 조합
select count(*), count(store_id), count(distinct store_id) from customer; 

-- SUM함수로 amount열의 데이터 합산
select sum(amount) from payment;

-- SUM함수로 GROUP절 조합
select customer_id, sum(amount) from payment group by customer_id;

-- 암시적 형 변환으로 오버플로 없이 합산 결과를 반환
create table doit_overflow(
col_1 int,
col_2 int,
col_3 int
);
insert into doit_overflow values (1000000000, 1000000000, 1000000000);
insert into doit_overflow values (1000000000, 1000000000, 1000000000);
insert into doit_overflow values (1000000000, 1000000000, 1000000000);

select sum(col_1) from doit_overflow;

-- avg 함수로 amount열의 데이터의 평균 계산
select avg(amount) from payment;

-- AVG함수로 GROUP BY절 조합
select customer_id, AVG(amount) from payment group by customer_id;

-- MIN과 MAX 함수로 amount열의 최솟값과 최댓값 조회
select min(amount), max(amount) from payment;

-- MIN과 MAX함수 그리고 GROUP BY절 조합
select customer_id, min(amount), max(amount) from payment group by customer_id;

-- ROLLUP 함수로 부분합 계산

SELECT customer_id, staff_id, sum(amount)
from payment
group by customer_id, staff_id with rollup;

-- STDDEV와 STDDEV_SAMP함수로 표준편차 계산
select stddev(amount), stddev_samp(amount) from payment;

-- ABS함수에 입력한 숫자를 절댓값으로 반환
select abs(-1.0), abs(0.0), abs(1.0);

-- ABS함수에 입력한 수식의 결과를 절댓값으로 반환
select a.amount - b.amount as amount, ABS(a.amount - b.amount) as abs_amount
from payment as a
	inner join payment as b on a.payment_id = b.payment_id-1;
    
-- 암시적 형 변환으로 오버플로 없이 절댓값을 반환
select abs(-2147483648);

-- SIGN 함수로 입력한 숫자가 양수, 음수,0인지를 판단
select sign(-256), sign(0), sign(256);

-- SIGN함수로 수식의 결과가 양수, 음수, 0인지를 판단
select a.amount-b.amount as amount, sign(a.amount-b.amount) as abs_amount
from payment as a
	inner join payment as b on a.payment_id = b.payment_id-1;
    
-- CEILING 함수로 천장값 반환
select ceiling(2.4), ceiling(-2.4), ceiling(0.0);

-- FLOOR 함수로 천장값 반환
select FLOOR(2.4), FLOOR(-2.4), FLOOR(0.0);

-- ROUND함수로 소수점 셋째자리까지 반올림
select round(99.9994, 3), round(99.9995, 3);

-- ROUND함수로 소수와 정수를 따로 반올림
select round(234.4545, 2), round(234.4545, -2);

-- 정수 부분의 길이보다 큰 자릿수를 입력한 경우
select round(748.58, -1);
select round(748.58, -2);
select round(748.58, -4);

-- LOG함수로 로그 10을 계산
select log(10);

-- LOG함수로 로그 10의 5를 계산
select log(10, 5);

-- EXP함수로 지수 1.0을 계산
select exp(1.0);

-- EXP함수로 지수 10을 계산
select exp(10);

-- LOG함수와 EXP함수로 결과 확인
select exp(log(20)), log(exp(20));

-- power함수로 거듭제곱 계산
select power(2,3), power(2,10), power(2.0, 3);

-- sqrt함수로 제곱근 계산
select sqrt(1.00), sqrt(10.00);

-- rand함수로 난수 계산
select rand(100), rand(), rand();

-- 인수가 없는 rand함수로 난수 계산
delimiter $$
create procedure rnd()
begin
declare counter int;
set counter = 1;

while counter <5 do
	select rand() random_number;
    set counter = counter +1;
end while;
end $$

delimiter ;
call rnd();

-- COS함수 계산
select cos(14.78);

-- SIN함수 계산
select sin(45.175643);

-- TAN함수 계산
select TAN(pi()/2), tan(.45);

-- ATAN함수 계산
SELECT ATAN(45.87) AS atanalc1,
ATAN(-181.01) AS atancalc2,
ATAN(0) AS atanCalc3,
ATAN(0.1472738) AS atanCalc4,
ATAN(197.1099392) AS atanCalc5;

-- ROW_NUMBER 함수로 순위 부여

SELECT ROW_NUMBER() OVER(ORDER by amount desc) as num, customer_id, amount

from(
	select customer_id, sum(amount) as amount
    from payment group by customer_id) as x;
    
    -- ROW_NUMBER 함수로 순위 부여

-- 내림차순 정렬한 결과에 ROW_NUMBER함수로 순위 부여
SELECT ROW_NUMBER() OVER(ORDER by amount desc, customer_id DESC) as num, customer_id, amount

from(
	select customer_id, sum(amount) as amount
    from payment group by customer_id) as x;
    
--  PATRTITION BY 절로 사용해 그룹별 순위 부여

SELECT staff_id,
 ROW_NUMBER() OVER(partition by staff_id ORDER by amount desc, customer_id asc) as num, customer_id, amount

from(
	select customer_id,staff_id, sum(amount) as amount
    from payment group by customer_id, staff_id) as x;
    
-- rank 함수로 순위 부여
SELECT rank() OVER(ORDER by amount desc)as num, customer_id, amount

from(
	select customer_id, sum(amount) as amount
    from payment group by customer_id) as x; 

-- DENCE_RANK 함수로 순위 부여
SELECT dense_rank() OVER(ORDER by amount desc)as num, customer_id, amount

from(
	select customer_id, sum(amount) as amount
    from payment group by customer_id) as x; 
 -- 내림차순으로 정렬한 결과에 NTILE함수로 순위 부여   
SELECT NTILE(100) OVER(ORDER by amount desc)as num, customer_id, amount

from(
	select customer_id, sum(amount) as amount
    from payment group by customer_id) as x; 
    
-- LAG와 LEAD함수로 앞뒤 행 참조

SELECT x.payment_date,
 Lag(x.amount) over(order by x.payment_date asc) as lag_amount, amount,
 lead(x.amount) over(order by x.payment_date asc) as lead_amount
 from(
	select date_format(payment_date, '%y-%m-%d') as payment_date,
    sum(amount) as amount
    from payment group by date_format(payment_date, '%y-%m-%d')) as x
order by x.payment_date;

-- LAG와 LEAD함수로 2칸씩 앞뒤 행 참조

SELECT x.payment_date,
 Lag(x.amount, 2) over(order by x.payment_date asc) as lag_amount, amount,
 lead(x.amount,2) over(order by x.payment_date asc) as lead_amount
 from(
	select date_format(payment_date, '%y-%m-%d') as payment_date,
    sum(amount) as amount
    from payment group by date_format(payment_date, '%y-%m-%d')) as x
order by x.payment_date;


-- CUME_DIST 함수로 누적 분폿값 계산
SELECT x.customer_id, x.amount, cume_dist() over(order by x.amount desc)
from(
	select customer_id, sum(amount) as amount
    from payment group by customer_id) as x
order by x.amount desc;

-- percent_rank함수로 상위 분포 순위를 계산
SELECT x.customer_id, x.amount, percent_rank() over(order by x.amount desc)
from(
	select customer_id, sum(amount) as amount
    from payment group by customer_id) as x
order by x.amount desc;

-- FIRST_VALUE함수로 가장 높은 값 조회
select x.payment_date, x.amount,
	FIRST_VALUE(x.amount) over(order by x.payment_date ) as f_value,
	LAST_value(x.amount) over(order by x.payment_date range between unbounded preceding and unbounded following) as l_value,
     x.amount-first_value(x.amount) over(order by x.payment_date) as increase_amount
 from(
	select date_format(payment_date, '%y-%m-%d') as payment_date,
    sum(amount) as amount
    from payment group by date_format(payment_date, '%y-%m-%d')) as x
order by x.payment_date;
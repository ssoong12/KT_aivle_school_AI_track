/*
뷰(Views)
*/

USE myshop2019;


/*
1. 뷰 만들기 
*/


SELECT * 
    FROM order_header
    WHERE order_date >= '2018-01-01' AND order_date < '2019-01-01';

-- 1) 대상 쿼리문 작성

SELECT o.order_id, 
       c.customer_name, 
       o.customer_id, 
       DATE(o.order_date) AS order_date, 
       o.total_due
    FROM order_header AS o
    INNER JOIN customer AS c ON o.customer_id = c.customer_id
    WHERE o.order_date >= '2018-01-01' AND o.order_date < '2019-01-01';

    
-- 2) 뷰 만들기

CREATE VIEW orders_2018
AS
SELECT o.order_id, 
       c.customer_name, 
       o.customer_id, 
       DATE(o.order_date) AS order_date, 
       o.total_due
    FROM order_header AS o
    INNER JOIN customer AS c ON o.customer_id = c.customer_id
    WHERE o.order_date >= '2018-01-01' AND o.order_date < '2019-01-01';


-- 3) 뷰 사용

SELECT *
    FROM orders_2018;
    
    
-- 4) 뷰 관련 정보 확인

-- 목록 확인 #1
SHOW TABLES;  

-- 목록 확인 #2
SHOW FULL TABLES;   

-- 목록 확인 #3
SHOW FULL TABLES WHERE table_type = 'VIEW';   

-- 열 정보 확인
DESCRIBE orders_2018;

-- 뷰 생성 구문 확인
SHOW CREATE VIEW orders_2018;


/*
2. 뷰 변경과 삭제 
*/

-- 1) ALTER VIEW 문으로 변경 

ALTER VIEW orders_2018
AS
SELECT o.order_id, 
       c.customer_name, 
       o.customer_id, 
       DATE(o.order_date) AS order_date, 
       o.sub_total, 
       o.total_due
    FROM order_header AS o
    INNER JOIN customer AS c ON o.customer_id = c.customer_id
    WHERE o.order_date >= '2018-01-01' AND o.order_date < '2019-01-01';

SELECT *
    FROM orders_2018;


-- 2) CREATE OR REPLACE VIEW 문으로 변경

CREATE OR REPLACE VIEW orders_2018
AS
SELECT o.order_id, 
       c.customer_name, 
       c.gender,
       o.customer_id, 
       DATE(o.order_date) AS order_date, 
       o.sub_total, 
       o.total_due
    FROM order_header AS o
    INNER JOIN customer AS c ON o.customer_id = c.customer_id
    WHERE o.order_date >= '2018-01-01' AND o.order_date < '2019-01-01';

SELECT *
    FROM orders_2018;
    

-- 3) 뷰 삭제 

DROP VIEW orders_2018;


/*
3. 뷰 데이터 변경 
*/

USE mydb;

DROP TABLE IF EXISTS member;

CREATE TABLE member (
	id int NOT NULL,
    name varchar(20) NULL,
    nick_name varchar(20)  NULL,
    score1 int NULL,
    score2 int NULL,
    score3 int NULL,
    PRIMARY KEY (id)
);

-- 데이터 추가
INSERT INTO member VALUES(1, '홍길동', '홍대장', 80, 95, 85);
INSERT INTO member VALUES(2, '일지매', '일지매', 85, 90, 70);
INSERT INTO member VALUES(3, '한사랑', '두사랑', 70, 80, 90);
INSERT INTO member VALUES(4, '강우동', 'NULL', 90, 85, 80);

-- 확인 
SELECT * 
	FROM member;

    
-- 1) 뷰 만들기 

CREATE OR REPLACE VIEW high_score
AS
SELECT id, 
       name, 
       score1, 
       score2, 
       score3,
       ROUND((score1 + score2 + score3) / 3, 2) AS avg_score
    FROM member
    WHERE (score1 + score2 + score3) / 3 >= 85;

SELECT *
    FROM high_score;


-- 2) 데이터 변경 

UPDATE high_score
    SET score3 = 70
    WHERE id = 1;

-- 확인
SELECT *
    FROM high_score;

-- 다시 변경
UPDATE member
    SET score3 = 85
    WHERE id = 1;

-- 확인
SELECT *
    FROM high_score;


-- 3) WITH CHECK OPTION  사용  

CREATE OR REPLACE VIEW high_score
AS
SELECT id, 
       name, 
       score1, 
       score2, 
       score3,
       ROUND((score1 + score2 + score3) / 3, 2) AS avg_score
    FROM member
    WHERE (score1 + score2 + score3) / 3 >= 85
    WITH CHECK OPTION;

-- 실패하는 쿼리 
UPDATE high_score
    SET score3 = 70
    WHERE id = 1;

-- 성공하는 쿼리 
UPDATE high_score
    SET score3 = 90
    WHERE id = 1;
    
USE myshop2019;
SELECT DATABASE();


-- Q01) 다음 쿼리문을 수행하여 결과를 확인하세요.

SELECT o.order_id, 
       o.order_date,
       o.total_due,
       c.customer_name,
       c.gender,
       c.birth_date,
       c.city
    FROM order_header AS o
    INNER JOIN customer AS c ON o.customer_id = c.customer_id;

-- Q02) 위 쿼리문을 수정하여 다음 정보를 조회하세요.
--      order_id, order_year, order_month, total_due, customer_name, gender, birth_year, birth_month, age, city   
--      단, age는 현재 연도에서 출생 연도를 뺀 값으로 정의하세요.


    
-- Q03) 위 결과를 갖는 뷰 vw_order_header를 만드세요.



-- Q04) vw_order_header 뷰를 조회해 결과를 확인하세요.


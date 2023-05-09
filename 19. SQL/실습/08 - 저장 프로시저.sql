/*
저장 프로시저(Stored Procedures)
*/

USE myshop2019;


/*
1. DELIMITER 
*/


SELECT 1 + 2;

SELECT 2 + 3 $$

-- DELIMITER 선언
DELIMITER $$
SELECT 2 + 3 $$
DELIMITER ;


/*
2. 저장 프로시저 만들기 
*/

-- 1) 저장 프로시저 만들기

DROP PROCEDURE IF EXISTS get_all_customers;

DELIMITER //
CREATE PROCEDURE get_all_customers()
BEGIN
	SELECT customer_name, 
           customer_id, 
           gender, 
           phone, 
           email
        FROM customer
        ORDER BY customer_name;    
END //
DELIMITER ;


-- 2) 저장 프로시저 호출 

CALL get_all_customers();


-- Q01) 예시처럼 연도별 지불금액(total_due) 합계를 보여주는 저장 프로시저를 작성하고 실행하세요.
--      단, 저장 프로시저 이름은 get_orders_summary로 하세요.

/*
order_year	total_due
---------------------
2016	    400638500
2017	    630777500
2018	    841931000
2019	    450936500
*/



/*
3. 저장 프로시저 안에서 지역변수 사용 
*/

-- 1) 저장 프로시저 만들기 

DROP PROCEDURE IF EXISTS get_total_orders;

DELIMITER //
CREATE PROCEDURE get_total_orders()
BEGIN
    DECLARE total_order int DEFAULT 0;
	SELECT COUNT(*)
        INTO total_order
        FROM order_header;
    SELECT total_order;
END //
DELIMITER ;


-- 2) 저장 프로시저 호출 

CALL get_total_orders();


/*
4. 매개변수 사용 
*/

-- 1) IN 매개변수

DROP PROCEDURE IF EXISTS get_customer_orders;

DELIMITER //
CREATE PROCEDURE get_customer_orders(
    IN order_customer varchar(20)
)
BEGIN
	SELECT order_id, employee_id, order_date, total_due
        FROM order_header
        WHERE customer_id = order_customer;
END //
DELIMITER ;

-- 저장 프로시저 호출 
CALL get_customer_orders('gdhong');


-- 2) OUT 매개변수 

DROP PROCEDURE IF EXISTS get_customer_order_count;

DELIMITER //
CREATE PROCEDURE get_customer_order_count(
    IN order_customer varchar(20),
    OUT total_count int
)
BEGIN
	SELECT COUNT(*)
        INTO total_count
        FROM order_header
        WHERE customer_id = order_customer;

END //
DELIMITER ;

-- 저장 프로시저 호출 
CALL get_customer_order_count('gdhong', @total);

SELECT @total;


-- 3) INOUT 매개변수 

DROP PROCEDURE IF EXISTS set_counter;

DELIMITER //
CREATE PROCEDURE set_counter(
    INOUT counter int,
    IN inc int
)
BEGIN
    SET counter = counter + inc;
END //
DELIMITER ;

-- 저장 프로시저 호출 
SET @counter = 10;
CALL set_counter(@counter, 10);
SELECT @counter; 


-- 4) 데이터 추가 또는 변경 처리

DROP PROCEDURE IF EXISTS set_customer_info;

DESC customer;

DELIMITER //
CREATE PROCEDURE set_customer_info(
    IN id varchar(20),
    IN new_name varchar(20),
    IN new_phone varchar(20),
    IN new_email varchar(50),
    IN new_city varchar(20)
)
BEGIN
    UPDATE customer
        SET customer_name = new_name,
            phone = new_phone,
            email = new_email,
            city = new_city
        WHERE customer_id = id;
    SELECT customer_id, customer_name, phone, email, city
        FROM customer
        WHERE customer_id = id; 
END //
DELIMITER ;

SELECT *
    FROM customer;
    
-- 저장 프로시저 호출 
CALL set_customer_info('agikim', '김아이', '010-9603-8126', 'ai.kim@gmeil.com', '이천' );

-- Q02) 연도를 매개변수로 받아 예시처럼 월별 지불금액(total_due) 합계를 보여주는 저장 프로시저를 작성하고 실행하세요.
--      단, 앞에서 만든 저장 프로시저 get_orders_summary를 수정하세요.

/*
-- 2018년의 예
order_year	order_month	total_due
---------------------------------
2018        1           88388500
2018        2           65199500
2018        3           65924000
2018        4           60695500
2018        5           94702000
2018        6           44430500
2018        7           77171000
2018        8           62124500
2018        9           55450000
2018        10          79835000
2018        11          65777500
2018        12          82233000
*/



/*
5. 저장 프로시저 목록 확인 
*/

SHOW PROCEDURE STATUS;

SHOW PROCEDURE STATUS LIKE '%customer%';
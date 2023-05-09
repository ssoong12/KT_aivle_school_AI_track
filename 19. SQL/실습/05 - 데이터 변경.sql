/*
데이터 변경
*/


-- 데이터베이스 연결
USE hrdb2019;


-- 1) INSERT

/*
- 모든 열이 원래 순서대로 나열되는 경우 열 이름을 생략하기도 함
- 하지만 가독성 향상을 위해 열 이름을 지정하기를 권고함
*/

-- PRD 부서 추가
INSERT INTO department(dept_id, dept_name, unit_id, start_date)
    VALUES('PRD', '상품', 'A', '2018-10-01');

-- 열 이름 생략
INSERT INTO department
    VALUES('DBA', 'DB관리', 'A', '2018-10-01');

-- 확인   
SELECT * FROM department;
    

-- 2) UPDATE

-- 특정 조건의 행 UPDATE
UPDATE employee
	SET phone = '010-1239-1239'
	WHERE emp_id = 'S0001';
            
            
-- Q) 홍길동(S0001)의 이름을 '홍길명'으로 변경



-- Q) 정보시스템(SYS) 직원의 급여를 일괄적으로 1,000만원 인상



-- 3) DELETE

-- 특정 조건에 맞는 행 지우기
DELETE FROM vacation
   WHERE end_date <= '2013-12-31';

-- 모든 행 지우기
DELETE FROM vacation;

-- 모든 행 지우기
TRUNCATE TABLE vacation;

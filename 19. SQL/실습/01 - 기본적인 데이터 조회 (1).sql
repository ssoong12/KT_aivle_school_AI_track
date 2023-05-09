/*
기본적인 데이터 조회 (1)
*/


-- 1) 단순 조회

/*
- SELECT 문에 FROM 절이 꼭 필요한 것은 아님
- 특정 값, 계산식 또는 함수 결과를 조회할 수 있음
- AS를 사용해 표시되는 열의 별칭을 지정할 수 있음
*/

-- 문자열 출력
SELECT 'Hello SQL World';

-- 별칭 사용
SELECT 'Hello SQL World' AS Start;

-- 숫자 연산 결과 출력
SELECT 10 + 20 AS Result;

-- 함수 결과 출력
SELECT CURDATE() AS Today;

-- 변수 값 출력
SET @Today = CURDATE();
SELECT @Today;


-- 2) 테이블의 모든 데이터 조회

/*
- 테이블의 모든 행의 모든 열을 조회
- 데이터가 많은 테이블에 대해서는 사용을 자제
*/

-- 데이터베이스 연결
USE hrdb2019;

-- 현재 데이터베이스 확인
SELECT DATABASE();

-- 직원 정보 조회
SELECT * FROM employee;

-- 부서 정보 조회
SELECT * FROM department;


-- 3) 테이블의 일부 열만 조회

/*
- SELECT 절에 일부 열을 보고 싶은 순서로 나열하여 조회
- 꼭 필요한 열을 지정해서 조회해야 함
*/

-- 원하는 열을 원하는 순서로 나열
SELECT emp_name, emp_id, gender, dept_id, phone, salary
	FROM employee;

-- 부서 정보 조회
SELECT dept_id, dept_name
	FROM department;


-- 4) 테이블의 일부 행만 조회

/*
- WHERE 절에 지정한 조건에 맞는 일부 행만 조회
- 꼭 필요한 행만 조회하도록 정확한 조건을 지정해야 함
*/

-- S0001 직원 정보 조회
SELECT *
	FROM employee
	WHERE emp_id = 'S0001';

-- MKT 부서 직원 정보 조회
SELECT *
	FROM employee
	WHERE dept_id = 'MKT';

-- S0002 휴가 정보 조회
SELECT *
	FROM vacation
	WHERE emp_id = 'S0002';
   

-- 5) 테이블의 일부 행의 일부 열만 조회

/*
- 가장 바람직한 형태, 꼭 필요한 열과 행 만을 조회하도록 함
- 열 이름이 잘못 지정되면 오류가 발생
- 조건이 잘못 지정되면 오류 대신 의도하지 않는 결과를 얻을 수 있음
- 지정한 조건에 문제가 없는지 면밀히 검토해야 함
*/

-- S0001 직원 정보 조회
SELECT emp_id, emp_name, dept_id, gender, hire_date
	FROM employee
	WHERE emp_id = 'S0001';

-- SYS 부서 정보 조회
SELECT dept_id, dept_name
	FROM department
	WHERE dept_id = 'SYS';


-- 6) 비교 연산자: =, >, <, >=, <=, <>, !=

/*
- 크기를 비교할 때 사용하는 연산자
- 대부분 WHERE 절에서 조건을 정의할 때 사용
- 정확한 조회 결과를 얻기 위해 신중하고 또 신중해야 할 부분
- 문자, 날짜, 숫자 모두 크기를 비교할 수 있음
*/

-- SYS 부서 직원 정보 조회
SELECT emp_name, emp_id, dept_id, gender, hire_date, phone
	FROM employee
	WHERE dept_id = 'SYS';

-- 연봉이 7,000을 초과하는 직원 정보 조회
SELECT emp_name, emp_id, dept_id, gender, hire_date, salary
	FROM employee
	WHERE salary > 7000;

-- 2015년 3월 이전에 입사한 직원 정보 조회
SELECT emp_name, emp_id, dept_id, gender, hire_date, phone
	FROM employee
	WHERE hire_date < '2015-03-01';

-- SYS 부서가 아닌 직원 정보 조회
SELECT emp_name, emp_id, dept_id, gender, hire_date, phone
	FROM employee
	WHERE dept_id != 'SYS';


-- Q) vacation 테이블 모든 데이터 조회



-- Q) unit 테이블 모든 데이터 조회



-- Q) 남자 직원의 사번, 이름, 입사일 정보 조회



-- Q) 2016년 6월 1일 입사자의 이름, 부서코드, 성별, 이메일 정보 조회

    
    
-- Q) 휴가 기간이 5일 이상인 사번, 휴가시작일, 휴가사유 정보 조회




-- 7) LIKE 연산자

/*
- 문자열 데이터는 숫자나 날짜와 달리 다양한 조건의 검색이 요구됨
*/

-- 김씨 성을 갖는 직원
SELECT emp_id, emp_name, dept_id, hire_date, email, phone
	FROM employee
	WHERE emp_name LIKE '김%';

-- 이름에 '국'이 들어간 직원
SELECT emp_id, emp_name, dept_id, hire_date, email, phone
	FROM employee
	WHERE emp_name LIKE '%국%';

-- 이름이 '국'으로 끝나는 직원
SELECT emp_id, emp_name, dept_id, hire_date, email, phone
	FROM employee
	WHERE emp_name LIKE '%국';

-- 이메일 아이디가 4글자인 직원

SELECT emp_id, emp_name, dept_id, hire_date, email, phone
	FROM employee
	WHERE email LIKE '____@%';
    
    
-- Q) 전화번호가 017로 시작하는 직원 정보 조회



-- Q) 전화번호가 010으로 시작하지 않는 직원 정보 조회



-- 8) 논리 연산자: AND, OR, NOT 

/*
- WHERE 절에 여러 개의 조건을 연결하는 연산자
- AND는 조건을 만족할 수록 결과 행이 줄어듦(긍정적)
- OR는 조건을 만족할 수록 결과 행이 늘어남(부정적)
- NOT은 조건에 대한 부정을 의미함
- 괄호를 사용해 조건을 명확히 식별할 수 있도록 해야 함
*/

-- 2016년에 입사인 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE hire_date >= '2016-01-01' AND hire_date <= '2016-12-31';
    
-- SYS 부서 남자 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE gender = 'M' AND dept_id = 'SYS';

-- SYS, MKT, GEN 부서 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE dept_id = 'SYS' OR dept_id = 'MKT' OR dept_id = 'GEN';


-- Q) 2018년부터 입사한 SYS 부서 직원 정보 조회



-- Q) SYS 부서 직원 중에서 급여를 6,000 이상 받는 직원 정보 조회

    
    
-- 9) 범위 조건(BETWEEN)과 리스트 조건(IN)

/*
- WHERE 절을 단순하게 표시할 수 있는 방법, 가독성 향상
- WHERE 절에 열 이름이 반복되는 문제를 해결함
- NOT을 사용해 부정 조건을 지정할 수 있음
*/

-- 2016년에 입사한 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE hire_date BETWEEN '2016-01-01' AND '2016-12-31';

-- SYS, MKT, GEN 부서 직원 정보 조회
SELECT emp_name, emp_id, dept_id, hire_date, phone
	FROM employee
	WHERE dept_id IN ('SYS', 'MKT', 'GEN');


-- Q) 2014년도에 입사한 정보시스템, 영업팀 직원 정보 조회



-- Q) 2015년도에 입사한 연봉이 6,000 이상인 근무중인 직원 정보 조회



-- Q) 홍길동(S0001), 강우동(S0003), 오삼식(S0005)의 2015년 휴가 정보 조회








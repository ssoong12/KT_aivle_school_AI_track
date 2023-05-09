/*
데이터 집계 (1)
*/


-- 데이터베이스 연결
USE hrdb2019;


-- 1) 집계 함수: SUM, AVG, MAX, MIN, COUNT

/*
- 합, 평균값, 최댓값, 최솟값, 개수를 구함
- 합과 평균값은 숫자에 대해서만 구할 수 있음
- 최댓값, 최솟값, 개수는 문자와 날짜에 대해서 사용 가능
- 날짜의 최솟값 = 가장 빠른(오래된) 날짜
- 날짜의 최댓값 = 가장 최근 날짜
- 행 수를 구할 때는 COUNT(*)를 사용함
*/

-- 근무 중 직원 급여 총액 조회
SELECT SUM(salary) AS tot_salary
	FROM employee
	WHERE retire_date IS NULL;

-- 근무중인 직원의 최대 급여 조회
SELECT MAX(salary) AS max_salary, 
       MIN(salary) AS min_salary
	FROM employee
	WHERE retire_date IS NULL;

-- 근무중인 직원의 최소 급여 조회
SELECT MAX(salary) AS max_salary, 
       MIN(salary) AS min_salary
	FROM employee
	WHERE retire_date IS NULL;
    
-- 근무중인 직원의 급여 개수 조회
SELECT COUNT(salary) AS cnt_salary
	FROM employee
	WHERE retire_date IS NULL;
    
-- 근무 중 직원 수
SELECT COUNT(*) AS emp_count
	FROM employee
	WHERE retire_date IS NULL;

-- 최대 급여, 최소 급여, 최대 최소 급여 차이 조회
SELECT MAX(salary) AS max_salary, 
       MIN(salary) AS min_salary,
	   MAX(salary) - MIN(salary) AS diff_salary
	FROM employee
	WHERE retire_date IS NULL;


-- Q) 홍길동의 2014년 휴가 일수 합계 조회  



-- Q) 가장 최근에 직원이 입사한 날짜 조회

 

-- 2) 집계 함수와 NULL 값

/*
- 집계 함수는 NULL값을 무시함(없는 행으로 간주)
- NULL값이 있는 열에 대한 집계 시 주의 필요
- COUNT(*)은 특정 열을 기준으로 하지 않으므로 NULL 값이 무시되지 않음
*/

-- 근무중인 직원의 급여 평균 조회
SELECT AVG(salary) AS avg_salary
	FROM employee
	WHERE retire_date IS NULL;

-- 급여 합을 직원 수로 나눠서 급여 평균 조회
SELECT SUM(salary) / COUNT(*) AS avg_salary
	FROM employee
	WHERE retire_date IS NULL;

-- 급여가 NULL이면 0으로 대체해서 급여 평균 조회
SELECT AVG(IFNULL(salary, 0)) AS avg_salary
	FROM employee
	WHERE retire_date IS NULL;


-- 3) 그룹별 집계

/*
- 집계 기준열을 지정해 그룹별 집계를 할 수 있음
- 부서별, 남녀별, 지역별, 연도별 등등
*/

-- 부서별 직원수 조회
SELECT dept_id, COUNT(*) AS emp_count
	FROM employee
	WHERE retire_date IS NULL
	GROUP BY dept_id;

-- 남녀별 직원수 조회
SELECT gender, COUNT(*) AS emp_count
	FROM employee
	WHERE retire_date IS NULL
	GROUP BY gender
	ORDER BY gender DESC;

-- 집계 결과 정렬
SELECT gender, COUNT(*) AS emp_count
	FROM employee
	WHERE retire_date IS NULL
	GROUP BY gender
	ORDER BY emp_count ASC;

-- 부서별 급여 합 조회
SELECT dept_id, SUM(IFNULL(salary, 0)) AS tot_salary
	FROM employee
	WHERE retire_date IS NULL
	GROUP BY dept_id;

-- 부서별 최대 급여, 최소 급여, 최대 급여 최소 급여 차이 조회
SELECT dept_id, 
       MAX(salary) AS max_salary, 
       MIN(salary) AS min_salary,
       MAX(salary) - MIN(salary) AS diff_salary
	FROM employee
	WHERE retire_date IS NULL
	GROUP BY dept_id;


-- Q) 근무 중인 직원의 부서별 급여 합 조회



-- Q) 부서별로 급여가 5,000보다 많은 근무중인 직원 수 조회



-- 4) 집계 결과에 대한 조건

/*
- WHERE 절 조건: GROUP BY 하기 전 조건
- HAVING 절 조건: GROUP BY 한 후 조건
- HAVING 없는 GROUP BY는 존재할 수 있지만,
- GROUP BY 없는 HAVING은 존재할 수 없음
*/

-- 근무중인 직원이 3명 이상인 부서별 근무중인 직원 수 조회
SELECT dept_id, COUNT(*) AS emp_count
	FROM employee
	WHERE retire_date IS NULL
	GROUP BY dept_id
	HAVING COUNT(*) >= 3
	ORDER BY emp_count DESC;

-- HAVING 절에 열 별칭 사용 가능(권고하지 않음)
SELECT dept_id, COUNT(*) AS emp_count
	FROM employee
	WHERE retire_date IS NULL
	GROUP BY dept_id
	HAVING emp_count >= 3
	ORDER BY emp_count DESC;
    

-- Q) 2017년 휴가일수 합이 5가 넘는 직원의 사번과 휴가일수 합 조회



-- Q) 2017년에 3회 이상 휴가를 간 직원의 사번과 휴가 횟수 조회



/*
참고01 - 함수 익히기
*/


/*
A. 문자열 관련 함수
*/

-- 1) LENGTH() - 문자열 바이트 수 확인 (SQLite)

SELECT LENGTH('홍길동'); -- 9


-- 2) CONCAT() - 문자열 연결

SELECT CONCAT('ABC', 'DEF', 'HIJ', 'KLMN'); -- ABCDEFHIJKLMN


-- 3) 지정한 구분자를 사용해 문자열 연결

SELECT CONCAT_WS('/', 'ABC', 'DEF', 'HIJ', 'KLMN'); -- ABC/DEF/HIJ/KLMN


-- 4) ELT() - 나열된 문자열에서 지정한 위치의 문자열 확인

SELECT ELT(3, '나', '너', '우리', '우리나라'); -- 우리


-- 5) FILED() - 나열된 문자열에서 지정한 문자열이 있는 위치 확인, 없으면 0

SELECT FIELD('우리', '나', '너', '우리', '우리나라'); -- 3
SELECT FIELD('대한민국', '나', '너', '우리', '우리나라'); -- 0


-- 6) INSTR() - 문자열에서 지정한 문자열이 나타나는 위치 확인, 없으면 0 (SQLite)

SELECT INSTR('우리나라 대한민국', '나라'); -- 3
SELECT INSTR('우리나라 대한민국', '너'); -- 0


-- 7) LOCATE() - 문자열에서 지정한 문자열이 나타나는 위치 확인, 없으면 0

SELECT LOCATE('나라', '우리나라 대한민국'); -- 3
SELECT LOCATE('너', '우리나라 대한민국'); -- 0


-- 8) LEFT() - 왼쪽부터 지정한 길이의 문자열 추출

SELECT LEFT('가나다라마바사아', 5); -- 가나다라마


-- 9) RIGHT() -- 오른쪽부터 지정한 길이의 문자열 추출

SELECT RIGHT('가나다라마바사아', 5); -- 라마바사아


-- 10) UPPER() - 모든 문자를 대문자로 변경 (SQLite)

SELECT UPPER('I have a Dream.'); -- I HAVE A DREAM.


-- 11) LOWER() - 모든 문자를 소문자로 변경 (SQLite)

SELECT LOWER('I have a Dream.'); -- i have a dream.


-- 12) LPAD() - 왼쪽에 지정한 문자를 채워 지정한 길이의 문자열을 만듦

SELECT LPAD('대한민국', 10, '*'); -- ******대한민국


-- 13) RPAD() - 오른쪽에 지정한 문자를 채워 지정한 길이의 문자열을 만듦

SELECT RPAD('대한민국', 10, '*'); -- 대한민국******


-- 14) LTRIM() - 왼쪽 공백 제거 (SQLite)

SELECT CONCAT('[', LTRIM('   대한민국   '), ']'); -- [대한민국   ]


-- 15) RTRIM() - 오른쪽 공백 제거 (SQLite)

SELECT CONCAT('[', RTRIM('   대한민국   '), ']'); -- [   대한민국]


-- 16) TRIM() - 양쪽 공백, 또는 지정한 문자 제거 (SQLite)

SELECT CONCAT('[', TRIM('   대한민국   '), ']'); -- [대한민국]


-- 17) REPLACE() -- 문자열의 특정 문자열 변경 (SQLite)

SELECT REPLACE('우리나라 대한민국', ' ', ''); -- 우리나라대한민국


-- 18) REPEAT() -- 문자열을 지정한 횟수만큼 반복

SELECT REPEAT('만세!', 3); -- 만세!만세!만세!


-- 19) REVERSE() -- 문자열 뒤집기

SELECT REVERSE('쓰레기통'); -- 통기레쓰


-- 20) SPACE() - 지정한 길이만큼 공백으로 채워진 문자열

SELECT CONCAT('너', SPACE(10), '나'); -- 너          나


-- 21) SUBSTRING() -- 지정한 위치에서 지정한 길이 만큼의 문자열 추출 (SQLite, MID 함수 제외)

SELECT SUBSTR('아름다운 대한민국', 6, 2); -- 대한
SELECT SUBSTRING('아름다운 대한민국', 6, 2); -- 대한
SELECT MID('아름다운 대한민국', 6, 2); -- 대한



/*
B. 날짜/시간 관련 함수
*/

-- 22) ADDTIME() - 시간 더하기

SELECT ADDTIME('2019-12-25 09:00:00', '01:30:40'); -- 2019-12-25 10:30:40
SELECT ADDTIME('2019-12-25 09:00:00', '35:30:40'); -- 2019-12-26 20:30:40


-- 23) SUBTIME() - 시간 빼기

SELECT SUBTIME('2019-12-25 09:00:00', '01:30:40'); -- 2019-12-25 07:29:20
SELECT SUBTIME('2019-12-25 09:00:00', '35:30:40'); -- 2019-12-23 21:29:20


-- 24) ADDDATE() -- 날 더하기

SELECT ADDDATE('2019-12-25 09:00:00', INTERVAL 15 DAY); -- 2020-01-09 09:00:00


-- 25) SUBDATE() - 날 빼기

SELECT SUBDATE('2019-12-25 09:00:00', INTERVAL 15 DAY); -- 2019-12-10 09:00:00


-- 26) CURDATE() - 현재 날짜 확인

SELECT CURDATE(); -- 2020-01-06


-- 27) CURTIME() - 현재 시간 확인

SELECT CURTIME(); -- 16:12:47


-- 28) NOW() - 현재 날짜와 시간 확인

SELECT NOW(); -- 2020-01-06 16:13:03


-- 29) SYSDATE() - 현재 날짜와 시간 확인

SELECT SYSDATE(); -- 2020-01-06 16:13:22


-- 30) YEAR() -- 지정한 날짜의 년 확인

SELECT YEAR(NOW()); -- 2020 


-- 31) QUARTER() - 지정한 날짜의 분기 확인

SELECT QUARTER(NOW()); -- 1


-- 32) MONTH() -- 지정한 날짜의 월 확인

SELECT MONTH(NOW()); -- 1


-- 33) DAY() -- 지정한 날짜의 일 확인

SELECT DAY(NOW()); -- 6 


-- 34) DATE() -- 지정한 날짜와 시간에서 날짜 확인 (SQLite, 사용 방법이 조금 다름)

SELECT DATE(NOW()); -- 2020-01-06


-- 35) TIME() -- 지정한 날짜와 시간에서 시간 확인 (SQLite, 사용 방법이 조금 다름)

SELECT TIME(NOW()); -- 16:16:21


-- 36) DATEDIFF() - 두 날짜와 시간의 일수 차이 확인

SELECT DATEDIFF('2020-12-25 00:00:00', NOW()); -- 354


-- 37) DAYOFWEEK() - 요일 확인

SELECT DAYOFWEEK(NOW()); -- 2 (일요일: 1 ~ 토요일: 7)


-- 38) DATE_FORMAT() - 날짜를 지정한 형태의 문자열로 바꾸기

SELECT DATE_FORMAT(NOW(), '%Y-%m-%d'); -- 2020-01-06
SELECT DATE_FORMAT(NOW(), '%Y.%m.%d'); -- 2020.01.06
SELECT DATE_FORMAT(NOW(), '%/%m/%d'); -- 2020/01/06
SELECT DATE_FORMAT(NOW(), '%Y%m%d'); -- 20200106
SELECT DATE_FORMAT(NOW(), '%Y년%m월%d일'); -- 2020년01월06일


/*
C. 숫자 관련 함수 
*/

-- 39) FORMAT() -- 숫자 표시 형식 지정

SELECT FORMAT(112345.7890, 2); -- 112,345.79


-- 40) ABS() - 절대값으로 바꾸기 (SQLite)

SELECT ABS(-30); -- 30


-- 41) CEILING() - 지정한 수보다 큰 가장 가까운 정수 확인

SELECT CEILING(15.4); -- 16


-- 42) FLOOR() - 지정한 수보다 작은 가장 가까운 정수 확인

SELECT FLOOR(15.7); -- 15


-- 43) ROUND() - 반올림한 정수 (SQLite)

SELECT ROUND(15.649); -- 16
SELECT ROUND(15.649, 2); -- 15.65


-- 44) MOD() - 나머지 확인

SELECT MOD(5, 2); -- 1


-- 45) POW() - 제곱 확인

SELECT POW(4, 3);  -- 64


-- 46) SQRT() - 제곱근 확인

SELECT SQRT(4); -- 2


-- 47) TRUNCATE() - 지정한 위치 까지의 수만 취하고 나머지는 버림

SELECT TRUNCATE(1234.567, 2); -- 1234.56
SELECT TRUNCATE(1234.567, 1); -- 1234.5
SELECT TRUNCATE(1234.567, 0); -- 1234
SELECT TRUNCATE(1234.567, -1); -- 1230
SELECT TRUNCATE(1234.567, -2); -- 1200


-- 48) GREATEST() - 나열된 값 중에서 가장 큰 값 확인 (SQLite MAX())

SELECT GREATEST(10, 12, 11, 34, 21); -- 34


-- 49) LEAST() - 나열된 값 중에서 가장 작은 값 확인 (SQLite MIN())

SELECT LEAST(10, 12, 11, 34, 21); -- 10


/*
D. 기타 함수
*/


-- 50) IFNULL() - NULL 값은 다른 값으로 바꾸기 (SQLite)

SELECT IFNULL(NULL, 10); -- 10


-- 51) NULLIF() - 두 값이 같으면 NULL (SQLite)

SELECT NULLIF(10, 10); -- NULL


-- 52) COALESCE() - 나열된 값 중에서 NULL이 아닌 첫번 째 값 확인 (SQLite)

SELECT COALESCE(NULL, NULL, 10, 20); -- 10


-- 53) IF() - 조건에 따른 값 선택 (SQLite IIF())

SELECT IF(10 > 1, '참', '거짓'); -- 참

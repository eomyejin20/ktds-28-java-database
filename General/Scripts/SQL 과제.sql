/*각 문제를 풀고 문제 마다 조회된 ROW의 수를 댓글로 작성하세요.

* 깃헙 링크 X, 파일 업로드 X

예> 1번: 107개
   2번: 107개
   ...
*/

-- 1. 사원 테이블의 모든 컬럼과 모든 행을 조회하시오.
SELECT EMPLOYEE_ID 
	 , FIRST_NAME 
	 , LAST_NAME 
	 , EMAIL 
	 , PHONE_NUMBER 
	 , HIRE_DATE 
	 , JOB_ID 
	 , SALARY 
	 , COMMISSION_PCT 
	 , MANAGER_ID 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
;

-- 2. 사원의 이름과 급여만 조회하시오.
SELECT FIRST_NAME 
	 , SALARY  
  FROM EMPLOYEES
;

-- 3. 모든 사원의 이름, 성, 급여를 조회하시오.
SELECT FIRST_NAME 
	 , LAST_NAME 
	 , SALARY 
  FROM EMPLOYEES
;
-- 4. 모든 사원의 이름과 성을 조회하시오.
SELECT FIRST_NAME 
	 , LAST_NAME 
  FROM EMPLOYEES
;
-- 5. 모든 사원의 연봉(SALARY * 12)을 조회하시오.
SELECT SALARY * 12
  FROM EMPLOYEES
;

-- 6. 모든 부서명을 중복 없이 조회하시오.
SELECT DISTINCT DEPARTMENT_NAME
  FROM DEPARTMENTS
;
-- 7. 직무 ID와 직무명을 조회하시오.
SELECT JOB_ID 
	 , JOB_TITLE 
  FROM JOBS
;

-- 8. 모든 사원을 급여가 높은 순으로 정렬해 조회하시오.
SELECT EMPLOYEE_ID 
	 , FIRST_NAME 
	 , LAST_NAME 
	 , EMAIL 
	 , PHONE_NUMBER 
	 , HIRE_DATE 
	 , JOB_ID 
	 , SALARY 
	 , COMMISSION_PCT 
	 , MANAGER_ID 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 ORDER BY SALARY DESC
;
-- 9. 모든 사원을 입사일이 빠른 순으로 정렬해 조회하시오.
SELECT EMPLOYEE_ID 
	 , FIRST_NAME 
	 , LAST_NAME 
	 , EMAIL 
	 , PHONE_NUMBER 
	 , HIRE_DATE 
	 , JOB_ID 
	 , SALARY 
	 , COMMISSION_PCT 
	 , MANAGER_ID 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 ORDER BY HIRE_DATE ASC
;
-- 10. 사원을 부서번호 오름차순, 같은 부서 내에서는 급여 내림차순으로 정렬해 조회하시오.
SELECT EMPLOYEE_ID 
	 , FIRST_NAME 
	 , LAST_NAME 
	 , EMAIL 
	 , PHONE_NUMBER 
	 , HIRE_DATE 
	 , JOB_ID 
	 , SALARY 
	 , COMMISSION_PCT 
	 , MANAGER_ID 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 ORDER BY
;
-- 11. 사원을 '성'기준 알파벳순으로 정렬해 이름과 성을 조회하시오.

-- 12. 모든 부서의 정보를 부서명 기준 오름차순으로 정렬해 모든 정보를 조회하시오.

-- 13. 커미션이 있는 사원만 커미션이 높은 순으로 정렬해 모든 정보를 조회하시오.

-- 14. 급여가 10000 이상인 사원을 조회하시오.

-- 15. 급여가 5000 이상 10000 이하인 사원을 BETWEEN으로 조회하시오.

-- 16. 부서번호가 50, 60, 90인 사원을 조회하시오.

-- 17. 성이 'King'인 사원을 조회하시오.

-- 18. 커미션이 없는 사원을 조회하시오.

-- 19. 커미션이 있는 사원을 조회하시오.

-- 20. 부서번호가 50이면서 급여가 5000을 초과하는 사원을 조회하시오.

-- 21. 부서번호가 10이거나 20인 사원을 조회하시오.

-- 22. 직무아이디가 'IT_PROG'가 아닌 사원을 조회하시오.

-- 23. 입사일이 2005년 1월 1일 이후인 사원을 조회하시오.

-- 24. 상사가 없는 최상위 사원을 조회하시오.

-- 25. 입사일을 "YYYY-MM-DD" 형식의 문자열로 변환해 조회하시오.

-- 26. 입사일을 "YYYY년 MM월 DD일" 형식으로 변환해 조회하시오.
-- 날짜 포멧에 한글이 들어갈 경우 ORACLE 에러 발생!
-- 아래처럼 큰 따옴표("") 이용하면 에러 없음.
-- SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일"')
--   FROM DUAL

-- 27. 각 사원의 입사일로부터 6개월 후의 날짜를 조회하시오.
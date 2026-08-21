--	MENU 임시테이블 만들기
WITH MENU AS (
	SELECT '1000' AS MENU_ID
		 , '브랜드패션' AS MENU_NAME
		 , NULL AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2000' AS MENU_ID
		 , '패션의류/잡화/뷰티' AS MENU_NAME
		 , NULL AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1100' AS MENU_ID
		 , '브랜드의류' AS MENU_NAME
		 , '1000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1200' AS MENU_ID
		 , '브랜드잡화' AS MENU_NAME
		 , '1000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1300' AS MENU_ID
		 , '스포츠브랜드' AS MENU_NAME
		 , '1000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2100' AS MENU_ID
		 , '패션의류' AS MENU_NAME
		 , '2000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2200' AS MENU_ID
		 , '잡화' AS MENU_NAME
		 , '2000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2300' AS MENU_ID
		 , '뷰티' AS MENU_NAME
		 , '2000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1101' AS MENU_ID
		 , '브랜드 여성의류' AS MENU_NAME
		 , '1100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1102' AS MENU_ID
		 , '브랜드 남성의류' AS MENU_NAME
		 , '1100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1103' AS MENU_ID
		 , '브랜드 캐쥬얼의류' AS MENU_NAME
		 , '1100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1201' AS MENU_ID
		 , '브랜드 잡화' AS MENU_NAME
		 , '1200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1202' AS MENU_ID
		 , '브랜드 쥬얼리/시계' AS MENU_NAME
		 , '1200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1203' AS MENU_ID
		 , '수입명품' AS MENU_NAME
		 , '1200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1301' AS MENU_ID
		 , '브랜드 아웃도어' AS MENU_NAME
		 , '1300' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1302' AS MENU_ID
		 , '브랜드 스포츠패션' AS MENU_NAME
		 , '1300' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2101' AS MENU_ID
		 , '여성의류' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2102' AS MENU_ID
		 , '남성의류' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2103' AS MENU_ID
		 , '언더웨어' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2104' AS MENU_ID
		 , '유아동의류' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2201' AS MENU_ID
		 , '신발' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2202' AS MENU_ID
		 , '가방/잡화' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2203' AS MENU_ID
		 , '유아동 신발/잡화' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2203' AS MENU_ID
		 , '쥬얼리/시계' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2204' AS MENU_ID
		 , '수입명품' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2301' AS MENU_ID
		 , '화장품/향수' AS MENU_NAME
		 , '2300' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2302' AS MENU_ID
		 , '바디/헤어' AS MENU_NAME
		 , '2300' AS TOP_MENU_ID
      FROM DUAL
)
-- 재귀 조인을 이용한 계층데이터 조회
-- 모든 상위 하위 메뉴가 조회
--후위탐색
 SELECT MENU_ID
	  , MENU_NAME
	  , TOP_MENU_ID
	  , LEVEL --degree
   FROM MENU
  START WITH MENU_ID = 1203
CONNECT BY PRIOR TOP_MENU_ID = MENU_ID
;

-- 전위탐색
-- 브랜드 패션(1000) 메뉴의 모든 하위 메뉴를 조회한다.
-- SELECT MENU_ID
--	  , MENU_NAME
--	  , TOP_MENU_ID
--	  , LEVEL --degree
--   FROM MENU
--  START WITH MENU_ID = 1000
--CONNECT BY PRIOR MENU_ID = TOP_MENU_ID
--;



--재귀 참조를 이용한 조인
--해당 메뉴의 하위나 상위 하나만 조회
--SELECT M_TOP.MENU_ID
--	 , M_TOP.MENU_NAME
--	 , M_TOP.TOP_MENU_ID
--	 , M_SUB.MENU_ID
--	 , M_SUB.MENU_NAME
--	 , M_SUB.TOP_MENU_ID
--  FROM MENU M_TOP
-- INNER JOIN MENU M_SUB
--    ON M_TOP.MENU_ID = M_SUB.TOP_MENU_ID 
-- 브랜드패션(1000) 메뉴의 하위 메뉴를 조회한다. (1100, 1200, 1300)
 -- WHERE M_TOP.MENU_ID = 1000
 -- 패션의류/잡화/뷰티(2000) 메뉴의 하위 메뉴를 조회한다. (2100, 2200, 2300)
 -- WHERE M_TOP.MENU_ID = 2000
 -- 브랜드잡화(1200) 메뉴의 하위 메뉴를 조회한다. (1201, 1202, 1203)
 -- WHERE M_TOP.MENU_ID = 1200
 -- 유아동 신발/잡화(2203) 메뉴의 하위 메뉴를 조회한다.
 --  WHERE M_TOP.MENU_ID = 2203
 -- 브랜드 캐쥬얼의류(1103) 메뉴의 부모 메뉴의 이름을 조회한다. (브랜드의류(1100))
 --  WHERE M_SUB.MENU_ID = 1103
 -- 브랜드의류(1100) 메뉴의 부모 메뉴의 이름을 조회한다. (브랜드패션(1000))
 -- WHERE M_SUB.MENU_ID = 1100
 -- 브랜드패션(1000) 메뉴의 부모 메뉴의 이름을 조회한다.
 -- WHERE M_SUB.MENU_ID = 1000



-- ERD
-- 테이블 조인+그룹핑
--직무명 별 수행중인 사원의 수를 조회한다.
SELECT J.JOB_TITLE 
	 , COUNT(E.EMPLOYEE_ID )
  FROM EMPLOYEES E
 INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID 
 GROUP BY J.JOB_TITLE 
;
--직무명 별 수행중인 사원의 수를 조회한다. 직무명으로 오름차순 정렬
SELECT J.JOB_TITLE 
	 , COUNT(E.EMPLOYEE_ID )
  FROM EMPLOYEES E
 INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID 
 GROUP BY J.JOB_TITLE 
 ORDER BY J.JOB_TITLE ASC
;
-- 직무명 별 수행중인 사원의 수를 조회한다. 사원의수로 내림차순 정렬
SELECT J.JOB_TITLE 
	 , COUNT(E.EMPLOYEE_ID ) AS EMP_CNT
  FROM EMPLOYEES E
 INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID 
 GROUP BY J.JOB_TITLE 
 ORDER BY EMP_CNT DESC
;

-- 테이블 조인+ 조건
-- 108번 사원의 이름과 부서명을 조회한다.
SELECT E.FIRST_NAME 
	 , D.DEPARTMENT_NAME 
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
 	ON E.DEPARTMENT_ID  = D.DEPARTMENT_ID 
 WHERE E.EMPLOYEE_ID = 108 
;
 -- 108번 사원의 이름과 부서명을 조회한다.최적화
 SELECT E.FIRST_NAME 
 	  , D.DEPARTMENT_NAME 
   FROM EMPLOYEES E
  INNER JOIN DEPARTMENTS D
     ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
    AND E.EMPLOYEE_ID = 108
;  

-- 위 코드 최적화
 SELECT E.FIRST_NAME 
 	  , D.DEPARTMENT_NAME 
   FROM EMPLOYEES E
  INNER JOIN DEPARTMENTS D
     ON E.EMPLOYEE_ID = 108
    AND E.DEPARTMENT_ID = D.DEPARTMENT_ID 
;

-- 직무 아이디가 AD_VP이거나 부서의 번호가 70번인 사원의 이름, 직무명, 부서명을 조회한다.
SELECT E.FIRST_NAME 
	 , J.JOB_TITLE 
	  , E.DEPARTMENT_ID 
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID  = D.DEPARTMENT_ID 
 INNER JOIN JOBS j 
    ON E.JOB_ID = J.JOB_ID
 WHERE J.JOB_ID = 'AD_VP'
    OR E.DEPARTMENT_ID = 70
;
 
-- 직무명이 'Administration Vice President'이거나 부서의 번호가 70번인 사원의 이름, 직무명, 부서명을 조회한다.
-- 추출할 테이블이 아닐경우 JOIN x -> WHERE에서 
SELECT E.FIRST_NAME 
	 , D.DEPARTMENT_NAME 
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID  = D.DEPARTMENT_ID 
 WHERE D.DEPARTMENT_ID  = 70
 	OR E.JOB_ID = (SELECT JOB_ID
 					 FROM JOBS
 					WHERE JOB_TITLE = 'Administration Vice President')
;

-- Europe에 근무중인(서브쿼리로 ) 모든사원의 이름과 근무중인 도시를 조회한다.
SELECT E.FIRST_NAME 
	 , L.CITY 
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = E.DEPARTMENT_ID 
 INNER JOIN LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID 
 WHERE L.COUNTRY_ID IN (SELECT COUNTRY_ID 
  						  FROM COUNTRIES
						 WHERE REGION_ID = (SELECT REGION_ID 
 											  FROM REGIONS
 											 WHERE REGION_NAME = 'Europe' ))
;


--Europe에 존재하는 국가의 아이디들
SELECT COUNTRY_ID 
  FROM COUNTRIES
 WHERE REGION_ID = Europe의 REGION_ID 

 -- Europe의 REGION_ID 
SELECT REGION_ID 
  FROM REGIONS
 WHERE REGION_NAME = 'Erope'





------------------------------------------------------------
 -- 테이블 조인(여러 테이블을 관계를 이용해 하나의 테이블로 만드는 과정) 연습
-- 직무가 변경된 사원들의 사원번호, 이름, 급여, 현재 수행중인 직무의 이름, 
--      과거에 근무했던 부서의 이름, 현재 근무중인 부서의 이름을 조회한다.
SELECT E.EMPLOYEE_ID
	 , E.FIRST_NAME
	 , E.SALARY
	 , J.JOB_TITLE
	 , D_PAST.DEPARTMENT_NAME AS PAST_DEPT_NAME
	 , D_PRESENT.DEPARTMENT_NAME AS PRESENT_DEPT_NAME
  FROM EMPLOYEES E
 INNER JOIN JOB_HISTORY JH
    ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID
 INNER JOIN JOBS J
 	ON J.JOB_ID = E.JOB_ID
 INNER JOIN DEPARTMENTS D_PRESENT
    ON D_PRESENT.DEPARTMENT_ID = E.DEPARTMENT_ID
 INNER JOIN DEPARTMENTS D_PAST
    ON D_PAST.DEPARTMENT_ID = JH.DEPARTMENT_ID
;



-- 3개 이상의 테이블 조인 방법
-- 사원 + 부서 + 직무
SELECT *
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D -- 사원 + 부서
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 INNER JOIN JOBS J -- 사원 + 직무
    ON E.JOB_ID = J.JOB_ID
;
-- 사원 + 부서 + 직무 + 지역
SELECT *
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D -- 사원 + 부서
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 INNER JOIN JOBS J -- 사원 + 직무
    ON J.JOB_ID = E.JOB_ID
 INNER JOIN LOCATIONS L -- 부서 + 지역
    ON L.LOCATION_ID = D.LOCATION_ID
;
-- 사원 + 부서 + 지역 + 국가 + 대륙
SELECT *
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D -- 사원 + 부서
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 INNER JOIN LOCATIONS L -- 부서 + 지역
    ON L.LOCATION_ID = D.LOCATION_ID
 INNER JOIN COUNTRIES C -- 지역 + 국가
    ON C.COUNTRY_ID = L.COUNTRY_ID
 INNER JOIN REGIONS R -- 국가 + 대륙
    ON R.REGION_ID = C.REGION_ID
;
-- 사원 테이블 + 부서 테이블 ==> 사원_부서
-- 사원의 이름, 사원의 성, 급여, 부서장의 사원번호, 부서명
SELECT E.FIRST_NAME
	 , E.LAST_NAME
	 , E.SALARY
	 , D.MANAGER_ID
	 , D.DEPARTMENT_NAME
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
;

-- 사원의 이름과 성, 직무아이디, 직무의 이름, 급여, 최대 급여, 최소 급여를 조회한다.
SELECT E.FIRST_NAME
	 , E.LAST_NAME
	 , J.JOB_ID
	 , J.JOB_TITLE
	 , E.SALARY
	 , J.MAX_SALARY
	 , J.MIN_SALARY
  FROM EMPLOYEES E
 INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID
;


-- 80번 부서의 부서장으로 근무하는 사원의 직무명을 조회한다.
-- 1. 80번 부서의 부서장의 직무아이디를 조회한다.
SELECT JOB_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 80번 부서의 부서장 사원번호
;
SELECT MANAGER_ID -- 145
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = 80
;
SELECT JOB_ID -- SA_MAN
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = (SELECT MANAGER_ID -- 145
					    FROM DEPARTMENTS
					   WHERE DEPARTMENT_ID = 80)
;
-- 2. 80번 부서의 부서장 사원의 직무 명을 조회한다.
SELECT JOB_TITLE
  FROM JOBS
 WHERE JOB_ID = 80번 부서 부서장의 직무 아이디
;
SELECT JOB_TITLE -- Sales Manager
  FROM JOBS
 WHERE JOB_ID = (SELECT JOB_ID -- SA_MAN
				   FROM EMPLOYEES
				  WHERE EMPLOYEE_ID = (SELECT MANAGER_ID -- 145
									     FROM DEPARTMENTS
									    WHERE DEPARTMENT_ID = 80))
;
-- 103번 사원이 근무중인 부서의 이름을 조회한다.
SELECT DEPARTMENT_NAME
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
						  FROM EMPLOYEES
						 WHERE EMPLOYEE_ID = 103)
;

SELECT DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 103
;
-- 118번 사원이 근무중인 부서의 도시명을 조회한다.
-- 1. 118번 사원이 근무중인 부서의 지역 번호를 조회한다.
SELECT LOCATION_ID -- 1700
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
						  FROM EMPLOYEES
						 WHERE EMPLOYEE_ID = 118)
;
SELECT DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 118
; 
-- 2. 118번 사원이 근무중인 지역 번호로 도시명을 조회한다.
SELECT CITY
  FROM LOCATIONS
 WHERE LOCATION_ID = (SELECT LOCATION_ID -- 1700
						FROM DEPARTMENTS
					   WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
												FROM EMPLOYEES
											   WHERE EMPLOYEE_ID = 118))
;
-- 'Seattle' 에서 근무중인 사원들의 직무 명을 중복없이 조회한다.
-- 1. 'Seattle' 에 존재하는 부서의 번호
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE LOCATION_ID = 'Seattle'의 지역 번호
;
SELECT LOCATION_ID
  FROM LOCATIONS
 WHERE CITY = 'Seattle'
;

SELECT DEPARTMENT_ID -- 10, 30, 90, 100, 110, ...
  FROM DEPARTMENTS
 WHERE LOCATION_ID = (SELECT LOCATION_ID
					    FROM LOCATIONS
					   WHERE CITY = 'Seattle')
;

-- 2. 'Seattle'에 존재하는 부서에서 근무하는 사원들의 JOB_ID
SELECT JOB_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN ('Seattle' 에 존재하는 부서의 번호)
;
SELECT DISTINCT JOB_ID -- AD_ASST, PU_MAN, PU_CLERK, ...
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID -- 10, 30, 90, 100, 110, ...
						   FROM DEPARTMENTS
						  WHERE LOCATION_ID = (SELECT LOCATION_ID -- 10, 30, 90, 100, 110, ...
											     FROM LOCATIONS
											    WHERE CITY = 'Seattle'))
;
-- 3. 'Seattle'에 존재하는 부서에서 근무하는 사원들의 직무명
SELECT JOB_TITLE
  FROM JOBS
 WHERE JOB_ID IN ('Seattle'에 존재하는 부서에서 근무하는 사원들의 JOB_ID)
;
SELECT JOB_TITLE
  FROM JOBS
 WHERE JOB_ID IN (SELECT DISTINCT JOB_ID -- AD_ASST, PU_MAN, PU_CLERK, ...
				    FROM EMPLOYEES
				   WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID -- 10, 30, 90, 100, 110, ...
										     FROM DEPARTMENTS
										    WHERE LOCATION_ID = (SELECT LOCATION_ID -- 10, 30, 90, 100, 110, ...
															       FROM LOCATIONS
															      WHERE CITY = 'Seattle')))
;
-- 102번 사원이 수행중인 직무의 이름과 최대 급여, 최소 급여를 조회한다.
SELECT JOB_TITLE
	 , MAX_SALARY
	 , MIN_SALARY
  FROM JOBS
 WHERE JOB_ID = (SELECT JOB_ID
				   FROM EMPLOYEES
				  WHERE EMPLOYEE_ID = 102)
;
SELECT JOB_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 102
;
-- Seattle에 있는 부서의 이름과 부서장의 사원 번호를 조회한다.
SELECT DEPARTMENT_NAME
	 , MANAGER_ID
  FROM DEPARTMENTS
 WHERE LOCATION_ID = (SELECT LOCATION_ID
					    FROM LOCATIONS
					   WHERE CITY = 'Seattle')
;
SELECT LOCATION_ID
  FROM LOCATIONS
 WHERE CITY = 'Seattle'
;
-- Asia에서 근무중인 사원들의 이름과 성, 부서 번호를 조회한다.
-- 1. 'Asia'에 존재하는 국가 아이디를 조회한다.
SELECT COUNTRY_ID
  FROM COUNTRIES
 WHERE REGION_ID = 'Asia'의 대륙 아이디
;
SELECT REGION_ID -- 3
  FROM REGIONS
 WHERE REGION_NAME = 'Asia'
;
SELECT COUNTRY_ID -- AU, CN, IN, JP, ML, SG
  FROM COUNTRIES
 WHERE REGION_ID = (SELECT REGION_ID -- 3
					  FROM REGIONS
					 WHERE REGION_NAME = 'Asia')
;
-- 2. 'Asia'에 존재하는 국가의 지역번호를 조회한다.
SELECT LOCATION_ID
  FROM LOCATIONS
 WHERE COUNTRY_ID IN ('Asia'에 존재하는 국가 아이디)
;
SELECT LOCATION_ID -- 1200, 1300, 2000, 2100, 2200, 2300
  FROM LOCATIONS
 WHERE COUNTRY_ID IN (SELECT COUNTRY_ID -- AU, CN, IN, JP, ML, SG
					    FROM COUNTRIES
					   WHERE REGION_ID = (SELECT REGION_ID -- 3
										    FROM REGIONS
										   WHERE REGION_NAME = 'Asia'))
;
-- 3. 'Asia'에 존재하는 지역의 부서번호를 조회한다.
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE LOCATION_ID IN ('Asia'에 존재하는 국가의 지역번호)
;

SELECT DEPARTMENT_ID -- NULL
  FROM DEPARTMENTS
 WHERE LOCATION_ID IN (SELECT LOCATION_ID -- 1200, 1300, 2000, 2100, 2200, 2300
						 FROM LOCATIONS
						WHERE COUNTRY_ID IN (SELECT COUNTRY_ID -- AU, CN, IN, JP, ML, SG
											   FROM COUNTRIES
											  WHERE REGION_ID = (SELECT REGION_ID -- 3
																   FROM REGIONS
																  WHERE REGION_NAME = 'Asia')))
;
-- 4. 'Asia'에 존재하는 부서에서 근무하는 사원의 정보를 조회한다.
SELECT FIRST_NAME
	 , LAST_NAME
	 , DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN ('Asia'에 존재하는 지역의 부서번호)
;
SELECT FIRST_NAME
	 , LAST_NAME
	 , DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID -- NULL
						   FROM DEPARTMENTS
						  WHERE LOCATION_ID IN (SELECT LOCATION_ID -- 1200, 1300, 2000, 2100, 2200, 2300
												  FROM LOCATIONS
												 WHERE COUNTRY_ID IN (SELECT COUNTRY_ID -- AU, CN, IN, JP, ML, SG
																	    FROM COUNTRIES
																	   WHERE REGION_ID = (SELECT REGION_ID -- 3
																						    FROM REGIONS
																						   WHERE REGION_NAME = 'Asia'))))
;
















------------------------------------------------------------

-- 평균 급여보다 많은 급여를 받는 사원의 이름, 성, 급여를 조회한다.
-- 1. 특정할 수 없는 데이터는 무엇인가? 평균 급여
SELECT AVG(SALARY)
  FROM EMPLOYEES
;
-- 2. 특정할 수 없는 평균 급여를 무엇과 비교를 해야하는가? 급여
SELECT FIRST_NAME 
	 , LAST_NAME 
	 , SALARY 
  FROM EMPLOYEES
 WHERE SALARY > 6461.831775700934579439252336448598130841
;

-- 3. 두 쿼리를 하나로 합친다.
SELECT FIRST_NAME 
	 , LAST_NAME 
	 , SALARY 
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY)
  			 	   FROM EMPLOYEES)
;

-- IT부서에서 근무중인 사원들의 부서번호와 이름을 조회한다.
-- 1. 특정할 수 없는 것? IT부서의 부서 번호
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE DEPARTMENT_NAME = 'IT'
;
-- 2. 무엇과 비교를 해야하는가? 부서 번호
SELECT DEPARTMENT_ID
	 , FIRST_NAME
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 60
;

-- 3. 두 쿼리를 하나로 합칩다.
SELECT DEPARTMENT_ID
	 , FIRST_NAME
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
  						  FROM DEPARTMENTS
 						 WHERE DEPARTMENT_NAME = 'IT')
;


-- "Marketing Representative" 이름의 직무를 수행 중인 사원의 직무 아이디, 급여를 조회한다.
-- 1. 특정할 수 없는 것? "Marketing Representative" 직무 이름의 직무 아이디
SELECT JOB_ID --'MK_REP'
  FROM JOBS
 WHERE JOB_TITLE = 'Marketing Representative'
;
-- 2. 무엇과 비교해야하는지? 직무 아이디
SELECT JOB_ID 
	 , SALARY 
  FROM EMPLOYEES
 WHERE JOB_ID  = 'MK_REP'
;
-- 3. 하나로 합친다
SELECT JOB_ID 
	 , SALARY 
  FROM EMPLOYEES
 WHERE JOB_ID = (SELECT JOB_ID
 				   FROM JOBS
 				  WHERE JOB_TITLE = 'Marketing Representative')
;

-- 부서번호 별 사원의 수, 급여의 총합을 조회한다.
-- 이 때, 사원의 수가 2 이상인것과 급여의 총합이 20000이상인 것만 조회
SELECT DEPARTMENT_ID 
	 , COUNT(EMPLOYEE_ID )
	 , SUM(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID) >= 2
   AND SUM(SALARY) >= 20000
;
-- 같은 급여를 받는 사원들은 몇명인지 급여별 사원의 수를 조회한다.
-- 이 때, 사원의 수가 1인 것은 제외한다.
SELECT COUNT(EMPLOYEE_ID)
     , SALARY 
  FROM EMPLOYEES
 GROUP BY SALARY 
 HAVING COUNT(EMPLOYEE_ID ) > 1
 ORDER BY SALARY ASC
;


-- 같은 급여를 받는 사원들은 몇명인지 급여별 사원의 수를 조회한다.
SELECT COUNT(EMPLOYEE_ID)
     , SALARY 
  FROM EMPLOYEES
 GROUP BY SALARY 
 ORDER BY SALARY ASC
;
-- 직무 아이디별 사원의 수, 급여의 총합, 평균 급여, 최고 급여, 최소 급여, 
--    가장 빠른 입사일, 가장 늦은 입사일을 조회한다.
SELECT JOB_ID  
  	 , COUNT(EMPLOYEE_ID )
	 , SUM(SALARY)
	 , AVG(SALARY)
	 , MAX(SALARY)
	 , MIN(SALARY)
	 , MIN(HIRE_DATE)
	 , MAX(HIRE_DATE)
  FROM EMPLOYEES
 GROUP BY JOB_ID
;

-- 부서의 지역번호 별 부서의 개수를 조회한다.
SELECT LOCATION_ID 
	 , COUNT(DEPARTMENT_ID)
  FROM DEPARTMENTS
 GROUP BY LOCATION_ID 
;
-- 지역의 국가아이디 별 지역의 개수를 조회한다.
SELECT COUNTRY_ID
	 , COUNT(LOCATION_ID)
  FROM LOCATIONS
 GROUP BY COUNTRY_ID 
;
-- 부서번호 별 사원의 수, 급여의 총합을 조회한다.
SELECT DEPARTMENT_ID 
	 , COUNT(EMPLOYEE_ID )
	 , SUM(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID 

-- 전체 사원들의 급여 총 합을 조회한다.
SELECT SUM(SALARY) -- 691,416
  FROM EMPLOYEES
;
-- 전체 사원 중 최저 급여를 조회한다.
SELECT MIN(SALARY) -- 2,100
  FROM EMPLOYEES
;
-- 전체 사원 중 최고 급여를 조회한다.
SELECT MAX(SALARY) -- 24,000
  FROM EMPLOYEES
;
-- 전체 사원의 평균 급여를 조회한다.
SELECT AVG(SALARY) -- 6461.831775700934579439252336448598130841
  FROM EMPLOYEES
;

-- 전체 사원 중 가장 일찍 입사한 날짜를 조회한다.
SELECT MIN(HIRE_DATE) -- 2001-01-13 00:00:00.000
  FROM EMPLOYEES
;
-- 전체 사원 중 가장 늦게 입사한 날짜를 조회한다.
SELECT MAX(HIRE_DATE) -- 2008-04-21 00:00:00.000
  FROM EMPLOYEES
;
-- 50번 부서에서 근무하는 사원들의 급여 총합을 조회한다.
SELECT SUM(SALARY) -- 156,400
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50
;
-- 60번 부서에서 근무하는 사원들의 평균 급여를 조회한다.
SELECT AVG(SALARY) -- 5,760
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60
;
-- 80번 부서에서 근무하는 사원들의 최고 급여를 조회한다.
SELECT MAX(SALARY) -- 14,000
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 80
;
-- 90번 부서에서 근무하는 사원들의 최저 급여를 조회한다.
SELECT MIN(SALARY) -- 17,000
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
;
-- 100번 부서에서 근무하는 사원들의 최고 급여, 최저 급여, 
-- 가장 일찍 입사한 날짜(YYYY-MM-DD), 가장 늦게 입사한 날짜(YYYY-MM-DD), 평균 급여, 급여 총합을 조회한다.
SELECT MAX(SALARY) -- 12,008
	 , MIN(SALARY) -- 6,900
	 , TO_CHAR(MIN(HIRE_DATE), 'YYYY-MM-DD') -- 2002-08-16
	 , TO_CHAR(MAX(HIRE_DATE), 'YYYY-MM-DD') -- 2007-12-07
	 , AVG(SALARY) -- 8601.333333333333333333333333333333333333
	 , SUM(SALARY) -- 51,608
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100
;
-- 전체 사원들의 최고 급여와 최저 급여의 차를 조회한다.
SELECT MAX(SALARY) - MIN(SALARY) -- 21,900
  FROM EMPLOYEES
;

-- 전체 사원의 수를 조회한다.
SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES
;
-- 70번 부서에서 근무 중인 사원의 수를 조회한다.
SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 70
;
-- 이름이 'a'로 끝나는 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME
	 , LAST_NAME 
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%a'
;
-- 성이 'A'로 시작하는 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME
	 , LAST_NAME 
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE 'A%'
;
-- 이름과 성에 'e'가 있는(포함되어있는) 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME
	 , LAST_NAME 
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE '%e%'
   AND FIRST_NAME LIKE '%e%'
;

-- 이름 또는 성에 'g'가 있는(포함되어있는) 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME
	 , LAST_NAME 
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%g%'
    OR LAST_NAME LIKE '%g%' 
;
-- 이름이 5자리인 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
	 , LAST_NAME 
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_____'
;
-- 이름이 4자리 이상인 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
	 , LAST_NAME 
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '____%'
;
-- 성이 4자리 이상이며 다섯번째 자리의 글자가 'e'인 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
	 , LAST_NAME 
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE '____e%'
;
-- 도시명이 'S'로 시작하는 도시의 이름을 조회한다.
SELECT CITY
  FROM LOCATIONS
 WHERE CITY LIKE 'S%'
;
-- 부서의 이름에 'r'이 있는(포함되어있는) 부서의 이름을 조회한다.
SELECT DEPARTMENT_NAME 
  FROM DEPARTMENTS
 WHERE DEPARTMENT_NAME LIKE '%r%'
;

-- 급여가 8000 이상이면서 커미션을 받는 사원의 급여, 커미션 비율을 조회한다.
SELECT SALARY 
	 , COMMISSION_PCT 
  FROM EMPLOYEES
  WHERE SALARY >= 8000
  	AND COMMISSION_PCT IS NOT NULL
;

-- 급여가 10000 이상이거나 커미션을 받는 사원의 급여, 커미션 비율을 조회한다.
SELECT SALARY 
	 , COMMISSION_PCT 
  FROM EMPLOYEES
  WHERE SALARY >= 10000
  	 OR COMMISSION_PCT IS NOT NULL
;
-- 10번, 20번, 50번 부서번호에서 근무하는 모든 사원들의 근무부서 번호, 직무 아이디를 조회한다.
SELECT DEPARTMENT_ID 
	 , JOB_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 10
 	OR DEPARTMENT_ID = 20
 	OR DEPARTMENT_ID = 50
;

SELECT DEPARTMENT_ID 
	 , JOB_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (10, 20, 50)
;
-- 급여가 5000이상 10000미만이거나 직무아이디가 IT_PROG 인 사원의 급여와 직무아이디를 조회한다.
SELECT SALARY
	 , JOB_ID
  FROM EMPLOYEES
 WHERE SALARY >= 5000
   AND SALARY < 10000
    OR JOB_ID = 'IT_PROG' 
;

SELECT SALARY
	 , JOB_ID
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 5000 AND 10000 - 1
    OR JOB_ID = 'IT_PROG' 
;
-- 직무아이디가 IT_PROG, FI_ACCOUNT가 아닌 사원들의 직무 아이디를 중복없이 조회한다.
SELECT DISTINCT JOB_ID 
  FROM EMPLOYEES
 WHERE JOB_ID != 'IT_PROG'
   AND JOB_ID != 'FI_ACCOUNT'
;

SELECT DISTINCT JOB_ID 
  FROM EMPLOYEES
 WHERE JOB_ID NOT IN ('IT_PROG','FI_ACCOUNT')
;

-- 급여가 2000 ~ 5000 사이 이거나 직무 아이디가 ST_MAN, SA_REP가 아닌 사원들의 급여와 직무 아이디를 조회한다.
SELECT SALARY
	 , JOB_ID
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 2000 AND 5000
    OR JOB_ID != 'IT_PROG'
   AND JOB_ID != 'SA_REP'
;

SELECT SALARY
	 , JOB_ID
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 2000 AND 5000
    OR JOB_ID NOT IN('IT_PROG', 'SA_REP')
;

-- 상사 사원 번호가 103번 이거나 101번인 사원 중 급여가 5000이상인 사원의 상사사원번호와 급여를 조회한다.
SELECT MANAGER_ID 
	 , SALARY 
  FROM EMPLOYEES
 WHERE (MANAGER_ID = 101
 	OR MANAGER_ID = 103)
   AND SALARY >= 5000
;

SELECT MANAGER_ID 
	 , SALARY 
  FROM EMPLOYEES
 WHERE MANAGER_ID IN (101, 103)
   AND SALARY >= 5000
;


-- 10, 20, 30, 40번 부서에서 근무하지 않는 사원들의 이름, 근무부서번호를 조회한다.
SELECT FIRST_NAME, DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID NOT IN (10, 20, 30, 40)
;

-- 사원번호가 108번인 사원의 사원번호, 이름, 성을 조회한다.
SELECT EMPLOYEE_ID  
	 , FIRST_NAME 
	 , LAST_NAME 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 108
;

-- 이름이 'Steven'인 사원의 이름과 성, 급여, 근무부서번호를 조회한다.
SELECT FIRST_NAME
	 , LAST_NAME 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Steven'
;

-- 근무 부서 번호가 50인 사원의 이름, 성, 상사사원 번호, 직무아이디를 조회한다.
-- 이 때, 상사사원번호로 내림차순 정렬한다.
SELECT FIRST_NAME 
	 , LAST_NAME 
	 , MANAGER_ID 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50
 ORDER BY MANAGER_ID DESC 
;

-- 도시의 이름이 'Seattle' 인 지역의 지역번호, 주소, 주, 국가아이디를 조회한다.
SELECT LOCATION_ID 
	 , STREET_ADDRESS 
	 , STATE_PROVINCE
	 , COUNTRY_ID 
  FROM LOCATIONS
 WHERE CITY = 'Seattle'
;
  
-- 101번 사원의 직무변경 이력 중 직무 시작일, 직무 종료일, 직무 아이디, 근무 부서 아이디를 조회한다.
-- 이 때, 직무시작일로 오름차순 정렬한다.
SELECT START_DATE
	 , END_DATE 
	 , JOB_ID 
	 , DEPARTMENT_ID 
  FROM JOB_HISTORY
 WHERE EMPLOYEE_ID = 101
 ORDER BY START_DATE ASC
  
;

-- 급여가 10000 이상인 사원의 사원 번호, 직무아이디, 급여, 근무부서 번호를 조회한다.
-- 직무아이디 오름차순, 근무부서번호 오름차순, 급여 내림차순으로 정렬한다.
SELECT EMPLOYEE_ID
	 , JOB_ID 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE SALARY >= 10000
 ORDER BY JOB_ID ASC 
 	 , DEPARTMENT_ID ASC 
 	 , SALARY DESC 
;

-- 커미션 비율이 0.2보다 작은 사원의 급여, 커미션 비율을 조회한다.
-- 급여 오름차순 정렬한다
SELECT SALARY 
	 , COMMISSION_PCT 
  FROM EMPLOYEES
 WHERE COMMISSION_PCT < 0.2
 ORDER BY SALARY ASC  
;

-- 근무부서 번호가 50이 아닌 사원들의 부서번호, 직무아이디를 조회한다.
SELECT DEPARTMENT_ID  
	 , JOB_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID != 50
;


-- 부서의 이름, 부서장의 번호, 지역의 번호를 조회한다.
-- 이 때, 부서장의 번호로 오름차순 정렬한다.
SELECT DEPARTMENT_NAME 
	 , MANAGER_ID 
	 , LOCATION_ID 
  FROM DEPARTMENTS
 ORDER BY MANAGER_ID ASC
;

-- 부서의 지역번호를 중복없이 조회한다.
-- 이 때, 지역번호를 내림차순 정렬한다.
SELECT DISTINCT LOCATION_ID 
  FROM DEPARTMENTS
 ORDER BY LOCATION_ID DESC
;

-- 사원의 급여와 커미션 비율, 이름, 성을 조회한다.
-- 이 때, 급여로 오름차순 정렬하고 같은 급여가 있을 경우 커미션 비율로 내림차순 정렬한다.
SELECT SALARY 
	 , COMMISSION_PCT 
	 , FIRST_NAME 
	 , LAST_NAME 
  FROM EMPLOYEES
 ORDER BY SALARY ASC
 	 , COMMISSION_PCT DESC
;

-- 모든 사원들의 이름, 성, 급여를 중복없이 조회한다.
SELECT DISTINCT FIRST_NAME 
	 , LAST_NAME 
	 , SALARY 
  FROM EMPLOYEES
;

-- 모든 사원들의 급여와 커미션을 중복없이 조회한다. 
SELECT DISTINCT SALARY 
	 , COMMISSION_PCT 
  FROM EMPLOYEES
;

-- 현재 날짜와 시간을 "연-월-일 시:분:초" 형태로 보여준다.
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
  FROM DUAL
;

-- 현재 날짜와 시간을 보여준다.
SELECT SYSDATE 
  FROM DUAL
;
-- 현재 날짜에서 하루를 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 1
  FROM DUAL
;
-- 현재 날짜에서 이틀을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 2
  FROM DUAL
;
-- 현재 날짜에서 한달을 더한 날짜와 시간을 보여준다.
SELECT SELECT SYSDATE + 1 / 24
  FROM DUAL
;

-- 현재 날짜에서 한달을 뺀 날짜와 시간을 보여준다.
SELECT ADD_MONTHS(SYSDATE, -1)
  FROM DUAL
;
-- 현재 날짜에서 이틀을 뺀 날짜와 시간을 보여준다.
SELECT SYSDATE - 2
  FROM DUAL
;
-- 현재 날자에서 하루를 뺀 날짜와 시간을 보여준다.
SELECT SYSDATE - 1
  FROM DUAL
;
-- 현재 날짜에서 1시간을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 1 / 24
  FROM DUAL
;
-- 현재 날짜에서 5시간을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE +  5 / 24
  FROM DUAL
;
-- 현재 날짜에서 10시간을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 10 / 24
  FROM DUAL
;
-- 현재 날짜에서 1분을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 1 / 24 / 60
  FROM DUAL
;
-- 현재 날짜에서 13분을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 13 / 24 / 60
  FROM DUAL
;
-- 현재 날짜에서 49초를 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 49 / 24 / 60 / 60
  FROM DUAL
;

SELECT EMPLOYEE_ID
	 , FIRST_NAME
	 , LAST_NAME
	 , EMAIL
  FROM EMPLOYEES
;

-- DEPARTMENTS 테이블에서
-- DEPARTMENT_ID, MANAGER_ID만 조회해본다
SELECT DEPARTMENT_ID
	 , MANAGER_ID
  FROM DEPARTMENTS
;

-- COUNTRIES 테이블에서
-- COUNTY_ID, COUNTY_NAME, REGION_ID를 조회해본다.
SELECT COUNTRY_ID
	 , COUNTRY_NAME
	 , REGION_ID
  FROM COUNTRIES
;

SELECT *
  FROM COUNTRIES
;


-- 1. 사원의 이름과 성 그리고 급여를 조회한다.
SELECT FIRST_NAME
	 , LAST_NAME
	 , SALARY
  FROM EMPLOYEES
;

-- 2. 부서의 부서장 번호와 부서가 존재하는 지역의 번호를 존재한다.
SELECT MANAGER_ID
	 , LOCATION_ID
  FROM DEPARTMENTS
;

-- 3. 국가의 아이디, 이름, 국가가 존재하는 대륙의 번호를 조회한다.
SELECT COUNTRY_ID
	 , COUNTRY_NAME
	 , REGION_ID
  FROM COUNTRIES
;

-- 4. 직무의 이름과 최대급여를 조회한다.
SELECT JOB_TITLE 
 	 , MAX_SALARY 
  FROM JOBS
;

-- 5. 지역의 도시명과 주소, 우편번호를 조회한다.
SELECT CITY 
	 , STREET_ADDRESS 
	 , POSTAL_CODE 
  FROM LOCATIONS
;

-- 6. 사원의 상사사원번호와 입사일 그리고 연락처를 조회한다.
SELECT MANAGER_ID 
	 , HIRE_DATE 
	 , PHONE_NUMBER 
  FROM EMPLOYEES
;

--7. 직무가 변경된 사원의 이전 직무 아이디, 이전직무를 수행한 부서의 아이디, 이전직무를 시작한 날짜를 조회한다.
SELECT JOB_ID
	 , DEPARTMENT_ID 
	 , START_DATE 
  FROM JOB_HISTORY
;

--8. 대륙의 아이디와 이름을 조회한다.
SELECT REGION_ID 
	 , REGION_NAME 
  FROM REGIONS
;

--9. 사원의 직무아이디와 부서번호만 조회한다.
SELECT JOB_ID 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
;

--10. 사원의 이름, 성, 급여, 입사일, 부서의 이름, 부서장의 이름,
--	  지역의 도시명, 국가명, 대륙의 이름을 조회한다.



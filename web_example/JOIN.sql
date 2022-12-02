use practice;

-- inner join
-- inner join : 두 테이블의 공통 값이 매칭되는 데이터만 결합
-- customer + sales inner join
select  *
  from customer as a
 inner
  join sales as b
    on a.mem_no = b.mem_no;

-- customer 및 sales 테이블은 mem_no 기준으로 1: N 관계
select  *
  from customer as a
 inner
  join sales as b
    on a.mem_no = b.mem_no
 where a.mem_no = '1000970';
 
-- left join
-- left join : 두 테이블의 공통 값이 매칭되는 데이터만 결합 + 왼쪽 테이블의 매칭되지 않는 데이터는 null 값으로 표현
-- customer + sales left join
select  *
  from customer as a
  left
  join sales as b
    on a.mem_no = b.mem_no;
    
-- right join
-- right join : 두 테이블의 공통 값이 매칭되는 데이터만 결합 + 오른쪽 테이블의 매칭되는 않는 데이터는 null 값으로 표현 */
-- customer + sales right join
select  *
  from customer as a
 right
  join sales as b
    on a.mem_no = b.mem_no
 where a.mem_no is null;
 -- 회원번호(999999) = 비회원
 -- IS NULL : 비교 연산자 / NULL인 값만
 
 SELECT  *
   FROM CUSTOMER AS A
  INNER
   JOIN SALES AS B
     ON A.MEM_NO = B.MEM_NO;
     
-- 임시 테이블 생성
CREATE TEMPORARY TABLE CUSTOMER_SALES_INNER_JOIN
SELECT  A. *
		 ,B. ORDER_NO
  FROM CUSTOMER AS A
 INNER
  JOIN SALES AS B
    ON A.MEM_NO = B.MEM_NO;
    
SELECT  *  FROM CUSTOMER_SALES_INNER_JOIN;
-- TEMPORARY TABLE : 서버 연결 종료시 자동 삭제

-- 성별 남성 조건
SELECT  *
  FROM CUSTOMER_SALES_INNER_JOIN
 WHERE GENDER = 'MAN';
 
 -- 거주지별 구매 횟수
 SELECT  ADDR
			,COUNT(ORDER_NO) AS 구매횟수
  FROM CUSTOMER_SALES_INNER_JOIN
 WHERE GENDER = 'MAN'
 GROUP
    BY ADDR;
    
-- 구매횟수 100회 미만 조건 필터링
 SELECT  ADDR
			,COUNT(ORDER_NO) AS 구매횟수
  FROM CUSTOMER_SALES_INNER_JOIN
 WHERE GENDER = 'MAN'
 GROUP
    BY ADDR
HAVING COUNT(ORDER_NO) < 100;

-- 구매회수 낮은 순
 SELECT  ADDR
			,COUNT(ORDER_NO) AS 구매횟수
  FROM CUSTOMER_SALES_INNER_JOIN
 WHERE GENDER = 'MAN'
 GROUP
    BY ADDR
HAVING COUNT(ORDER_NO) < 100
 order
    BY COUNT(ORDER_NO) ASC;
    
-- SALES 테이블 기준, CUSTOMER, PRODUCT 테이블 LEFT JOIN
SELECT  *
  FROM SALES AS A
  LEFT
  JOIN CUSTOMER AS B
    ON 	A.MEM_NO = B.MEM_NO
  LEFT
  JOIN PRODUCT AS C
    ON A.PRODUCT_CODE = C.PRODUCT_CODE;
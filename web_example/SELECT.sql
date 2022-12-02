USE Practice;
-- customer 테이블 모든 열 조회
select * from customer;

-- where
-- 성별이 남성 조건으로 필터링
select * from customer
where gender = 'man';

-- group by
-- 지역별로 회원수 집계
select addr, count(gender) as 회원수
from customer where gender = 'man'
group by addr;

-- having
-- 집계 회원수 100명 미만 조건으로 필터링
select addr, count(gender) as 회원수
from customer where gender = 'man'
group by addr
having count(gender) < 100;

-- order by
-- 집계 회원수가 높은 순으로 정렬
select addr, count(gender) as 회원수
from customer where gender = 'man'
group by addr
having count(gender) <100
order by count(gender) desc;
-- desc: 내림차순  asc: 오름차순

-- FROM (WHERE) GROUP BY
SELECT addr, count(gender) as 회원수
from customer
-- where gender = 'man'
group by addr;

-- group by + 집계함수
-- 거주지역 서울, 인천 필터링 / 거주지역 및 성별로 회원수 집계
select addr, gender, count(gender) as 회원수
from customer where addr in ('seoul', 'incheon')
group by addr, gender;
-- in : 특수 연산자 / in (list) 리스트 값만

select  addr
		,count(gender) as 회원수
  from  customer
  where gender = 'man'
  group
     by addr
 having count(gender) <100
   order
      by count(gender) desc;
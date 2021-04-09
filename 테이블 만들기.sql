show tables;
insert into pets (name,owner) values('삐삐','carami'); #컬럼리스트를 쓴다.
-- select 컬럼리스트 from 테이블명들 where...
select* from pets; #from 뒤를 확인한다. *는 모든 사용자를 대상으로...
desc pets; #pets의 구조를 확인한다

select name, owner,birth from pets; #마지막 column에는 쉼표를 쓰면 안 된다.
select* from pets where birth>="1998-1-1";
select* from pets where species="dog" and gender="f";
select* from pets where species="snake" or species="bird";
select name, owner, birth from pets order by birth asc,name;
select name, owner, birth from pets order by 3 asc,1;
select * from pets
where name like '%b%';
select * from pets
where name like '%o%';
select * from pets
where name like '_____';
select count(*) from pets; #count 함수는 null 값은 세지 않는다. *를 사용하면 모든 함수가 대상이 된다.
select distinct species from pets;
select count(distinct species) from pets;
show tables;
select * from emp;
select * from emp where sal < 1000;
select deptno,job from emp;

select*from emp; #emp라는 테이블에 있는 내용을 전부 보고 싶을 때
select empno 사번,ename 이름,job 업무 from emp; #emp에 있는 컬럼 타이틀을 뽑고 싶을 때
#뒤에 붙인 한글은 별칭을 말한다. 
select empno as 사번, ename 이름, job 업무 from emp;
#별칭을 붙일 때 as(alias)를 붙여도 되고 안 붙여도 된다. 
#만일 공백을 넣고 싶다면 따옴표를 사용한다. (아래 예시)
select empno "사   번",ename 이름, job 업무 from emp;
show tables;
select distinct title from titles;
select concat(ename,'사원의 업무는 ',job ,'입니다.') 사원정보 from emp;
show tables;

show databases;
show tables;
desc emp;
desc dept;
select * from dept
where deptno = 10 or deptno = 20;
select * from dept
where deptno in (10,20,30);

select distinct job from emp;

select empno,ename,sal*20 +ifnull(comm,0) 연봉 from emp; 
# ifnull(comm,0) -> comm이 null일 때 0으로 처리한다. 

desc emp;

select deptno, avg(sal) from emp
group by deptno; #부서번호, 평균급여를 부서별로 그룹핑한다.

#급여가 5000이상, 1500미만인 사원은 제외하고 job별로 평균 급여를 구하세요. 
#단, 평균급여가 2000 미만인 job은 제외하고 보여주세요. 
select job, avg(sal) from emp
where sal<5000 and sal>=1500
group by job
having avg(sal) >=2000;

desc dept;
select e.empno,e.ename,e.deptno,d.dname from emp e,dept d
where e.deptno=d.deptno;

show tables;
select * from salgrade;
#각 사원의 salgrade가 어떤지 확인할 수 있다. 
#PK나 FK가 있지 않아도 조인이 가능하다. 
select e.empno,e.ename,e.sal,s.grade from emp e, salgrade s
where e.sal between s.losal and s.hisal
order by s.grade; #grade 기준으로 정렬

update emp set deptno=null where empno=7839;

select e.empno,e.ename,e.deptno,d.dname from emp e natural join dept d;

select e.empno,e.ename,e.deptno,d.dname from emp e join dept d using(deptno);

select e.empno,e.ename,e.deptno,d.dname from emp e join dept d on(e.deptno=d.deptno);

select e.empno,e.ename,e.deptno,d.dname from emp e right outer join dept d using(deptno)
union
select e.empno,e.ename,e.deptno,d.dname from emp e left outer join dept d using(deptno);

show databases;
select database();
show tables;

select e.empno 사번, e.ename 사원이름, m.empno 매니저사번, m.ename 매니저이름 
from emp e , emp m 
where (e.mgr=m.empno);
select e.empno 사번, e.ename 사원이름, m.empno 매니저사번, m.ename 매니저이름 
from emp e join emp m 
on (e.mgr=m.empno);
select * from dept;
select * from emp;
#smith 사원의 부서의 평균 급여를 확인하라. 
select deptno from emp where ename='smith';
select avg(sal) from emp where deptno=(select deptno from emp where ename='smith');

#ford 사원보다 급여를 많이 받는 사원들의 정보를 출력하라. 
select * from emp
where sal > (select sal from emp where ename='ford');
#평균급여보다 적게 받는 사람들의 급여를 출력하라. 
select ename 이름, sal 급여 from emp
where sal<(select avg(sal) from emp);
#scott와 다른 부서 사원들의 정보를 출력하라. 
select * from emp
where DEPTNO <> (select deptno from emp where ename='scott');
	# <> ➡ != 
    
select * from (select * from emp where DEPTNO = 10) a;

select ename,sal,deptno from emp
where ename = (select min(ename) from emp group by deptno);
	# -> 오류발생
	# 1대 다수를 비교할 때는 = 같은 연산자는 사용하지 못한다. in을 사용해야 한다. 
select ename,sal,deptno from emp
where ename in (select min(ename) from emp group by deptno);

SELECT EMPNO, ENAME, DEPTNO FROM EMP
WHERE DEPTNO = 10 OR DEPTNO = 20;
SELECT EMPNO, ENAME, DEPTNO FROM EMP
WHERE DEPTNO IN (10,20);

select ename, min(sal) from emp group by deptno;
	# -> 이 코드문이 틀린 이유는 deptno를 group by를 했기 때문에 ename을 출력할 수 없다. 
select deptno, min(sal) from emp group by deptno; 
	#이런 식으로 해야 한다. 
    
#각 부서별 평균 급여보다 적게 받는 사원의 급여를 출력하라
SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO;
	#GROUP BY DEPTNO -> 부서번호로 그룹을 나눴다. 
    #부서별 평균 급여를 보여준다. 
SELECT * FROM EMP
WHERE SAL <ALL (SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO);
#각 부서별 최대 급여를 받는 사람
SELECT deptno, ename, MAX(SAL) FROM EMP group by DEPTNO;
#내가 짠 코드
SELECT * FROM EMP 
WHERE sal in (SELECT MAX(SAL) FROM EMP group by DEPTNO);
	# 부서 별 최대 급여를 받는 사람이 있으면 그 사람도 출력해낸다.
    # 예를 들어, 20번 부서에 2450(부서 10의 최대 급여)을 받는 사람이 있으면 출력된다. 
#강사님 코드 
select e.ename, e.deptno,e.sal from emp e,
(select deptno, max(sal) msal from emp group by deptno) m
where e.deptno = m.deptno and e.sal = m.msal;

select ename, deptno, sal from emp e
where sal = (select max(sal) from emp where deptno = e.deptno);

select ename, deptno, sal from emp 
where (deptno,sal) in (select deptno, max(sal) FROM EMP group by DEPTNO);

select * from emp
where deptno not in (10,20);

select * from emp
where job='manager' and deptno = 10 or deptno = 20;
	# 결과 : 10번 부서번호의 매니저인 사람 or 20번 부서번호인 사람
    # 항상 and 먼저 실행이 된다. 

select * from emp
where job='manager' and (deptno = 10 or deptno = 20);

create table member (
no int not null primary key, # 하나의 컬럼이 끝났으면 쉼표(,)를 쓴다.
email varchar(50) not null,
passwd varchar(20) not null,
name varchar(25) , # not null 조건이 no면 아무것도 쓰지 않아도 된다.
department_name varchar(25)) ;
ALTER TABLE MEMBER
ADD juminbunho CHAR(13) NOT NULL ;
ALTER TABLE MEMBER
DROP juminbunho ; 
alter table member 
add join_date datetime not null;
ALTER TABLE member
CHANGE no no INT NOT NULL AUTO_INCREMENT;
alter table member
modify join_date datetime default current_timestamp;

alter table member 
change no member_id int not null auto_increment;

select * from member;
show tables;
desc member;

create table Board (
no int not null primary key,
title varchar(50) not null,
contents varchar(30) ,
member_id int ,
Reg_date datetime default current_timestamp);


drop table board;
alter table Board
change no board_id int auto_increment;

alter table board
add constraint board_fk foreign key(member_id)
references member(member_id); 
# constraint : 제약조건

insert member
value(null,'asdf@nate.com','345','king123','500',default);

insert into member(email,name) values ('carami@nate.com','kang');
	#오류나는 이유? 나열하지 않은 것들에 대한 값은 NULL이 들어간다. 
	#passwd가 not null 조건이 걸려있기 때문에 오류가 발생한다. 
insert into member(email,name,passwd) values ('carami@nate.com','kang','1223');

insert board (title, member_id) values ('제123목',5);
select * from board;

show tables;
desc Board;
select * from member;
desc member;
select * from board;

alter table Board rename column content to contents;

#수정
update member
set email='abc@abc.com',name='abc'
#이렇게 run하면 모든 멤버의 이메일과 이름이 변경된다. mysql은 safemode가 설정되어 있기 때문에 실행되지 않지만 safemode가 꺼지면 실행된다.
where member_id = 1 ;

#삭제 
delete from board
where member_id =1 ;

delete from member;
	#safemode 때문에 오류가 발생하지만 잘못된 코드 아니다. 
    #이렇게 런하면 모두 삭제가 된다. 

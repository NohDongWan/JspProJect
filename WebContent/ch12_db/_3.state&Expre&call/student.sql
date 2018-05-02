drop table student;

create table student(
num number,
name varchar(20),
primary key(num)
);

select * from STUDENT;

delete from student;

create table emp1
as
select * from emp; 


-- 영역 설정 (ALT + C)----
create or replace procedure del_all
is 
begin
	delete from emp1;
end;
-- 영역 설정 (ALT + C)----	



select * from emp1;

select * from emp2;



create table emp2
as
select * from emp;







---Alt c 하는이유 중간에 비긴단계에서 세미콜론에서 끝나버리기때문에 end 뒤에서 끝내기위해 하나의 문장으로 만들어주는 ALT C 를한다

create or replace procedure
	del_name(vename emp.ename%TYPE)
is
begin 
	delete from emp2 where ename = vename;
end; 












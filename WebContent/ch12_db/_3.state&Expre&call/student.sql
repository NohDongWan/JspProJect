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


-- ���� ���� (ALT + C)----
create or replace procedure del_all
is 
begin
	delete from emp1;
end;
-- ���� ���� (ALT + C)----	



select * from emp1;

select * from emp2;



create table emp2
as
select * from emp;







---Alt c �ϴ����� �߰��� ���ܰ迡�� �����ݷп��� ���������⶧���� end �ڿ��� ���������� �ϳ��� �������� ������ִ� ALT C ���Ѵ�

create or replace procedure
	del_name(vename emp.ename%TYPE)
is
begin 
	delete from emp2 where ename = vename;
end; 












create table students(
  sno CHAR(6) NOT NULL PRIMARY KEY, /* �й� */
  sname VARCHAR(20) NOT NULL, /* �̸� */
  dept VARCHAR(20) NOT NULL,  /* �а� */
  birthday date,              /* ������� */
  year INT DEFAULT 1         /* �г� */
);

desc STUDENTS;

drop table students;

insert into students(sno, sname, dept) 
values ('202301', 'ȫ�浿', '����');
insert into students(sno, sname, dept, birthday) 
values ('202302', '��û��', '����', '2000-10-04');
insert into students(sno, sname, dept, birthday) 
values ('202303', '�̼���', '����', '2000-12-17');

select *
from students;

select *
from students
where sno = '202302';

SELECT *
FROM STUDENTS
WHERE SNAME like '%��%';

SELECT *
FROM STUDENTS
WHERE SNAME like '%��%'
ORDER by sname, birthday;

SELECT max(sno) + 1 as newno
from STUDENTS;

UPDATE STUDENTS 
SET BIRTHDAY = '2000-01-01'
WHERE SNO = '202301';

DELETE FROM STUDENTS
WHERE SNO = '202301';

commit;

select * from students;
create table students(
  sno CHAR(6) NOT NULL PRIMARY KEY, /* 학번 */
  sname VARCHAR(20) NOT NULL, /* 이름 */
  dept VARCHAR(20) NOT NULL,  /* 학과 */
  birthday date,              /* 생년월일 */
  year INT DEFAULT 1         /* 학년 */
);

desc STUDENTS;

drop table students;

insert into students(sno, sname, dept) 
values ('202301', '홍길동', '컴정');
insert into students(sno, sname, dept, birthday) 
values ('202302', '심청이', '컴정', '2000-10-04');
insert into students(sno, sname, dept, birthday) 
values ('202303', '이순신', '컴정', '2000-12-17');

select *
from students;

select *
from students
where sno = '202302';

SELECT *
FROM STUDENTS
WHERE SNAME like '%이%';

SELECT *
FROM STUDENTS
WHERE SNAME like '%이%'
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
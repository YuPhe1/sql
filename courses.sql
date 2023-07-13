-- �л� ���̺� ����
create table students (
  scode char(6) not null primary key,
  sname varchar(20) not null,
  dept varchar(20) not null
);

-- ���� ���̺� ����
create table courses(
  ccode char(3) not null primary key,
  cname varchar(100) not null
);

-- ������û ���̺� ����
create table enrols(
  scode char(6) not null,
  ccode char(3) not null,
  grade int DEFAULT 0,
  edate Date DEFAULT sysdate,
  PRIMARY key(scode, ccode),
  FOREIGN key(scode) REFERENCES students(scode),
  FOREIGN key(ccode) REFERENCES courses(ccode)
);

insert into students(scode, sname, dept)
values('202301', 'ȫ�浿', '����');
insert into students(scode, sname, dept)
values('202302', '��û��', '����');
insert into students(scode, sname, dept)
values('202303', '�̼���', '����');

select * from students;


insert into courses(ccode, cname)
values('100', '�ڹ�');
insert into courses(ccode, cname)
values('101', '�����ͺ��̽�');
insert into courses(ccode, cname)
values('102', 'HTML');

select * from courses;

insert into ENROLS(SCODE, CCODE)
values('202301','100');
insert into ENROLS(SCODE, CCODE)
values('202301','102');
insert into ENROLS(SCODE, CCODE)
values('202302','101');
insert into ENROLS(SCODE, CCODE)
values('202302','102');
insert into ENROLS(SCODE, CCODE)
values('202303','102');

select * from ENROLS;

create view view_enrols as
select e.* , s.SNAME, c.CNAME
from STUDENTS s, COURSES c, ENROLS e
where s.SCODE = e.SCODE and c.CCODE = e.CCODE;

select * from VIEW_ENROLS order by scode;

commit;

select max(scode)+1 ncode from students;
select * from view_enrols where scode = '202302';

-- ķ���� ���̺� ����
create table camp(
  cno char(3) not null primary key,
  cname varchar(100) not null,
  juso varchar(500),
  tel varchar(20)
);

insert into camp(cno, cname, juso, tel)
values('100', '���丮ķ����', '������','010-1010-1010');
insert into camp(cno, cname, juso, tel)
values('101', '�ֹ�ķ����', '��⵵','010-1010-2020');
insert into camp(cno, cname, juso, tel)
values('102', '�ϴ�ķ����', '��õ','010-1010-3030');

select * from camp;

-- �ü��� ���̺� ����
create table facil(
  fno int primary key not null,
  fname varchar(100) not null
);

insert into facil(fno, fname)
values(0, '����');
insert into facil(fno, fname)
values(1, '����');
insert into facil(fno, fname)
values(2, '��������');
insert into facil(fno, fname)
values(3, 'ȭ���');
insert into facil(fno, fname)
values(4, '������');

select * from facil;

-- Ÿ�� ���̺� ����
create table type(
  tno int PRIMARY key not null,
  tname varchar(100) not null
);

insert into type values(0, 'ī���');
insert into type values(1, '�۷���');
insert into type values(2, '����ķ��');
insert into type values(3, '�Ҽ�');

select * from type;

-- ķ���庰 �ü��� ���̺�
create table camp_facil(
  cno char(3) not null,
  fno int not null,
  PRIMARY key(cno, fno),
  FOREIGN key(cno) REFERENCES camp(cno),
  FOREIGN key(fno) REFERENCES facil(fno)
);

-- ķ���庰 Ÿ�� ���̺�
create table camp_type(
  cno char(3) not null,
  tno int not null,
  PRIMARY key(cno, tno),
  FOREIGN key(cno) REFERENCES camp(cno),
  FOREIGN key(tno) REFERENCES type(tno)
);

insert into camp_facil values('100', 0);
insert into camp_facil values('100', 1);
insert into camp_facil values('100', 2);

insert into camp_facil values('101', 0);
insert into camp_facil values('101', 1);

insert into camp_facil values('102', 0);
insert into camp_facil values('102', 3);

select * from camp_facil;

insert into camp_type values('100', 1);
insert into camp_type values('100', 2);

insert into camp_type values('101', 1);

insert into camp_type values('102', 2);

select * from camp_type;

commit;
  
select c.*, f.fname
from CAMP_FACIL c, facil f
where c.fno = f.fno;

select c.*, t.tname
from camp_type c, type t
where c.tno = t.tno
order by cno;
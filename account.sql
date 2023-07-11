-- �������̺� ����
create table account(
  ANO int not null primary key,
  aname varchar(20) not null,
  balance int default 0
);

-- �ŷ����� ���̺�
create table detail(
  dno int not null primary key,
  ano int not null ,
  amount int default 0,
  type char(6) not null,
  ddate date default sysdate,
  foreign key(ano) references account(ano) 
);

drop table detail;
-- ���¹�ȣ SEQUENCE ����
create SEQUENCE seq_ano start with 100 INCREMENT by 1;

-- �ŷ���ȣ SEQUENCE ����
CREATE SEQUENCE seq_dno START with 1 INCREMENT by 1;



drop SEQUENCE seq_dno;

-- ���µ����� �Է�
insert into account(ano, aname, balance)
values(seq_ano.NEXTVAL, 'ȫ�浿', 500);
insert into account(ano, aname, balance)
values(seq_ano.NEXTVAL, '��û��', 1000);
insert into account(ano, aname, balance)
values(seq_ano.NEXTVAL, '������', 1000);

select * from ACCOUNT;

-- �ŷ����������� �Է�
insert into detail(dno, ano, amount, type, ddate)
values(seq_dno.nextval, 100, 1000, '�Ա�', '2023-07-09');
insert into detail(dno, ano, amount, type, ddate)
values(seq_dno.nextval, 101, 1000, '�Ա�', '2023-07-09');
insert into detail(dno, ano, amount, type, ddate)
values(seq_dno.nextval, 102, 1000, '�Ա�', '2023-07-10');
insert into detail(dno, ano, amount, type, ddate)
values(seq_dno.nextval, 100, 1000, '���', '2023-07-11');

select * from detail;

commit;
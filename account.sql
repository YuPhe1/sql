-- 계좌테이블 생성
create table account(
  ANO int not null primary key,
  aname varchar(20) not null,
  balance int default 0
);

-- 거래내역 테이블
create table detail(
  dno int not null primary key,
  ano int not null ,
  amount int default 0,
  type char(6) not null,
  ddate date default sysdate,
  foreign key(ano) references account(ano) 
);

drop table detail;
-- 계좌번호 SEQUENCE 생성
create SEQUENCE seq_ano start with 100 INCREMENT by 1;

-- 거래번호 SEQUENCE 생성
CREATE SEQUENCE seq_dno START with 1 INCREMENT by 1;



drop SEQUENCE seq_dno;

-- 계좌데이터 입력
insert into account(ano, aname, balance)
values(seq_ano.NEXTVAL, '홍길동', 500);
insert into account(ano, aname, balance)
values(seq_ano.NEXTVAL, '심청이', 1000);
insert into account(ano, aname, balance)
values(seq_ano.NEXTVAL, '강감찬', 1000);

select * from ACCOUNT;

-- 거래내역데이터 입력
insert into detail(dno, ano, amount, type, ddate)
values(seq_dno.nextval, 100, 1000, '입금', '2023-07-09');
insert into detail(dno, ano, amount, type, ddate)
values(seq_dno.nextval, 101, 1000, '입금', '2023-07-09');
insert into detail(dno, ano, amount, type, ddate)
values(seq_dno.nextval, 102, 1000, '입금', '2023-07-10');
insert into detail(dno, ano, amount, type, ddate)
values(seq_dno.nextval, 100, 1000, '출금', '2023-07-11');

select * from detail;

commit;
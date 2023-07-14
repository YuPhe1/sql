-- 캠핑장 테이블 생성
create table camp(
  cno char(3) not null primary key,
  cname varchar(100) not null,
  juso varchar(500),
  tel varchar(20)
);

insert into camp(cno, cname, juso, tel)
values('100', '도토리캠핑장', '강원도','010-1010-1010');
insert into camp(cno, cname, juso, tel)
values('101', '솔밭캠핑장', '경기도','010-1010-2020');
insert into camp(cno, cname, juso, tel)
values('102', '하늘캠핑장', '인천','010-1010-3030');

select * from camp;

-- 시설물 테이블 생성
create table facil(
  fno int primary key not null,
  fname varchar(100) not null
);

insert into facil(fno, fname)
values(0, '전기');
insert into facil(fno, fname)
values(1, '수도');
insert into facil(fno, fname)
values(2, '와이파이');
insert into facil(fno, fname)
values(3, '화장실');
insert into facil(fno, fname)
values(4, '수영장');

select * from facil;

-- 타입 테이블 생성
create table type(
  tno int PRIMARY key not null,
  tname varchar(100) not null
);

insert into type values(0, '카라반');
insert into type values(1, '글램핑');
insert into type values(2, '오토캠핑');
insert into type values(3, '팬션');

select * from type;

-- 캠핑장별 시설물 테이블
create table camp_facil(
  cno char(3) not null,
  fno int not null,
  PRIMARY key(cno, fno),
  FOREIGN key(cno) REFERENCES camp(cno),
  FOREIGN key(fno) REFERENCES facil(fno)
);

-- 캠핑장별 타입 테이블
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
-- 사용자 테이블
create table users (
  id varchar(20) not null primary key,
  uname varchar(20) not null,
  point int default 0,
  phone varchar(20)
);

desc users;

-- 메세지 테이블
create table messages(
  mid int not null primary key,
  sender varchar(20) not null,
  receiver varchar(20) not null,
  sdate date default sysdate,
  message varchar(1000) not null,
  foreign key(sender) REFERENCES users(id),
  foreign key(receiver) REFERENCES users(id)
);

-- 사용자입력
insert into users(id, uname, point, phone)
values('blue', '이블루', 20, '010-1010-1010');
insert into users(id, uname, point, phone)
values('red', '박레드', 10, '010-1010-2020');
insert into users(id, uname, point, phone)
values('green', '최그린', 10, '010-1010-3030');

delete from users;

select * from users;

-- 메세지 번호 시퀀스
create SEQUENCE seq_mid start with 1 increment by 1;

-- 메세지 입력
insert into messages(mid, sender, receiver, sdate, message)
values(seq_mid.nextval, 'blue', 'red', sysdate, '레드야 잘지내지?');
insert into messages(mid, sender, receiver, sdate, message)
values(seq_mid.nextval, 'red', 'blue', sysdate, '블루야 오랜만이야');
insert into messages(mid, sender, receiver, sdate, message)
values(seq_mid.nextval, 'green', 'blue', sysdate, '폭우 조심해!');
insert into messages(mid, sender, receiver, sdate, message)
values(seq_mid.nextval, 'blue', 'green', sysdate, '고마워 조심할게!');

SELECT * FROM messages;

-- 블루가 보낸 메세지
select m.* , u.UNAME, PHONE
from messages m, users u
where sender = 'blue' and u.id = m.RECEIVER;

-- 블루가 받은 메세지
select m.* , u.UNAME, PHONE
from messages m, users u
where receiver = 'blue' and u.id = m.sender;

commit;

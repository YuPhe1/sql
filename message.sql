-- ����� ���̺�
create table users (
  id varchar(20) not null primary key,
  uname varchar(20) not null,
  point int default 0,
  phone varchar(20)
);

desc users;

-- �޼��� ���̺�
create table messages(
  mid int not null primary key,
  sender varchar(20) not null,
  receiver varchar(20) not null,
  sdate date default sysdate,
  message varchar(1000) not null,
  foreign key(sender) REFERENCES users(id),
  foreign key(receiver) REFERENCES users(id)
);

-- ������Է�
insert into users(id, uname, point, phone)
values('blue', '�̺��', 20, '010-1010-1010');
insert into users(id, uname, point, phone)
values('red', '�ڷ���', 10, '010-1010-2020');
insert into users(id, uname, point, phone)
values('green', '�ֱ׸�', 10, '010-1010-3030');

delete from users;

select * from users;

-- �޼��� ��ȣ ������
create SEQUENCE seq_mid start with 1 increment by 1;

-- �޼��� �Է�
insert into messages(mid, sender, receiver, sdate, message)
values(seq_mid.nextval, 'blue', 'red', sysdate, '����� ��������?');
insert into messages(mid, sender, receiver, sdate, message)
values(seq_mid.nextval, 'red', 'blue', sysdate, '���� �������̾�');
insert into messages(mid, sender, receiver, sdate, message)
values(seq_mid.nextval, 'green', 'blue', sysdate, '���� ������!');
insert into messages(mid, sender, receiver, sdate, message)
values(seq_mid.nextval, 'blue', 'green', sysdate, '���� �����Ұ�!');

SELECT * FROM messages;

-- ��簡 ���� �޼���
select m.* , u.UNAME, PHONE
from messages m, users u
where sender = 'blue' and u.id = m.RECEIVER;

-- ��簡 ���� �޼���
select m.* , u.UNAME, PHONE
from messages m, users u
where receiver = 'blue' and u.id = m.sender;

commit;

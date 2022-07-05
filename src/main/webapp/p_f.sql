drop table member cascade constraints;
select * from member;
create table member (
	id  varchar2(20) primary key, -- 아이디
	password  varchar2(20) NOT NULL, -- 비밀번호
	name  varchar2(10) NOT NULL, -- 이름 
	age  NUMBER NOT NULL, -- 나이
	address  varchar2(255) NOT NULL,-- 주소
	tel  varchar2(30) NOT NULL, -- 전화번호
	gender  char(20) default 'n' NOT NULL, --성별
	mail   varchar2(40) NOT NULL --이메일	
);
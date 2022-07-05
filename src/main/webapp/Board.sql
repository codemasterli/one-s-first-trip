DROP TABLE review_board CASCADE CONSTRAINTS ;
DROP TABLE notice_board CASCADE CONSTRAINTS ;
DROP TABLE member CASCADE CONSTRAINTS ;
DROP TABLE sell_notice_board CASCADE CONSTRAINTS ;
DROP TABLE reply CASCADE CONSTRAINTS ;




create table review_board (
review_num NUMBER primary key,
review_title varchar2(50),  -- 제목
review_reg_date DATE NOT NULL,	--작성날짜
review_content varchar2(4000) NOT NULL, -- 본문
review_read_cnt NUMBER NOT NULL, -- 읽은 횟수
review_likes NUMBER NOT NULL, --좋아요
ref_number NUMBER NOT null, -- 답변글끼리 그룹
ref_step NUMBER NOT null, -- 답변순서
ref_level NUMBER NOT null, -- 들여쓰기 레벨
review_hb_tag varchar2(30) not null, -- 취미 태그
thumbnail VARCHAR2(100),
id VARCHAR2(20) REFERENCES member on delete cascade
);

INSERT INTO review_board(
review_num,
review_title,
review_reg_date,
review_content,
review_read_cnt,
review_likes,
ref_number,
ref_step,
ref_level,
thumbnail)
VALUES (
0,
'첫제목',
SYSDATE,
'아무거나 적겠습니다',
0,
0,
0,
0,
0,
0);

select * from REVIEW_BOARD;

drop table sell_notice_board;

create table sell_notice_board (
sell_notice_num NUMBER primary key,
sell_notice_title varchar2(50),  -- 제목
sell_notice_reg_date DATE NOT NULL,	--작성날짜
sell_notice_content varchar2(4000) NOT NULL, -- 본문
sell_notice_read_cnt NUMBER NOT NULL, -- 읽은 횟수
sell_notice_likes NUMBER NOT NULL, --좋아요
sell_notice_ref_number NUMBER NOT null, -- 답변글끼리 그룹
sell_notice_ref_step NUMBER NOT null, -- 답변순서
sell_notice_ref_level NUMBER NOT null, -- 들여쓰기 레벨
sell_notice_price NUMBER NOT NULL, -- 판매가격
sell CHARACTER(1), --판매여부
id VARCHAR2(20) REFERENCES member ON DELETE CASCADE
);



select * from sell_notice_board;

create table notice_board (
notice_num NUMBER primary key,
notice_title varchar2(50),  -- 제목
notice_reg_date DATE NOT NULL,	--작성날짜
notice_content varchar2(4000) NOT NULL, -- 본문
notice_read_cnt NUMBER NOT NULL, -- 읽은 횟수
id VARCHAR2(20) REFERENCES member ON DELETE CASCADE
);

CREATE TABLE reply
(
    re_no    NUMBER  PRIMARY KEY NOT NULL,
    content    VARCHAR2(500) NOT NULL,
    reg_date    DATE NOT NULL,
    ref    NUMBER NOT NULL,
    ref_level    NUMBER NOT NULL,
    ref_step    NUMBER NOT NULL,
    likes    NUMBER default 0,
    id   varchar2(20)  references member ON DELETE CASCADE,
    review_num    NUMBER  references review_board(review_num) ON DELETE CASCADE
);

insert into notice_board values (30,'6채명',sysdate,'굿',20,1);
SELECT * FROM reply;

create table sell_notice_board (
sell_notice_num NUMBER primary key,
sell_notice_title varchar2(50),  -- 제목
sell_notice_reg_date DATE NOT NULL,	--작성날짜
sell_notice_content varchar2(4000) NOT NULL, -- 본문
sell_notice_read_cnt NUMBER NOT NULL, -- 읽은 횟수
sell_notice_likes NUMBER NOT NULL, --좋아요
sell_notice_ref_number NUMBER NOT null, -- 답변글끼리 그룹
sell_notice_ref_step NUMBER NOT null, -- 답변순서
sell_notice_ref_level NUMBER NOT null, -- 들여쓰기 레벨
sell_notice_price NUMBER NOT NULL, -- 판매가격
thumbnail VARCHAR2(100),
sell CHARACTER(100), --판매여부
id VARCHAR2(20) REFERENCES member ON DELETE CASCADE
);
select * from sell_notice_board;
	
create table bay_notice_board (
bay_notice_num NUMBER primary key,
bay_notice_title varchar2(50),  -- 제목
bay_notice_reg_date DATE NOT NULL,	--작성날짜
bay_notice_content varchar2(4000) NOT NULL, -- 본문
bay_notice_read_cnt NUMBER NOT NULL, -- 읽은 횟수
bay_notice_likes NUMBER NOT NULL, --좋아요
bay_notice_ref_number NUMBER NOT null, -- 답변글끼리 그룹
bay_notice_ref_step NUMBER NOT null, -- 답변순서
bay_notice_ref_level NUMBER NOT null, -- 들여쓰기 레벨
bay_notice_price NUMBER NOT NULL, -- 판매가격
thumbnail VARCHAR2(100), -- 그림
id VARCHAR2(20) REFERENCES member ON DELETE CASCADE
);

SELECT review_board.* FROM ( SELECT rownum AS row_num, review_board.* FROM
 ( SELECT review_board.* FROM review_board ORDER BY group_id DESC,review_num ASC ) review_board )
 review_board WHERE row_num BETWEEN #{startRow} AND #{endRow};
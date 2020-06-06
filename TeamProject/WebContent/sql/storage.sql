create table member(
	id varchar(20) not null primary key,
	password varchar(16) not null,
	name varchar(20) not null,
	nickname varchar(20) not null,
	email varchar(50) not null,
	area varchar(50) not null,
	createtime datetime not null);

		
-- 게시판 테이블
 
CREATE TABLE Member_Board 
(
  board_category varchar(10) not null,
  board_num int NOT NULL,
  board_nick VARCHAR(50),
  board_subject VARCHAR(100),
  board_content VARCHAR(2000),
  board_file VARCHAR(100),
  Board_re_ref int,
  Board_re_lev int,
  Board_re_seq int,
  Board_count int,
  Board_date DATE,
  CONSTRAINT PK_Member_Board PRIMARY KEY(board_num)
);
 
-- board_num : 게시물 글번호
-- board_nick : 글작성자 닉네임
-- board_subject : 글 제목
-- board_content : 글 내용
-- board_file : 첨부파일 이름
-- Board_re_ref : 글 그룹번호
-- Board_re_lev : 답변글 깊이
-- Board_re_seq : 답변글 순서
-- Board_count : 글 조회수
-- Board_date 작성날짜
 
 
-- 게시판 시퀀스
 
create sequence BOARD_NUM; 
 
-- 제약조건 추가
 
alter table MEMBER_BOARD
add constraint pk_board_id foreign key(board_id)
REFERENCES MEMBER(nickname);
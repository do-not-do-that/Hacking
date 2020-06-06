create table member(
	id varchar(20) not null primary key,
	password varchar(16) not null,
	name varchar(20) not null,
	nickname varchar(20) not null,
	email varchar(50) not null,
	area varchar(50) not null,
	createtime datetime not null);

		
-- �Խ��� ���̺�
 
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
 
-- board_num : �Խù� �۹�ȣ
-- board_nick : ���ۼ��� �г���
-- board_subject : �� ����
-- board_content : �� ����
-- board_file : ÷������ �̸�
-- Board_re_ref : �� �׷��ȣ
-- Board_re_lev : �亯�� ����
-- Board_re_seq : �亯�� ����
-- Board_count : �� ��ȸ��
-- Board_date �ۼ���¥
 
 
-- �Խ��� ������
 
create sequence BOARD_NUM; 
 
-- �������� �߰�
 
alter table MEMBER_BOARD
add constraint pk_board_id foreign key(board_id)
REFERENCES MEMBER(nickname);
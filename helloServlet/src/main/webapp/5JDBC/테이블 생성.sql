-- 회원 테이블 생성
create table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key (id)
);

-- 게시판 테이블 생성
create table board (
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);

-- 외래키 추가
alter table board
    add constraint board_mem_fk foreign key (id)
    references member (id);

-- 시퀀스 생성
create sequence seq_board_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
-- 더미데이터 입력
insert into member (id, pass, name) values ('test', '1234', '머스트해브');
insert into board  (num, title, content, id, postdate, visitcount) 
	values (seq_board_num.nextval, '제목1입니다', '내용1입니다', 'test', sysdate, 0);

-- comment 추가
comment on table board is '게시판';
comment on column board.num is '일련번호';
comment on column board.title is '제목';
comment on column board.content is '내용';
comment on column board.id is '작성자 아이디';
comment on column board.postdate is '작성일';
comment on column board.visitcount is '조회수';

comment on table member is '회원';
comment on column member.id is '아이디';
comment on column member.pass is '비밀번호';
comment on column member.name is '이름';
comment on column member.regidate is '생성일';


    
    
    
    
    
    
    
    
    
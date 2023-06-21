--파일 업로드와 다운로드를 위한 테이블 생성
drop table myfile;

create table myfile (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    cate varchar2(100),
    ofile varchar2(100) not null,
    sfile varchar2(100) not null,
    postdate date default sysdate not null
);

-- 시퀀스 생성
create sequence seq_board_num;

-- 데이터 입력
INSERT INTO myfile (  idx, name, title, cate, ofile, sfile)
VALUES ( seq_board_num.nextval, '하니', '제목', '카테고리'
                        , 'abc.txt', 'abc_20230621112622.txt');

-- 데이터 조회
SELECT * FROM myfile ORDER BY idx DESC;
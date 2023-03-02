-- BOARD TABLE DROP & CREATE
DROP TABLE BOARD;
CREATE TABLE BOARD(
    NUM     NUMBER(5,0)    PRIMARY KEY,   -- 글번호
    WRITER  VARCHAR2(30)   NOT NULL,      -- 글작성자
    SUBJECT VARCHAR2(100)  NOT NULL,      -- 글제목
    CONTENT VARCHAR2(4000) NOT NULL,      -- 본문
    EMAIL   VARCHAR2(30),                 -- 작성자 이메일
    READCOUNT NUMBER(5) DEFAULT 0,        -- 글 HIT (조회수)
    REF NUMBER (5,0) NOT NULL,            -- 글그룹(원글의 경우 글번호로  / 답변글일경우 원글의 REF로)
    RE_STEP NUMBER(3) NOT NULL,           -- 글그룹내 출력 순서(원글 0)
    RE_INDENT NUMBER(3) NOT NULL,         -- 글 LIST 출력시 글 제목 들여쓰기정도 원글은 0
    IP VARCHAR2(30) NOT NULL,             -- 글 작성시 컴퓨터 IP 주소
    RDATE DATE DEFAULT SYSDATE NOT NULL   -- 글쓴시점 (날짜 + 시간)
);

-- 1. 글 갯수
SELECT COUNT(*) FROM BOARD ORDER BY REF DESC;

-- 2. 글목록 (글그룹이 최신인 글이 위로)
SELECT * FROM BOARD ORDER BY REF DESC;

-- 3. 글쓰기(원글쓰기) - 글쓴이, 글제목, 글본문, 이메일, PW
    -- 글번호를 생성
    SELECT NVL (MAX(NUM), 0)+1 FROM BOARD;
INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
    VALUES ((SELECT NVL (MAX(NUM), 0)+1 FROM BOARD), '홍길동', '제목용1', '본문용1', null,
            '111',(SELECT NVL (MAX(NUM), 0)+1 FROM BOARD), 0,0, '192.168.0.1');
    
    
    
    
    
    
INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, 
                    PW, REF, RE_STEP, RE_INDENT, IP)
  VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), '홍길동', '제목1', '본문\n방가', null,
                    '111', (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, '192.168.0.1' );  
    
    
    
    
    
    
    
    
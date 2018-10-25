/* 
 * 다중 게시판 구축을 위한 SQL
 * employees 테이블과 departments 테이블의 1 : N 구조 유사
 */
DROP TABLE board;

--#1. 게시판 테이블 생성
CREATE TABLE board(
    board_id    NUMBER(2)       NOT NULL,    -- 게시판 식별번호
    category    NUMBER(2)       NOT NULL,    -- 게시판 카테고리
    title       VARCHAR2(100)   NOT NULL,    -- 게시판 이름
    description VARCHAR2(200)                -- 게시판 상세설명
);


--#2. 게시판 테이블 제약사항 추가
ALTER TABLE board
	ADD CONSTRAINT board_id_pk PRIMARY KEY(board_id);


--#3. 테스트 게시판 등록
INSERT INTO board(board_id, category, title, description)
VALUES (1, 1, '코스타 자유게시판', '누구나 자유롭게 글을 쓰실 수 있는 자유게시판입니다.');

INSERT INTO board(board_id, category, title, description)
VALUES (2, 1, '코스타 만땅자료실', '이것 저것 없는게 없는 만땅 자료실입니다.');

INSERT INTO board(board_id, category, title, description)
VALUES (3, 2, '코스타 묻고답하기', 'IT 관련 무엇이든 물어 보세요.');

INSERT INTO board(board_id, category, title, description)
VALUES (4, 3, '코스타 구인/구직', 'IT 관련 구인/구직 게시판입니다.');

INSERT INTO board(board_id, category, title, description)
VALUES (5, 4, '코스타 공지사항', '공지사항 게시판입니다.');

COMMIT;

SELECT * FROM board;


DROP TABLE article;

--#4. 게시글 테이블 생성
CREATE TABLE article(
  article_id    NUMBER(7)        NOT NULL,                   -- 게시글 식별번호
  board_id      NUMBER(2)        DEFAULT 1 NOT NULL,         -- 소속 게시판번호
  writer        VARCHAR2(20)     NOT NULL,                   -- 작성자 아이디
  subject       VARCHAR2(400)    NOT NULL,                   -- 게시글 제목
  content       VARCHAR2(4000)   NOT NULL,                   -- 게시글 내용
  regdate       DATE             DEFAULT SYSDATE NOT NULL,   -- 게시글 등록일자
  hitcount      NUMBER(5)        DEFAULT 0 NOT NULL,         -- 게시글 조회수
  ip	          VARCHAR2(20)     NOT NULL,                   -- 작성자 아이피
  passwd        VARCHAR2(8)      NOT NULL,                   -- 게시글 비밀번호
  attach_file   VARCHAR2(20),                                -- 첨부파일
  group_no      NUMBER(7)        NOT NULL,                   -- 계층형 게시판 구조를 위한 게시글 그룹번호
  level_no      NUMBER(2)        NOT NULL,                   -- 계층형 게시판 구조를 위한 그룹내 게시글 레벨
  order_no      NUMBER(3)        NOT NULL                    -- 계층형 게시판 구조를 위한 그룹내 게시글 순서
);

--#5. 테이블 제약사항 추가
ALTER TABLE article 
  ADD ( CONSTRAINT article_id_pk PRIMARY KEY(article_id), 
        CONSTRAINT article_boardid_fk FOREIGN KEY(board_id) REFERENCES board(board_id), 
        CONSTRAINT article_writer_fk FOREIGN KEY(writer) REFERENCES users(id) ); 
  

--#6. 게시글 식별번호를 위한 시퀀스 생성
DROP SEQUENCE article_id_seq;

CREATE SEQUENCE article_id_seq
    START WITH   1
    INCREMENT BY 1
    NOCYCLE;
    
   

-- 필요시 게시글에 대한 댓글 테이블 생성
-- CREATE TABLE comment(^________________^);

--#7. 자유게시판 신규글 등록  테스트
INSERT INTO article 
            (article_id, 
             board_id, 
             writer, 
             subject, 
             content, 
             ip, 
             passwd, 
             group_no, 
             level_no, 
             order_no) 
VALUES     (article_id_seq.nextval, 
            1, 
            'bangry', 
            'bangry의 신규글 제목입니다.', 
            'bangry의 신규글 내용입니다.', 
            '127.0.0.1', 
            '1111', 
            article_id_seq.currval, 
            0, 
            0); 


desc users;

insert into users
values('sujin', '이수진', '1111', 'sujin@naver.com');

commit;
            
INSERT INTO article 
            (article_id, 
             board_id, 
             writer, 
             subject, 
             content, 
             ip, 
             passwd, 
             group_no, 
             level_no, 
             order_no) 
VALUES     (article_id_seq.nextval, 
            1, 
            'gildong', 
            'gildong의 신규글 제목입니다.', 
            'gildong의 신규글 내용입니다.', 
            '192.168.0.20', 
            '1111', 
            article_id_seq.currval, 
            0, 
            0); 
            

INSERT INTO article 
            (article_id, 
             board_id, 
             writer, 
             subject, 
             content, 
             ip, 
             passwd, 
             group_no, 
             level_no, 
             order_no) 
VALUES     (article_id_seq.nextval, 
            1, 
            'sujin', 
            'sujin의 신규글 제목입니다.', 
            'sujin의 신규글 내용입니다.', 
            '192.168.0.50', 
            '1111', 
            article_id_seq.currval, 
            0, 
            0); 

COMMIT;

-- 중간 점검
SELECT article_id,
       subject, 
       writer, 
       regdate, 
       ip, 
       hitcount 
FROM   article 
WHERE  board_id = 1 
ORDER  BY article_id DESC;

--------------------------------------------------------------------------------

-- #8. 신규글에 대한 첫번째 답변글 등록 테스트
INSERT INTO article 
            (article_id, 
             board_id, 
             writer, 
             subject, 
             content, 
             ip, 
             passwd, 
             group_no, 
             level_no, 
             order_no) 
VALUES      (article_id_seq.nextval, 
             1, 
             'gildong', 
             'bangry의 신규글에 대한 gildong의 첫번째 답변글 제목입니다', 
             'gildong의 첫번째 답변글 내용입니다', 
             '192.168.0.150', 
             '1111', 
             1, 
             1, 
             (SELECT MAX(order_no) + 1 
              FROM   article 
              WHERE  board_id = 1 
                     AND group_no = 1));


-- #9. 신규글에 대한 두번째 답변글 등록 테스트
INSERT INTO article 
            (article_id, 
             board_id, 
             writer, 
             subject, 
             content, 
             ip, 
             passwd, 
             group_no, 
             level_no, 
             order_no) 
VALUES      (article_id_seq.nextval, 
             1, 
             'sujin', 
             'bangry의 신규글에 대한 sujin의 첫번째 답변글 제목입니다', 
             'sujin의 첫번째 답변글 내용입니다.', 
             '192.168.0.170', 
             '1111', 
             1, 
             1, 
             (SELECT MAX(order_no) + 1 
              FROM   article 
              WHERE  board_id = 1 
                     AND group_no = 1));
                     
COMMIT;

-- 중간점검
SELECT article_id,
       subject, 
       writer, 
       regdate, 
       ip, 
       hitcount
FROM article
WHERE board_id = 1
ORDER BY group_no DESC, order_no ASC;


-- #10. 답변글에 대한 답변글 등록 테스트
-- 부모글의 article_id를 전달받아야 한다.(ex, article_id = 4) 
-- 등록전에 부모글보다 order_no이 큰  order_no을 1씩 증가시킨다
UPDATE article 
SET    order_no = order_no + 1 
WHERE  board_id = 1 
       AND group_no = 1 
       AND order_no > (SELECT order_no 
                       FROM   article 
                       WHERE  article_id = 4);
                       
-- 답변글에 대한 답변글 등록           
INSERT INTO article 
            (article_id, 
             board_id, 
             writer, 
             subject, 
             content, 
             ip, 
             passwd, 
             group_no, 
             level_no, 
             order_no) 
VALUES      (article_id_seq.nextval, 
             1, 
             'sujin', 
             'gildong의 답변글에 대한 sujin의 답변글 제목입니다', 
             'jisung의 답변글 내용입니다.', 
             '192.168.0.150', 
             '1111', 
             1, 
             2, 
             (SELECT order_no + 1 
              FROM   article 
              WHERE  article_id = 4));
              
              
              
COMMIT;

-------------------------------------------------------

-- 중간점검
SELECT article_id,
       subject, 
       writer, 
       regdate, 
       ip, 
       hitcount,
       group_no,
       level_no,
       order_no
FROM article
WHERE board_id = 1
ORDER BY group_no DESC, order_no ASC;


--#11. 게시글 전체목록 조회 테스트를 위한 테스트 신규글 등록(서브쿼리 활용)
INSERT INTO article 
            (article_id, 
             board_id, 
             writer, 
             subject, 
             content, 
             ip, 
             passwd, 
             group_no, 
             level_no, 
             order_no) 
(SELECT article_id_seq.NEXTVAL, 
        1, 
        writer, 
        subject, 
        content, 
        ip, 
        passwd, 
        article_id_seq.CURRVAL, 
        level_no, 
        order_no 
 FROM   article 
 WHERE  writer = 'bangry');


COMMIT;

--#12. 계층형 게시판을 위한 게시글목록 조회
SELECT subject,
       writer, 
       regdate, 
       ip, 
       hitcount, 
       group_no, 
       level_no, 
       order_no 
FROM   article 
WHERE  board_id = 1 
ORDER  BY group_no DESC, 
          order_no ASC; 


--#13. 게시글목록 페이징 처리를 위한 조회(가상컬럼(rownum)과 서브쿼리 활용)
SELECT subject, 
       writer, 
       regdate, 
       ip, 
       hitcount 
FROM   (SELECT CEIL(rownum / 10) request_page, 
               subject, 
               writer, 
               TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI') regdate, 
               ip, 
               hitcount 
        FROM   (SELECT subject, 
                       writer, 
                       regdate, 
                       ip, 
                       hitcount 
                FROM   article 
                WHERE  board_id = 1 --자유게시글 
                ORDER  BY group_no DESC, 
                          order_no ASC)) 
WHERE  request_page = 1; 



--#14. 검색조건별 조회
SELECT subject, 
       writer, 
       regdate, 
       ip, 
       hitcount 
FROM   (SELECT CEIL(rownum / 10) request_page, 
               subject, 
               writer, 
               TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI') regdate, 
               ip, 
               hitcount 
        FROM   (SELECT subject, 
                       writer, 
                       regdate, 
                       ip, 
                       hitcount 
                FROM   article 
                WHERE  board_id = 1
                    AND subject  LIKE '%신규글%'
                    --AND content LIKE '%답변글%'
                    --AND writer = 'bangry'
                ORDER  BY group_no DESC, 
                          order_no ASC)) 
WHERE  request_page = 1; 



-- #15. 게시글 상세보기
SELECT subject, 
       writer, 
       TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') regdate, 
       ip, 
       hitcount, 
       content 
FROM   article 
WHERE  board_id = 1 
       AND article_id = 1; 


-- #16. 게시글 상세보기 시 조회수 증가
UPDATE article 
SET    hitcount = hitcount + 1 
WHERE  board_id = 1 
       AND article_id = 1; 

COMMIT;

-- 자료실 목록
SELECT attach_file,
       writer, 
       subject, 
       content, 
       TO_CHAR(regdate, 'YYYY/MM/DD HH24:MI:SS') regdate 
FROM   article 
WHERE  board_id = 2 
ORDER  BY article_id DESC ;


SELECT attach_file, 
       writer,
       subject,
       content,
       regdate 
FROM   (SELECT CEIL(rownum / 10) request_page, 
               attach_file,
               writer,
               subject, 
               content, 
               TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI') regdate 
        FROM   (SELECT attach_file, 
                       writer,
                       subject,
                       content,
                       regdate
                FROM   article 
                WHERE  board_id = 2
                       AND attach_file  LIKE '%.exe%'
                     --AND writer = 'bangry'
                     --AND subject LIKE '%조은%'
                ORDER  BY article_id DESC)) 
WHERE  request_page = 1; 
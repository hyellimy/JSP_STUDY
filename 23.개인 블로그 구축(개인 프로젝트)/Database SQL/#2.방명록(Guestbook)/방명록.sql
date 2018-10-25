drop table guestbook;

-- 방명록 테이블 생성
CREATE TABLE guestbook (
    guestbook_id NUMBER,
    user_id      VARCHAR2(8)    NOT NULL,
    contents     VARCHAR2(4000) NOT NULL,
    regdate      DATE           DEFAULT SYSDATE NOT NULL
);

-- 테이블에 제약사항 추가
ALTER TABLE guestbook
    ADD (
        CONSTRAINT guestbook_id_pk PRIMARY KEY(guestbook_id),
        CONSTRAINT guestbook_user_id_fk FOREIGN KEY(user_id)
            REFERENCES users(id));

-- 시퀀스 생성
CREATE SEQUENCE guestbook_seq
    START WITH 1
    NOCYCLE;

-- 테스트(더미) 데이터 입력 및 검색
INSERT INTO guestbook(guestbook_id, user_id, contents)
VALUES (GUESTBOOK_SEQ.NEXTVAL, 'bangry', '좋은 내용 감사합니다.');

-- 많은 데이터 입력을 위해 서브쿼리 활용
INSERT INTO guestbook 
            (guestbook_id, 
             user_id, 
             CONTENTS) 
(SELECT guestbook_seq.NEXTVAL, 
        user_id, 
        CONTENTS 
 FROM   guestbook); 

COMMIT;

SELECT guestbook_id, user_id, contents, TO_CHAR(regdate, 'YYYY/MM/DD HH24:MI DAY') regdagte
FROM guestbook
ORDER BY guestbook_id desc;
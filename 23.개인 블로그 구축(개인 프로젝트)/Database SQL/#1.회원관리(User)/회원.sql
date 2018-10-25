drop table users;

-- 사용자 정보 저장을 위한 테이블 생성
CREATE TABLE users(
     id         VARCHAR2(8),
     name       VARCHAR2(20)    NOT NULL,
     passwd     VARCHAR2(8)     NOT NULL,
     email      VARCHAR2(50)    NOT NULL,
     telephone  VARCHAR2(30),
     job        VARCHAR2(20)    NOT NULL,
     message    VARCHAR2(4000),
     regdate    DATE DEFAULT sysdate NOT NULL
);

-- 테이블 변경을 이용한 제약사항 추가
ALTER TABLE users
  ADD(CONSTRAINT users_id_pk    PRIMARY KEY(id),
      CONSTRAINT users_email_uk UNIQUE(email),
      CONSTRAINT users_job_ck   CHECK (job in('회사원', '강사', '학생', '기타')));
  
desc users;

-- 테스트(Dummy) 데이터 인서트
INSERT INTO users 
            (id, 
             name, 
             passwd,
             email,
             telephone,
             job,
             message) 
VALUES     ('bangry', 
            '김기정', 
            '1111',
            'bangry313@naver.com',
            '010-9179-8707',
            '강사',
            '잘 부탁혀유....');

INSERT INTO users 
            (id, 
             name, 
             passwd,
             email,
             telephone,
             job,
             message) 
VALUES     ('jisung', 
            '박지성', 
            '1234',
            'jisung@korea.com',
            '010-1111-2222',
            '기타',
            '제일 좋아하는 축구선수');

INSERT INTO users 
            (id, 
             name, 
             passwd,
             email,
             telephone,
             job,
             message) 
VALUES     ('sujin', 
            '한수진', 
            '1111',
            'sujin@korea.com',
            '010-1111-2222',
            '학생',
            '이쁜 학생입니다.'); 

commit;

-- 전체 조회
SELECT id, 
       name, 
       passwd,
       email,
       telephone,
       job,
       message,
       TO_CHAR(regdate, 'YYYY-MM-DD DAY') regdate 
FROM   users;
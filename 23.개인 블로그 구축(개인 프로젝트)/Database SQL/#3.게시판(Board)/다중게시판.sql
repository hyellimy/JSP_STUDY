/* 
 * ���� �Խ��� ������ ���� SQL
 * employees ���̺�� departments ���̺��� 1 : N ���� ����
 */
DROP TABLE board;

--#1. �Խ��� ���̺� ����
CREATE TABLE board(
    board_id    NUMBER(2)       NOT NULL,    -- �Խ��� �ĺ���ȣ
    category    NUMBER(2)       NOT NULL,    -- �Խ��� ī�װ�
    title       VARCHAR2(100)   NOT NULL,    -- �Խ��� �̸�
    description VARCHAR2(200)                -- �Խ��� �󼼼���
);


--#2. �Խ��� ���̺� ������� �߰�
ALTER TABLE board
	ADD CONSTRAINT board_id_pk PRIMARY KEY(board_id);


--#3. �׽�Ʈ �Խ��� ���
INSERT INTO board(board_id, category, title, description)
VALUES (1, 1, '�ڽ�Ÿ �����Խ���', '������ �����Ӱ� ���� ���� �� �ִ� �����Խ����Դϴ�.');

INSERT INTO board(board_id, category, title, description)
VALUES (2, 1, '�ڽ�Ÿ �����ڷ��', '�̰� ���� ���°� ���� ���� �ڷ���Դϴ�.');

INSERT INTO board(board_id, category, title, description)
VALUES (3, 2, '�ڽ�Ÿ ������ϱ�', 'IT ���� �����̵� ���� ������.');

INSERT INTO board(board_id, category, title, description)
VALUES (4, 3, '�ڽ�Ÿ ����/����', 'IT ���� ����/���� �Խ����Դϴ�.');

INSERT INTO board(board_id, category, title, description)
VALUES (5, 4, '�ڽ�Ÿ ��������', '�������� �Խ����Դϴ�.');

COMMIT;

SELECT * FROM board;


DROP TABLE article;

--#4. �Խñ� ���̺� ����
CREATE TABLE article(
  article_id    NUMBER(7)        NOT NULL,                   -- �Խñ� �ĺ���ȣ
  board_id      NUMBER(2)        DEFAULT 1 NOT NULL,         -- �Ҽ� �Խ��ǹ�ȣ
  writer        VARCHAR2(20)     NOT NULL,                   -- �ۼ��� ���̵�
  subject       VARCHAR2(400)    NOT NULL,                   -- �Խñ� ����
  content       VARCHAR2(4000)   NOT NULL,                   -- �Խñ� ����
  regdate       DATE             DEFAULT SYSDATE NOT NULL,   -- �Խñ� �������
  hitcount      NUMBER(5)        DEFAULT 0 NOT NULL,         -- �Խñ� ��ȸ��
  ip	          VARCHAR2(20)     NOT NULL,                   -- �ۼ��� ������
  passwd        VARCHAR2(8)      NOT NULL,                   -- �Խñ� ��й�ȣ
  attach_file   VARCHAR2(20),                                -- ÷������
  group_no      NUMBER(7)        NOT NULL,                   -- ������ �Խ��� ������ ���� �Խñ� �׷��ȣ
  level_no      NUMBER(2)        NOT NULL,                   -- ������ �Խ��� ������ ���� �׷쳻 �Խñ� ����
  order_no      NUMBER(3)        NOT NULL                    -- ������ �Խ��� ������ ���� �׷쳻 �Խñ� ����
);

--#5. ���̺� ������� �߰�
ALTER TABLE article 
  ADD ( CONSTRAINT article_id_pk PRIMARY KEY(article_id), 
        CONSTRAINT article_boardid_fk FOREIGN KEY(board_id) REFERENCES board(board_id), 
        CONSTRAINT article_writer_fk FOREIGN KEY(writer) REFERENCES users(id) ); 
  

--#6. �Խñ� �ĺ���ȣ�� ���� ������ ����
DROP SEQUENCE article_id_seq;

CREATE SEQUENCE article_id_seq
    START WITH   1
    INCREMENT BY 1
    NOCYCLE;
    
   

-- �ʿ�� �Խñۿ� ���� ��� ���̺� ����
-- CREATE TABLE comment(^________________^);

--#7. �����Խ��� �űԱ� ���  �׽�Ʈ
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
            'bangry�� �űԱ� �����Դϴ�.', 
            'bangry�� �űԱ� �����Դϴ�.', 
            '127.0.0.1', 
            '1111', 
            article_id_seq.currval, 
            0, 
            0); 


desc users;

insert into users
values('sujin', '�̼���', '1111', 'sujin@naver.com');

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
            'gildong�� �űԱ� �����Դϴ�.', 
            'gildong�� �űԱ� �����Դϴ�.', 
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
            'sujin�� �űԱ� �����Դϴ�.', 
            'sujin�� �űԱ� �����Դϴ�.', 
            '192.168.0.50', 
            '1111', 
            article_id_seq.currval, 
            0, 
            0); 

COMMIT;

-- �߰� ����
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

-- #8. �űԱۿ� ���� ù��° �亯�� ��� �׽�Ʈ
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
             'bangry�� �űԱۿ� ���� gildong�� ù��° �亯�� �����Դϴ�', 
             'gildong�� ù��° �亯�� �����Դϴ�', 
             '192.168.0.150', 
             '1111', 
             1, 
             1, 
             (SELECT MAX(order_no) + 1 
              FROM   article 
              WHERE  board_id = 1 
                     AND group_no = 1));


-- #9. �űԱۿ� ���� �ι�° �亯�� ��� �׽�Ʈ
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
             'bangry�� �űԱۿ� ���� sujin�� ù��° �亯�� �����Դϴ�', 
             'sujin�� ù��° �亯�� �����Դϴ�.', 
             '192.168.0.170', 
             '1111', 
             1, 
             1, 
             (SELECT MAX(order_no) + 1 
              FROM   article 
              WHERE  board_id = 1 
                     AND group_no = 1));
                     
COMMIT;

-- �߰�����
SELECT article_id,
       subject, 
       writer, 
       regdate, 
       ip, 
       hitcount
FROM article
WHERE board_id = 1
ORDER BY group_no DESC, order_no ASC;


-- #10. �亯�ۿ� ���� �亯�� ��� �׽�Ʈ
-- �θ���� article_id�� ���޹޾ƾ� �Ѵ�.(ex, article_id = 4) 
-- ������� �θ�ۺ��� order_no�� ū  order_no�� 1�� ������Ų��
UPDATE article 
SET    order_no = order_no + 1 
WHERE  board_id = 1 
       AND group_no = 1 
       AND order_no > (SELECT order_no 
                       FROM   article 
                       WHERE  article_id = 4);
                       
-- �亯�ۿ� ���� �亯�� ���           
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
             'gildong�� �亯�ۿ� ���� sujin�� �亯�� �����Դϴ�', 
             'jisung�� �亯�� �����Դϴ�.', 
             '192.168.0.150', 
             '1111', 
             1, 
             2, 
             (SELECT order_no + 1 
              FROM   article 
              WHERE  article_id = 4));
              
              
              
COMMIT;

-------------------------------------------------------

-- �߰�����
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


--#11. �Խñ� ��ü��� ��ȸ �׽�Ʈ�� ���� �׽�Ʈ �űԱ� ���(�������� Ȱ��)
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

--#12. ������ �Խ����� ���� �Խñ۸�� ��ȸ
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


--#13. �Խñ۸�� ����¡ ó���� ���� ��ȸ(�����÷�(rownum)�� �������� Ȱ��)
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
                WHERE  board_id = 1 --�����Խñ� 
                ORDER  BY group_no DESC, 
                          order_no ASC)) 
WHERE  request_page = 1; 



--#14. �˻����Ǻ� ��ȸ
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
                    AND subject  LIKE '%�űԱ�%'
                    --AND content LIKE '%�亯��%'
                    --AND writer = 'bangry'
                ORDER  BY group_no DESC, 
                          order_no ASC)) 
WHERE  request_page = 1; 



-- #15. �Խñ� �󼼺���
SELECT subject, 
       writer, 
       TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') regdate, 
       ip, 
       hitcount, 
       content 
FROM   article 
WHERE  board_id = 1 
       AND article_id = 1; 


-- #16. �Խñ� �󼼺��� �� ��ȸ�� ����
UPDATE article 
SET    hitcount = hitcount + 1 
WHERE  board_id = 1 
       AND article_id = 1; 

COMMIT;

-- �ڷ�� ���
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
                     --AND subject LIKE '%����%'
                ORDER  BY article_id DESC)) 
WHERE  request_page = 1; 
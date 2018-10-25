drop table guestbook;

-- ���� ���̺� ����
CREATE TABLE guestbook (
    guestbook_id NUMBER,
    user_id      VARCHAR2(8)    NOT NULL,
    contents     VARCHAR2(4000) NOT NULL,
    regdate      DATE           DEFAULT SYSDATE NOT NULL
);

-- ���̺� ������� �߰�
ALTER TABLE guestbook
    ADD (
        CONSTRAINT guestbook_id_pk PRIMARY KEY(guestbook_id),
        CONSTRAINT guestbook_user_id_fk FOREIGN KEY(user_id)
            REFERENCES users(id));

-- ������ ����
CREATE SEQUENCE guestbook_seq
    START WITH 1
    NOCYCLE;

-- �׽�Ʈ(����) ������ �Է� �� �˻�
INSERT INTO guestbook(guestbook_id, user_id, contents)
VALUES (GUESTBOOK_SEQ.NEXTVAL, 'bangry', '���� ���� �����մϴ�.');

-- ���� ������ �Է��� ���� �������� Ȱ��
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
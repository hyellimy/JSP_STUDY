drop table users;

-- ����� ���� ������ ���� ���̺� ����
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

-- ���̺� ������ �̿��� ������� �߰�
ALTER TABLE users
  ADD(CONSTRAINT users_id_pk    PRIMARY KEY(id),
      CONSTRAINT users_email_uk UNIQUE(email),
      CONSTRAINT users_job_ck   CHECK (job in('ȸ���', '����', '�л�', '��Ÿ')));
  
desc users;

-- �׽�Ʈ(Dummy) ������ �μ�Ʈ
INSERT INTO users 
            (id, 
             name, 
             passwd,
             email,
             telephone,
             job,
             message) 
VALUES     ('bangry', 
            '�����', 
            '1111',
            'bangry313@naver.com',
            '010-9179-8707',
            '����',
            '�� ��Ź����....');

INSERT INTO users 
            (id, 
             name, 
             passwd,
             email,
             telephone,
             job,
             message) 
VALUES     ('jisung', 
            '������', 
            '1234',
            'jisung@korea.com',
            '010-1111-2222',
            '��Ÿ',
            '���� �����ϴ� �౸����');

INSERT INTO users 
            (id, 
             name, 
             passwd,
             email,
             telephone,
             job,
             message) 
VALUES     ('sujin', 
            '�Ѽ���', 
            '1111',
            'sujin@korea.com',
            '010-1111-2222',
            '�л�',
            '�̻� �л��Դϴ�.'); 

commit;

-- ��ü ��ȸ
SELECT id, 
       name, 
       passwd,
       email,
       telephone,
       job,
       message,
       TO_CHAR(regdate, 'YYYY-MM-DD DAY') regdate 
FROM   users;
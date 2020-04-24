--테이블 드롭-
DROP TABLE CHATROOM CASCADE CONSTRAINTS;
DROP TABLE CHATMESSAGE CASCADE CONSTRAINTS;

--시퀀스 드롭--
DROP SEQUENCE SEQ_CRNO;
DROP SEQUENCE SEQ_CMNO;


--테이블--
--CHATROOM
CREATE TABLE CHATROOM(
    CR_NO VARCHAR2(50) /* 방 번호(PK) */,
    SENDID VARCHAR2(50) /* 보낸사람아이디 */,
    RECEIVEID VARCHAR2(100) /* 받는사람아이디 */,
    ROOMNAME VARCHAR2(50) /* 방이름 */,
    FLAG VARCHAR2(50) /* 구분 */,
    CREATEDATE DATE DEFAULT SYSDATE /* 방생성날짜 */,
    CONNECTYN VARCHAR2(1) DEFAULT 'Y' /* 방 생성확인 */
);


--제약조건--

ALTER TABLE CHATROOM ADD CONSTRAINT CR_PK_NO PRIMARY KEY (CR_NO);
ALTER TABLE CHATROOM MODIFY SENDID CONSTRAINT CR_NN_SENDID NOT NULL;
ALTER TABLE CHATROOM MODIFY RECEIVEID CONSTRAINT CR_NN_RECEIVEID NOT NULL;
ALTER TABLE CHATROOM MODIFY ROOMNAME CONSTRAINT CR_NN_ROOMNAME NOT NULL;
ALTER TABLE CHATROOM MODIFY FLAG CONSTRAINT CR_NN_FLAG NOT NULL;
ALTER TABLE CHATROOM MODIFY CREATEDATE CONSTRAINT CR_NN_CREATEDATE NOT NULL;
ALTER TABLE CHATROOM MODIFY CONNECTYN CONSTRAINT CR_NN_CONNECTYN NOT NULL;

--주석--

COMMENT ON COLUMN CHATROOM.CR_NO IS '방 번호(PK)';
COMMENT ON COLUMN CHATROOM.SENDID IS '보낸사람 아이디';
COMMENT ON COLUMN CHATROOM.RECEIVEID IS '받는사람 아이디';
COMMENT ON COLUMN CHATROOM.ROOMNAME IS '방이름';
COMMENT ON COLUMN CHATROOM.FLAG IS '구분';
COMMENT ON COLUMN CHATROOM.CREATEDATE IS '방생성날짜';
COMMENT ON COLUMN CHATROOM.CONNECTYN IS '방생성확인';

--CHATMESSAGE
CREATE TABLE CHATMESSAGE(
    CM_NO VARCHAR2(50) /* 메시지 번호(PK) */,
    CM_CR_NO VARCHAR2(50) /* 방 번호(FK) */,
    SENDID VARCHAR2(100) /* 보낸사람아이디 */,
    ROOMNAME VARCHAR2(50) /* 방이름 */,
    MESSAGE VARCHAR2(50) /* 메시지 내용 */,
    SENDDATE DATE DEFAULT SYSDATE /* 메시지 보낸 날짜 */,
    FLAG VARCHAR2(50) /* 구분 */,
    CONNECTYN VARCHAR2(1) DEFAULT 'Y' /* 방 생성확인 */
);


--제약조건--

ALTER TABLE CHATMESSAGE ADD CONSTRAINT CM_PK_NO PRIMARY KEY (CM_NO);
ALTER TABLE CHATMESSAGE ADD CONSTRAINT CM_CR_FK_NO FOREIGN KEY(CM_CR_NO) REFERENCES CHATROOM(CR_NO) ON DELETE CASCADE;
ALTER TABLE CHATMESSAGE MODIFY SENDID CONSTRAINT CM_NN_SENDID NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY ROOMNAME CONSTRAINT CM_NN_ROOMNAME NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY MESSAGE CONSTRAINT CM_NN_MESSAGE NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY SENDDATE CONSTRAINT CM_NN_SENDDATE NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY FLAG CONSTRAINT CM_NN_FLAG NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY CONNECTYN CONSTRAINT CM_NN_CONNECTYN NOT NULL;

--주석--

COMMENT ON COLUMN CHATMESSAGE.CM_NO IS '메시지 번호(PK)';
COMMENT ON COLUMN CHATMESSAGE.CM_CR_NO IS '방 번호(FK)';
COMMENT ON COLUMN CHATMESSAGE.SENDID IS '보낸사람 아이디';
COMMENT ON COLUMN CHATMESSAGE.ROOMNAME IS '보낸사람 아이디';
COMMENT ON COLUMN CHATMESSAGE.MESSAGE IS '메시지 내용';
COMMENT ON COLUMN CHATMESSAGE.SENDDATE IS '메시지 보낸 날짜';
COMMENT ON COLUMN CHATMESSAGE.FLAG IS '구분';
COMMENT ON COLUMN CHATMESSAGE.CONNECTYN IS '방생성확인';



--시퀀스--
CREATE SEQUENCE SEQ_CRNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_CMNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

COMMIT;
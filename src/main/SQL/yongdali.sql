------------------------- 이전의 테이블 및 시퀀스를 삭제 -------------------------
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE DRIVER CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE RESERVATION CASCADE CONSTRAINTS;
DROP TABLE ADDRESS CASCADE CONSTRAINTS;
DROP TABLE CHATROOM CASCADE CONSTRAINTS;
DROP TABLE CHATMESSAGE CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_DNO;
DROP SEQUENCE SEQ_NNO;
DROP SEQUENCE SEQ_RNO;
DROP SEQUENCE SEQ_ANO;
DROP SEQUENCE SEQ_CRNO;
DROP SEQUENCE SEQ_CMNO;


------------------------------- 테이블 (제약조건 설정 & 코멘트)-------------------------------------
-- MEMBER
CREATE TABLE MEMBER(
    M_NO VARCHAR2(50) /* 회원번호 */,       
    M_ID VARCHAR2(50) /* 회원 ID(이메일) */,                 
    PWD CHAR(60) /* 비밀번호 */,
    NAME VARCHAR2(50) /* 이름 */,
    PHONE VARCHAR2(14) /* 휴대폰번호 */,
    M_SORT VARCHAR2(9)/* 회원구분(관리자, 일반, 사업자) */,
    M_STATUS CHAR(6) /* 회원상태(정상, 휴면, 탈퇴) */,
    PUSH_ENABLED CHAR(1) /* 푸시 알림 설정(Y, N) */,
    ENROLLDATE DATE DEFAULT SYSDATE /* 가입일 */
);

ALTER TABLE MEMBER ADD CONSTRAINT M_PK_NO PRIMARY KEY (M_NO);
ALTER TABLE MEMBER ADD CONSTRAINT M_UQ_ID UNIQUE (M_ID);
ALTER TABLE MEMBER ADD CONSTRAINT M_CK_SORT CHECK (M_SORT IN ('관리자', '일반', '사업자'));
ALTER TABLE MEMBER ADD CONSTRAINT M_CK_STATUS CHECK (M_STATUS IN ('정상', '휴면', '탈퇴'));
ALTER TABLE MEMBER ADD CONSTRAINT M_CK_PUSH CHECK (PUSH_ENABLED IN ('Y', 'N'));

ALTER TABLE MEMBER MODIFY M_ID CONSTRAINT M_NN_ID NOT NULL;
ALTER TABLE MEMBER MODIFY PWD CONSTRAINT M_NN_PWD NOT NULL;
ALTER TABLE MEMBER MODIFY NAME CONSTRAINT M_NN_NAME NOT NULL;
ALTER TABLE MEMBER MODIFY PHONE CONSTRAINT M_NN_PHONE NOT NULL;
ALTER TABLE MEMBER MODIFY M_SORT CONSTRAINT M_NN_SORT NOT NULL;
ALTER TABLE MEMBER MODIFY M_STATUS CONSTRAINT M_NN_STATUS NOT NULL;
ALTER TABLE MEMBER MODIFY PUSH_ENABLED CONSTRAINT M_NN_PUSH NOT NULL;
ALTER TABLE MEMBER MODIFY ENROLLDATE CONSTRAINT M_NN_ENROLLDATE NOT NULL;



COMMENT ON COLUMN MEMBER.M_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.M_ID IS '회원 ID(이메일)';
COMMENT ON COLUMN MEMBER.PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.NAME IS '이름';
COMMENT ON COLUMN MEMBER.PHONE IS '휴대폰번호';
COMMENT ON COLUMN MEMBER.M_SORT IS '회원구분(관리자, 일반, 사업자)';
COMMENT ON COLUMN MEMBER.M_STATUS IS '회원상태(정상, 휴면, 탈퇴)';
COMMENT ON COLUMN MEMBER.PUSH_ENABLED IS '푸시 알림 설정(Y, N)';
COMMENT ON COLUMN MEMBER.ENROLLDATE IS '가입일';

-- DRIVER
CREATE TABLE DRIVER(
    D_NO VARCHAR2(50) /* 기사(사업자) 번호 */,
    D_M_NO VARCHAR2(50) /* 회원번호(FK) */,
    CAPACITY NUMBER(2,1) /* 차량 톤수 */,
    TYPE VARCHAR2(17) /* 차종 */ ,
    CAR_NO VARCHAR2(17) /* 차량번호 */,
    ID_IMG_ORIGIN VARCHAR2(300) /* 증명사진 원명*/,
    ID_IMG_RENAME VARCHAR2(300) /* 증명사진 가명*/,
    REGCARD_IMG_ORIGIN VARCHAR2(300) /* 차량등록증 원명*/,
    REGCARD_IMG_RENAME VARCHAR2(300) /* 차량등록증 가명*/
);

ALTER TABLE DRIVER ADD CONSTRAINT D_PK_NO PRIMARY KEY (D_NO);
ALTER TABLE DRIVER ADD CONSTRAINT D_M_FK_NO FOREIGN KEY (D_M_NO) REFERENCES MEMBER(M_NO) ON DELETE CASCADE;

ALTER TABLE DRIVER MODIFY D_M_NO CONSTRAINT D_M_NN_NO NOT NULL;
ALTER TABLE DRIVER MODIFY CAPACITY CONSTRAINT D_NN_CAPACITY NOT NULL;
ALTER TABLE DRIVER MODIFY TYPE CONSTRAINT D_NN_TYPE NOT NULL;
ALTER TABLE DRIVER MODIFY CAR_NO CONSTRAINT D_NN_CAR_NO NOT NULL;
ALTER TABLE DRIVER MODIFY ID_IMG_ORIGIN CONSTRAINT D_NN_ID_IMG_ORIGIN NOT NULL;
ALTER TABLE DRIVER MODIFY ID_IMG_RENAME CONSTRAINT D_NN_ID_IMG_RENAME NOT NULL;
ALTER TABLE DRIVER MODIFY REGCARD_IMG_ORIGIN CONSTRAINT D_NN_REGCARD_IMG_ORIGIN NOT NULL;
ALTER TABLE DRIVER MODIFY REGCARD_IMG_RENAME CONSTRAINT D_NN_REGCARD_IMG_RENAME NOT NULL;


COMMENT ON COLUMN DRIVER.D_NO IS '기사(사업자) 번호';
COMMENT ON COLUMN DRIVER.D_M_NO IS '회원번호(FK)';
COMMENT ON COLUMN DRIVER.CAPACITY IS '차량 톤수';
COMMENT ON COLUMN DRIVER.TYPE IS '차종';
COMMENT ON COLUMN DRIVER.CAR_NO IS '차량번호';
COMMENT ON COLUMN DRIVER.ID_IMG_ORIGIN IS '증명사진 원명';
COMMENT ON COLUMN DRIVER.ID_IMG_RENAME IS '증명사진 가명';
COMMENT ON COLUMN DRIVER.REGCARD_IMG_ORIGIN IS '차량등록증 원명';
COMMENT ON COLUMN DRIVER.REGCARD_IMG_RENAME IS '차량등록증 가명';



-- NOTICE
CREATE TABLE NOTICE(
    N_NO VARCHAR2(50) /* 번호 */,
    N_TITLE VARCHAR2(100) /* 제목 */,
    N_WRITER VARCHAR2(50) /* 작성자 */,
    N_CONTENT VARCHAR2(2100) /* 내용 */,
    N_IMG_ORIGIN VARCHAR2(300) /* 첨부파일 원명 */,
    N_IMG_RENAME VARCHAR2(300) /* 첨부파일 가명 */,
    N_SORT VARCHAR2(9) /* 구분(일반, 사업자, 공통) */,
    N_CREATEDATE DATE DEFAULT SYSDATE /* 처음 작성일 */,
    N_MODIFYDATE DATE DEFAULT SYSDATE /* 수정 작성일 */,
    N_STATUS VARCHAR2(1) DEFAULT 'Y' /* 게시글 상태 값 */
);

ALTER TABLE NOTICE ADD CONSTRAINT N_PK_NO PRIMARY KEY (N_NO);
ALTER TABLE NOTICE ADD CONSTRAINT N_CK_SORT CHECK (N_SORT IN ('일반', '사업자', '공통'));

ALTER TABLE NOTICE MODIFY N_TITLE CONSTRAINT N_NN_TITLE NOT NULL;
ALTER TABLE NOTICE MODIFY N_WRITER CONSTRAINT N_NN_WRITER NOT NULL;
ALTER TABLE NOTICE MODIFY N_CONTENT CONSTRAINT N_NN_CONTENT NOT NULL;
ALTER TABLE NOTICE MODIFY N_CREATEDATE CONSTRAINT N_NN_CREATEDATE NOT NULL;
ALTER TABLE NOTICE MODIFY N_MODIFYDATE CONSTRAINT N_NN_MODIFYDATE NOT NULL;
ALTER TABLE NOTICE MODIFY N_STATUS CONSTRAINT N_NN_STATUS NOT NULL;

COMMENT ON COLUMN NOTICE.N_NO IS '번호';
COMMENT ON COLUMN NOTICE.N_TITLE IS '제목';
COMMENT ON COLUMN NOTICE.N_WRITER IS '작성자';
COMMENT ON COLUMN NOTICE.N_CONTENT IS '내용';
COMMENT ON COLUMN NOTICE.N_IMG_ORIGIN IS '첨부파일 원명';
COMMENT ON COLUMN NOTICE.N_IMG_RENAME IS '첨부파일 가명';
COMMENT ON COLUMN NOTICE.N_SORT IS '구분(일반, 사업자, 공통)';
COMMENT ON COLUMN NOTICE.N_CREATEDATE IS '처음 작성일';
COMMENT ON COLUMN NOTICE.N_MODIFYDATE IS '수정 작성일';
COMMENT ON COLUMN NOTICE.N_STATUS IS '게시글 상태 값';

-- RESERVATION
CREATE TABLE RESERVATION(
    R_NO VARCHAR2(50),
    R_M_NO VARCHAR2(50) DEFAULT NULL,
    R_D_NO VARCHAR2(50) DEFAULT NULL,
    CAPACITY NUMBER(2,1),
    TYPE VARCHAR2(50),
    START_NAME VARCHAR2(100),
    END_NAME VARCHAR2(100),


    START_PHONE VARCHAR2(100),
    END_PHONE VARCHAR2(100),
    START_ADDR VARCHAR2(300),
    END_ADDR VARCHAR2(300),
    DISTANCE VARCHAR2(50),
    RIGHT_LOAD VARCHAR2(100),
    RIGHT_UNLOAD VARCHAR2(100),
    STARTDATE DATE,
    STARTTIME VARCHAR2(100),
    ENDDATE DATE,
    ENDTIME VARCHAR2(100),
    HELP_LOAD VARCHAR2(100),
    HELP_UNLOAD VARCHAR2(100),
    LUGGAGE VARCHAR2(4000),
    MSG VARCHAR2(2000),
    AMOUNT VARCHAR2(50),
    PAY_YN VARCHAR2(10) DEFAULT 'N',
    DEAL_YN VARCHAR2(10) DEFAULT 'N',
    DEALDATE DATE DEFAULT NULL,
    CALC_YN VARCHAR2(10) DEFAULT NULL,
    CALCDATE DATE DEFAULT NULL,
    ENROLLDATE DATE DEFAULT SYSDATE
);

ALTER TABLE RESERVATION ADD CONSTRAINT R_PK_NO PRIMARY KEY (R_NO);
ALTER TABLE RESERVATION MODIFY START_ADDR CONSTRAINT R_NN_START_ADDR NOT NULL;
ALTER TABLE RESERVATION MODIFY END_ADDR CONSTRAINT R_NN_END_ADDR NOT NULL;
ALTER TABLE RESERVATION MODIFY DISTANCE CONSTRAINT R_NN_DISTANCE NOT NULL;
ALTER TABLE RESERVATION MODIFY START_NAME CONSTRAINT R_NN_START_NAME NOT NULL;
ALTER TABLE RESERVATION MODIFY END_NAME CONSTRAINT R_NN_END_NAME NOT NULL;
ALTER TABLE RESERVATION MODIFY START_PHONE CONSTRAINT R_NN_START_PHONE NOT NULL;
ALTER TABLE RESERVATION MODIFY END_PHONE CONSTRAINT R_NN_END_PHONE NOT NULL;
ALTER TABLE RESERVATION MODIFY LUGGAGE CONSTRAINT R_NN_LUGGAGE NOT NULL;
ALTER TABLE RESERVATION MODIFY AMOUNT CONSTRAINT R_NN_AMOUNT NOT NULL;
ALTER TABLE RESERVATION MODIFY PAY_YN CONSTRAINT R_NN_PAY_YN NOT NULL;
ALTER TABLE RESERVATION MODIFY ENROLLDATE CONSTRAINT R_NN_ENROLLDATE NOT NULL;
ALTER TABLE RESERVATION ADD CONSTRAINT R_M_FK_NO FOREIGN KEY(R_M_NO) REFERENCES MEMBER(M_NO) ON DELETE CASCADE;
ALTER TABLE RESERVATION ADD CONSTRAINT R_D_FK_NO FOREIGN KEY(R_D_NO) REFERENCES DRIVER(D_NO) ON DELETE CASCADE;

COMMENT ON COLUMN RESERVATION.R_NO IS '예약번호';
COMMENT ON COLUMN RESERVATION.R_M_NO IS '멤버 외래키';
COMMENT ON COLUMN RESERVATION.R_D_NO IS '기사 외래키';
COMMENT ON COLUMN RESERVATION.CAPACITY IS '차량 크기';
COMMENT ON COLUMN RESERVATION.TYPE IS '차량 옵션';
COMMENT ON COLUMN RESERVATION.START_ADDR IS '출발지';
COMMENT ON COLUMN RESERVATION.END_ADDR IS '도착지';
COMMENT ON COLUMN RESERVATION.DISTANCE IS '거리';
COMMENT ON COLUMN RESERVATION.START_NAME IS '상차할 이름';
COMMENT ON COLUMN RESERVATION.END_NAME IS '하차받을 이름';
COMMENT ON COLUMN RESERVATION.START_PHONE IS '상차 연락처';
COMMENT ON COLUMN RESERVATION.END_PHONE IS '하차 연락처';
COMMENT ON COLUMN RESERVATION.RIGHT_LOAD IS '바로 상차';
COMMENT ON COLUMN RESERVATION.RIGHT_UNLOAD IS '바로 하차';
COMMENT ON COLUMN RESERVATION.STARTDATE IS '상차 날짜';
COMMENT ON COLUMN RESERVATION.STARTTIME IS '상차 시각';
COMMENT ON COLUMN RESERVATION.ENDDATE IS '하차 날짜';
COMMENT ON COLUMN RESERVATION.ENDTIME IS '하차 시각';
COMMENT ON COLUMN RESERVATION.HELP_LOAD IS '상차 도움';
COMMENT ON COLUMN RESERVATION.HELP_UNLOAD IS '하차 도움';
COMMENT ON COLUMN RESERVATION.LUGGAGE IS '이삿짐';
COMMENT ON COLUMN RESERVATION.MSG IS '전달 사항';
COMMENT ON COLUMN RESERVATION.AMOUNT IS '결제 금액';
COMMENT ON COLUMN RESERVATION.PAY_YN IS '결제유무';
COMMENT ON COLUMN RESERVATION.DEAL_YN IS '거래 성사 유무';
COMMENT ON COLUMN RESERVATION.DEALDATE IS '거래 성사 날짜';
COMMENT ON COLUMN RESERVATION.CALC_YN IS '정산 유무';
COMMENT ON COLUMN RESERVATION.CALCDATE IS '정산 날짜';
COMMENT ON COLUMN RESERVATION.ENROLLDATE IS '예약 등록 날짜';

-- ADDRESS
CREATE TABLE ADDRESS(
    A_NO VARCHAR2(50) /* 주소록 번호(PK) */,
    A_M_NO VARCHAR(50) /* 회원번호(FK) */,
    PLACE VARCHAR2(50) DEFAULT NULL /* 배송지명 */,
    NAME VARCHAR(50 ) /* 이름 */,
    ADDRESS VARCHAR2(300) /*주소*/,
    PHONE VARCHAR2(14) /* 연락처 */,
    RECENTDATE DATE DEFAULT NULL /*최근 사용일*/
);

ALTER TABLE ADDRESS ADD CONSTRAINT A_PK_NO PRIMARY KEY (A_NO);
ALTER TABLE ADDRESS ADD CONSTRAINT A_M_FK_NO FOREIGN KEY (A_M_NO) REFERENCES MEMBER(M_NO) ON DELETE CASCADE;
ALTER TABLE ADDRESS MODIFY A_M_NO CONSTRAINT A_M_NN_NO NOT NULL;
ALTER TABLE ADDRESS MODIFY PLACE CONSTRAINT A_NN_PLACE NOT NULL;
ALTER TABLE ADDRESS MODIFY NAME CONSTRAINT A_NN_NAME NOT NULL;
ALTER TABLE ADDRESS MODIFY ADDRESS CONSTRAINT A_NN_ADDRESS NOT NULL;
ALTER TABLE ADDRESS MODIFY PHONE CONSTRAINT A_NN_PHONE NOT NULL;

COMMENT ON COLUMN ADDRESS.A_NO IS '주소록 번호(PK)';
COMMENT ON COLUMN ADDRESS.A_M_NO IS '회원번호(FK)';
COMMENT ON COLUMN ADDRESS.PLACE IS '배송지명';
COMMENT ON COLUMN ADDRESS.NAME IS '이름';
COMMENT ON COLUMN ADDRESS.ADDRESS IS '주소';
COMMENT ON COLUMN ADDRESS.PHONE IS '연락처';
COMMENT ON COLUMN ADDRESS.RECENTDATE IS '최근 사용일';

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

ALTER TABLE CHATROOM ADD CONSTRAINT CR_PK_NO PRIMARY KEY (CR_NO);
ALTER TABLE CHATROOM MODIFY SENDID CONSTRAINT CR_NN_SENDID NOT NULL;
ALTER TABLE CHATROOM MODIFY RECEIVEID CONSTRAINT CR_NN_RECEIVEID NOT NULL;
ALTER TABLE CHATROOM MODIFY ROOMNAME CONSTRAINT CR_NN_ROOMNAME NOT NULL;
ALTER TABLE CHATROOM MODIFY FLAG CONSTRAINT CR_NN_FLAG NOT NULL;
ALTER TABLE CHATROOM MODIFY CREATEDATE CONSTRAINT CR_NN_CREATEDATE NOT NULL;
ALTER TABLE CHATROOM MODIFY CONNECTYN CONSTRAINT CR_NN_CONNECTYN NOT NULL;

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

ALTER TABLE CHATMESSAGE ADD CONSTRAINT CM_PK_NO PRIMARY KEY (CM_NO);
ALTER TABLE CHATMESSAGE ADD CONSTRAINT CM_CR_FK_NO FOREIGN KEY(CM_CR_NO) REFERENCES CHATROOM(CR_NO) ON DELETE CASCADE;
ALTER TABLE CHATMESSAGE MODIFY SENDID CONSTRAINT CM_NN_SENDID NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY ROOMNAME CONSTRAINT CM_NN_ROOMNAME NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY MESSAGE CONSTRAINT CM_NN_MESSAGE NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY SENDDATE CONSTRAINT CM_NN_SENDDATE NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY FLAG CONSTRAINT CM_NN_FLAG NOT NULL;
ALTER TABLE CHATMESSAGE MODIFY CONNECTYN CONSTRAINT CM_NN_CONNECTYN NOT NULL;

COMMENT ON COLUMN CHATMESSAGE.CM_NO IS '메시지 번호(PK)';
COMMENT ON COLUMN CHATMESSAGE.CM_CR_NO IS '방 번호(FK)';
COMMENT ON COLUMN CHATMESSAGE.SENDID IS '보낸사람 아이디';
COMMENT ON COLUMN CHATMESSAGE.ROOMNAME IS '보낸사람 아이디';
COMMENT ON COLUMN CHATMESSAGE.MESSAGE IS '메시지 내용';
COMMENT ON COLUMN CHATMESSAGE.SENDDATE IS '메시지 보낸 날짜';
COMMENT ON COLUMN CHATMESSAGE.FLAG IS '구분';
COMMENT ON COLUMN CHATMESSAGE.CONNECTYN IS '방생성확인';

------------------------------- 시퀀스 생성 -------------------------------------
-- Member Number
CREATE SEQUENCE SEQ_MNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- Driver Number
CREATE SEQUENCE SEQ_DNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- Notice Number
CREATE SEQUENCE SEQ_NNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
       
-- Reservation Number
CREATE SEQUENCE SEQ_RNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;       

-- Address Number
CREATE SEQUENCE SEQ_ANO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

/* 채팅방 번호 시퀀스*/
CREATE SEQUENCE SEQ_CRNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

/* 채팅 메시지 번호 시퀀스*/
CREATE SEQUENCE SEQ_CMNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;       
                  
COMMIT;                        
--SELECT * FROM MEMBER;
--SELECT * FROM DRIVER;
--SELECT * FROM NOTICE;
--SELECT * FROM RESERVATION;
--SELECT * FROM ADDRESS;

-- 수정자 : 이탐희
-- 수정일시 : 200413_16:06
-- reservation/member/driver 수정 / address 추가

-- 수정자 : 손신혜
-- 수정일시 : 200416_7:33
-- ADDRESS 주석 수정

-- 수정자 : 이탐희
-- 수정일시 : 200416_20:54
-- Reservation 수정부분 반영수

-- 수정자 : 최진영
-- 수정일시 : 200420_12:15
-- Driver테이블 차량등록증 Column명 수정

-- 수정자 : 이탐희
-- 수정일시 : 200424_15:46
-- 채팅 테이블 추가
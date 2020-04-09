------------------------- 이전의 테이블 및 시퀀스를 삭제 -------------------------
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE DRIVER CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE RESERVATION CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_DNO;
DROP SEQUENCE SEQ_NNO;
DROP SEQUENCE SEQ_RNO;


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
    ENROLLDATE DATE DEFAULT SYSDATE /* 가입일 */
);

ALTER TABLE MEMBER ADD CONSTRAINT M_PK_NO PRIMARY KEY (M_NO);
ALTER TABLE MEMBER ADD CONSTRAINT M_UQ_ID UNIQUE (M_ID);
ALTER TABLE MEMBER ADD CONSTRAINT M_CK_SORT CHECK (M_SORT IN ('관리자', '일반', '사업자'));
ALTER TABLE MEMBER ADD CONSTRAINT M_CK_STATUS CHECK (M_STATUS IN ('정상', '휴면', '사업자'));

ALTER TABLE MEMBER MODIFY M_ID CONSTRAINT M_NN_ID NOT NULL;
ALTER TABLE MEMBER MODIFY PWD CONSTRAINT M_NN_PWD NOT NULL;
ALTER TABLE MEMBER MODIFY NAME CONSTRAINT M_NN_NAME NOT NULL;
ALTER TABLE MEMBER MODIFY PHONE CONSTRAINT M_NN_PHONE NOT NULL;
ALTER TABLE MEMBER MODIFY M_SORT CONSTRAINT M_NN_SORT NOT NULL;
ALTER TABLE MEMBER MODIFY M_STATUS CONSTRAINT M_NN_STATUS NOT NULL;
ALTER TABLE MEMBER MODIFY ENROLLDATE CONSTRAINT M_NN_ENROLLDATE NOT NULL;

COMMENT ON COLUMN MEMBER.M_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.M_ID IS '회원 ID(이메일)';
COMMENT ON COLUMN MEMBER.PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.NAME IS '이름';
COMMENT ON COLUMN MEMBER.PHONE IS '휴대폰번호';
COMMENT ON COLUMN MEMBER.M_SORT IS '회원구분(관리자, 일반, 사업자)';
COMMENT ON COLUMN MEMBER.M_SORT IS '회원상태(정상, 휴면, 탈퇴)';
COMMENT ON COLUMN MEMBER.ENROLLDATE IS '가입일';

-- DRIVER
CREATE TABLE DRIVER(
    D_NO VARCHAR2(50) /* 기사(사업자) 번호 */,
    D_M_NO VARCHAR2(50) /* 회원번호(FK) */,
    CAPACITY NUMBER(10) /* 차량 톤수 */,
    TYPE VARCHAR2(17) /* 차종 */ ,
    CAR_NO VARCHAR2(17) /* 차량번호 */,
    ID_IMG_ORIGIN VARCHAR2(300) /* 증명사진 원명*/,
    ID_IMG_RENAME VARCHAR2(300) /* 증명사진 가명*/,
    CAR_IMG_ORIGIN VARCHAR2(300) /* 차량사진 원명*/,
    CAR_IMG_RENAME VARCHAR2(300) /* 차량사진 가명*/
);

ALTER TABLE DRIVER ADD CONSTRAINT D_PK_NO PRIMARY KEY (D_NO);
ALTER TABLE DRIVER ADD CONSTRAINT D_M_FK_NO FOREIGN KEY (D_M_NO) REFERENCES MEMBER(M_NO) ON DELETE CASCADE;

ALTER TABLE DRIVER MODIFY D_M_NO CONSTRAINT D_M_NN_NO NOT NULL;
ALTER TABLE DRIVER MODIFY CAPACITY CONSTRAINT D_NN_CAPACITY NOT NULL;
ALTER TABLE DRIVER MODIFY TYPE CONSTRAINT D_NN_TYPE NOT NULL;
ALTER TABLE DRIVER MODIFY CAR_NO CONSTRAINT D_NN_CAR_NO NOT NULL;
ALTER TABLE DRIVER MODIFY ID_IMG_ORIGIN CONSTRAINT D_NN_ID_IMG_ORIGIN NOT NULL;
ALTER TABLE DRIVER MODIFY ID_IMG_RENAME CONSTRAINT D_NN_ID_IMG_RENAME NOT NULL;
ALTER TABLE DRIVER MODIFY CAR_IMG_ORIGIN CONSTRAINT D_NN_CAR_IMG_ORIGIN NOT NULL;
ALTER TABLE DRIVER MODIFY CAR_IMG_RENAME CONSTRAINT D_NN_CAR_IMG_RENAME NOT NULL;


COMMENT ON COLUMN DRIVER.D_NO IS '기사(사업자) 번호';
COMMENT ON COLUMN DRIVER.D_M_NO IS '회원번호(FK)';
COMMENT ON COLUMN DRIVER.CAPACITY IS '차량 톤수';
COMMENT ON COLUMN DRIVER.TYPE IS '차종';
COMMENT ON COLUMN DRIVER.CAR_NO IS '차량번호';
COMMENT ON COLUMN DRIVER.ID_IMG_ORIGIN IS '증명사진 원명';
COMMENT ON COLUMN DRIVER.ID_IMG_RENAME IS '증명사진 가명';
COMMENT ON COLUMN DRIVER.CAR_IMG_ORIGIN IS '차량사진 원명';
COMMENT ON COLUMN DRIVER.CAR_IMG_RENAME IS '차량사진 가명';


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

    CAPACITY VARCHAR2(50),
    TYPE VARCHAR2(50),

    START_ADDR VARCHAR2(300),
    END_ADDR VARCHAR2(300),

    DISTANCE NUMBER(10),
    PHONE1 VARCHAR2(100),
    PHONE2 VARCHAR2(100),

    RIGHT_LOAD VARCHAR2(100),
    RIGHT_UNLOAD VARCHAR2(100),
    STARTDATE DATE,
    ENDDATE DATE,
    HELP_LOAD VARCHAR2(100),
    HELP_UNLOAD VARCHAR2(100),
    LUGGAGE VARCHAR2(4000),
    MSG VARCHAR2(2000),
    AMOUNT NUMBER(20),
    PAY_YN VARCHAR2(10) DEFAULT 'N',
    DEAL_YN VARCHAR2(10) DEFAULT NULL,
    DEALDATE DATE DEFAULT NULL,
    ENROLLDATE DATE DEFAULT SYSDATE
);

ALTER TABLE RESERVATION ADD CONSTRAINT R_PK_NO PRIMARY KEY (R_NO);
ALTER TABLE RESERVATION MODIFY START_ADDR CONSTRAINT R_NN_START_ADDR NOT NULL;
ALTER TABLE RESERVATION MODIFY END_ADDR CONSTRAINT R_NN_END_ADDR NOT NULL;
ALTER TABLE RESERVATION MODIFY DISTANCE CONSTRAINT R_NN_DISTANCE NOT NULL;
ALTER TABLE RESERVATION MODIFY PHONE1 CONSTRAINT R_NN_PHONE1 NOT NULL;
ALTER TABLE RESERVATION MODIFY PHONE2 CONSTRAINT R_NN_PHONE2 NOT NULL;
ALTER TABLE RESERVATION MODIFY RIGHT_LOAD CONSTRAINT R_NN_RIGHT_LOAD NOT NULL;
ALTER TABLE RESERVATION MODIFY RIGHT_UNLOAD CONSTRAINT R_NN_RIGHT_UNLOAD NOT NULL;
ALTER TABLE RESERVATION MODIFY LUGGAGE CONSTRAINT R_NN_LUGGAGE NOT NULL;
ALTER TABLE RESERVATION MODIFY MSG CONSTRAINT R_NN_MSG NOT NULL;
ALTER TABLE RESERVATION MODIFY AMOUNT CONSTRAINT R_NN_AMOUNT NOT NULL;
ALTER TABLE RESERVATION MODIFY PAY_YN CONSTRAINT R_NN_PAY_YN NOT NULL;
ALTER TABLE RESERVATION MODIFY DEAL_YN CONSTRAINT R_NN_DEAL_YN NOT NULL;
ALTER TABLE RESERVATION MODIFY DEALDATE CONSTRAINT R_NN_DEALDATE NOT NULL;
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
COMMENT ON COLUMN RESERVATION.PHONE1 IS '상차 연락처';
COMMENT ON COLUMN RESERVATION.PHONE2 IS '하차 연락처';
COMMENT ON COLUMN RESERVATION.RIGHT_LOAD IS '바로 상차';
COMMENT ON COLUMN RESERVATION.RIGHT_UNLOAD IS '바로 하차';
COMMENT ON COLUMN RESERVATION.STARTDATE IS '상차 날짜';
COMMENT ON COLUMN RESERVATION.ENDDATE IS '하차 날짜';
COMMENT ON COLUMN RESERVATION.HELP_LOAD IS '상차 도움';
COMMENT ON COLUMN RESERVATION.HELP_UNLOAD IS '하차 도움';
COMMENT ON COLUMN RESERVATION.LUGGAGE IS '이삿짐';
COMMENT ON COLUMN RESERVATION.MSG IS '전달 사항';
COMMENT ON COLUMN RESERVATION.AMOUNT IS '결제 금액';
COMMENT ON COLUMN RESERVATION.PAY_YN IS '결제유무';
COMMENT ON COLUMN RESERVATION.DEAL_YN IS '거래 성사 유무';
COMMENT ON COLUMN RESERVATION.DEALDATE IS '거래 성사 날짜';
COMMENT ON COLUMN RESERVATION.ENROLLDATE IS '예약 등록 날짜';

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
                  
COMMIT;                        
--SELECT * FROM MEMBER;
--SELECT * FROM DRIVER;
--SELECT * FROM NOTICE;
--SELECT * FROM RESERVATION;

— 수정자 : 이탐희
— 수정일시 : 200409_21:31
— MEMBER/DRIVER/NOTICE/RESERVATION 테이블,시퀀스,제약조건,코멘트 생성
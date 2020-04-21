------------------------- 이전의 테이블 및 시퀀스를 삭제 -------------------------
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE DRIVER CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_DNO;


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

--PAYMENT
CREATE TABLE PAYMENT(
    P_NO VARCHAR2(50) /*결제번호(PK)*/,
    P_R_NO VARCHAR2(50) /*예약번호(FK)*/,
    P_D_NO VARCHAR2(50) /*기사번호*/,
    AMOUNT VARCHAR2(50) /*총금액*/,
    FEE VARCHAR2(50) /*용달이수익*/,
    CHARGE VARCHAR2(50) /*기사운임*/
    CALC_YN VARCHAR2(10) DEFAULT 'N'/*정산여부*/,
    CALC_DATE DATE /*정산날짜*/,
    CANC_YN VARCHAR2(10) DEFAULT 'N'/*취소여부*/,
    CANC_DATE DATE DEFAULT NULL /*취소날짜*/
);

ALTER TABLE PAYMENT ADD CONSTRAINT P_PK_NO PRIMARY KEY (P_NO);
ALTER TABLE PAYMENT ADD CONSTRAINT P_R_FK_NO FOREIGN KEY(P_R_NO) REFERENCES RESERVATION(R_NO) ON DELETE CASCADE;
ALTER TABLE PAYMENT MODIFY P_D_NO CONSTRAINT P_NN_D_NO NOT NULL;
ALTER TABLE PAYMENT MODIFY AMOUNT CONSTRAINT P_NN_AMOUNT NOT NULL;
ALTER TABLE PAYMENT MODIFY FEE CONSTRAINT P_NN_FEE NOT NULL;
ALTER TABLE PAYMENT MODIFY CHARGE CONSTRAINT P_NN_CHARGE NOT NULL;

COMMENT ON COLUMN PAYMENT.P_NO IS '결제번호';
COMMENT ON COLUMN PAYMENT.P_R_NO IS '예약번호';
COMMENT ON COLUMN PAYMENT.P_D_NO IS '기사번호';
COMMENT ON COLUMN PAYMENT.AMOUNT IS '총금액';
COMMENT ON COLUMN PAYMENT.FEE IS '용달이수익';
COMMENT ON COLUMN PAYMENT.CHARGE IS '기사운임';
COMMENT ON COLUMN PAYMENT.CALC_YN IS '정산여부';
COMMENT ON COLUMN PAYMENT.CALC_DATE IS '정산날짜';
COMMENT ON COLUMN PAYMENT.CANC_YN IS '취소여부';
COMMENT ON COLUMN PAYMENT.CANC_DATE IS '취소날짜';

CREATE SEQUENCE SEQ_PNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE TABLE REFUND(
    RF_NO VARCHAR2(10) /*환불규정번호*/,
    PERIOD VARCHAR2(10) /*환불기간*/,
    RATIO NUMBER /*비율*/ 
)

INSERT INTO REFUND VALUES("0", "거래완료",1);
INSERT INTO REFUND VALUES("1", "7일",0);
INSERT INTO REFUND VALUES("2", "2일",0.5);
INSERT INTO REFUND VALUES("3", "당일",1;

COMMENT ON COLUMN REFUND.RF_NO IS '환불규정번호';
COMMENT ON COLUMN REFUND.PERIOD IS '환불기간';
COMMENT ON COLUMN REFUND.RATIO IS '비율';


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


------------------------------- Insert -------------------------------------
-- MEMBER
--INSERT INTO MEMBER VALUES('M' || SEQ_MNO.NEXTVAL, 'admin@naver.com', 'admin', '유승제', '010-1111-1111', '관리자', '정상', 'N', '2020-03-10'); 
--INSERT INTO MEMBER VALUES('M' || SEQ_MNO.NEXTVAL, 'mem01@naver.com', 'mem01', '홍멤버', '010-2222-2222', '일반', '정상', 'Y','2020-03-18'); 
--INSERT INTO MEMBER VALUES('M' || SEQ_MNO.NEXTVAL, 'biz01@naver.com', 'biz01', '김거상', '010-3333-3333', '사업자', '정상', 'N', '2020-03-18'); 
--INSERT INTO MEMBER VALUES('M' || SEQ_MNO.NEXTVAL, 'biz02@naver.com', 'biz01', '최거상', '010-4444-4444', '사업자', '정상', 'N','2020-03-19'); 
--
--
---- DRIVER

-- INSERT INTO DRIVER VALUES('D' || SEQ_DNO.NEXTVAL, 'M3', 1, '카고', '01가1111', 'idImg1.png','yongdali_id_20200401_174203821','carImg1.png','yongdali_regCard_20200401_174203842');
-- INSERT INTO DRIVER VALUES('D' || SEQ_DNO.NEXTVAL, 'M4', 1.4, '호루', '02가2222', 'idImg2.png', 'yongdali_id_20200402_174203821','carImg2.png', 'yongdali_regCard_20200402_174203842');

                    
                  
COMMIT;                        
--SELECT * FROM MEMBER;
--SELECT * FROM DRIVER;
/*------------------------------SEQUENCE AREA-------------------------------------------*/
/*예약 번호 시퀀스*/
CREATE SEQUENCE SEQ_RNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

/*------------------------------테이블 삭제--------------------------------------------*/
DROP TABLE RESERVATION;


/*------------------------------TABLE AREA-------------------------------------------*/

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


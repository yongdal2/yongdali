/*------------------------------SEQUENCE AREA-------------------------------------------*/
/*결제 번호 시퀀스*/
CREATE SEQUENCE SEQ_PNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

/* 정산 번호 시퀀스*/
CREATE SEQUENCE SEQ_PNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

/*------------------------------테이블 삭제--------------------------------------------*/
DROP TABLE PAYMENT;
DROP TABLE CALCULATE;
DROP TABLE REFUND;

/*------------------------------TABLE AREA-------------------------------------------*/
--PAYMENT
CREATE TABLE PAYMENT(
    P_NO VARCHAR2(50) /*결제번호(PK)*/,
    P_R_NO VARCHAR2(50) /*예약번호(FK)*/,
    P_D_NO VARCHAR2(50) DEFAULT NULL /*기사번호(FK)*/,
    DEAL_YN VARCHAR2(10) DEFAULT 'N'/*거래 성사 여부*/,
    DEAL_DATE DATE DEFAULT NULL /*거래 성사 날짜*/,
    CANC_YN VARCHAR2(10) DEFAULT 'N'/*취소 여부*/,
    CANC_DATE DATE DEFAULT NULL /*취소 날짜*/,
    PAY_YN VARCHAR2(10) DEFAULT 'N'/*결제 여부*/,
    ENROLL_DATE DATE DEFAULT SYSDATE /*결제 날짜*/
);


ALTER TABLE PAYMENT ADD CONSTRAINT P_PK_NO PRIMARY KEY (P_NO);
ALTER TABLE PAYMENT ADD CONSTRAINT P_R_FK_NO FOREIGN KEY(P_R_NO) REFERENCES RESERVATION(R_NO) ON DELETE CASCADE;
ALTER TABLE PAYMENT ADD CONSTRAINT P_D_FK_NO FOREIGN KEY(P_D_NO) REFERENCES DRIVER(D_NO) ON DELETE CASCADE;
ALTER TABLE PAYMENT MODIFY PAY_YN CONSTRAINT P_NN_PAY_YN NOT NULL;
ALTER TABLE PAYMENT MODIFY ENROLL_DATE CONSTRAINT R_NN_ENROLL_DATE NOT NULL;

COMMENT ON COLUMN PAYMENT.P_NO IS '결제번호(PK)';
COMMENT ON COLUMN PAYMENT.P_R_NO IS '예약번호(FK)';
COMMENT ON COLUMN PAYMENT.P_D_NO IS '기사번호(FK)';
COMMENT ON COLUMN PAYMENT.DEAL_YN IS '거래 성사 여부';
COMMENT ON COLUMN PAYMENT.DEAL_DATE IS '거래 성사 날짜';
COMMENT ON COLUMN PAYMENT.CANC_YN IS '취소 여부';
COMMENT ON COLUMN PAYMENT.CANC_DATE IS '취소 날짜';
COMMENT ON COLUMN PAYMENT.PAY_YN IS '결제 여부';
COMMENT ON COLUMN PAYMENT.ENROLL_DATE IS '거래 날짜';


-- CALCULATE
CREATE TABLE CALCULATE(
    C_NO VARCHAR2(50) /*정산번호(PK)*/,
    C_P_NO VARCHAR2(50) /*결제번호(FK)*/,
    FEE VARCHAR2(50) /*용달이 수익*/,
    CHARGE VARCHAR2(50) /*기사 운임*/,
    CALC_YN VARCHAR2(10) DEFAULT 'N'/*정산 여부*/,
    CALC_DATE DATE DEFAULT SYSDATE/*정산날짜*/
);

ALTER TABLE CALCULATE ADD CONSTRAINT C_PK_NO PRIMARY KEY (C_NO);
ALTER TABLE CALCULATE ADD CONSTRAINT C_P_FK_NO FOREIGN KEY(C_P_NO) REFERENCES PAYMENT(P_NO) ON DELETE CASCADE;
ALTER TABLE CALCULATE MODIFY FEE CONSTRAINT C_NN_FEE NOT NULL;
ALTER TABLE CALCULATE MODIFY CHARGE CONSTRAINT C_NN_CHARGE NOT NULL;
ALTER TABLE CALCULATE MODIFY CALC_YN CONSTRAINT C_NN_CALC_YN NOT NULL;
ALTER TABLE CALCULATE MODIFY CALC_DATE CONSTRAINT C_NN_CALC_DATE NOT NULL;

COMMENT ON COLUMN CALCULATE.C_NO IS '정산번호(PK)';
COMMENT ON COLUMN CALCULATE.C_P_NO IS '결제번호(FK)';
COMMENT ON COLUMN CALCULATE.FEE IS '용달이수익';
COMMENT ON COLUMN CALCULATE.CHARGE IS '기사운임';
COMMENT ON COLUMN CALCULATE.CALC_YN IS '정산 유무';
COMMENT ON COLUMN CALCULATE.CALC_DATE IS '정산 날짜';



CREATE TABLE REFUND(
    RF_NO VARCHAR2(10) /*환불규정번호*/,
    PERIOD VARCHAR2(10) /*환불기간*/,
    RATIO NUMBER /*비율*/ 
);


COMMENT ON COLUMN REFUND.RF_NO IS '환불규정번호';
COMMENT ON COLUMN REFUND.PERIOD IS '환불기간';
COMMENT ON COLUMN REFUND.RATIO IS '비율';


INSERT INTO REFUND VALUES('0','거래완료',1);
INSERT INTO REFUND VALUES('1','7일',0);
INSERT INTO REFUND VALUES('2','2일',0.5);
INSERT INTO REFUND VALUES('3','당일',1);

COMMIT;
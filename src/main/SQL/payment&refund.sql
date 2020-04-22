--PAYMENT
CREATE TABLE PAYMENT(
    P_NO VARCHAR2(50) /*결제번호(PK)*/,
    P_R_NO VARCHAR2(50) /*예약번호(FK)*/,
    P_D_NO VARCHAR2(50) /*기사번호*/,
    AMOUNT VARCHAR2(50) /*총금액*/,
    FEE VARCHAR2(50) /*용달이수익*/,
    CHARGE VARCHAR2(50) /*기사운임*/,
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
);


COMMENT ON COLUMN REFUND.RF_NO IS '환불규정번호';
COMMENT ON COLUMN REFUND.PERIOD IS '환불기간';
COMMENT ON COLUMN REFUND.RATIO IS '비율';




INSERT INTO REFUND VALUES('0','거래완료',1);
INSERT INTO REFUND VALUES('1','7일',0);
INSERT INTO REFUND VALUES('2','2일',0.5);
INSERT INTO REFUND VALUES('3','당일',1);

COMMIT;
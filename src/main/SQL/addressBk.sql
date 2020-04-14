-------------- ADDRESS ----------------------

--테이블 드롭-
DROP TABLE ADDRESS CASCADE CONSTRAINTS;

--시퀀스 드롭--
DROP SEQUENCE SEQ_ANO;


--테이블--
CREATE TABLE ADDRESS(
    A_NO VARCHAR2(50) /* 주소록 번호(PK) */,
    A_M_NO VARCHAR(50) /* 회원번호(FK) */,
    PLACE VARCHAR2(50) DEFAULT NULL /* 배송지명 */,
    NAME VARCHAR(50 ) /* 이름 */,
    ADDRESS VARCHAR2(300) /*주소*/,
    PHONE VARCHAR2(14) /* 연락처 */,
    RECENTDATE DATE DEFAULT NULL /*최근 사용일*/
);


--제약조건--

ALTER TABLE ADDRESS ADD CONSTRAINT A_PK_NO PRIMARY KEY (A_NO);
ALTER TABLE ADDRESS ADD CONSTRAINT A_M_FK_NO FOREIGN KEY (A_M_NO) REFERENCES MEMBER(M_NO) ON DELETE CASCADE;
ALTER TABLE ADDRESS MODIFY A_M_NO CONSTRAINT A_M_NN_NO NOT NULL;
ALTER TABLE ADDRESS MODIFY PLACE CONSTRAINT A_NN_PLACE NOT NULL;
ALTER TABLE ADDRESS MODIFY NAME CONSTRAINT A_NN_NAME NOT NULL;
ALTER TABLE ADDRESS MODIFY ADDRESS CONSTRAINT A_NN_ADDRESS NOT NULL;
ALTER TABLE ADDRESS MODIFY PHONE CONSTRAINT A_NN_PHONE NOT NULL;

--주석--

COMMENT ON COLUMN ADDRESS.A_NO IS '주소록 번호(PK)';
COMMENT ON COLUMN ADDRESS.A_M_NO IS '회원번호(FK)';
COMMENT ON COLUMN ADDRESS.A_PLACE IS '배송지명';
COMMENT ON COLUMN ADDRESS.NAME IS '이름';
COMMENT ON COLUMN ADDRESS.ADDRESS IS '주소';
COMMENT ON COLUMN ADDRESS.PHONE IS '연락처';
COMMENT ON COLUMN ADDRESS.RECENTDATE IS '최근 사용일';


--시퀀스--
CREATE SEQUENCE SEQ_ANO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

--INSERT--
--                              /주소록 번호     /멤버번호/배송지명/이름/       주소/                              연락처   /최근사용일 --
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','가나상사','김사장','서울 성동구 가람길 28, 99층 990호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','무한상사','무사장','서울 관악구 봉천로 167, 1층','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','나나건설','나사장','서울 성동구 가람길 28, 202층 2호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','도로로록그룹','김사장','서울 성동구 가람길 28, 99층 990호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','KH유치원','김선생','서울 강남구 봉은사로 218, 99층 990호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','본가','이엄마','서울 관악구 과천대로 851, 99층 990호','010-4325-1234',SYSDATE);


COMMIT;

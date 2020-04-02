------------------------- 이전의 테이블 및 시퀀스를 삭제 -------------------------
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE DRIVER CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;


DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_DNO;
DROP SEQUENCE SEQ_NNO;


------------------------------- 테이블 (제약조건 설정 & 코멘트)-------------------------------------
-- MEMBER
CREATE TABLE MEMBER(
    M_NO VARCHAR2(50) /* 회원번호 */,       
    EMAIL VARCHAR2(50) /* EMAIL(회원 ID) */,                 
    PWD VARCHAR2(100) /* 비밀번호 */,
    NAME VARCHAR2(50) /* 이름 */,
    PHONE VARCHAR2(14) /* 휴대폰번호 */,
    M_SORT VARCHAR2(9)/* 회원구분(관리자, 일반, 사업자) */,
    ENROLLDATE DATE DEFAULT SYSDATE /* 가입일 */
);

ALTER TABLE MEMBER ADD CONSTRAINT M_PK_NO PRIMARY KEY (M_NO);
ALTER TABLE MEMBER ADD CONSTRAINT M_UQ_EMAIL UNIQUE (EMAIL);
ALTER TABLE MEMBER ADD CONSTRAINT M_CK_SORT CHECK (M_SORT IN ('관리자', '일반', '사업자'));

ALTER TABLE MEMBER MODIFY EMAIL CONSTRAINT M_NN_EMAIL NOT NULL;
ALTER TABLE MEMBER MODIFY PWD CONSTRAINT M_NN_PWD NOT NULL;
ALTER TABLE MEMBER MODIFY NAME CONSTRAINT M_NN_NAME NOT NULL;
ALTER TABLE MEMBER MODIFY PHONE CONSTRAINT M_NN_PHONE NOT NULL;
ALTER TABLE MEMBER MODIFY M_SORT CONSTRAINT M_NN_SORT NOT NULL;
ALTER TABLE MEMBER MODIFY ENROLLDATE CONSTRAINT M_NN_ENROLLDATE NOT NULL;

COMMENT ON COLUMN MEMBER.M_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.EMAIL IS 'EMAIL(회원 ID)';
COMMENT ON COLUMN MEMBER.PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.NAME IS '이름';
COMMENT ON COLUMN MEMBER.PHONE IS '휴대폰번호';
COMMENT ON COLUMN MEMBER.M_SORT IS '회원구분(관리자, 일반, 사업자)';
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
    N_STATUS VARCHAR2(1) /* 게시글 상태 값 */
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

-- NOTICE Number
CREATE SEQUENCE SEQ_NNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;


------------------------------- Insert -------------------------------------
-- MEMBER
INSERT INTO MEMBER VALUES('M' || SEQ_MNO.NEXTVAL, 'admin@naver.com', 'admin', '유승제', '010-1111-1111', '관리자', '2020-03-10'); 
INSERT INTO MEMBER VALUES('M' || SEQ_MNO.NEXTVAL, 'mem01@naver.com', 'mem01', '홍멤버', '010-2222-2222', '일반', '2020-03-18'); 
INSERT INTO MEMBER VALUES('M' || SEQ_MNO.NEXTVAL, 'biz01@naver.com', 'biz01', '김거상', '010-3333-3333', '사업자', '2020-03-18'); 
INSERT INTO MEMBER VALUES('M' || SEQ_MNO.NEXTVAL, 'biz02@naver.com', 'biz01', '최거상', '010-4444-4444', '사업자', '2020-03-19'); 

-- DRIVER
INSERT INTO DRIVER VALUES('D' || SEQ_DNO.NEXTVAL, 'M3', 1, '카고', '01가1111', 'idImg1.png','yongdali_20200401_174203821','carImg1.png','yongdali_20200401_174203842');
INSERT INTO DRIVER VALUES('D' || SEQ_DNO.NEXTVAL, 'M4', 1.4, '호루', '02가2222', 'idImg2.png', 'yongdali_20200402_174203821','carImg2.png', 'yongdali_20200402_174203842');

-- NOTICE
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, 
                        '용달이 공통 공지', '관리자',
                        '용달이 공통 공지입니다.', 
                        NULL, NULL,
                        '공통', 
                        DEFAULT,DEFAULT,'Y');
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, 
                        '용달이 사용자 방침', '관리자',
                        '용달이 사용자 방침입니다.', 
                        NULL, NULL,
                        '일반', 
                        DEFAULT,DEFAULT,'Y');
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, 
                        '용달이 기사님 방침.', '관리자',
                        '용달이 기사님 방침입니다.', 
                        NULL, NULL,
                        '사업자', 
                        DEFAULT,DEFAULT,'Y');
                        
--SELECT * FROM MEMBER;
--SELECT * FROM DRIVER;
-- SELECT * FROM NOTICE;
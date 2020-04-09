------------------------- 이전의 테이블 및 시퀀스를 삭제 -------------------------
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_NNO;

------------------------------- 시퀀스 생성 -------------------------------------

-- NOTICE Number
CREATE SEQUENCE SEQ_NNO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

------------------------------- 테이블 (제약조건 설정 & 코멘트)-------------------------------------

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

            
COMMIT;                        
-- SELECT * FROM NOTICE;
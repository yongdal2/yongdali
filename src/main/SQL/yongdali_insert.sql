------------------------------- Insert -------------------------------------
-- Notice
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 공통 공지1', '관리자', '용달이 공통 공지입니다.', NULL, NULL,'공통', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 공통 공지2', '관리자', '용달이 공통 공지입니다.', NULL, NULL,'공통', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 공통 공지3', '관리자', '용달이 공통 공지입니다.', NULL, NULL,'공통', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 공통 공지4', '관리자', '용달이 공통 공지입니다.', NULL, NULL,'공통', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 공통 공지5', '관리자', '용달이 공통 공지입니다.', NULL, NULL,'공통', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 공통 공지6', '관리자', '용달이 공통 공지입니다.', NULL, NULL,'공통', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 공통 공지7', '관리자', '용달이 공통 공지입니다.', NULL, NULL,'공통', DEFAULT,DEFAULT,DEFAULT);

INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 사용자 방침1', '관리자', '용달이 사용자 방침입니다.', NULL, NULL,'일반', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 사용자 방침2', '관리자', '용달이 사용자 방침입니다.', NULL, NULL,'일반', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 사용자 방침3', '관리자', '용달이 사용자 방침입니다.', NULL, NULL,'일반', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 사용자 방침4', '관리자', '용달이 사용자 방침입니다.', NULL, NULL,'일반', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 사용자 방침5', '관리자', '용달이 사용자 방침입니다.', NULL, NULL,'일반', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 사용자 방침6', '관리자', '용달이 사용자 방침입니다.', NULL, NULL,'일반', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 사용자 방침7', '관리자', '용달이 사용자 방침입니다.', NULL, NULL,'일반', DEFAULT,DEFAULT,DEFAULT);

INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 기사님 방침1', '관리자', '용달이 기사님 방침입니다.', NULL, NULL,'사업자', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 기사님 방침2', '관리자', '용달이 기사님 방침입니다.', NULL, NULL,'사업자', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 기사님 방침3', '관리자', '용달이 기사님 방침입니다.', NULL, NULL,'사업자', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 기사님 방침4', '관리자', '용달이 기사님 방침입니다.', NULL, NULL,'사업자', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 기사님 방침5', '관리자', '용달이 기사님 방침입니다.', NULL, NULL,'사업자', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 기사님 방침6', '관리자', '용달이 기사님 방침입니다.', NULL, NULL,'사업자', DEFAULT,DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES('N' || SEQ_NNO.NEXTVAL, '용달이 기사님 방침7', '관리자', '용달이 기사님 방침입니다.', NULL, NULL,'사업자', DEFAULT,DEFAULT,DEFAULT);

-- Address
--                              /주소록 번호     /멤버번호/배송지명/이름/       주소/                              연락처   /최근사용일 --
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','가나상사','김사장','서울 성동구 가람길 28, 99층 990호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','무한상사','무사장','서울 관악구 봉천로 167, 1층','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','나나건설','나사장','서울 성동구 가람길 28, 202층 2호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','도로로록그룹','김사장','서울 성동구 가람길 28, 99층 990호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','KH유치원','김선생','서울 강남구 봉은사로 218, 99층 990호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','본가','이엄마','서울 관악구 과천대로 851, 99층 990호','010-4325-1234',SYSDATE);

-- 수정자 : 이탐희
-- 수정일시 : 200413_16:38
-- NOTICE,ADDRESS INSERT구문 
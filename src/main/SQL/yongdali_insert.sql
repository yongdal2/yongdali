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
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','가나상사','김사장','서울 성동구 가람길 28,99층 990호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','무한상사','무사장','서울 관악구 봉천로 167,1층','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','나나건설','나사장','서울 성동구 가람길 28,202층 2호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','도로로록그룹','김사장','서울 성동구 가람길 28,99층 990호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','KH유치원','김선생','서울 강남구 봉은사로 218,99층 990호','010-4325-1234',SYSDATE);
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','본가','이엄마','서울 관악구 과천대로 851,99층 990호','010-4325-1234',SYSDATE);

-- Driver
INSERT INTO DRIVER VALUES('D' || SEQ_DNO.NEXTVAL, 'M3', 1, '카고', '01가1111', 'idImg1.png','yongdali_id_20200401_174203821','carImg1.png','yongdali_regCard_20200401_174203842');
INSERT INTO DRIVER VALUES('D' || SEQ_DNO.NEXTVAL, 'M4', 1.4, '호루', '02가2222', 'idImg2.png', 'yongdali_id_20200402_174203821','carImg2.png', 'yongdali_regCard_20200402_174203842');

-- Reservation
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M1',null,'1.4','호루','남지훈','최진영','010-8386-5235','010-8266-5185','서울 강서구 하늘길 38-자이 1101동 701호','서울 중랑구 동일로 지하 797,스토리하우스 301호','30.8',null,null,to_date('20/04/18','RR/MM/DD'),'07:00',to_date('20/04/21','RR/MM/DD'),'06:30','고객님이 직접 하차','기사님과 함께 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1)',null,'300000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M2',null,'1','카고','박정연','손신혜','010-8651-5515','010-6215-5842','서울 중랑구 동일로 지하 797-아이파크 1102동 202호','서울 강남구 강남대로 238,스카이빌딩 601호','9.3',null,null,to_date('20/05/02','RR/MM/DD'),'04:30',to_date('20/05/06','RR/MM/DD'),'07:00','기사님 단독 상차','기사님과 함께 하차','침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 의자(1), 식탁(1), 옷장(1), 모니터(1), 에어컨(1), TV(1), 청소기(1)','저희집 CU 편의점 맞은편에 있습니다.','310000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M3',null,'1','호루','이탐희','장원태','010-9915-2542','010-8452-5523','서울 서초구 강남대로 27-마당 넓은 집','서울 성북구 동소문로 24길 14-8,하늘마루빌라 301호','11.6','바로 상차','바로 하차',null,null,null,null,'고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만+프레임)(1), 수납장(1), 화장대(1), 프린터(2), 냉장고(2), TV(2), 세탁기(2), 청소기(4)','오실때 물 1리터짜리 6개 한 묶음 부탁드릴게요.','80000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M4',null,'1','탑차','박정연','박정연','010-8362-5111','010-8362-5111','서울 동작구 동작대로 335-1-초록색 대문','서울 강북구 덕릉로 88,이편한세상 1102동 602호','9.9',null,'바로 하차',to_date('20/04/23','RR/MM/DD'),'07:30',null,null,'고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만)(2), 침대(매트리스만+프레임)(1), 화장대(1), 책상(1), 모니터(1), 프린터(1), 냉장고(1), TV(1), 공기청정기(1), 청소기(1)',null,'60000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M1',null,'1','윙바디','유승제','유승제','010-9955-3215','010-9955-3215','서울 용산구 다산로 8-11-놀이터','서울 용산구 한강대로 405,서울역','5.6',null,'바로 하차',to_date('20/04/14','RR/MM/DD'),'19:30',null,null,'기사님 단독 상차','고객님이 직접 하차','수납장(2), 신발장(2), 화장대(1), 책상(1), 모니터(4), 에어컨(2), 냉장고(2), 공기청정기(3)','냉장고가 조금 무거워요.','80000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M2',null,'1','리프트','박정연','손신혜','010-1166-9582','010-6251-7598','서울 용산구 임정로 7,숙명여대','서울 강남구 개포로 402,개포고','11.6','바로 상차',null,null,null,to_date('20/04/24','RR/MM/DD'),'08:00','기사님 단독 상차','기사님 단독 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 신발장(4), 책상(3), 프린터(1), 냉장고(2), TV(2)','안전하게 배송 부탁드립니다~','780000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M3',null,'1.4','카고','이탐희','장원태','010-6654-1885','010-8632-1919','서울 성동구 마조로 42,한양대학교 기숙사','서울 관악구 관악로 1,서울대학교 기숙사 1관','11.2',null,null,to_date('20/05/02','RR/MM/DD'),'18:30',to_date('20/05/09','RR/MM/DD'),'07:30','고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 책상(1), 프린터(1), 에어컨(1), 냉장고(1), TV(1)','가는길에 사람좀 태울게요~','490000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M4',null,'1.4','호루','남지훈','남지훈','010-6663-1982','010-6663-1982','서울 광진구 긴고랑로 1,타이어테크','서울 강남구 테헤란로 133,한국타이어빌딩 501호','6.5',null,null,to_date('20/05/13','RR/MM/DD'),'07:30',to_date('20/05/16','RR/MM/DD'),'07:30','기사님과 함께 상차','기사님과 함께 하차','타이어(10)','저희랑 같이 타이어 부탁드립니다. 감사합니다 !!','270000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M1',null,'1.4','윙바디','손신혜','손신혜','010-9577-3256','010-9577-3256','서울 중랑구 겸재로 68,소소빌딩 101호','서울 강서구 하늘길 38,김포공항','30.3','바로 상차','바로 하차',null,null,null,null,'기사님과 함께 상차','기사님 단독 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 책상(1), 의자(1), 소파(1), 식탁(1), 옷장(1)','저 이민가요~','140000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R' || SEQ_RNO.NEXTVAL,'M2',null,'1.4','리프트','이탐희','장원태','010-1111-3516','010-7845-1888','서울 서초구 강남대로 27,AT센터 502호','서울 강남구 역삼1동 735-3,교보생명보험 305호','9.7',null,'바로 하차',to_date('20/06/18','RR/MM/DD'),'08:00',null,null,'기사님 단독 상차','기사님과 함께 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1)','침대 1억짜리라 주의 부탁드려요','100000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
COMMIT;



-- 수정자 : 이탐희
-- 수정일시 : 200413_16:38
-- NOTICE,ADDRESS INSERT구문 

-- 수정자 : 손신혜
-- 수정일시 : 200416_19:30
-- ADDRESS 주소 수정, DRIVER INSERT 추가

-- 수정자 : 이탐희
-- 수정일시 : 200416_20:52
-- Reservation insert 추가
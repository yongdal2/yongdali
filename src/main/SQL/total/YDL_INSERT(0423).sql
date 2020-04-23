--------------INSERT------------------
--*******************샘플 꼭 실행*****************************
------MEMBER 
-- 멤버 샘플실행

--DRIVER
INSERT INTO DRIVER VALUES('D' || SEQ_DNO.NEXTVAL, 'M3', 1, '카고', '01가1111', 'idImg1.png','yongdali_id_20200401_174203821.png','carImg1.png','yongdali_regCard_20200401_174203842.png');
INSERT INTO DRIVER VALUES('D' || SEQ_DNO.NEXTVAL, 'M4', 1.4, '호루', '02가2222', 'idImg2.png', 'yongdali_id_20200402_174203821.png','carImg2.png', 'yongdali_regCard_20200402_174203842.png');

--NOTICE
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

--ADDRESS
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','가나상사','김사장','서울 성동구 가람길 281,99층 990호','127.068927259618','37.5593086412653','010-4325-1234','20/04/01');
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','무한상사','무사장','서울 관악구 봉천로 167,1층','126.920838264633','37.4903812383624','010-4325-1234','20/04/02');
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','나나건설','나사장','서울 성동구 가람길 283,202층 2호','127.069117074248','37.5595679272979','010-4325-1234','20/04/03');
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','도로로록그룹','김사장','서울 성동구 가람길 287,99층 990호','127.069454279468','37.5597364861226','010-4325-1234','20/04/04');
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','KH유치원','김선생','서울 강남구 봉은사로 218,99층 990호','127.036001902474','37.5076374419827','010-4325-1234','20/04/05');
INSERT INTO ADDRESS VALUES('A' || SEQ_ANO.NEXTVAL,'M2','본가','이엄마','서울 관악구 과천대로 851,99층 990호','126.987276871611','37.4665469035686','010-4325-1234','20/04/06');

--REFUND
INSERT INTO REFUND VALUES('0','거래완료',1);
INSERT INTO REFUND VALUES('1','7일',0);
INSERT INTO REFUND VALUES('2','2일',0.5);
INSERT INTO REFUND VALUES('3','당일',1);

--RESERVATION
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M1',null,1.4,'호루','남지훈','최진영','010-8386-5235','010-8266-5185','서울 강서구 하늘길 38,자이 1101동 701호','서울 중랑구 동일로 지하 797,스토리하우스 301호',30.89,null,null,to_date('20/04/18','RR/MM/DD'),'7:00',to_date('20/04/21','RR/MM/DD'),'6:30','고객님이 직접 하차','기사님과 함께 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1)',null,'300000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,1,'카고','박정연','손신혜','010-8651-5515','010-6215-5842','서울 중랑구 동일로 지하 797,아이파크 1102동 202호','서울 강남구 강남대로 238,스카이빌딩 601호',9.36,null,null,to_date('20/05/02','RR/MM/DD'),'4:30',to_date('20/05/06','RR/MM/DD'),'7:00','기사님 단독 상차','기사님과 함께 하차','침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 의자(1), 식탁(1), 옷장(1), 모니터(1), 에어컨(1), TV(1), 청소기(1)','저희집 CU 편의점 맞은편에 있습니다.','310000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M3',null,1,'호루','이탐희','장원태','010-9915-2542','010-8452-5523','서울 서초구 강남대로 27,마당 넓은 집','서울 성북구 동소문로 24길 14-8,하늘마루빌라 301호',11.65,'바로 상차','바로 하차',null,null,null,null,'고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만+프레임)(1), 수납장(1), 화장대(1), 프린터(2), 냉장고(2), TV(2), 세탁기(2), 청소기(4)','오실때 물 1리터짜리 6개 한 묶음 부탁드릴게요.','80000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M4',null,1,'탑차','박정연','박정연','010-8362-5111','010-8362-5111','서울 동작구 동작대로 335-1,초록색 대문','서울 강북구 덕릉로 88,이편한세상 1102동 602호',9.92,null,'바로 하차',to_date('20/04/23','RR/MM/DD'),'7:30',null,null,'고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만)(2), 침대(매트리스만+프레임)(1), 화장대(1), 책상(1), 모니터(1), 프린터(1), 냉장고(1), TV(1), 공기청정기(1), 청소기(1)',null,'60000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M1',null,1,'윙바디','유승제','유승제','010-9955-3215','010-9955-3215','서울 용산구 다산로 8-11,놀이터','서울 용산구 한강대로 405,서울역',5.67,null,'바로 하차',to_date('20/04/14','RR/MM/DD'),'19:30',null,null,'기사님 단독 상차','고객님이 직접 하차','수납장(2), 신발장(2), 화장대(1), 책상(1), 모니터(4), 에어컨(2), 냉장고(2), 공기청정기(3)','냉장고가 조금 무거워요.','80000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,1,'리프트','박정연','손신혜','010-1166-9582','010-6251-7598','서울 용산구 임정로 7,숙명여대 골목 어딘가','서울 강남구 개포로 402,개포고',11.61,'바로 상차',null,null,null,to_date('20/04/24','RR/MM/DD'),'8:00','기사님 단독 상차','기사님 단독 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 신발장(4), 책상(3), 프린터(1), 냉장고(2), TV(2)','안전하게 배송 부탁드립니다~','780000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M3',null,1.4,'카고','이탐희','장원태','010-6654-1885','010-8632-1919','서울 성동구 마조로 42,한양대학교 기숙사','서울 관악구 관악로 1,서울대학교 기숙사 1관',11.24,null,null,to_date('20/05/02','RR/MM/DD'),'18:30',to_date('20/05/09','RR/MM/DD'),'7:30','고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 책상(1), 프린터(1), 에어컨(1), 냉장고(1), TV(1)','가는길에 사람좀 태울게요~','490000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M4',null,1.4,'호루','남지훈','남지훈','010-6663-1982','010-6663-1982','서울 광진구 긴고랑로 1,타이어테크','서울 강남구 테헤란로 133,한국타이어빌딩 501호',6.51,null,null,to_date('20/05/13','RR/MM/DD'),'7:30',to_date('20/05/16','RR/MM/DD'),'7:30','기사님과 함께 상차','기사님과 함께 하차','타이어(10)','저희랑 같이 타이어 부탁드립니다. 감사합니다 !!','270000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M1',null,1.4,'윙바디','손신혜','손신혜','010-9577-3256','010-9577-3256','서울 중랑구 겸재로 68,소소빌딩 101호','서울 강서구 하늘길 38,김포공항',30.3,'바로 상차','바로 하차',null,null,null,null,'기사님과 함께 상차','기사님 단독 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 책상(1), 의자(1), 소파(1), 식탁(1), 옷장(1)','저 이민가요~','140000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,1.4,'리프트','이탐희','장원태','010-1111-3516','010-7845-1888','서울 서초구 강남대로 27,AT센터 502호','서울 강남구 역삼1동 735-3,교보생명보험 305호',9.7,null,'바로 하차',to_date('20/06/18','RR/MM/DD'),'8:00',null,null,'기사님 단독 상차','기사님과 함께 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1)','침대 1억짜리라 주의 부탁드려요','100000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,1.4,'탑차','남지훈','남지훈','010-8838-6688','010-8838-6688','서울 강서구 하늘길 38,경비원','서울 중랑구 동일로 지하 797,하나둘',30.8,'바로 상차','바로 하차',null,null,null,null,'고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만+프레임)(1), 수납장(1)',null,'110000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,2.5,'호루','최진영','최진영','010-3518-8215','010-3518-8215','서울 도봉구 방학로 193,방학신동아아파트 1102동 201호','서울 서초구 청계산로7길 43,포레스타아파트 2001동 1101호',14.44,null,null,to_date('20/05/18','RR/MM/DD'),'15:00',to_date('20/05/21','RR/MM/DD'),'9:30','기사님과 함께 상차','기사님과 함께 하차','침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 의자(1), 식탁(1), 옷장(1), 모니터(1), 에어컨(1), TV(1), 청소기(1)','짐 아프게 하지 말아주세요!','330000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,2.5,'카고','박정연','박정연','010-9535-1684','010-9535-1684','서울 서대문구 가좌로 105,명지대학교 기숙사','서울 노원구 노원로 532,상계주공아파트 1001동 702호',15.86,'바로 상차','바로 하차',null,null,null,null,'고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(3), 신발장(1), 화장대(2), 책상(1), 의자(1), 소파(1), 식탁(1), 싱크대(1), 컴퓨터/노트북(1), 모니터(1), 프린터(1), 에어컨(1), 냉장고(1), TV(1), 세탁기(1)',null,'110000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,2.5,'윙바디','이탐희','이탐희','010-1111-3516','010-1111-3516','서울 강남구 학동로77길 49,도봉휴한신아파트 101동 1102호','서울 노원구 동일로250길 17,은빛아파트 302동 802호',10.79,null,'바로 하차',to_date('20/05/04','RR/MM/DD'),null,null,null,'고객님이 직접 하차','기사님과 함께 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1)','기사님 고생하십니다.','140000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M1',null,2.5,'리프트','손신혜','손신혜','010-8632-1919','010-8632-1919','서울 강동구 강동대로 143,삼성파크타워 101호','서울 양천구 가로공원로 66,자이아파트 1101동 옥탑방',33.36,'바로 상차',null,null,null,to_date('20/05/20','RR/MM/DD'),'19:30','기사님 단독 상차','기사님과 함께 하차','침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 의자(1), 식탁(1), 옷장(1), 모니터(1), 에어컨(1), TV(1), 청소기(1)',null,'1980000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,2.5,'탑차','유승제','유승제','010-8651-5515','010-8651-5515','서울 구로구 가마산로 77,마당 좁은 집','서울 서초구 남부순환로 2406,예술의전당 앞',15.48,null,null,to_date('20/05/04','RR/MM/DD'),'18:30',to_date('20/05/12','RR/MM/DD'),'18:30','고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만+프레임)(1), 수납장(1), 화장대(1), 프린터(2), 냉장고(2), TV(2), 세탁기(2), 청소기(4)','이따가 봐요~','610000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M3',null,3.5,'카고','박정연','박정연','010-9915-2542','010-9915-2542','서울 서초구 강남대로 27,AT센터 3층 하늘나라반','서울 성북구 길음로9길 46,다보탑 2층 개나리반',9.48,'바로 상차',null,null,null,to_date('20/05/27','RR/MM/DD'),'11:00','고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만)(2), 침대(매트리스만+프레임)(1), 화장대(1), 책상(1), 모니터(1), 프린터(1), 냉장고(1), TV(1), 공기청정기(1), 청소기(1)','도착하시면은 전화하지 말아주세요','2320000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M4',null,3.5,'호루','유승제','유승제','010-1111-3516','010-1111-3516','서울 송파구 올림픽로 240,현관 앞','서울 강동구 강동대로 143-8,진달래반',2.93,null,'바로 하차',to_date('20/05/27','RR/MM/DD'),'11:00',null,null,'기사님 단독 상차','고객님이 직접 하차','수납장(2), 신발장(2), 화장대(1), 책상(1), 모니터(4), 에어컨(2), 냉장고(2), 공기청정기(3)',null,'140000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M1',null,3.5,'탑차','박정연','손신혜','010-8386-5235','010-8266-5185','서울 강남구 개포로109길 69,마당 넓은 집','서울 종로구 종로 24-8,핑크색 대문',11.79,'바로 상차','바로 하차',null,null,null,null,'고객님이 직접 상차','고객님이 직접 하차','책상(30)','제가 할게요.','140000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,3.5,'윙바디','이탐희','장원태','010-8651-5515','010-6215-5842','서울 강서구 강서로 375,흐르는 강물 100m 앞','서울 송파구 도곡로62길 5-12,상광하이츠 화장실',26.89,null,null,to_date('20/05/12','RR/MM/DD'),'13:30',to_date('20/05/15','RR/MM/DD'),'5:00','기사님 단독 상차','기사님과 함께 하차','수납장(2), 신발장(2), 화장대(1), 책상(1), 모니터(4), 에어컨(2), 냉장고(2), 공기청정기(3)','허리 나가요.','360000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M1',null,3.5,'리프트','남지훈','남지훈','010-9915-2542','010-9915-2542','서울 영등포구 국제금융로 78,홍우빌딩 2층 201호','서울 강남구 도산대로30길 47,국제 예술 대학교 공과대학관',11.09,null,null,to_date('20/05/26','RR/MM/DD'),'19:00',to_date('20/05/29','RR/MM/DD'),'16:00','기사님 단독 상차','기사님 단독 하차','타이어(10)','강하셨으면 좋겠어요.','360000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M1',null,1,'카고','손신혜','손신혜','010-1111-3516','010-1111-3516','서울 동작구 서달로 50-14,한강이 보이는 곳','서울 강남구 학동로 322,강남구청역',8.7,null,null,to_date('20/06/25','RR/MM/DD'),'15:00',to_date('20/06/30','RR/MM/DD'),'7:00','고객님이 직접 상차','고객님이 직접 하차','프린터(1)','반갑습니다.','340000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M3',null,1,'호루','박정연','박정연','010-9915-2542','010-9915-2542','서울 강남구 강남대로 254,해병대전우회','서울 중구 다산로 지하 115,공군전우회',5.23,'바로 상차','바로 하차',null,null,null,null,'기사님 단독 상차','고객님이 직접 하차','TV(14), 세탁기(8)','티비랑 세탁기 많은 괜찮으시겠어요 ','80000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,1,'탑차','박정연','손신혜','010-8651-5515','010-6215-5842','서울 마포구 마포대로 지하 100,이편한세계 101호','서울 강남구 봉은사로 535,프루자요 1001동 203호',12.1,null,null,to_date('20/05/13','RR/MM/DD'),'8:30',to_date('20/05/16','RR/MM/DD'),'8:30','기사님과 함께 상차','기사님과 함께 하차','컴퓨터/노트북(1), 모니터(1), 프린터(1), 에어컨(1), 냉장고(1), TV(1), 세탁기(1), 공기청정기(1), 청소기(1), 오븐/전자레인지(1), 밥솥(1)','잠깐 차라도 한잔 하시겠어요 ','280000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M4',null,1,'윙바디','박정연','손신혜','010-8651-5515','010-6215-5842','서울 용산구 한강대로 지하 185,삼각지역 2번 출구','서울 광진구 능동로 지하 110,건대입구 10번 출구',10.79,null,null,to_date('20/05/04','RR/MM/DD'),'4:30',to_date('20/05/11','RR/MM/DD'),'4:30','고객님이 직접 상차','고객님이 직접 하차','수납장(1), 신발장(1), 화장대(1), 의자(1), 소파(1)',null,'500000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M3',null,1,'리프트','남지훈','최진영','010-8386-5235','010-8266-5185','서울 광진구 아차산로44길 41','서울 중랑구 동일로 지하 797',4.38,null,'바로 하차',to_date('20/05/22','RR/MM/DD'),'8:00',null,null,'기사님 단독 상차','고객님이 직접 하차','컴퓨터/노트북(1), 모니터(1), 프린터(1), 에어컨(1), 냉장고(1), TV(1), 세탁기(1), 공기청정기(1), 청소기(1), 오븐/전자레인지(1), 밥솥(1)','도착하시면 언제든지 연락주세요. 전화 안받아요.','80000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,1.4,'카고','손신혜','손신혜','010-9577-3256','010-9577-3256','서울 강동구 강동대로 143,삼성파크타워 101호','서울 강남구 개포로 402,개포고',7.63,null,null,to_date('20/05/18','RR/MM/DD'),'7:30',to_date('20/05/23','RR/MM/DD'),'7:30','기사님 단독 상차','기사님 단독 하차','수납장(1), 책상(1), 의자(1), 모니터(1), 프린터(1), TV(1), 청소기(1), 오븐/전자레인지(3)','오늘 하루종일 집에 있었어요. 잠깐만 들어오시겠어요 ','390000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M3',null,1.4,'호루','박정연','손신혜','010-1166-9582','010-6251-7598','서울 용산구 다산로 8-11,놀이터','서울 강남구 강남대로 238,스카이빌딩 601호',5.29,'바로 상차',null,null,null,to_date('20/05/13','RR/MM/DD'),'19:30','고객님이 직접 상차','고객님이 직접 하차','오븐/전자레인지(1)','아침 같이 먹게 약속된 시간보다 일찍 오셔요. 부디..','1470000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M4',null,1.4,'탑차','tomson','MicheL','010-3518-8215','010-8838-6688','서울 동작구 동작대로 335-1,초록색 대문','서울 서초구 남부순환로 2406,예술의전당 앞',4.24,null,null,null,null,null,null,'기사님 단독 상차','기사님과 함께 하차','Straw(1000)','Could you dance with me..  Catch my hand.. go ahead..','100000');
INSERT INTO RESERVATION VALUES('R' || SEQ_RNO.NEXTVAL,'M2',null,1.4,'윙바디','Jackson','Sumi Kin','010-1111-3516','010-8632-1919','서울 송파구 올림픽로 240,현관 앞','서울 강남구 역삼1동 735-3,교보생명보험 305호',7.22,null,null,to_date('20/05/20','RR/MM/DD'),'12:00',to_date('20/05/24','RR/MM/DD'),'18:00','고객님이 직접 상차','기사님 단독 하차','Cake(10), Thermos(30)','Be careful with that Cakes, Thermos. You can get some tips.','330000');
commit;
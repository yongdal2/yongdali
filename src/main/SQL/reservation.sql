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
    CAPACITY NUMBER(2,1),
    TYPE VARCHAR2(50),
    START_NAME VARCHAR2(100),
    END_NAME VARCHAR2(100),
    START_PHONE VARCHAR2(100),
    END_PHONE VARCHAR2(100),
    START_ADDR VARCHAR2(300),
    END_ADDR VARCHAR2(300),
    DISTANCE VARCHAR2(50),
    RIGHT_LOAD VARCHAR2(100),
    RIGHT_UNLOAD VARCHAR2(100),
    STARTDATE DATE,
    STARTTIME VARCHAR2(100),
    ENDDATE DATE,
    ENDTIME VARCHAR2(100),
    HELP_LOAD VARCHAR2(100),
    HELP_UNLOAD VARCHAR2(100),
    LUGGAGE VARCHAR2(4000),
    MSG VARCHAR2(2000),
    AMOUNT VARCHAR2(50),
    PAY_YN VARCHAR2(10) DEFAULT 'N',
    DEAL_YN VARCHAR2(10) DEFAULT NULL,
    DEALDATE DATE DEFAULT NULL,
    CALC_YN VARCHAR2(10) DEFAULT NULL,
    CALCDATE DATE DEFAULT NULL,
    ENROLLDATE DATE DEFAULT SYSDATE
);

ALTER TABLE RESERVATION ADD CONSTRAINT R_PK_NO PRIMARY KEY (R_NO);
ALTER TABLE RESERVATION MODIFY START_ADDR CONSTRAINT R_NN_START_ADDR NOT NULL;
ALTER TABLE RESERVATION MODIFY END_ADDR CONSTRAINT R_NN_END_ADDR NOT NULL;
ALTER TABLE RESERVATION MODIFY DISTANCE CONSTRAINT R_NN_DISTANCE NOT NULL;
ALTER TABLE RESERVATION MODIFY START_NAME CONSTRAINT R_NN_START_NAME NOT NULL;
ALTER TABLE RESERVATION MODIFY END_NAME CONSTRAINT R_NN_END_NAME NOT NULL;
ALTER TABLE RESERVATION MODIFY START_PHONE CONSTRAINT R_NN_START_PHONE NOT NULL;
ALTER TABLE RESERVATION MODIFY END_PHONE CONSTRAINT R_NN_END_PHONE NOT NULL;
ALTER TABLE RESERVATION MODIFY LUGGAGE CONSTRAINT R_NN_LUGGAGE NOT NULL;
ALTER TABLE RESERVATION MODIFY AMOUNT CONSTRAINT R_NN_AMOUNT NOT NULL;
ALTER TABLE RESERVATION MODIFY PAY_YN CONSTRAINT R_NN_PAY_YN NOT NULL;
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
COMMENT ON COLUMN RESERVATION.START_NAME IS '상차할 이름';
COMMENT ON COLUMN RESERVATION.END_NAME IS '하차받을 이름';
COMMENT ON COLUMN RESERVATION.START_PHONE IS '상차 연락처';
COMMENT ON COLUMN RESERVATION.END_PHONE IS '하차 연락처';
COMMENT ON COLUMN RESERVATION.RIGHT_LOAD IS '바로 상차';
COMMENT ON COLUMN RESERVATION.RIGHT_UNLOAD IS '바로 하차';
COMMENT ON COLUMN RESERVATION.STARTDATE IS '상차 날짜';
COMMENT ON COLUMN RESERVATION.STARTTIME IS '상차 시각';
COMMENT ON COLUMN RESERVATION.ENDDATE IS '하차 날짜';
COMMENT ON COLUMN RESERVATION.ENDTIME IS '하차 시각';
COMMENT ON COLUMN RESERVATION.HELP_LOAD IS '상차 도움';
COMMENT ON COLUMN RESERVATION.HELP_UNLOAD IS '하차 도움';
COMMENT ON COLUMN RESERVATION.LUGGAGE IS '이삿짐';
COMMENT ON COLUMN RESERVATION.MSG IS '전달 사항';
COMMENT ON COLUMN RESERVATION.AMOUNT IS '결제 금액';
COMMENT ON COLUMN RESERVATION.PAY_YN IS '결제유무';
COMMENT ON COLUMN RESERVATION.DEAL_YN IS '거래 성사 유무';
COMMENT ON COLUMN RESERVATION.DEALDATE IS '거래 성사 날짜';
COMMENT ON COLUMN RESERVATION.CALC_YN IS '정산 유무';
COMMENT ON COLUMN RESERVATION.CALCDATE IS '정산 날짜';
COMMENT ON COLUMN RESERVATION.ENROLLDATE IS '예약 등록 날짜';


/*------------------------------샘플 데이터-------------------------------------------*/
Insert into YONGDALI.RESERVATION values ('R1','M1',null,'1.4','호루','남지훈','최진영','서울 강서구 하늘길 38-자이 1101동 701호','서울 중랑구 동일로 지하 797,스토리하우스 301호','30.8','010-8386-5235','010-8266-5185',null,null,to_date('20/04/18','RR/MM/DD'),'07:00',to_date('20/04/21','RR/MM/DD'),'06:30','고객님이 직접 하차','기사님과 함께 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1)',null,'300000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R2','M2',null,'1','카고','박정연','손신혜','서울 중랑구 동일로 지하 797-아이파크 1102동 202호','서울 강남구 강남대로 238,스카이빌딩 601호','9.3','010-8651-5515','010-6215-5842',null,null,to_date('20/05/02','RR/MM/DD'),'04:30',to_date('20/05/06','RR/MM/DD'),'07:00','기사님 단독 상차','기사님과 함께 하차','침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 의자(1), 식탁(1), 옷장(1), 모니터(1), 에어컨(1), TV(1), 청소기(1)','저희집 CU 편의점 맞은편에 있습니다.','310000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R3','M3',null,'1','호루','이탐희','장원태','서울 서초구 강남대로 27-마당 넓은 집','서울 성북구 동소문로 24길 14-8,하늘마루빌라 301호','11.6','010-9915-2542','010-8452-5523','바로 상차','바로 하차',null,null,null,null,'고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만+프레임)(1), 수납장(1), 화장대(1), 프린터(2), 냉장고(2), TV(2), 세탁기(2), 청소기(4)','오실때 물 1리터짜리 6개 한 묶음 부탁드릴게요.','80000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R4','M4',null,'1','탑차','박정연','박정연','서울 동작구 동작대로 335-1-초록색 대문','서울 강북구 덕릉로 88,이편한세상 1102동 602호','9.9','010-8362-5111','010-8362-5111',null,'바로 하차',to_date('20/04/23','RR/MM/DD'),'07:30',null,null,'고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만)(2), 침대(매트리스만+프레임)(1), 화장대(1), 책상(1), 모니터(1), 프린터(1), 냉장고(1), TV(1), 공기청정기(1), 청소기(1)',null,'60000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R5','M1',null,'1','윙바디','유승제','유승제','서울 용산구 다산로 8-11-놀이터','서울 용산구 한강대로 405,서울역','5.6','010-9955-3215','010-9955-3215',null,'바로 하차',to_date('20/04/14','RR/MM/DD'),'19:30',null,null,'기사님 단독 상차','고객님이 직접 하차','수납장(2), 신발장(2), 화장대(1), 책상(1), 모니터(4), 에어컨(2), 냉장고(2), 공기청정기(3)','냉장고가 조금 무거워요.','80000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R6','M2',null,'1','리프트','박정연','손신혜','서울 용산구 임정로 7,숙명여대','서울 강남구 개포로 402,개포고','11.6','010-1166-9582','010-6251-7598','바로 상차',null,null,null,to_date('20/04/24','RR/MM/DD'),'08:00','기사님 단독 상차','기사님 단독 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 신발장(4), 책상(3), 프린터(1), 냉장고(2), TV(2)','안전하게 배송 부탁드립니다~','780000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R7','M3',null,'1.4','카고','이탐희','장원태','서울 성동구 마조로 42,한양대학교 기숙사','서울 관악구 관악로 1,서울대학교 기숙사 1관','11.2','010-6654-1885','010-8632-1919',null,null,to_date('20/05/02','RR/MM/DD'),'18:30',to_date('20/05/09','RR/MM/DD'),'07:30','고객님이 직접 상차','고객님이 직접 하차','침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 책상(1), 프린터(1), 에어컨(1), 냉장고(1), TV(1)','가는길에 사람좀 태울게요~','490000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R8','M4',null,'1.4','호루','남지훈','남지훈','서울 광진구 긴고랑로 1,타이어테크','서울 강남구 테헤란로 133,한국타이어빌딩 501호','6.5','010-6663-1982','010-6663-1982',null,null,to_date('20/05/13','RR/MM/DD'),'07:30',to_date('20/05/16','RR/MM/DD'),'07:30','기사님과 함께 상차','기사님과 함께 하차','타이어(10)','저희랑 같이 타이어 부탁드립니다. 감사합니다 !!','270000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R9','M1',null,'1.4','윙바디','손신혜','손신혜','서울 중랑구 겸재로 68,소소빌딩 101호','서울 강서구 하늘길 38,김포공항','30.3','010-9577-3256','010-9577-3256','바로 상차','바로 하차',null,null,null,null,'기사님과 함께 상차','기사님 단독 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1), 화장대(1), 책상(1), 의자(1), 소파(1), 식탁(1), 옷장(1)','저 이민가요~','140000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
Insert into YONGDALI.RESERVATION values ('R10','M2',null,'1.4','리프트','이탐희','장원태','서울 서초구 강남대로 27,AT센터 502호','서울 강남구 역삼1동 735-3,교보생명보험 305호','9.7','010-1111-3516','010-7845-1888',null,'바로 하차',to_date('20/06/18','RR/MM/DD'),'08:00',null,null,'기사님 단독 상차','기사님과 함께 하차','침대(매트리스만)(1), 침대(매트리스만+프레임)(1), 수납장(1), 신발장(1)','침대 1억짜리라 주의 부탁드려요','100000','Y',null,null,null,null,to_date('20/04/13','RR/MM/DD'));
------------ login&signUp -----------------------------
-- loginMember
SELECT *
FROM MEMBER
WHERE M_ID = 'admin@naver.com'
  AND M_STATUS = '정상';


-- insertMember                                    
INSERT INTO MEMBER VALUES('M' || SEQ_MNO.NEXTVAL, 
                            'biz02@naver.com',
                            'ddd',
                            '가가가2',
                            '010-111-2222',
                            '사업자',
                            '정상',
                            'Y',
                            SYSDATE);
                            
SELECT * FROM MEMBER WHERE M_ID = 'raejin0@naver.com';
DELETE FROM MEMBER WHERE M_ID = 'raejin0@naver.com';
COMMIT;
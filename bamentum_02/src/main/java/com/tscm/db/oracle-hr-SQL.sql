-- WEB Member 생성
-- 4개 column 구성
-- email    (PK)        문자열(50)
-- pw       not null    문자열(50)
-- tel        not null  문자열(50)
-- address  not null    문자열(50)

CREATE TABLE WEB_MEMBER (
   email           VarChar2(50)      PRIMARY KEY,
   pw              VarChar2(50)      NOT NULL,
   tel            VarChar2(50)      NOT NULL,
   address       VarChar2(50)      NOT NULL
);

commit;

insert into WEB_MEMBER 
        values ('aaa@smhrd.or.kr', 'aaa', '111-1111-1111', '스마트 인재 개발원 aaa');
        
insert into WEB_MEMBER 
        values ('admin', 'admin', '111-1111-1111', '광주 북구');        
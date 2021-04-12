#주제: 휴대폰 통합 판매 시스템 - 핸드폰 매장 
 -- 등록 / 검색  / 종료
 -- 검색 -> 제품명 -> 상세보기 y/n 
   # 제품명 5개 (아이폰 12, 아이폰 12 pro, 아이폰12 mini, 갤럭시 폴드, 갤럭시 s21, 갤럭시 노트 s20)
   # 총 갯수 : 5개씩 -> 30개 
   # 재고 -> 등록시 +1
 
DROP TABLE 할인율;
CREATE TABLE 할인율(
제품명  VARCHAR(10) not null primary key ,
할인율 float
);
SELECT *FROM 할인율;
INSERT 할인율 VALUES('아이폰12', 0);
INSERT 할인율 VALUES('아이폰12pro', 0.05);
INSERT 할인율 VALUES('아이폰12mini', 0.1);
INSERT 할인율 VALUES('갤럭시폴드', 0.3);
INSERT 할인율 VALUES('갤럭시s21+', 0.1);
INSERT 할인율 VALUES('갤럭시노트20울트라', 0);
INSERT 할인율 VALUES('갤럭시s21', 0.1);
INSERT 할인율 VALUES('갤럭시노트20', 0.5);

alter table 할인율 rename 할인율;
alter table 할인율 change 재고 할인율 float;

# 입고일 CURRENT_TIMESTAMP
# 제품코드 auto_increment &  foreign key(제품명) REFERENCES 재고확인(제품명)
DROP TABLE 상세정보;
CREATE TABLE 상세정보(
제품명 VARCHAR(20) not null , foreign key(제품명) REFERENCES 할인율(제품명),
제품코드 INT not null primary key auto_increment,
출시일 VARCHAR(30) ,
입고일 DATETIME  default current_timestamp ,
제조사 VARCHAR(20), 
보증기간 INT, 
용량 VARCHAR(20), 
색상 VARCHAR(20),
가격 INT,
화면크기 VARCHAR(20), 
무게 VARCHAR(20)
);
desc 상세정보;
ALTER TABLE 상세정보 modify 출시일 varchar(30);

INSERT 상세정보 VALUES('아이폰12', DEFAULT, '2020-02-11' , DEFAULT, 'APPLE', 1, '128G' , 'RED', 20000, '6INCH', '200G');  
INSERT 상세정보 VALUES('아이폰12', DEFAULT, '2020-02-11' , DEFAULT, 'APPLE', 1, '128G' , 'GREEN', 1300000, '6INCH', '200G');
INSERT 상세정보 VALUES('아이폰12', DEFAULT, '2020-02-13' , DEFAULT, 'APPLE', 2, '256G' , 'GREEN', 1300000, '6INCH', '200G');
INSERT 상세정보 VALUES('아이폰12', DEFAULT, '2020-02-15' , DEFAULT, 'APPLE', 2, '256G' , 'WHITE', 1300000, '6INCH', '200G');
INSERT 상세정보 VALUES('아이폰12', DEFAULT, '2020-02-17' , DEFAULT, 'APPLE', 2, '256G' , 'BLUE', 1300000, '6INCH', '200G');

INSERT 상세정보 VALUES('아이폰12pro', DEFAULT, '2020-02-11' , DEFAULT, 'APPLE', 1, '128G' , 'WHITE', 1500000, '8INCH', '300G');
INSERT 상세정보 VALUES('아이폰12pro', DEFAULT, '2020-02-13' , DEFAULT, 'APPLE', 1, '128G' , 'RED', 1500000, '8INCH', '300G');
INSERT 상세정보 VALUES('아이폰12pro', DEFAULT, '2020-02-13' , DEFAULT, 'APPLE', 1, '128G' , 'GREEN', 1500000, '8INCH', '300G');
INSERT 상세정보 VALUES('아이폰12pro', DEFAULT, '2020-02-15' , DEFAULT, 'APPLE', 2, '256G' , 'WHITE', 1500000, '8INCH', '300G');
INSERT 상세정보 VALUES('아이폰12pro', DEFAULT, '2020-02-17' , DEFAULT, 'APPLE', 3, '512G' , 'BLUE', 1500000, '8INCH', '300G');

INSERT 상세정보 VALUES('아이폰12mini', DEFAULT, '2020-02-11' , DEFAULT, 'APPLE', 1, '64G' , 'BLUE', 950000, '6INCH', '135G');
INSERT 상세정보 VALUES('아이폰12mini', DEFAULT, '2020-02-12' , DEFAULT, 'APPLE', 1, '64G' , 'RED', 950000, '6INCH', '135G');
INSERT 상세정보 VALUES('아이폰12mini', DEFAULT, '2020-02-12' , DEFAULT, 'APPLE', 1, '128G' , 'WHITE', 1050000, '6INCH', '135G');
INSERT 상세정보 VALUES('아이폰12mini', DEFAULT, '2020-02-13' , DEFAULT, 'APPLE', 2, '128G' , 'BLACK', 1050000, '6INCH', '135G');
INSERT 상세정보 VALUES('아이폰12mini', DEFAULT, '2020-02-16' , DEFAULT, 'APPLE', 2, '256G' , 'GREEN', 1150000, '6INCH', '135G');

INSERT 상세정보 VALUES('갤럭시폴드', DEFAULT, '2020-08-16' , DEFAULT, 'SAMSUNG',1, '128G' , 'BLACK', 2390000, '7INCH', '282G');
INSERT 상세정보 VALUES('갤럭시폴드', DEFAULT, '2020-08-16' , DEFAULT, 'SAMSUNG',2, '256G' , 'BLACK', 2490000, '7INCH', '282G');
INSERT 상세정보 VALUES('갤럭시폴드', DEFAULT, '2020-08-17' , DEFAULT, 'SAMSUNG',2, '256G' , 'BRONZE', 2490000, '7INCH', '282G');
INSERT 상세정보 VALUES('갤럭시폴드', DEFAULT, '2020-08-17' , DEFAULT, 'SAMSUNG',1, '128G' , 'BRONZE', 2390000, '7INCH', '282G');
INSERT 상세정보 VALUES('갤럭시폴드', DEFAULT, '2020-08-19' , DEFAULT, 'SAMSUNG',2, '256G' , 'BRONZE', 2490000, '7INCH', '282G');

INSERT 상세정보 VALUES('갤럭시s21', DEFAULT, '2021-01-15' , DEFAULT, 'samsung', 1, '256G' , '바이올렛', 999900, '6.2INCH', '171G');  
INSERT 상세정보 VALUES('갤럭시s21', DEFAULT, '2021-01-15' , DEFAULT, 'samsung', 1, '256G' , '핑크', 999900, '6.2INCH', '171G');  
INSERT 상세정보 VALUES('갤럭시s21+', DEFAULT, '2021-01-15' , DEFAULT, 'samsung', 1, '512G' , '화이트', 1199000, '6.7INCH', '200G');  
INSERT 상세정보 VALUES('갤럭시s21+', DEFAULT, '2021-01-15' , DEFAULT, 'samsung', 1, '256G' , '화이트', 1199000, '6.7INCH', '200G');  

INSERT 상세정보 VALUES('갤럭시노트20', DEFAULT, '2020-08-05' , DEFAULT, 'samsung', 1, '256G' , '미스틱그레이', 1199000, '6.7INCH', '192G');
INSERT 상세정보 VALUES('갤럭시노트20', DEFAULT, '2020-08-05' , DEFAULT, 'samsung', 1, '256G' , '미스틱그린', 1199000, '6.7INCH', '192G');
INSERT 상세정보 VALUES('갤럭시노트20', DEFAULT, '2020-08-05' , DEFAULT, 'samsung', 1, '256G' , '미스틱그린', 1199000, '6.7INCH', '192G');
INSERT 상세정보 VALUES('갤럭시노트20', DEFAULT, '2020-08-05' , DEFAULT, 'samsung', 1, '256G' , '미스틱브론즈', 1199000, '6.7INCH', '192G');
INSERT 상세정보 VALUES('갤럭시노트20', DEFAULT, '2020-08-05' , DEFAULT, 'samsung', 1, '256G' , '미스틱브론즈', 1199000, '6.7INCH', '192G');
INSERT 상세정보 VALUES('갤럭시노트20울트라', DEFAULT, '2020-08-05' , DEFAULT, 'samsung', 1, '256G' , '미스틱브론즈', 1452000, '6.9INCH', '208G');


SELECT * FROM 상세정보;
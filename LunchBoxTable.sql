CREATE SCHEMA project;

CREATE TABLE CATEGORY
   (CategoryID INTEGER NOT NULL,
     CategoryName VARCHAR(10),
     PRIMARY KEY(CategoryID));
     
CREATE TABLE FOOD
   (FoodID INTEGER NOT NULL,
     FoodName VARCHAR(10),
     FoodPrice INTEGER,
     FoodImage VARCHAR(25),
     CategoryID INTEGER,
     PRIMARY KEY(FoodID),
     FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID));
     
CREATE TABLE STAR
   (StarID INTEGER AUTO_INCREMENT,
     FoodID INTEGER,
     UserID VARCHAR(10),
     PRIMARY KEY(StarID),
     FOREIGN KEY(FoodID) REFERENCES FOOD(FoodID));
     
CREATE TABLE BOX
    (BoxID INTEGER AUTO_INCREMENT,
     TotalPrice INTEGER,
     Food1ID INTEGER,
     Food2ID INTEGER,
     Food3ID INTEGER,
     Food4ID INTEGER,
     Food5ID INTEGER,
     Food6ID INTEGER,
     PRIMARY KEY(BoxID),
     FOREIGN KEY(Food1ID) REFERENCES FOOD(FoodID),
     FOREIGN KEY(Food2ID) REFERENCES FOOD(FoodID),
     FOREIGN KEY(Food3ID) REFERENCES FOOD(FoodID),
     FOREIGN KEY(Food4ID) REFERENCES FOOD(FoodID),
     FOREIGN KEY(Food5ID) REFERENCES FOOD(FoodID),
     FOREIGN KEY(Food6ID) REFERENCES FOOD(FoodID));



CREATE TABLE TIER
     (TierID INTEGER NOT NULL,
      TierName VARCHAR(10),
      TierDiscount INTEGER,
      PRIMARY KEY(TierID));
      
CREATE TABLE CUSTOMER
   (CustomerID VARCHAR(10) NOT NULL,
     CustomerPW VARCHAR(18),
     CustomerTotalPrice INTEGER,
     TierID INTEGER,
     City VARCHAR(4),
     Dong VARCHAR(4),
     Ku VARCHAR(3),
     PRIMARY KEY(CustomerID),
     FOREIGN KEY(TierID) REFERENCES Tier(TierID));
     
CREATE TABLE CART
   (CartID INTEGER auto_increment,
     CartDate DATETIME,
     CartStatus BOOLEAN,
     BoxID INTEGER,
     CustomerID VARCHAR(18),
     PRIMARY KEY(CartID),
     FOREIGN KEY(BoxID) REFERENCES Box(BoxID),
     FOREIGN KEY(CustomerID) REFERENCES CUSTOMER(CustomerID));

CREATE TABLE BOOKMARK
   (BookID INTEGER auto_increment,
     BookName VARCHAR(10),
     CartID INTEGER,
     PRIMARY KEY(BookID),
     FOREIGN KEY(CartID) REFERENCES CART(CartID));
     
CREATE TABLE REVIEW
   (ReviewID INTEGER auto_increment,
     ReviewDate DATETIME,
     ReviewContent VARCHAR(190),
     CartID INTEGER,
     PRIMARY KEY(ReviewID),
     FOREIGN KEY(CartID) REFERENCES CART(CartID));
     

ALTER TABLE food ADD INDEX(FoodID, FoodName(10));



INSERT INTO CATEGORY 
VALUES (4, "밥"), (1, "육류"), (2, "채소"),
		(3, "해산물"), (8, "토핑"), (12, "간식");
        
INSERT INTO TIER
VALUES (1, "가", 500) ,(2, "양", 1000) ,(3, "미", 1500),
(4, "우", 2000), (5, "수", 2500);

INSERT INTO CUSTOMER
VALUES ("맛없으면우는펭귄", "pengsad", 0, 1, "청주시", "개신동", "서원구"), 
("맛있으면짓는개", "elephant", 0, 1, "청주시", "개신동", "서원구"),
("문스윙스", "swings0627", 0, 1, "청주시", "개신동", "서원구"),
 ("아지즈", "aziz", 0, 1, "청주시", "개신동", "서원구"),
("티에프티", "loltochess", 0, 1, "청주시", "개신동", "서원구"), 
("몬생긴고앵이", "uglycat", 0, 1, "청주시", "개신동", "서원구"),
("저녁뭐먹지", "whatdinner", 0, 1, "청주시", "개신동", "서원구");



INSERT INTO FOOD 
VALUES (1,'백미밥', 1000,'Food/밥/밥1.jpg', 4);

INSERT INTO FOOD
VALUES (2,'흑미밥', 1000,'Food/밥/밥2.jpg', 4);

INSERT INTO FOOD
VALUES (3,'보리밥', 1000,'Food/밥/밥3.jpg', 4);

INSERT INTO FOOD
VALUES (4,'오곡밥', 1000,'Food/밥/밥4.jpg', 4);

INSERT INTO FOOD
VALUES (5,'잡곡밥', 1000,'Food/밥/밥5.jpg', 4);

INSERT INTO FOOD
VALUES (6,'현미밥', 1000,'Food/밥/밥6.jpg', 4);




INSERT INTO FOOD
VALUES (7,'갈비찜', 2500,'Food/반찬/반찬1.jpg', 1);

INSERT INTO FOOD
VALUES (8,'계란말이', 1300,'Food/반찬/반찬2.jpg', 1);

INSERT INTO FOOD
VALUES (9,'계란장', 1200,'Food/반찬/반찬3.jpg', 1);

INSERT INTO FOOD
VALUES (10,'꼬마돈까스', 2200,'Food/반찬/반찬4.jpg', 1);

INSERT INTO FOOD
VALUES (11,'동그랑땡', 1000,'Food/반찬/반찬5.jpg', 1);

INSERT INTO FOOD
VALUES (12,'분홍소세지', 1000,'Food/반찬/반찬6.jpg', 1);

INSERT INTO FOOD
VALUES (13,'불고기', 2000,'Food/반찬/반찬7.jpg', 1);

INSERT INTO FOOD
VALUES (14,'비엔나 소세지', 1200,'Food/반찬/반찬8.jpg', 1);

INSERT INTO FOOD
VALUES (15,'소세지 야채 볶음', 1200,'Food/반찬/반찬9.jpg', 1);

INSERT INTO FOOD
VALUES (16,'스펨구이', 1500,'Food/반찬/반찬10.jpg', 1);

INSERT INTO FOOD
VALUES (17,'장조림', 2300,'Food/반찬/반찬11.jpg', 1);


INSERT INTO FOOD
VALUES (18,'제육볶음', 1800,'Food/반찬/반찬12.jpg', 1);

INSERT INTO FOOD
VALUES (19,'치킨너겟', 1500,'Food/반찬/반찬13.jpg', 1);


INSERT INTO FOOD
VALUES (20,'고사리', 800,'Food/반찬/반찬14.jpg', 2);

INSERT INTO FOOD
VALUES (21,'깍두기', 500,'Food/반찬/반찬15.jpg', 2);

INSERT INTO FOOD
VALUES (22,'꽈리고추멸치볶음', 1400,'Food/반찬/반찬16.jpg', 2);

INSERT INTO FOOD
VALUES (23,'노각김치', 800,'Food/반찬/반찬17.jpg', 2);

INSERT INTO FOOD
VALUES (24,'단무지', 500,'Food/반찬/반찬18.jpg', 2);

INSERT INTO FOOD
VALUES (25,'두부조림', 1500,'Food/반찬/반찬19.jpg', 2);

INSERT INTO FOOD
VALUES (26,'마늘장아찌', 1200,'Food/반찬/반찬20.jpg', 2);

INSERT INTO FOOD
VALUES (27,'마늘종볶음', 1100,'Food/반찬/반찬21.jpg', 2);

INSERT INTO FOOD
VALUES (28,'무말랭이', 900,'Food/반찬/반찬22.jpg', 2);

INSERT INTO FOOD
VALUES (29,'무생채', 1000,'Food/반찬/반찬23.jpg', 2);

INSERT INTO FOOD
VALUES (30,'볶음김치', 800,'Food/반찬/반찬24.jpg', 2);

INSERT INTO FOOD
VALUES (31,'상추', 500,'Food/반찬/반찬25.jpg', 2);

INSERT INTO FOOD
VALUES (32,'시금치무침', 1000,'Food/반찬/반찬26.jpg', 2);

INSERT INTO FOOD
VALUES (33,'애호박전', 1200,'Food/반찬/반찬27.jpg', 2);

INSERT INTO FOOD
VALUES (34,'찐감자', 1500,'Food/반찬/반찬28.jpg', 2);

INSERT INTO FOOD
VALUES (35,'콩나물무침', 1000,'Food/반찬/반찬29.jpg', 2);

INSERT INTO FOOD
VALUES (36,'콩자반', 700,'Food/반찬/반찬30.jpg', 2);

INSERT INTO FOOD
VALUES (37,'갈치조림', 2500,'Food/반찬/반찬31.jpg', 3);

INSERT INTO FOOD
VALUES (38,'고등어구이', 2500,'Food/반찬/반찬32.jpg', 3);

INSERT INTO FOOD
VALUES (39,'꼬막무침', 2000,'Food/반찬/반찬33.jpg', 3);


INSERT INTO FOOD
VALUES (40,'멸치볶음',1000,'Food/반찬/반찬34.jpg', 3);

INSERT INTO FOOD
VALUES (41,'명란젓',1500,'Food/반찬/반찬35.jpg', 3);

INSERT INTO FOOD
VALUES (42,'미역줄기볶음',1300,'Food/반찬/반찬36.jpg', 3);

INSERT INTO FOOD
VALUES (43,'새우튀김',2300,'Food/반찬/반찬37.jpg', 3);

INSERT INTO FOOD
VALUES (44,'어묵볶음',1200,'Food/반찬/반찬38.jpg', 3);

INSERT INTO FOOD
VALUES (45,'연어장',3000,'Food/반찬/반찬39.jpg', 3);

INSERT INTO FOOD
VALUES (46,'진미채볶음',1300,'Food/반찬/반찬40.jpg', 3);

INSERT INTO FOOD
VALUES (47,'계란후라이',1000,'Food/토핑/토핑1.jpg', 8);

INSERT INTO FOOD
VALUES (48,'고추장',200,'Food/토핑/토핑2.jpg', 8);

INSERT INTO FOOD
VALUES (49,'김가루',200,'Food/토핑/토핑3.jpg', 8);

INSERT INTO FOOD
VALUES (50,'동원참',1000,'Food/토핑/토핑4.jpg', 8);

INSERT INTO FOOD
VALUES (51,'마요네즈',200,'Food/토핑/토핑5.jpg', 8);

INSERT INTO FOOD
VALUES (52,'참기름',200,'Food/토핑/토핑6.jpg', 8);




INSERT INTO FOOD
VALUES (53,'고로케',2000,'Food/간식/간식1.jpg', 12);

INSERT INTO FOOD
VALUES (54,'꾀돌이',300,'Food/간식/간식2.jpg', 12);

INSERT INTO FOOD
VALUES (55,'네모스낵',300,'Food/간식/간식3.jpg', 12);

INSERT INTO FOOD
VALUES (56,'누네띠네',500,'Food/간식/간식4.jpg', 12);

INSERT INTO FOOD
VALUES (57,'달고나',500,'Food/간식/간식5.jpg', 12);

INSERT INTO FOOD
VALUES (58,'밭두렁',600,'Food/간식/간식6.jpg', 12);

INSERT INTO FOOD
VALUES (59,'별뽀빠이',1000,'Food/간식/간식7.jpg', 12);

INSERT INTO FOOD
VALUES (60,'뻥이요',1000,'Food/간식/간식8.jpg', 12);

INSERT INTO FOOD
VALUES (61,'스탬프',400,'Food/간식/간식9.jpg', 12);

INSERT INTO FOOD
VALUES (62,'아폴로',300,'Food/간식/간식10.jpg', 12);

INSERT INTO FOOD
VALUES (63,'약과',1300,'Food/간식/간식11.jpg', 12);

INSERT INTO FOOD
VALUES (64,'옥수수빵',1000,'Food/간식/간식12.jpg', 12);


INSERT INTO FOOD
VALUES (65,'전병',1500,'Food/간식/간식13.jpg', 12);

INSERT INTO FOOD
VALUES (66,'짝궁',500,'Food/간식/간식14.jpg', 12);

INSERT INTO FOOD
VALUES (67,'쫀드기',300,'Food/간식/간식15.jpg', 12);

INSERT INTO FOOD
VALUES (68,'차카니',400,'Food/간식/간식16.jpg', 12);

INSERT INTO FOOD
VALUES (69,'쿠키속초코짱',500,'Food/간식/간식17.jpg', 12);

INSERT INTO FOOD
VALUES (70,'포포',1000,'Food/간식/간식18.jpg', 12);

INSERT INTO FOOD
VALUES (71,'한과',1500,'Food/간식/간식19.jpg', 12);

INSERT INTO FOOD
VALUES (72,'휘파람캔디',800,'Food/간식/간식20.jpg', 12);

INSERT INTO BOX(BoxID, TotalPrice, Food1ID, Food2ID, Food3ID)
VALUES(1,3300,70,71,72);

INSERT INTO REVIEW
VALUES(1, '2020-12-09 08:35:52', '아이거정말화나네요', 3);

INSERT INTO REVIEW
VALUES(2, '2020-12-09 08:35:52', '제발 실행해주세요 제발', 4);
/*
밥 6개 1~6
육류 13개 7~19               
채소 17개 20~ 36         
해산물 10개 37~46      
토핑 6개  47~52          
간식 20개 53~ 72
*/

DROP TABLE REVIEW;
DROP TABLE BOOKMARK;
DROP TABLE CART;
DROP TABLE CUSTOMER;
DROP TABLE TIER;
DROP TABLE BOX;
DROP TABLE STAR;
DROP TABLE FOOD;
DROP TABLE CATEGORY;
     
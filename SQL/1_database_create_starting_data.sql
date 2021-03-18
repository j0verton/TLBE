USE [master]
GO
IF db_id('TuneList') IS NULL
  CREATE DATABASE [TuneList]
GO
USE [TuneList]
GO

DROP TABLE IF EXISTS [UserProfile];
DROP TABLE IF EXISTS [Tune];
DROP TABLE IF EXISTS [Collection];
DROP TABLE IF EXISTS [TuneCollection];
DROP TABLE IF EXISTS [Tuning]
DROP TABLE IF EXISTS [Photos]

CREATE TABLE [UserProfile](
   Id       INTEGER  NOT NULL PRIMARY KEY 
  ,[Username] VARCHAR(12) NOT NULL
  ,Name     VARCHAR(17) NOT NULL
  ,Email    VARCHAR(20) NOT NULL
  ,[FirebaseUserId] NVARCHAR(28) NOT NULL,
  
  CONSTRAINT UQ_FirebaseUserId UNIQUE(FirebaseUserId),
  CONSTRAINT UQ_Email UNIQUE(Email)
);
INSERT INTO [UserProfile](Id,[Username],Name,Email, FirebaseUserId) VALUES (1,'Joe','Joe Overton','me@me.com', '09q9hn1Za8PUnHJlsAk0Wey8ztw1');
INSERT INTO [UserProfile](Id,[Username],Name,Email, FirebaseUserId) VALUES (2,'Jeff','Jeff Jeffity Jeff','Jeff@jeffityjeff.com', 'gbKdG17uSseqr8zlUoCoTfaxNfq1');
INSERT INTO [UserProfile](Id,[Username],Name,Email, FirebaseUserId) VALUES (3,'Sue','Sue Shu','sue_1982317@aol.com', 'HkBOT0tsNINZDL2131cjPtTEmPY2');
INSERT INTO [UserProfile](Id,[Username],Name,Email, FirebaseUserId) VALUES (4,'SJ','Steve  Johnson','steve@aol.com', 'mZWySgbBtIOWTSpxSFt330bvq8f1');
INSERT INTO [UserProfile](Id,[Username],Name,Email, FirebaseUserId) VALUES (5,'littleStevie','Uptown  Stan','oooo@joe.com','2WVu2j8ZE8Yyii1jIgfidmZ45Ik1');

CREATE TABLE Tune(
	Id      INTEGER  NOT NULL PRIMARY KEY 
  ,Name        VARCHAR(60) NOT NULL
  ,tuneCollection     VARCHAR(2) NOT NULL
  ,Tuning      VARCHAR(8) NOT NULL
  ,AudioUpload VARCHAR(91)
  ,ImageUpload VARCHAR(91)
  ,UserProfileId          INTEGER  NOT NULL
  ,Starred     BIT 
  ,Source      VARCHAR(16)
  ,Notes       VARCHAR(89)
  ,Link        VARCHAR(55)
  ,Learning    VARCHAR(4),
  CONSTRAINT [FK_Tune_UserProfile] FOREIGN KEY ([UserProfileId])
  REFERENCES [UserProfile] ([Id])
);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'The Old Yellow Dog Come A Trotting Through the Meeting House','G','Standard',NULL,NULL,3,1,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Possum up a Gum Stump','A','Cross',NULL,'https://res.cloudinary.com/banjo/image/upload/v1604000169/tunelist/n1feqvi9mimdsagldy0g.jpg',4,NULL,'Allen Alsop','Learned this from the H.B. Mississippi FIddle Tune book, its a great Source for MS tunes',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Cindy Gal','D','ADAE',NULL,NULL,5,0,'Joe Thompson',NULL,'https://www.youtube.com/watch?v=GMGZuxUs1e4',NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Icy Mountain','A','Cross','https://res.cloudinary.com/banjo/vIdeo/upload/v1604003661/tunelist/ricvqd6720sqhkkdtufy.mp4',NULL,7,1,NULL,'I learned this from the Improbabillies record.',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Liberty off a Corn Liquor Still in Georgia','G','Standard','https://res.cloudinary.com/banjo/vIdeo/upload/v1604004016/tunelist/jpwkj6mjv2r86apftcqt.mp3',NULL,8,1,'Clayton McMichen','From GId Tanner and the Skillet Lickers',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'Icy Mountain','A','Cross','https://res.cloudinary.com/banjo/vIdeo/upload/v1604003661/tunelist/ricvqd6720sqhkkdtufy.mp4',NULL,10,1,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Sweet Bama','A','Cross','https://res.cloudinary.com/banjo/vIdeo/upload/v1604020093/tunelist/krlkia8rpcjmp4csc5b8.mp3',NULL,16,0,'Stanley Bailey',NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Dinah','A','Cross',NULL,NULL,17,1,'Henry Reed','I learned it from Rick Martin',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Oscar''s Piece #3','A','Cross','https://res.cloudinary.com/banjo/vIdeo/upload/v1604019332/tunelist/ikkmbsbpvdovdtfwad4g.mp3',NULL,23,1,'Oscar Overturf',NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Paddy wont you have some good old cIder','D','ADAE',NULL,NULL,24,1,'Charlie Acuff',NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Polecat Blues','D','ADAE',NULL,NULL,25,1,'Greg Hooven','I learned this from the Freight Hoppers originally',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Five Miles from Town','D','ADAE',NULL,NULL,26,0,'Clyde Davenport',NULL,'https://www.slippery-hill.com/recording/five-miles-town',NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Sally Anne','D','ADAE',NULL,NULL,27,NULL,'Tommy Jarrell','The Mt Airy national anthem',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Wolf Creek','G','Standard','https://res.cloudinary.com/banjo/vIdeo/upload/v1604080026/tunelist/ypesp3elwwphunmsmtiz.mp4',NULL,29,1,NULL,'Learned from the Rafe Stefanini record',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'I''m Gonna Go A-Hunting For The Buffalo','Em','BEGB','https://res.cloudinary.com/banjo/vIdeo/upload/v1604022115/tunelist/bvmmdjdxv8h7rjkmriww.mp3',NULL,30,1,'Jimmy Driftwood','What?! so cool...',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Pickin'' the Devils Eye','A','AEAC#',NULL,NULL,31,NULL,NULL,'I learned this from Mike Bryant',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'Sally Anne','D','ADAE',NULL,NULL,32,1,'Tommy Jarrell',NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (4,'Polecat Blues','D','ADAE',NULL,NULL,34,0,'Greg Hooven',NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (4,'Cindy Gal','D','ADAE',NULL,NULL,36,0,'Joe Thompson',NULL,'https://www.youtube.com/watch?v=GMGZuxUs1e4',NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'Wolf Creek','G','Standard',NULL,NULL,38,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'Rattletrap','G','GDGD',NULL,NULL,39,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'Hy Patillion','C','Standard',NULL,NULL,40,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'Billy in the Lowground','C','Standard',NULL,NULL,41,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'Possum up a Gum Stump','A','Cross',NULL,'https://res.cloudinary.com/banjo/image/upload/v1604000169/tunelist/n1feqvi9mimdsagldy0g.jpg',42,NULL,'Allen Alsop',NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'I''m Gonna Go A-Hunting For The Buffalo','Em','BEGB','https://res.cloudinary.com/banjo/vIdeo/upload/v1604022115/tunelist/bvmmdjdxv8h7rjkmriww.mp3',NULL,43,0,'Jimmy Driftwood',NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'The Old Yellow Dog Come A Trotting Through the Meeting House','G','Standard',NULL,NULL,44,0,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'Give the FIddler a Dram','A','Cross',NULL,NULL,45,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (2,'Liberty off of a Corn Liquor Still in Georgia','G','Standard','https://res.cloudinary.com/banjo/vIdeo/upload/v1604004016/tunelist/jpwkj6mjv2r86apftcqt.mp3',NULL,46,1,'Clayton McMichen',NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (5,'Icy Mountain','A','Cross',NULL,NULL,47,1,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (5,'Head of the Creek','A','Cross',NULL,NULL,48,1,'Ward Jarvis',NULL,NULL,'true');
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (5,'Farwell to Trion','C','Standard','https://res.cloudinary.com/banjo/vIdeo/upload/v1604974771/tunelist/q5kasw3ws2kwhkym8lxm.m4a',NULL,49,NULL,NULL,'AL tune learned from James Bryan, this is a recording of Aaron Olwell playing it.',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (5,'Squirrel Heads and Gravy','A','Cross',NULL,NULL,50,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Horseshoe Bend','C','Standard','https://res.cloudinary.com/banjo/vIdeo/upload/v1604975343/tunelist/zrozh1f60gnyentaml94.mp4',NULL,51,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Walk Along John to Kansas','A','Cross','https://res.cloudinary.com/banjo/vIdeo/upload/v1604979136/tunelist/hx4xi24wpqykc6xkc5fk.m4a',NULL,52,NULL,NULL,'I learned this from Rick Martin',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (3,'June Apple','A','Cross',NULL,NULL,54,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (3,'Stay All Night/Waterbound','A','Cross',NULL,NULL,55,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (3,'Acorn Stomp','F','Standard',NULL,NULL,56,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (3,'The Old Yellow Dog Come A Trotting Through the Meeting House','G','Standard',NULL,NULL,57,1,NULL,NULL,NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Waco','A','Cross','https://res.cloudinary.com/banjo/vIdeo/upload/v1605024282/tunelist/v7vawlipwwz2ubq8xk90.m4a',NULL,58,NULL,'Cecil Plum','I''ve been playing this one with George',NULL,NULL);
INSERT INTO Tune(UserProfileId,Name,tuneCollection,Tuning,AudioUpload,ImageUpload,Id,Starred,Source,Notes,Link,Learning) VALUES (1,'Rattletrap','G','GDGD',NULL,NULL,59,NULL,NULL,NULL,NULL,NULL);

CREATE TABLE [Collection](
   Id     INTEGER  NOT NULL PRIMARY KEY 
  ,UserProfileId INTEGER  NOT NULL
  ,Name   VARCHAR(8) NOT NULL
  ,Custom VARCHAR(4),
  CONSTRAINT [FK_Collection_UserProfile] FOREIGN KEY ([UserProfileId])
  REFERENCES [UserProfile] ([Id])
);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (1,1,'A/Cross',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (2,1,'G',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (3,1,'D/ADAE',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (5,2,'D/ADAE',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (6,2,'A/Cross',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (7,2,'G',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (8,1,'A/AEAC#',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (11,1,'Em/BEGB',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (15,1,'C',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (16,2,'GA tunes','true');
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (17,2,'G/GDGD',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (18,2,'C',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (19,2,'Em/BEGB',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (20,5,'A/Cross',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (21,5,'C',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (23,3,'A/Cross',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (24,3,'F',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (25,3,'G favs','true');
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (26,3,'G',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (27,1,'G/GDGD',NULL);
INSERT INTO [Collection](Id,UserProfileId,Name,Custom) VALUES (28,1,'GA tunes','true');

CREATE TABLE TuneCollection(
   Id       INTEGER  NOT NULL PRIMARY KEY 
  ,[CollectionId] INTEGER 
  ,TuneId           INTEGER  NOT NULL,
    CONSTRAINT [FK_TuneCollection_Collection] FOREIGN KEY ([CollectionId])
  REFERENCES [Collection] ([Id])
  ,
    CONSTRAINT [FK_TuneCollection_Tune] FOREIGN KEY ([TuneId])
  REFERENCES [Tune] ([Id])
);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (3,2,3);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (4,1,4);
INSERT INTO TuneCollection (TuneId,CollectionId,Id) VALUES (5,3,5);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (7,1,7);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (8,2,8);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (10,6,10);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (16,1,16);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (17,1,17);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (23,1,23);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (24,3,24);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (25,3,25);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (26,3,26);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (27,3,27);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (29,2,29);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (30,11,30);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (31,8,31);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (32,5,32);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (10,16,38);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (38,7,39);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (39,17,40);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (40,18,41);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (41,18,42);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (42,6,43);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (43,19,44);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (44,7,45);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (45,6,46);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (46,7,47);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (47,20,48);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (48,20,49);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (48,NULL,50);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (49,21,51);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (50,20,52);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (51,15,53);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (52,1,54);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (52,NULL,55);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (52,NULL,56);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (54,23,58);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (55,23,59);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (54,NULL,60);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (54,NULL,61);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (56,24,62);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (57,26,63);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (57,25,64);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (4,NULL,65);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (58,1,66);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (59,27,67);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (8,NULL,68);
INSERT INTO TuneCollection(TuneId,CollectionId,Id) VALUES (8,28,69);

CREATE TABLE Tunings(
   Id    INTEGER  NOT NULL PRIMARY KEY,
   TuneKey   VARCHAR(12) NOT NULL 
  ,Text  VARCHAR(29) NOT NULL
  ,Value VARCHAR(8) NOT NULL

);
INSERT INTO Tunings(TuneKey,Text,Value,Id) VALUES ('Standard','GDAE / Standard','Standard',1);
INSERT INTO Tunings(TuneKey,Text,Value,Id) VALUES ('Cross tuning','AEAE / Cross-tuning / Sawmill','Cross',2);
INSERT INTO Tunings(TuneKey,Text,Value,Id) VALUES ('ADAE','ADAE','ADAE',3);
INSERT INTO Tunings(TuneKey,Text,Value,Id) VALUES ('AEAC#','AEAC#','AEAC#',4);
INSERT INTO Tunings(TuneKey,Text,Value,Id) VALUES ('BEGB','BEGB','BEGB',5);
INSERT INTO Tunings(TuneKey,Text,Value,Id) VALUES ('GDAD','GDAD','GDAD',6);

CREATE TABLE Photos(
   Id     INTEGER  NOT NULL PRIMARY KEY 
  ,Url    VARCHAR(117) NOT NULL
  ,UserProfileId INTEGER,
    CONSTRAINT [FK_Photos_UserProfile] FOREIGN KEY ([UserProfileId])
  REFERENCES [UserProfile] ([Id])
);
INSERT INTO Photos(Id,Url,UserProfileId) VALUES (1,'https://res.cloudinary.com/banjo/image/upload/v1604077419/DSC04362_xtmbod.jpg',NULL);
INSERT INTO Photos(Id,Url,UserProfileId) VALUES (2,'https://res.cloudinary.com/banjo/image/upload/v1604077418/615059_4782632210821_909383358_o_mb4mmb.jpg',NULL);
INSERT INTO Photos(Id,Url,UserProfileId) VALUES (3,'https://res.cloudinary.com/banjo/image/upload/v1604077418/254126_10150209288705773_3334529_n_lonaeb.jpg',NULL);
INSERT INTO Photos(Id,Url,UserProfileId) VALUES (4,'https://res.cloudinary.com/banjo/image/upload/v1604077418/564927_10151043243077242_471246640_n_ebtspw.jpg',NULL);
INSERT INTO Photos(Id,Url,UserProfileId) VALUES (5,'https://res.cloudinary.com/banjo/image/upload/v1604077418/11817123_10153495924565030_5026181015286445267_n_cw6c6d.jpg',NULL);
INSERT INTO Photos(Id,Url,UserProfileId) VALUES (6,'https://res.cloudinary.com/banjo/image/upload/v1604081643/1270317_10202335393773317_1774884711_o_luikhv.jpg',NULL);
INSERT INTO Photos(Id,Url,UserProfileId) VALUES (7,'https://res.cloudinary.com/banjo/image/upload/v1604081643/857125_10205020035687512_8077124020092329385_o_kdpagw.jpg',2);

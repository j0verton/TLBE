CREATE TABLE Users(
   Id       INTEGER  NOT NULL PRIMARY KEY 
  ,Username VARCHAR(12) NOT NULL
  ,Name     VARCHAR(17) NOT NULL
  ,Email    VARCHAR(20) NOT NULL
);
INSERT INTO Users(id,username,name,email) VALUES (1,'Joe','Joe Overton','me@me.com');
INSERT INTO Users(id,username,name,email) VALUES (2,'Jeff','Jeff Jeffity Jeff','Jeff@jeffityjeff.com');
INSERT INTO Users(id,username,name,email) VALUES (3,'Sue','Sue Shu','sue_1982317@aol.com');
INSERT INTO Users(id,username,name,email) VALUES (4,'SJ','Steve  Johnson','steve@aol.com');
INSERT INTO Users(id,username,name,email) VALUES (5,'littleStevie','Uptown  Stan','oooo@joe.com');

CREATE TABLE Tunes(
   UserId      INTEGER  NOT NULL PRIMARY KEY 
  ,name        VARCHAR(60) NOT NULL
  ,key         VARCHAR(2) NOT NULL
  ,tuning      VARCHAR(8) NOT NULL
  ,audioUpload VARCHAR(91)
  ,imageUpload VARCHAR(91)
  ,id          INTEGER  NOT NULL
  ,starred     BIT 
  ,source      VARCHAR(16)
  ,notes       VARCHAR(89)
  ,link        VARCHAR(55)
  ,learning    VARCHAR(4)
);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'The Old Yellow Dog Come A Trotting Through the Meeting House','G','Standard',NULL,NULL,3,1,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Possum up a Gum Stump','A','Cross',NULL,'https://res.cloudinary.com/banjo/image/upload/v1604000169/tunelist/n1feqvi9mimdsagldy0g.jpg',4,NULL,'Allen Alsop','Learned this from the H.B. Mississippi Fiddle Tunes book, its a great source for MS tunes',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Cindy Gal','D','ADAE',NULL,NULL,5,0,'Joe Thompson',NULL,'https://www.youtube.com/watch?v=GMGZuxUs1e4',NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Icy Mountain','A','Cross','https://res.cloudinary.com/banjo/video/upload/v1604003661/tunelist/ricvqd6720sqhkkdtufy.mp4',NULL,7,1,NULL,'I learned this from the Improbabillies record.',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Liberty off a Corn Liquor Still in Georgia','G','Standard','https://res.cloudinary.com/banjo/video/upload/v1604004016/tunelist/jpwkj6mjv2r86apftcqt.mp3',NULL,8,1,'Clayton McMichen','From Gid Tanner and the Skillet Lickers',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'Icy Mountain','A','Cross','https://res.cloudinary.com/banjo/video/upload/v1604003661/tunelist/ricvqd6720sqhkkdtufy.mp4',NULL,10,1,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Sweet Bama','A','Cross','https://res.cloudinary.com/banjo/video/upload/v1604020093/tunelist/krlkia8rpcjmp4csc5b8.mp3',NULL,16,0,'Stanley Bailey',NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Dinah','A','Cross',NULL,NULL,17,1,'Henry Reed','I learned it from Rick Martin',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Oscar''s Piece #3','A','Cross','https://res.cloudinary.com/banjo/video/upload/v1604019332/tunelist/ikkmbsbpvdovdtfwad4g.mp3',NULL,23,1,'Oscar Overturf',NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Paddy wont you have some good old cider','D','ADAE',NULL,NULL,24,1,'Charlie Acuff',NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Polecat Blues','D','ADAE',NULL,NULL,25,1,'Greg Hooven','I learned this from the Freight Hoppers originally',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Five Miles from Town','D','ADAE',NULL,NULL,26,0,'Clyde Davenport',NULL,'https://www.slippery-hill.com/recording/five-miles-town',NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Sally Anne','D','ADAE',NULL,NULL,27,NULL,'Tommy Jarrell','The Mt Airy national anthem',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Wolf Creek','G','Standard','https://res.cloudinary.com/banjo/video/upload/v1604080026/tunelist/ypesp3elwwphunmsmtiz.mp4',NULL,29,1,NULL,'Learned from the Rafe Stefanini record',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'I''m Gonna Go A-Hunting For The Buffalo','Em','BEGB','https://res.cloudinary.com/banjo/video/upload/v1604022115/tunelist/bvmmdjdxv8h7rjkmriww.mp3',NULL,30,1,'Jimmy Driftwood','What?! so cool...',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Pickin'' the Devils Eye','A','AEAC#',NULL,NULL,31,NULL,NULL,'I learned this from Mike Bryant',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'Sally Anne','D','ADAE',NULL,NULL,32,1,'Tommy Jarrell',NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (4,'Polecat Blues','D','ADAE',NULL,NULL,34,0,'Greg Hooven',NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (4,'Cindy Gal','D','ADAE',NULL,NULL,36,0,'Joe Thompson',NULL,'https://www.youtube.com/watch?v=GMGZuxUs1e4',NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'Wolf Creek','G','Standard',NULL,NULL,38,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'Rattletrap','G','GDGD',NULL,NULL,39,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'Hy Patillion','C','Standard',NULL,NULL,40,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'Billy in the Lowground','C','Standard',NULL,NULL,41,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'Possum up a Gum Stump','A','Cross',NULL,'https://res.cloudinary.com/banjo/image/upload/v1604000169/tunelist/n1feqvi9mimdsagldy0g.jpg',42,NULL,'Allen Alsop',NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'I''m Gonna Go A-Hunting For The Buffalo','Em','BEGB','https://res.cloudinary.com/banjo/video/upload/v1604022115/tunelist/bvmmdjdxv8h7rjkmriww.mp3',NULL,43,0,'Jimmy Driftwood',NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'The Old Yellow Dog Come A Trotting Through the Meeting House','G','Standard',NULL,NULL,44,0,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'Give the Fiddler a Dram','A','Cross',NULL,NULL,45,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (2,'Liberty off of a Corn Liquor Still in Georgia','G','Standard','https://res.cloudinary.com/banjo/video/upload/v1604004016/tunelist/jpwkj6mjv2r86apftcqt.mp3',NULL,46,1,'Clayton McMichen',NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (5,'Icy Mountain','A','Cross',NULL,NULL,47,1,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (5,'Head of the Creek','A','Cross',NULL,NULL,48,1,'Ward Jarvis',NULL,NULL,'true');
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (5,'Farwell to Trion','C','Standard','https://res.cloudinary.com/banjo/video/upload/v1604974771/tunelist/q5kasw3ws2kwhkym8lxm.m4a',NULL,49,NULL,NULL,'AL tune learned from James Bryan, this is a recording of Aaron Olwell playing it.',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (5,'Squirrel Heads and Gravy','A','Cross',NULL,NULL,50,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Horseshoe Bend','C','Standard','https://res.cloudinary.com/banjo/video/upload/v1604975343/tunelist/zrozh1f60gnyentaml94.mp4',NULL,51,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Walk Along John to Kansas','A','Cross','https://res.cloudinary.com/banjo/video/upload/v1604979136/tunelist/hx4xi24wpqykc6xkc5fk.m4a',NULL,52,NULL,NULL,'I learned this from Rick Martin',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (3,'June Apple','A','Cross',NULL,NULL,54,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (3,'Stay All Night/Waterbound','A','Cross',NULL,NULL,55,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (3,'Acorn Stomp','F','Standard',NULL,NULL,56,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (3,'The Old Yellow Dog Come A Trotting Through the Meeting House','G','Standard',NULL,NULL,57,1,NULL,NULL,NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Waco','A','Cross','https://res.cloudinary.com/banjo/video/upload/v1605024282/tunelist/v7vawlipwwz2ubq8xk90.m4a',NULL,58,NULL,'Cecil Plum','I''ve been playing this one with George',NULL,NULL);
INSERT INTO mytable(userId,name,key,tuning,audioUpload,imageUpload,id,starred,source,notes,link,learning) VALUES (1,'Rattletrap','G','GDGD',NULL,NULL,59,NULL,NULL,NULL,NULL,NULL);


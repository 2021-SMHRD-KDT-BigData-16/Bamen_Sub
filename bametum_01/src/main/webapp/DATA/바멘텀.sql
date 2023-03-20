drop table Bmt_Friend;
drop table Bmt_Reply;
drop table Bmt_CycleID;
drop table Bmt_Post;
drop table Bmt_Board;
drop table Bmt_User;


CREATE TABLE Bmt_User (
	Email	VarChar2(50)		PRIMARY KEY,
	Password	VarChar2(20)		NOT NULL,
	Name	VarChar2(20)		NULL,
	ProfileImg	VARCHAR2(256)		NULL,
	ProfileText	VARCHAR2(2000)		NULL
);

CREATE TABLE Bmt_Board (
	BoardId	NUMBER(10)		PRIMARY KEY,
	BoardName	VARCHAR2(20)		NULL
);

CREATE TABLE Bmt_Post (
	PostId	NUMBER(20)		PRIMARY KEY,
	BoardId	NUMBER(10)		NOT NULL,
	Email	VarChar2(50)		NOT NULL,
	Title	VarChar2(100)		NULL,
	Content	VARCHAR2(2000)		NULL,
	ImgPath	VarChar2(500)		NULL,
	FileName	VarChar2(256)		NULL
	
   ,foreign key (Email) references Bmt_User(Email)
   ,foreign key (BoardId) references Bmt_Board(BoardId)
	
);

CREATE TABLE Bmt_CycleID (
	CIdNum	VarChar2(20)		PRIMARY KEY,
	IdNumPath	VarChar2(500)		NOT NULL,
	Email	VarChar2(50)		NOT NULL
	
   ,foreign key (Email) references Bmt_User(Email)
	
);

CREATE TABLE Bmt_Reply (
	ReplyId	Number(10)		PRIMARY KEY,
	ParentId	Number(10)		NOT NULL,
	R_Depth	Number(5)		NULL,
	PostId	NUMBER(10)		NOT NULL,
	Reply	VarChar2(500)		NULL,
	Email	VarChar2(50)		NOT NULL
	
   ,foreign key (Email) references Bmt_User(Email)
   ,foreign key (PostId) references Bmt_Post(PostId)
	
);

CREATE TABLE Bmt_Friend (
	FriendId	Number(20)		PRIMARY KEY,
	FriendEmail	VarChar2(50)		NOT NULL,
	UserEmail	VarChar2(50)		NOT NULL,
	RelAgree	Number(1)		NULL

   ,foreign key (FriendEmail) references Bmt_User(Email)
   ,foreign key (UserEmail) references Bmt_User(Email)
	
);


insert into Bmt_User 
        values ('aaa@aaa.aaa', 'aaa', 'aaa', './DATA/PostImage/img001.jpg', 'CG에 돈 많이 썼다는건 개구라임. 다만 직접 판도라가서 수중촬영하긴 빡쎘을거 같음. 나비족 섭외에도 돈 많이 썼겠드만... ');

insert into Bmt_User 
        values ('bbb@bbb.bbb', 'bbb', 'bbb', './DATA/PostImage/img002.jpg', '말이안되네 ㅋㅋㅋ 어케만든겨 ');

insert into Bmt_User 
        values ('ccc@ccc.ccc', 'ccc', 'ccc', './DATA/PostImage/img003.jpg', '미래에도 영화관이 있어야 되는 이유를 보여준 영화. ');

insert into Bmt_User 
        values ('ddd@ddd.ddd', 'ddd', 'ddd', './DATA/PostImage/img004.jpg', '제일궁금했던건 2009년도에도 대단했던 CG기술이 2022년도에 얼마나 대단해졌을까..?13년의 기다림이 아깝지 않았습니다. ');

insert into Bmt_User 
        values ('eee@eee.eee', 'eee', 'eee', './DATA/PostImage/img005.jpg', '믿고보는 아바타 아쿠아리움에 있는줄..3시간이 어떻게 간건지 모르겠어요 ');


CREATE TABLE Bmt_User (
	Email	VarChar2(50)		PRIMARY KEY,
	Password	VarChar2(20)		NOT NULL,
	Name	VarChar2(20)		NULL,
	ProfileImg	VARCHAR2(256)		NULL,
	ProfileText	VARCHAR2(2000)		NULL
);


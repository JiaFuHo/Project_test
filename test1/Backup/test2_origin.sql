CREATE TABLE test2.dbo.Room
(
    rid INT IDENTITY(1,1) NOT NULL,
    tid INT NULL,
    rprice INT NOT NULL,
    rlimit INT NOT NULL,
    rdesc NVARCHAR(200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
    [status] NVARCHAR(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
);

CREATE TABLE test2.dbo.[Type]
(
    tid INT IDENTITY(1,1) NOT NULL,
    tdesc NVARCHAR(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
);

CREATE TABLE test2.dbo.Reserve
(
    reid INT IDENTITY(1,1) NOT NULL,
    citime DATETIME2 NOT NULL,
    [day] INT NULL,
    rid INT NULL,
    caccount NVARCHAR(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
);

CREATE TABLE test2.dbo.Client
(
    cid INT NULL,
    caccount NVARCHAR(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
    cpassword NVARCHAR(64) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
    permission INT NOT NULL,
);

CREATE TABLE test2.dbo.ClientInfo
(
    cid INT IDENTITY(1,1) NOT NULL,
    cname NVARCHAR(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
    cbirthday DATETIME NOT NULL,
    cgender NVARCHAR(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
    id CHAR(20) NOT NULL,
    cphone NVARCHAR(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
    [emergency] NVARCHAR(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
    emergencyphone NVARCHAR(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
);

CREATE TABLE test2.dbo.History
(
    hid INT IDENTITY(1,1) NOT NULL,
    reid INT NULL,
    caccount NVARCHAR(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
    fee INT NULL,
);

-- PK
ALTER TABLE test2.dbo.Client ADD CONSTRAINT PK_Client PRIMARY KEY(caccount);
ALTER TABLE test2.dbo.ClientInfo ADD CONSTRAINT PK_ClientInfo PRIMARY KEY(cid);
ALTER TABLE test2.dbo.History ADD CONSTRAINT PK_History PRIMARY KEY(hid);
ALTER TABLE test2.dbo.Reserve ADD CONSTRAINT PK_Reserve PRIMARY KEY(reid);
ALTER TABLE test2.dbo.Room ADD CONSTRAINT PK_Room PRIMARY KEY(rid);
ALTER TABLE test2.dbo.[Type] ADD CONSTRAINT PK_Type PRIMARY KEY(tid);

-- FK
ALTER TABLE test2.dbo.Client ADD CONSTRAINT FK_ClientInfo FOREIGN KEY(cid) REFERENCES test2.dbo.ClientInfo(cid);
ALTER TABLE test2.dbo.History ADD CONSTRAINT FK_ClientH FOREIGN KEY(caccount) REFERENCES test2.dbo.Client(caccount);
ALTER TABLE test2.dbo.History ADD CONSTRAINT FK_Reserve FOREIGN KEY(reid) REFERENCES test2.dbo.Reserve(reid);
ALTER TABLE test2.dbo.Reserve ADD CONSTRAINT FK_ClientR FOREIGN KEY(caccount) REFERENCES test2.dbo.Client(caccount);
ALTER TABLE test2.dbo.Reserve ADD CONSTRAINT FK_Room FOREIGN KEY(rid) REFERENCES test2.dbo.Room(rid);
ALTER TABLE test2.dbo.Room ADD CONSTRAINT FK_Type FOREIGN KEY(tid) REFERENCES test2.dbo.[Type](tid);
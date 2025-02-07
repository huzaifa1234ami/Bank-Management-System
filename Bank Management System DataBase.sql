-- Creating the database
CREATE DATABASE BankManagementSystem;

-- Creating the BankTeam table
CREATE TABLE BankTeam (
    memberId INT IDENTITY (1, 1) NOT NULL,
    CONSTRAINT pk_BankTeam PRIMARY KEY (memberId),
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Age INT CHECK (Age >= 18) NOT NULL,
    gender CHAR(1) CHECK (gender ='M' OR gender ='F') NOT NULL,
    Email VARCHAR(40) UNIQUE,
    PhoneNumber INT UNIQUE,
    UserName VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(25) NOT NULL,
    Designation VARCHAR(30) NOT NULL CHECK(Designation IN ('Admin', 'Account Manager', 'Transaction Manager', 'Financial Products Coordinator'))
);

-- Creating the Client table
CREATE TABLE Client (
    ClientId INT IDENTITY (1, 1) NOT NULL,
    CONSTRAINT pk_Client PRIMARY KEY (ClientId),
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    UserName VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(25) NOT NULL,
    ClientPhoto IMAGE NOT NULL,
    DOB DATE NOT NULL,
    Gender CHAR(1) NOT NULL CHECK(Gender IN ('M', 'F')),
    Age INT CHECK (Age >= 18) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Email VARCHAR(40) UNIQUE,
    Phone INT UNIQUE,
    CNIC VARCHAR(20) UNIQUE NOT NULL
);

-- Creating the Account table
CREATE TABLE Account (
    AccId INT IDENTITY (1, 1) NOT NULL,
    CONSTRAINT pk_Acc PRIMARY KEY (AccId),
    ClientId INT NOT NULL,
    CONSTRAINT fk_Acc FOREIGN KEY (ClientId) REFERENCES Client(ClientId) ON DELETE CASCADE,
    AccType VARCHAR(20) NOT NULL CHECK(AccType IN ('Saving', 'Current')),
    Balance INT DEFAULT 0 NOT NULL,
    Status VARCHAR(15) NOT NULL DEFAULT 'Active'
);

-- Creating the DebitCard table
CREATE TABLE DebitCard (
    CardId INT IDENTITY (1, 1) NOT NULL,
    CONSTRAINT pk_DebitCard PRIMARY KEY (CardId),
    AccountID INT NOT NULL,
    CONSTRAINT fk_DebitCard FOREIGN KEY (AccountID) REFERENCES Account(AccId) ON DELETE CASCADE,
    CardType VARCHAR(15) NOT NULL CHECK (CardType IN ('Silver', 'Gold', 'Platinum')),
    Pin CHAR(4) NOT NULL,
    Status VARCHAR(15) NOT NULL DEFAULT 'Active'
);

-- Adding a computed column for the DebitCard table
ALTER TABLE DebitCard
ADD CardNumber AS 
    (CONCAT(
        RIGHT(YEAR(GETDATE()), 2), 
        '-', 
        RIGHT(REPLICATE('0', 14) + CAST(CardID AS VARCHAR(14)), 14)
    ));

-- Creating the Transactions table
CREATE TABLE Transactions (
    TransId INT IDENTITY (1, 1) NOT NULL,
    CONSTRAINT pk_Trans PRIMARY KEY (TransId),
    AccId INT NOT NULL,
    CONSTRAINT fk_Trans FOREIGN KEY (AccId) REFERENCES Account(AccId) ON DELETE CASCADE,
    TransType VARCHAR(20) NOT NULL CHECK(TransType IN ('Deposit', 'Withdraw')),
    Amount INT NOT NULL,
    TransDate DATETIME NOT NULL DEFAULT GETDATE()
);

-- Creating the MoneyTransfer table
CREATE TABLE MoneyTransfer (
    TransferID INT IDENTITY(1,1) NOT NULL,
    CONSTRAINT pk_MoneyTransfer PRIMARY KEY (TransferID),
    FromAccID INT NOT NULL,
    CONSTRAINT fk_FromAccount FOREIGN KEY (FromAccID) REFERENCES Account(AccID) ON DELETE CASCADE,
    ToAccID INT NOT NULL,
    CONSTRAINT fk_ToAccount FOREIGN KEY (ToAccID) REFERENCES Account(AccID),
    TransferAmount INT NOT NULL,
    TransferDate DATETIME NOT NULL DEFAULT GETDATE()
);

-- Creating the Loans table
CREATE TABLE Loans (
    LoansId INT IDENTITY (1, 1) NOT NULL,
    CONSTRAINT pk_Loans PRIMARY KEY (LoansId),
    ClientId INT NOT NULL,
    CONSTRAINT fk_Loans FOREIGN KEY (ClientId) REFERENCES Client(ClientId) ON DELETE CASCADE,
    LoanType VARCHAR(20) NOT NULL,
    Amount INT NOT NULL,
    Status VARCHAR(15) NOT NULL CHECK (Status IN ('Pending', 'Approved', 'Not Approved')) DEFAULT 'Pending',
    ApprovalDate DATETIME DEFAULT NULL
);

-- Creating the MessageBox table
CREATE TABLE MessageBox (
    MessageID INT IDENTITY(1,1) NOT NULL,
    CONSTRAINT pk_MessageBox PRIMARY KEY (MessageID),
    ClientID INT NOT NULL,
    CONSTRAINT fk_MessageBox FOREIGN KEY (ClientID) REFERENCES Client(ClientId) ON DELETE CASCADE,
    Message VARCHAR(255) NOT NULL,
    RequestDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status VARCHAR(50) NOT NULL DEFAULT 'In Progress' CHECK (Status IN ('In Progress', 'Resolved')),
    Reply VARCHAR(255) DEFAULT 'Waiting for Reply',
    ReplyDate DATETIME DEFAULT NULL
);

-- Admin--
INSERT INTO BankTeam (FirstName, LastName, Age, Gender, Email, PhoneNumber, UserName, Password, Designation) 
VALUES ('Mannan', 'Ul Haq', 20, 'M', 'l227556@lhr.nu.edu.pk', 123456789, 'Mannan Ul Haq', 'Mannan2004', 'Admin');

-- Selecting all data from each table
SELECT * FROM BankTeam;
SELECT * FROM Client;
SELECT * FROM Account;
SELECT * FROM DebitCard;
SELECT * FROM Transactions;
SELECT * FROM MoneyTransfer;
SELECT * FROM Loans;
SELECT * FROM MessageBox;
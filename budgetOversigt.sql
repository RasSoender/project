CREATE DATABASE budgetOversigtData;
use budgetOversigtData; 

DROP TABLE Income;
DROP TABLE Investments; 
DROP TABLE Stock;
DROP TABLE Expense;
DROP TABLE Date;
DROP TABLE Category;
DROP TABLE User;

create table User (
	userId varchar(100) PRIMARY KEY,
	username varchar(100),
    password varchar(100),
    balance varchar(100)
);

create table Income (
	incomeId varchar(100) PRIMARY KEY,
    userId varchar(100),
    amount int,
    valuta varchar(100),
    name varchar(100),
    periodic varchar(100),
    FOREIGN KEY (userId) REFERENCES USER(userId)
);

create table Stock(
	AS_Ident varchar(5) PRIMARY KEY,
    name varchar(100),
    kurs int, 
    type varchar(100)
);

create table Investments(
	investmentsId varchar(100) PRIMARY KEY,
    userId varchar(100),
    AS_Ident varchar(5),
    numbShares int,
    value int,
    valuta varchar(100),
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (AS_Ident) REFERENCES Stock(AS_Ident)
);

create table Date (
	dateId varchar(100) PRIMARY KEY,
    year varchar(4),
    month varchar(2),
    day varchar(2)
);

create table Category (
	categoryId varchar(100) PRIMARY KEY,
    topic varchar(100),
    subscription varchar(100)
);

create table Expense (
	expenseId varchar(100) PRIMARY KEY,
    userId varchar(100),
    categoryId varchar(100),
    dateId varchar(100),
    name varchar(100),
    cost int, 
    valuta varchar(100),
    description varchar(100),
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (categoryId) REFERENCES Category(categoryId),
    FOREIGN KEY (dateId) REFERENCES Date(dateId)
);


create database FaridStore
go

use FaridStore
go

create table Users (
    ID int primary key,
    FirstName nvarchar(50),
    LastName nvarchar(50),
    Email nvarchar(100),
    Password nvarchar(100),
    IsActive bit
);

create table UserDetails (
    ID int primary key,
    UserID int unique,
    PhoneNumber nvarchar(20),
    Address nvarchar(255),
    foreign key (UserID) references Users(ID)
);

create table Products (
    ID int primary key,
    Name nvarchar(100),
    Price decimal(10, 2)
);
go

create table Orders (
    ID int primary key,
    UserID int foreign key references Users(ID),
    ExecutedDate date
);

create table OrderProducts (
    OrderID int foreign key references Orders(ID),
    ProductID int foreign key references Products(ID),
    primary key (OrderID, ProductID)
);
go

insert into Users (ID, FirstName, LastName, Email, Password, IsActive)
values
    (1, 'Kamran', 'Zeynalov', 'kamran@gmail.com', 'salam123', 1),
    (2, 'Tahir', 'P324', 'kamran@gmail.com', 'salam123', 1),
    (3, 'Farid', 'Faridov', 'kamran@gmail.com', 'salam123', 1),
    (4, 'Fadil', 'Ehmedov', 'kamran@gmail.com', 'salam123', 1),
    (5, 'Rashid', 'Baghirov', 'kamran@gmail.com', 'salam123', 1),
    (6, 'Mehrac', 'Afaqov', 'kamran@gmail.com', 'salam123', 1);

	
insert into UserDetails (ID, UserID, PhoneNumber, Address)
values
    (1, 1, '+9999999', 'Razin'),
    (2, 2, '+9999999', 'Razin 123'),
    (3, 3, '+9999999', 'Razin 7565'),
    (4, 4, '+9999999', 'Razin 543'),
    (5, 5, '+9999999', 'Razin KFC');
	
insert into Products (ID, Name, Price)
values
    (1, 'Phone', 30),
    (2, 'Notebook', 100),
    (3, 'Chips', 10),
    (4, 'Suxarik', 20),
    (5, 'Kurtka', 80);
	
insert into Orders (ID, UserID, ExecutedDate)
values
    (1, 1, '2023-11-25'),
    (2, 2, '2023-11-11'),
    (3, 3, '2023-11-01'),
    (4, 4, '2023-10-05'),
    (5, 5, '2023-12-01');
	
insert into OrderProducts (OrderID, ProductID)
values
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 3),
    (4, 2),
    (4, 5),
    (5, 2),
    (5, 3);
	go

	select * from Users where FirstName like 'T%';
	select * from Products where Price > 30;
	select * from Orders where month(ExecutedDate) = 11 and year(ExecutedDate) = 2023;
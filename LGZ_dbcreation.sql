/*
Team Name: LGZ
Members:Bahar Golmohammadi
		Li Liang
		Julie Zhou
*/

CREATE DATABASE MUJIDB;
GO

USE MUJIDB;
GO

-- Create the customer and order tables
CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  AddressLine1 varchar(50) NOT NULL,
  City varchar(50) NOT NULL,
  StateName varchar(50) NOT NULL,
  ZipCode varchar(50) NOT NULL,
  Phone# varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  BirthDate varchar(50) NOT NULL,
  CountryRegionID bigint NOT NULL);

  CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  ProductCategory varchar(50) NOT NULL,
  ProductSubcategory varchar(50) NOT NULL,
  Price decimal(6,2) NOT NULL,
  Cost decimal(6,2) NOT NULL,
  SupplierID bigint NOT NULL);

  CREATE TABLE Employee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  JobTitle varchar(50) NOT NULL,
  BirthDate varchar(50) NOT NULL,
  Gender varchar(50) NOT NULL,
  HireDate varchar(50) NOT NULL,
  CountryRegionID bigint NOT NULL);

  CREATE TABLE Purchase(
  PurchaseID bigint NOT NULL PRIMARY KEY,
  Quantity int NOT NULL,
  ProductID bigint NOT NULL,
  OrderID bigint NOT NULL,
  EmployeeID bigint NOT NULL);

  CREATE TABLE CountryRegion(
  CountryRegionID bigint NOT NULL PRIMARY KEY,
  CountryName varchar(50) NOT NULL);

  CREATE TABLE Orders(
  OrderID bigint NOT NULL PRIMARY KEY,
  SalesType varchar(50) NOT NULL, 
  OrderDate varchar(50) NOT NULL,
  OrderTime varchar(50) NOT NULL,
  OrderTotal decimal(6,2) NOT NULL,
  CustomerID bigint NOT NULL);

  CREATE TABLE Supplier(
  SupplierID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  AddressLine1 varchar (50) NOT NULL,
  City varchar(50) NOT NULL,
  StateName varchar(50) NOT NULL,
  ZipCode varchar(50) NOT NULL,
  Phone# varchar(50) NOT NULL,
  CountryRegionID bigint NOT NULL);
  GO

ALTER TABLE Customer ADD CONSTRAINT FK_Customer_CountryRegion 
FOREIGN KEY (CountryRegionID) REFERENCES CountryRegion(CountryRegionID);

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

ALTER TABLE Purchase ADD CONSTRAINT FK_Purchase_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

ALTER TABLE Purchase ADD CONSTRAINT FK_Purchase_Orders
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE Purchase ADD CONSTRAINT FK_Purchase_Employee
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_CountryRegion
FOREIGN KEY (CountryRegionID) REFERENCES CountryRegion(CountryRegionID);

ALTER TABLE Product ADD CONSTRAINT FK_Product_Supplier
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);

ALTER TABLE Supplier ADD CONSTRAINT FK_Supplier_CountryRegion
FOREIGN KEY (CountryRegionID) REFERENCES CountryRegion(CountryRegionID);
GO

INSERT INTO CountryRegion(CountryRegionID, CountryName) VALUES 
(1, 'Japan'),
(2, 'South Korea'),
(3, 'USA'),
(4, 'Italy'),
(5, 'Sweden'),
(6, 'India'),
(7, 'Turkey'),
(8, 'Kuwait'),
(9, 'Australia'),
(10, 'China');

INSERT INTO Customer(CustomerID, FirstName, LastName, AddressLine1, City, StateName, ZipCode, Phone#, Email, BirthDate, CountryRegionID) VALUES 
(1, 'Rachel', 'Burstiner', '11 Pulaski Street', 'Hesperia', 'CA', 92345, 2025550156, 'inhat1962@yahoo.com', '2002-06-01', 3),
(2, 'Ryan', 'Colaco', '74 East Armstrong Drive', 'Alhambra', 'CA', 91801, 2225550179, 'hinisal57@yahoo.com', '1995-07-22', 3),
(3, 'Julia', 'Harrigan', '8543 Pacific Drive', 'Costa Mesa', 'CA', 92627, 2225550154, 'specult49@gmail.com', '1994-10-14', 3),
(4, 'Jillian', 'Klinvex', '984 Rockville Street', 'San Pablo', 'CA', 94806, 2225550197, 'ovion1940@gmail.com', '1993-01-03', 3),
(5, 'Mark', 'Koerner', '560 Lantern Drive', 'Hanford', 'CA', 93230, 2225556647, 'criver1958@hotmail.com', '1986-04-01', 3),
(6, 'Anne', 'McCormack', '563 Pacific Street', 'San Pablo', 'CA', 94806, 2225559932, 'thron1986@hotmail.com', '1944-11-11', 3),
(7, 'Julie', 'Zhou', '331 Manor Lane', 'San Diego', 'CA', 92117, 2225559011, 'maran1989@aol.com', '1995-07-31', 3),
(8, 'Li', 'Liang', '7 Military Drive', 'Union City', 'CA', 94587, 2225552385, 'whisfat71@aol.com', '1996-01-13', 3),
(9, 'Bahar', 'Golmohammadi', '130 Cypress Road', 'Azusa', 'CA', 91702, 2225550113, 'healf1943@yahoo.com', '1995-02-26', 3),
(10, 'Theresia', 'Susanto', '501 North Creekside Lane', 'Los Angeles', 'CA', 90001, 2225553346, 'tivis1991@gmail.com', '1972-04-30', 3);

INSERT INTO Employee(EmployeeID, FirstName, LastName, JobTitle, BirthDate, Gender, HireDate, CountryRegionID) VALUES
(1, 'Olivia', 'Logan', 'Cashier', '1988-04-02', 'Female', '2008-08-27', 3),
(2, 'Veronica', 'Jordan', 'Store Manager', '1980-12-31', 'Female', '2002-03-30', 3),
(3, 'Samantha', 'McKinsey', 'Cashier', '1995-06-12', 'Female', '2012-01-01', 3),
(4, 'Lillian', 'Flemming', 'Cashier', '1994-03-14', 'Female', '2010-02-13', 3),
(5, 'Ray', 'Kim', 'Cashier', '1997-09-25', 'Male', '2009-01-31', 3),
(6, 'Marjorie', 'Addams', 'Cashier', '1992-07-22', 'Female', '2004-11-20', 3),
(7, 'Neil', 'Vargas', 'Cashier', '1997-10-10', 'Male', '2006-06-28', 3),
(8, 'Maurice', 'Paige', 'Cashier', '1998-06-13', 'Male', '2007-02-11', 3),
(9, 'Darrell', 'Hudson', 'Cashier', '2000-05-24', 'Male', '2015-02-30', 3),
(10, 'Hugh', 'Hanson', 'Cashier', '1999-02-05', 'Male', '2014-08-29', 3);

INSERT INTO Supplier(SupplierID, Name, AddressLine1, City, StateName, ZipCode, Phone#, CountryRegionID) VALUES 
(1, 'Yodoya Hosou Inc', '186 Birch Hill Street', 'Ottumwa', 'IA', 52501, 5944465549, 1),
(2, 'Ikeda Mengyo Co', '1 Rockcrest Street', 'Fairmont', 'WV', 26554, 1117357514, 1),
(3, 'Daika Co Ltd', '617 Airport Avenue', 'Marlton', 'NJ', 08053, 2321693848, 1),
(4, 'Yusen Air Sea Services USA Inc', '7650 Cypress Street', 'Greenville', 'NC', 27834, 5391025905, 3),
(5, 'Itochu Logistics Corp', '620 Myrtle Court', 'Mount Airy', 'MD', 21771, 1108144661, 1),
(6, 'H C Shipping Co Ltd Suzuka Building', '579 North Military Drive', 'Wesport', 'CT', 06880, 3487304993, 1),
(7, 'CEI Roanoke', '5 Shub Farm Drive', 'Rockford', 'MI', 49341, 1957595122, 2),
(8, 'Cosmetic Essence, LLC', '320 Talbot Avenue', 'Palm Beach Gardens', 'FL', 33410, 7925990040, 5),
(9, 'L&H Co Ltd', '9910 Spruce Street', 'Appleton', 'WI', 54911, 3135328119, 9),
(10, 'Juno Craft Co Ltd', '75 North Glendale Street', 'Stamford', 'CT', 06902, 2716019860, 1);

INSERT INTO Product(ProductID, Name, ProductCategory, ProductSubcategory, Price, Cost, SupplierID) VALUES 
(1, '36 Colored Pencils in Tube Mini', 'Stationary', 'Pen.Pencils', $11.00, $1.50, 5),
(2, '12 Colored Pencils', 'Stationary', 'Pen.Pencils', $5.00, $0.40, 9),
(3, 'Gel-Ink Ballpoint Pen 0.38 mm Blue', 'Stationary', 'Pen.Pencils', $1.50, $0.10, 2),
(4, 'Recycled Paper Note Double Ring', 'Stationary', 'Note Books', $3.50, $1.00, 4),
(5, 'Recycled Paper Note Beige B5 Plain', 'Stationary', 'Note Books', $1.50, $0.10, 10),
(6, 'Women Merino Wool Long Cardigan', 'Womens Wear', 'Cardigans.Vests.Sweaters', $79.00, $10.00, 7),
(7, 'Women Organic Cotton Skinny Jeans', 'Womens Wear', 'Skirts.Pants', $46.00, $8.00, 5),
(8, 'Men Organic Cotton Slip-on Shoes White', 'Shoes', 'Mens Shoes', $24.00, $5.00, 6),
(9, 'Aluminum Glasses Case', 'Stationary', 'Desk Accessories', $9.00, $1.00, 8),
(10, 'Cork Board M', 'Stationary', 'Desk Accessories', $10.00, $1.50, 3);

INSERT INTO Orders(OrderID, SalesType, OrderDate, OrderTime, OrderTotal, CustomerID) VALUES 
(1, 'Online', '2016-10-23', '11:10', $17.78, 6),
(2, 'In-Store', '2011-05-22', '12:22', $3.67, 5),
(3, 'In-Store', '2016-05-28', '15:29', $12.14, 6),
(4, 'Online', '2012-05-01', '15:30', $144.26, 10),
(5, 'Online', '2012-07-03', '18:35', $337.12, 5),
(6, 'In-Store', '2016-03-24', '18:58', $13.13, 10),
(7, 'In-Store', '2015-11-07', '12:35', $27.99, 3),
(8, 'In-Store', '2011-11-08', '14:40', $35.56, 9),
(9, 'Online', '2013-12-22', '14:31', $78.90, 4),
(10, 'In-Store', '2005-06-01', '13:31', $66.02, 7);

INSERT INTO Purchase(PurchaseID, Quantity, ProductID, OrderID, EmployeeID) VALUES 
(1, 4, 10, 8, 7),
(2, 7, 9, 7, 9),
(3, 2, 2, 4, 5),
(4, 2, 2, 7, 2),
(5, 11, 4, 5, 5),
(6, 6, 6, 3, 3),
(7, 1, 8, 6, 4),
(8, 13, 5, 5, 7),
(9, 1, 1, 10, 4),
(10, 5, 10, 7, 2);


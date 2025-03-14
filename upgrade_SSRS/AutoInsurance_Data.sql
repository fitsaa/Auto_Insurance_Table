
---new change
create database Auto_Insurance

Create table Policy (
ID int PRIMARY KEY,
PolicyNumber nVarchar(20) NOT NULL ,
PolicyEffectiveDate DateTime ,
PolicyExpireDate DateTime NOT NULL ,
PaymentOption varchar(100) NOT NULL ,
TotalAmount FLOAT NOT NULL ,
Active BIT NOT NULL ,
AdditionalInfo Text ,
CreatedDate DateTime NOT NULL
)
CREATE TABLE PolicyEditLog
(
ID INT PRIMARY KEY,
Policy_ID INT NOT NULL,
EditedTableName Varchar(50) NOT NULL,
EditedDate DateTime NOT NULL,
EditedBy Varchar(50) NOT NULL,
AdditionalInfo Text,
FOREIGN KEY (Policy_ID) REFERENCES Policy(ID)
)

CREATE TABLE Bill
(
ID INT PRIMARY KEY,
Policy_ID INT NOT NULL,
Bill_ID INT NOT NULL UNIQUE,
DueDate DateTime NOT NULL,
MinimumPayment FLOAT NOT NULL,
CreatedDate DateTime NOT NULL,
Balance FLOAT NOT NULL,
Statuss nVarchar(50) NOT NULL,
FOREIGN KEY (Policy_ID) REFERENCES Policy(ID)
)

CREATE TABLE Payment
(
ID INT PRIMARY KEY,
Bill_ID INT NOT NULL,
PaidDate DateTime NOT NULL,
Amount FLOAT NOT NULL,
PaymentMethod Varchar(100) NOT NULL,
PayerFirstName Varchar(50),
PayerLastName Varchar(50),
CardNumber Varchar(50),
ZipCode Varchar(10),
CardExpireDate Varchar(10),
CardType Varchar(20),
DebitOrCredit Varchar(50),
BankName Varchar(100),
AccountNumber Varchar(20),
RoutingNumber Varchar(20),
CheckNumber Varchar(20),
CheckImage Text,
AdditionalInfo Text,
CreatedDate DATETIME NOT NULL,
FOREIGN KEY (Bill_ID ) REFERENCES Bill(ID)
)

CREATE TABLE Driver
(
ID INT PRIMARY KEY,
Policy_ID INT NOT NULL,
Title Varchar(50),
FirstName Varchar(50) NOT NULL,
LastName Varchar(50) NOT NULL,
MiddleInitial char(1),
DoB  Varchar(1) NOT NULL,
EmailAddress Varchar(100),
PhoneNumber Varchar(20) NOT NULL,
CellNumber Varchar(20),
SSN Varchar(12) NOT NULL,
LicenseIssuedDate Date NOT NULL,
LicenseIssuedState Varchar(50) NOT NULL,
LicenceNumber Varchar(20) NOT NULL,
IsPrimaryPolicyHolder Bit NOT NULL,
RelationWithPrimaryPo Varchar(50) NOT NULL,
Gender Varchar(10),
MaritalStatus Varchar(20),
CreatedDate DateTime NOT NULL,
Active Bit NOT NULL,
FOREIGN KEY (Policy_ID ) REFERENCES Policy(ID)
)

CREATE TABLE DriverAddress(
ID INT PRIMARY KEY,
Driver_ID INT NOT NULL,
AddressOne Varchar(100) NOT NULL,
AddressTwo Varchar(100),
City Varchar(100) NOT NULL,
State Varchar(50) NOT NULL,
ZipCode Varchar(20) NOT NULL,
Country Varchar(100) NOT NULL,
IsItGarageAddress Bit NOT NULL,
FOREIGN KEY (Driver_ID ) REFERENCES Driver(ID)
)

CREATE TABLE TrafficViolationCode(
ID INT PRIMARY KEY,
TrafficViolationQuestion Varchar(Max) NOT NULL,
TrafficViolationCode_ID int UNIQUE NOT NULL,
TrafficViolationPoint FLOAT NOT NULL,
CodeDescription Varchar(Max)
)

CREATE TABLE Driver_TrafficViolation_Record(
ID INT PRIMARY KEY,
Driver_ID INT ,
TrafficViolationCode_ID  INT,
Active Bit NOT NULL,
FOREIGN KEY (Driver_ID ) REFERENCES Driver(ID),
FOREIGN KEY (TrafficViolationCode_ID  ) REFERENCES TrafficViolationCode(ID )
)

CREATE TABLE Vehicle(
ID INT PRIMARY KEY,
Policy_ID INT NOT NULL,
Year Char(4) NOT NULL,
Make Varchar(50) NOT NULL,
Model Varchar(50) NOT NULL,
Color Varchar(50),
Trim Varchar(50),
Mileage INT NOT NULL,
VINNumber Varchar(20) NOT NULL,
VehicleNumberPlate Varchar(20) NOT NULL,
VehicleRegisteredState Varchar(50) NOT NULL,
CreatedDate DateTime NOT NULL,
Active Bit NOT NULL,
FOREIGN KEY (Policy_ID ) REFERENCES Policy(ID)
)

CREATE TABLE Vehicle_Driver(
ID INT PRIMARY KEY,
Vehicle_ID INT,
Driver_ID INT,
DriverForBusinessPurpose BIT NOT NULL,
IsPrimaryDriver BIT NOT NULL,
EveryDayMileage INT NOT NULL,
CreatedDate DateTime NOT NULL,
Active Bit NOT NULL,
FOREIGN KEY (Vehicle_ID ) REFERENCES Vehicle(ID),
FOREIGN KEY (Driver_ID ) REFERENCES Driver(ID)
)

CREATE TABLE Coverage(
ID INT PRIMARY KEY,
CoverageName Varchar(Max) NOT NULL,
CoverageGroup Varchar(50) NOT NULL,
Code Varchar(20) NOT NULL,
IsPolicyCoverage BIT NOT NULL,
IsVehicleCoverage BIT NOT NULL,
Description Varchar(Max)
)


CREATE TABLE Policy_Coverage(
ID int PRIMARY KEY,
Policy_ID int,
Coverage_ID int,
Active Bit,
CreatedDate Datetime,
FOREIGN KEY (Policy_ID) REFERENCES Policy(ID),
FOREIGN KEY (Coverage_ID) REFERENCES Coverage(ID)
)

CREATE TABLE Vehicle_Coverage(
ID int PRIMARY KEY,
Vehicle_ID int,
Coverage_ID int,
Active Bit,
CreatedDate Datetime,
FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(ID),
FOREIGN KEY (Coverage_ID) REFERENCES Coverage(ID)
)

select * from Vehicle_Coverage
go


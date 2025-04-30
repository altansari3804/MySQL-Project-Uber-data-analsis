CREATE DATABASE UBER;

USE UBER;

CREATE TABLE Drivers (
    Driver_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone_Number INT,
    Car_Model VARCHAR(50),
    License_Plate VARCHAR(20),
    Rating DECIMAL(2,1),
    City VARCHAR(50)
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone_Number INT,
    Email VARCHAR(100),
    Rating DECIMAL(2,1),
    City VARCHAR(50)
);

CREATE TABLE Trips (
    Trip_ID INT PRIMARY KEY,
    Driver_ID INT,
    Customer_ID INT,
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    Payment_Type VARCHAR(50),
    Fare DECIMAL(10,2),
    Trip_Date DATE,
    FOREIGN KEY (Driver_ID) REFERENCES Drivers(Driver_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

INSERT INTO Drivers VALUES
(1, 'Rahul Jain', '5551234', 'Toyota Prius', 'AB123CD', 4.9, 'Ramol'),
(2, 'Ali Ahmed', '5555678', 'Honda Civic', 'XY456EF', 4.8, 'Jamalpur'),
(3, 'Rohit Kumar', '5554623', 'Swift Dzire', 'DS786GF', 4.2, 'Maninagar'),
(4, 'Hardik Shah', '5559845', 'Innova', 'RR562CV', 3.9, 'S.g Highway'),
(5, 'Maulik Vyas', '5554951', 'Nexon', 'MV269SV', 4.5, 'Paldi');

INSERT INTO Customers VALUES
(1, 'Altamash Ansari', '555-4321', 'alt.ansari@gmail.com', 4.7, 'Ramol'),
(2, 'Raj Mehta', '555-8765', 'raj.mehta@gmail.com', 4.9, 'Jamalpur'),
(3, 'Krishna Kumar', '5559898', 'krish.kumar@gmail.com', 4.1, 'Maninagar'),
(4, 'Naman Shah', '5554687', 'naman.shah@gmail.com', 3.9, 'S.g Highway'),
(5, 'Dev Patel', '5554691', 'dev.patel@gmail.com', 4.2, 'Paldi');

INSERT INTO Trips VALUES
(101, 1, 1, 'Ramol', 'Ambawadi', 'Credit Card', 15.75, '2025-04-25'),
(102, 2, 3, 'Maninagar', 'Paldi', 'Cash', 22.00, '2025-04-26'),
(103, 5, 4, 'S.g Highway', 'Ramol', 'UPI', 18.00, '2025-04-26'),
(104, 3, 2, 'Jamalpur', 'Ramol', 'Cash', 20.00, '2025-04-27'),
(105, 4, 5, 'Paldi', 'Gandhinagar', 'UPI', 24.00, '2025-04-25');

SELECT * FROM Trips;

SELECT * FROM Drivers WHERE City = 'Paldi';

SELECT * FROM Customers WHERE Rating > 4.5;

SELECT * FROM Trips WHERE Payment_Type = 'UPI';

SELECT * FROM Trips WHERE Trip_Date = '2025-04-26';

SELECT COUNT(*) AS Total_Trips FROM Trips;

SELECT Name, Rating FROM Drivers WHERE Rating < 4.5;

SELECT * FROM Trips WHERE Pickup_Location = 'Ramol';

SELECT t.Trip_ID, d.Name AS Driver_Name, c.Name AS Customer_Name, t.Fare FROM Trips t
JOIN Drivers d ON t.Driver_ID = d.Driver_ID
JOIN Customers c ON t.Customer_ID = c.Customer_ID
WHERE t.Trip_Date = '2025-04-26';

SELECT c.Name AS Customer_Name, d.Name AS Driver_Name, t.Fare, t.Trip_Date FROM Trips t
JOIN Customers c ON t.Customer_ID = c.Customer_ID
JOIN Drivers d ON t.Driver_ID = d.Driver_ID;








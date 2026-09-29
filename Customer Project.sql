
-- Creating Database Customer_Project


CREATE DATABASE 
Customer_Project
USE Customer_Project;

-- Creating Customer Table

CREATE TABLE Customers
(
	CustomerID INT PRIMARY KEY,
	CustomerName VARCHAR(100),
	Gender VARCHAR(10),
	Age INT,
	City VARCHAR(50),
	Email VARCHAR(100),
	Phone VARCHAR(15),
	JoinDate DATE
	)

	SELECT * FROM Customers

	-- Inserting Data into Customers

	INSERT INTO Customers VALUES(101,'Madha','Male',28,'Delhi','madhav@gmail.com',8130663748,'2024-01-15')
	INSERT INTO Customers VALUES(102,'Pankaj','Male',30,'Gurgaon','pankaj@gmail.com',8140663748,'2025-04-25')
	INSERT INTO Customers VALUES(103,'Sneha','Female',31,'Delhi','sneha@gmail.com',8130663948,'2022-05-10')
	INSERT INTO Customers VALUES(104,'Harshit','Male',25,'Mumbai','harshit@gmail.com',8134663748,'2024-05-26')
	INSERT INTO Customers VALUES(105,'Trisha','Female',32,'Kolkata','trisha@gmail.com',9930663748,'2022-05-28')
	INSERT INTO Customers VALUES(106,'Simran','Female',26,'Siwan','simran@gmail.com',9830663748,'2020-08-10')
	INSERT INTO Customers VALUES(107,'Chandni','Female',32,'Nagpur','chandni@gmail.com',8830663748,'2021-06-20')
	INSERT INTO Customers VALUES(108,'Aman','Male',24,'Delhi','aman@gmail.com',7030663748,'2023-01-08')
	INSERT INTO Customers VALUES(109,'Sushil','Male',36,'Gurgaon','sushil@gmail.com',6530663748,'2022-06-01')
	INSERT INTO Customers VALUES(110,'Ajay','Male',36,'Delhi','ajay@gmail.com',9978202470,'2021-08-15')

	-- Displaying all Customers

	SELECT *
	FROM Customers

	-- Displaying all customer name and City.

	SELECT CustomerName,City
	FROM Customers
	
	-- Displaying all customers from Delhi Only

	SELECT * FROM Customers
	WHERE City ='Delhi'


	-- Finding the customers who is more than 30 years old.

	SELECT * FROM Customers
	WHERE (AGE) >30


	-- Find only Female Customers

	SELECT * FROM Customers
	WHERE Gender='Female'


	-- Finding total no of customers


	SELECT COUNT(*) AS
	TotalCustomers
	FROM Customers


	-- Finding AVERAGE age of all customers


	SELECT AVG(Age) AS AverageAge
	FROM Customers



	-- Find the MAX age of customers.

	SELECT MAX(Age) AS MaximumAge
	FROM Customers


	

	-- Find the MIN age of customers.

	SELECT MIN(Age) AS MinimumAge
	FROM Customers


	-- Find number of customers in each city.

	SELECT City, COUNT(*) AS
	CustomerCount
	FROM Customers
	GROUP BY City;

	-- Find how many Male and Female Customers are.

	SELECT Gender, COUNT(*) AS
	CustomerCount
	FROM Customers
	GROUP BY Gender;


	-- Sort Customers by age.

	SELECT *
	FROM Customers
	ORDER BY AGE ASC;


	-- To find the Oldest customer first.

	SELECT *
	FROM Customers
	ORDER BY AGE DESC;



	-- Find the customrs whose name contains 'a'

	SELECT * 
	FROM Customers
	WHERE CustomerName LIKE  '%a';



	-- Classify Customrs by age.

	SELECT 
		CustomerName,
		AGE,
		CASE	
			WHEN AGE<25 THEN
			'Young'
				WHEN AGE BETWEEN 25 AND 35 THEN 'Adult'
					ELSE 'Senior'

					END AS AgeGroup
			FROM Customers;					


	-- Find the customer whose join year is 2024.

	SELECT *
	FROM Customers
	WHERE YEAR(JoinDate) = 2024;


	-- Find the joining Month of each customers

	SELECT 
		CustomerName,
		MONTH(JoinDate) AS JoinMonth
	FROM Customers


	-- Find the customrs from Delhi and Gurgaon.

	SELECT *
	FROM Customers
	WHERE City IN ('Delhi','Gurgaon')


	-- Find the customers aged between 25 and 35.

	SELECT *
	FROM Customers
	WHERE AGE BETWEEN 25 AND 35;



	-- Cities having more than 2 customers.

	SELECT City, COUNT(*) AS
	TotalCustomrs
	FROM Customers
	GROUP BY City
	HAVING COUNT(*) >2;


	-- Add Sales Table

	CREATE TABLE Sales
	(
		SalesID INT PRIMARY KEY,
		CustomrID INT,
		ProductName VARCHAR(100),
		Quantity INT,
		Amount DECIMAL(10,2),
		SaleDate DATE,
		)


		INSERT INTO Sales VALUES(1,101,'Laptop',1,55000,'2024-06-01')
		INSERT INTO Sales VALUES(2,102,'Mobile',2,40000,'2024-06-05')
		INSERT INTO Sales VALUES(3,103,'Laptop',1,60000,'2024-06-10')
		INSERT INTO Sales VALUES(4,104,'Mouse',2,1500,'2024-06-15')
		INSERT INTO Sales VALUES(5,105,'Keyboard',1,2500,'2024-06-20')
		INSERT INTO Sales VALUES(6,106,'Mobile',1,22000,'2024-07-01')
		INSERT INTO Sales VALUES(7,107,'Laptop',1,50000,'2024-07-05')
		INSERT INTO Sales VALUES(8,108,'Headphone',2,5000,'2024-07-10')
		INSERT INTO Sales VALUES(9,109,'Mobile',1,25000,'2024-07-15')
		INSERT INTO Sales VALUES(10,110,'Laptop',1,70000,'2024-08-01')

		SELECT * FROM Sales


		-- JOIN - customer name with purchase details.

		SELECT 
			c.CustomerName,
			c.City,
			s.ProductName,
			s.Quantity,
			s.Amount

		FROM Customers c
		INNER JOIN Sales s
		ON c.CustomerID = s.CustomrID


		-- Highest- spending customres.

		SELECT 
			c.CustomerName,
			SUM(s.Amount) AS
			TotalPurchase
			FROM Customers c
			JOIN Sales s
			ON c.CustomerID = s.CustomrID
			GROUP BY c.CustomerName
			ORDER BY TotalPurchase DESC;


	-- Customers who has never purchased.

	SELECT 
		c.CustomerID,
		c.CustomerName
		FROM Customers c
		LEFT JOIN Sales s
		ON c.CustomerID = s.CustomrID
		WHERE s.CustomrID IS NULL;



		-- Top 3 Customers by Sales.

		SELECT TOP 3
			c.CustomerName,
			SUM(s.Amount) AS TotalSales
			FROM Customers c
			JOIN Sales s
			ON c.CustomerID = s.CustomrID
			GROUP BY c.CustomerName
			ORDER BY TotalSales DESC;

			







		






































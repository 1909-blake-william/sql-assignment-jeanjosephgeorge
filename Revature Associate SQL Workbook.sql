-- 1.0 Setting up Oracle Chinook
-- In this section you will begin the process of working with the Oracle Chinook database
-- Task � Open the Chinook_Oracle.sql file and execute the scripts within.
-- 2.0 SQL Queries
-- In this section you will be performing various queries against the Oracle Chinook database.
-- 2.1 SELECT
-- Task � Select all records from the Employee table.
SELECT * FROM EMPLOYEE;
-- Task � Select all records from the Employee table where last name is King.
SELECT * FROM EMPLOYEE WHERE LASTNAME = 'King'; 
-- Task � Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * FROM EMPLOYEE WHERE FIRSTNAME = 'Andrew' AND REPORTSTO IS NULL;
-- 2.2 ORDER BY
-- Task � Select all albums in Album table and sort result set in descending order by title.
SELECT * FROM ALBUM ORDER BY TITLE DESC;
-- Task � Select first name from Customer and sort result set in ascending order by city
SELECT FIRSTNAME FROM CUSTOMER ORDER BY CITY ASC;


-- 2.3 INSERT INTO
-- Task � Insert two new records into Genre table
INSERT INTO GENRE (GENREID, Name) VALUES (26, 'Psychedelic');
INSERT INTO GENRE (GENREID, Name) VALUES (27, 'Death Metal');

-- Task � Insert two new records into Employee table
INSERT INTO EMPLOYEE(EMPLOYEEID, LASTNAME, FIRSTNAME, TITLE, REPORTSTO, BIRTHDATE, HIREDATE, ADDRESS, CITY, STATE, COUNTRY, POSTALCODE, PHONE, FAX, EMAIL)
VALUES (9, 'Jean', 'George', 'Customer Service', 4, TO_DATE('1984/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), '6747 Strawberry Brook Lane', 'Dickinson', 'Texas','USA','77539','8328956087','8328956088','jean.joseph@outlook.com');

INSERT INTO EMPLOYEE(EMPLOYEEID, LASTNAME, FIRSTNAME, TITLE, REPORTSTO, BIRTHDATE, HIREDATE, ADDRESS, CITY, STATE, COUNTRY, POSTALCODE, PHONE, FAX, EMAIL)
VALUES (10, 'Jim', 'George', 'Chief Technologist', 4, TO_DATE('1986/04/15 20:12:24', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2010/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), '6747 Strawberry Brook Lane', 'Dickinson', 'Texas','USA','77539','8328956087','8328956088','jim.dot.dot@gmail.com');

SELECT * FROM CUSTOMER;
-- Task � Insert two new records into Customer table
INSERT INTO CUSTOMER(CUSTOMERID,FIRSTNAME,LASTNAME,COMPANY,ADDRESS,CITY,STATE, COUNTRY, POSTALCODE,PHONE,FAX,EMAIL,SUPPORTREPID)
VALUES (60,'Herbert','Schumer','Apple','123 Asphalt Drive','Reston','Virginia','USA',20190,'2315437224','2342632210','herbiederbie@gmail.com',2);

INSERT INTO CUSTOMER(CUSTOMERID,FIRSTNAME,LASTNAME,COMPANY,ADDRESS,CITY,STATE, COUNTRY, POSTALCODE,PHONE,FAX,EMAIL,SUPPORTREPID)
VALUES (61,'Salacious','Sal','Google','2003 Mango Hills Lane','Reston','Virginia','USA',20190,'2318523224','782132210','themangoman@gmail.com',4);

-- 2.4 UPDATE
-- Task � Update Aaron Mitchell in Customer table to Robert Walter
UPDATE CUSTOMER SET FIRSTNAME = 'Robert', LASTNAME = 'Walter' WHERE FIRSTNAME = 'Aaron' AND LASTNAME = 'Mitchell';

-- Task � Update name of artist in the Artist table �Creedence Clearwater Revival� to �CCR�
UPDATE ARTIST SET NAME = 'CCR' WHERE NAME ='Creedence Clearwater Revival';

-- 2.5 LIKE
-- Task � Select all invoices with a billing address like �T%�
SELECT * FROM INVOICE WHERE BILLINGADDRESS LIKE 'T%' ;

-- 2.6 BETWEEN
-- Task � Select all invoices that have a total between 15 and 50
SELECT * FROM INVOICE WHERE TOTAL BETWEEN 15 AND 50;
-- Task � Select all employees hired between 1st of June 2003 and 1st of March 2004
SELECT * FROM EMPLOYEE WHERE HIREDATE BETWEEN TO_DATE('2003/06/01 00:00:00', 'yyyy/mm/dd hh24:mi:ss') AND TO_DATE('2004/03/01 00:00:00', 'yyyy/mm/dd hh24:mi:ss')
-- 2.7 DELETE
-- Task � Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
ALTER TABLE INVOICE DROP CONSTRAINT fk_invoicecustomerid;
ALTER TABLE INVOICE DROP CONSTRAINT fk_invoicelineinvoiceid;
ALTER TABLE INVOICE
ADD CONSTRAINT fk_invoicecustomerid
   FOREIGN KEY (CustomerID)
   REFERENCES CUSTOMER (CustomerId)
   ON DELETE CASCADE;
DELETE FROM CUSTOMER WHERE FIRSTNAME = 'Robert' AND LASTNAME = 'Walter';

-- 3.0 SQL Functions
-- In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
-- 3.1 System Defined Functions
-- Task � Create a function that returns the current time.
-- Task � create a function that returns the length of a mediatype from the mediatype table
-- 3.2 System Defined Aggregate Functions
-- Task � Create a function that returns the average total of all invoices
-- Task � Create a function that returns the most expensive track
-- 3.3 User Defined Scalar Functions
-- Task � Create a function that returns the average price of invoiceline items in the invoiceline table
-- 3.4 User Defined Table Valued Functions
-- Task � Create a function that returns all employees who are born after 1968.
-- 4.0 Stored Procedures
--  In this section you will be creating and executing stored procedures. You will be creating various types of stored procedures that take input and output parameters.
-- 4.1 Basic Stored Procedure
-- Task � Create a stored procedure that selects the first and last names of all the employees.
-- 4.2 Stored Procedure Input Parameters
-- Task � Create a stored procedure that updates the personal information of an employee.
-- Task � Create a stored procedure that returns the managers of an employee.
-- 4.3 Stored Procedure Output Parameters
-- Task � Create a stored procedure that returns the name and company of a customer.
-- 6.0 Triggers
-- In this section you will create various kinds of triggers that work when certain DML statements are executed on a table.
-- 6.1 AFTER/FOR
-- Task - Create an after insert trigger on the employee table fired after a new record is inserted into the table.
-- Task � Create an after update trigger on the album table that fires after a row is inserted in the table
-- Task � Create an after delete trigger on the customer table that fires after a row is deleted from the table.
-- Task � Create a trigger that restricts the deletion of any invoice that is priced over 50 dollars.
-- 7.0 JOINS
-- In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
-- 7.1 INNER
-- Task � Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
-- 7.2 OUTER
-- Task � Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
-- 7.3 RIGHT
-- Task � Create a right join that joins album and artist specifying artist name and title.
-- 7.4 CROSS
-- Task � Create a cross join that joins album and artist and sorts by artist name in ascending order.
-- 7.5 SELF
-- Task � Perform a self-join on the employee table, joining on the reportsto column.

-- 14



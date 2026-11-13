create database bank;
use bank;

create table customer(
customerID int,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
Phone varchar(15));

alter table customer add column dateofBirth date;
alter table customer modify phone varchar(20);
select * from customer;

create table accounts(
accountID int,
accountType varchar(20),
balance decimal(10,2));
select * from accounts;

create table transactions(
transactionID int,
transactionDate date,
Amount decimal(10,2),
transactionType varchar(20));
select * from transactions;

create table branches(
branchID int,
branchName varchar(100),
branchAddress varchar(200),
branchPhone varchar(15));
select * from branches;

create table loans(
loanID int primary key,
loanAmount decimal(10,2),
interestRate decimal(5,2),
startDate date,
endDate date);
select * from loans;

alter table branches add constraint primary key(branchID);
alter table transactions add constraint primary key(transactionID);
alter table accounts add constraint primary key(accountID);
alter table customer add constraint primary key(customerID);

alter table accounts add column branchID int;
alter table accounts add column customer_id int;
alter table accounts add constraint foreign key(customer_id) references customer(customerID);

alter table loans add column customer_id int;
alter table loans add constraint foreign key(customer_id) references customer(customerID);

alter table branches add column account_id int;
alter table branches add constraint foreign key(account_id) references accounts(accountID);

alter table transactions add column account_id int;
alter table transactions add constraint foreign key(account_id) references accounts(accountID);

insert into customer value(101,"Rahul","Sharma","rahul.sharma@gmail.com",9999999999,19980415);
insert into customer value(102,"Priya","Patil","priya@gmail.com",9988776655,20000920),
(103,"Amit","Patel","amit.patel@gmail.com",9876500001,19950618),
(104,"Sneha","Joshi","sneha.joshi@gmail.com",9876500002,19970912),
(105,"Rohan","Kulkarni","rohan.kulkarni@gmail.com",9876500003,19931125);

insert into loans value(301,50000.00,8.50,20250115,20300115,101),
(302,30000.00,9.25,20280210,20280210,102),(303,750000.00,8.75,20250320,20320320,103),(304,250000.00,10.00,20250405,20290405,104),(305,100000.00,7.95,20250512,20350512,105);

insert into Branches value(1, "Mumbai Branch", "Andheri Mumbai", 0221111111, default), (2, "Pune Branch", "Shivaji nagan Pune", 0202222222, default),
(3, "Nashik Branch", "College Road Nashik", 0253222222, default),
(4, "Magpur Branch", "Sitabuldi Nagpur", 0712333333, default),
(5, "Navs Mumbail Branch", "VashiNavi Mumbai", 0224444444, default);

insert into transactions value(301, 20250510,5000.00, "deposit", 201);
insert into transactions value(302, 20250511, 2500.00, "withdraw", 202),(303, 20250512,10000.00, "deposit", 203),
(304,20250513,3000.00, "withdraw", 204),(305, 20250514,7000.00, "deposit", 205);

insert into accounts value(201,"savings",25000.00,101,0),(202,"current",40000.00,102,0),(203,"savings",35000.00,103,0),
(204,"current",60000.00,104,0),(205,"savings",45000.00,105,0);

-- Modify the balance of AccountID 201 to 30000 
update accounts set balance= 30000 where accountid=201;

-- Delete the transaction record with TransactionID 302 
delete from transactions where TransactionID = 302;

-- account record with AccountID 202
delete from accounts where AccountID = 202;

-- Display Customers in Alphabetical Order
select * from customer
order by  firstname;

-- Display Accounts with Highest Balance First
select * from accounts
order by balance desc limit 1;

-- Retrieve Unique Account Types
select distinct(accountType)as unique_account from accounts;

-- Display Top 3 Highest Balance Accounts
select * from accounts
order by balance desc limit 3;

-- Skip Initial Records While Viewing Transactions
select * from transactions 
order by amount limit 3 offset 1;
 
-- 1, Display customers sorted by LastName
select * from customer
order by lastname;

-- 2. Retrieve top 5 transactions with highest amount
select * from transactions
order by amount limit 3 offset 2;

-- 3. Display unique transaction types
select distinct transactionType as unique_transaction from transactions;

-- 4. Skip the first 3 transaction records and display the next 4 records
select * from transactions
order by amount limit 4 offset 3;

-- find customers without phone number
select * from customer
where phone is null;

-- find customer having email addresses
select * from customer
where email is not null;

-- find customer without email addresses
select * from customer
where email is null;

-- display all account where balance information is available
select * from customer where balace is not null;

-- search customer  whose first name starts with "a"
select * from customer
where firstname like 'a%';

-- search customers whose email contains "gamil"
select * from customer
where email like "%gmail%";

-- search customers whose last name ends with "kar"
select * from customer
where lastname like '%kar';

-- dispaly customers whose first name strat with r
select * from customer
where firstname like "R%";

-- find customers whose email contains yahoo
select * from customer 
where email like "%yahoo";

-- dispaly customer whose last  name start with p
select * from customer
where lastname like 'p%';

-- search customers whose phone number ends with 99
select * from customer
where phone like "%99";

--  Display Savings Account Customers Sorted by Balance Categorize Accounts Using Balance Balance >50000 then premium account Balance >2500 then standar account
 
 select balance, case 
 when balance >50000 then "premiun account"
 when balance >2500 then "stander account"
 else "normal account"
 end as category 
 from accounts;
 

-- · High Transaction>5000  Medium Transaction>2000 Low Transaction  based on transaction amount.

select amount, case when amount >5000 then "high transaction"
when amount >2000 then "medium transaction"
else "low transaction" end as transaction_done
from transactions;


-- The finance team wants to review only Savings and Current account holders.
select * from accounts
where accountType in ("savings","current");

-- The audit department wants to investigate only Deposit and Withdrawal transactions.
select * from transactions
where transactionType in ("deposite","withdrawal");

-- The customer relationship team wants to review records for a specific set of customers. 101,102,105
select * from customer
where customerID in (101,102,105);

 
-- 1. Display accounts belonging to Salary and Savings account types
select * from accounts
where accountType in ("salary","savings");

-- 2. Retrieve transactions for Payment and Deposit categories
select * from transactions
where transactionType in ("payment","deposit");

-- 3. Display customer records for CustomerID 103 and 104
select * from customer
where customerID in (103,104);

-- 4. Retrieve selected account records using AccountID values 201
select * from accounts
where accountID = 201;
 
-- Display Customers in Ascending Order of Last Name
select * from customer 
order by lastName asc;

-- Display Accounts with Highest Balance First
select * from accounts
order by balance desc limit 1;

-- Display Transactions Sorted by Transaction Date
select * from transactions
order by transactionDate;

-- 1. Display customers sorted by FirstName
select * from customer 
order by firstName;

-- 2. Display accounts sorted by AccountType
select * from accounts
order by accountType;

-- 3. Display transactions sorted by Amount in descending order
select * from transactions
order by amount desc;

-- 4. Display customers sorted by DateOfBirth
select * from customer
order by dateofbirth;

 
-- Display Only Top 5 Highest Balance Accounts
select * from accounts
order by balance desc limit 5;

-- Display First 3 Customer Records
select * from customer
order by customerID limit 3;

-- Skip Initial Transaction Records 3 While Viewing Data record 2
select * from transactions
limit 2 offset 3;

 
-- 1. Display top 3 transactions with highest amount
select * from transactions
order by amount desc limit 3;

-- 2. Retrieve only 4 customer records
select * from customer
limit 4;

-- 3. Skip first 2 account records and display next 3 records
select * from accounts
limit 3 offset 2;

-- 4. Display top 5 latest transactions
select * from transactions
order by transactionDate asc limit 5;

select transactionType, sum(amount) from transactions
group by transactionType
order by sum(amount) desc;

select customer_id,sum(loanamount) from loans
group by customer_id
having customer_id =101;

-- text function 
-- len, trim,upper,lower,left, right, mid

select length("hello")as length, upper("hello"),lower("HELLO"),left("hello",3),
right("hello",2),mid("hello",2,3);

select length("    hello"),length(trim("    hello"));

select concat("hello","","all");

select upper(firstname),left(firstname,3),length(firstname)  from customer;

-- Q1
select * from customer;

-- Q2
select upper(firstname) from customer;

-- Q3
select lower(firstname) from customer;

-- Q5
select left(firstname,3) from customer;

-- Q4
select length(firstname) from customer;

-- Q6
select concat(firstname,lastname) from customer;

-- maths
select round(7.5),round(7.4),abs(-7),ceil(8.9),floor(8.9);

-- date
select current_date(),now(),year(now()),day(now()),month(now());
select datediff("13-11-2026","01-11-2026");
-- Q1
select * from customer;

-- Q2
select current_date();

-- Q3
select now();

-- Q4
select year(dateofbirth) from customer;

-- Q5
select month(dateofbirth) from customer;

-- Q6
select datediff(current_date(),dateofbirth)from customer;

-- Q7
select dateofbirth from customer
order by dateofbirth desc
limit 1;

-- Q8
select dateofbirth from customer
order by dateofbirth
limit 1;

-- Q9 Display 'Not Available' if a phone number is NULL
select *,ifnull(phone,"not avaailable") from customer;
 
-- Q10. Compare two customer names
 select *,nullif(firstname,"rahul") from customer;
 
-- Q11. Calculate the total balance maintained across all customer accounts.
select customer_id,sum(balance) from accounts
group by customer_id;
 
-- Q12. Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
select accountType,avg(balance) from accounts
group by accountType;
 
-- Q13. Identify the highest balance maintained in any customer account.
select max(balance) from accounts;

select Customer_id,max(balance) from accounts
group by Customer_id
order by max(balance) desc
limit 1;
 
-- Q14. Identify the lowest balance maintained in any customer account
select min(balance) from accounts;

select Customer_id,min(balance) from accounts
group by Customer_id
order by min(balance) asc
limit 1;
 
-- Q15. Determine the total number of customer accounts available in the system.
select count(*) from accounts;

select  AccountType,count(*) from accounts
group by AccountType;

-- Q16. The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and identify which account type is attracting the highest total deposits from customers.
 select AccountType,sum(balance) from accounts
group by AccountType
order by sum(Balance) desc
limit 1;
 
-- Q17. The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.
select AccountType,sum(balance) from accounts
group by AccountType
having sum(balance)>=25000;
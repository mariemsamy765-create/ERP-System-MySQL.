create database ERPSystem;

USE ERPsystem ;
 -- ================= HR =================  	`      
create table Branches (
id int primary key auto_increment ,
name varchar (100),
location varchar (100),
phone varchar (100),
Email varchar (100),
openingdate date ,
status varchar(100)
 ); 
 insert into Branches (name,location,phone,Email,openingdate,status)values 
 ("maimn Branche","cairo",16322,"maimnBranche@gmail.com",'2015-4-9',"active"),
 ("5th settlement Branche","new cairo",16211,"newcairoBranche@gamil.com",'2010-9-4',"active"),
 ("october Branche","Giza",16122,"octoberBranche@gmail.com",'2009-2-3',"active"),
 ("northern coast Branche","northern coast",15111,"northerncoastBranche",'2021-12-11',"active"),
 ("maadi Branche","cairo",12211,"maadiBranche@gamil.com",'2006-5-5',"active") ,
    ("naser city Branche ","cairo",13312,"nasercityBranche@gmail.com",'2012-2-3',"inactive")
 ;
 select* from Branches;
 create table departments (
 id int primary key auto_increment ,
name varchar (100),
Branchesid int,
foreign key (Branchesid)references Branches(id)
);
insert into departments (name,Branchesid)values 
("human resources",1),
("finance",2),
("sales",3),
("marketiing",4),
("procurement",5),
("warehouse",6)
;

create table joptitles (
 id int primary key auto_increment ,
name varchar (100),
description text
);
insert into joptitles (name,description)values
("hr manager","Manages employees and recruitment"),
("Accountant","Manages financial records"),
("Sales Representative","Sales Representative"),
("Software Developer","Develops software applications"),
("Warehouse Manager","Manages warehouse operations")
;
select * from joptitles;
create table employees (
id int primary key auto_increment ,
name varchar (100),
email varchar(100),
phone  varchar(100),
hiredate date,
salary decimal(10,2),
departmentsid int,
foreign key (departmentsid)references departments(id),
joptitlesid int,
foreign key (joptitlesid)references joptitles(id)
);
select * from employees;
insert into employees(name,email,phone,hiredate,salary,departmentsid,joptitlesid)values
("ahmed","ahmed123@gmail.com",011797886,'2004-02-03',1200,1,1),
("ali","ali44444@gmail.com",0127877864,'2020-05-07',8000,2,2),
("mariem","mariemaa@gamil.com",0100246866,'2008-12-07',7600,3,3),
("mohamed-morsy","mahmedmorsy695@gmail,com",01030454191,'2006-05-05',30000,4,4),
("ahmed-hany","66ahmedan@gameil.com",01025851389,'2006-07-25',30000,5,5)
;
insert into employees(name,email,phone,hiredate,salary,departmentsid,joptitlesid)values
("mohamed","mohamed@gamil.com",0103248565,'2020-03-10',90000,3,4),
("sofia","sofia45@gmail.com",0123456789,'2021-05-07',10000,2,4),
("amr","amr5675@gmail.com",013246866,'2017-09-06',8900,1,3)
;
select * from employees
;
SELECT departments.name,
COUNT(employees.id) as number_of_employees
FROM departments
join employees
ON departments.id = employees.departmentsid
group by  departments.name;
  
SELECT departments.name,
SUM(employees.salary) AS total_salary
FROM departments
JOIN employees
ON departments.id = employees.departmentsid
GROUP BY departments.name
;
    
SELECT departments.name,
AVG(employees.salary) AS average_salary
FROM departments
JOIN employees
ON departments.id = employees.departmentsid
group by departments.name 
;
  
  SELECT departments.name,
MAX(employees.salary) AS highest_salary
FROM departments
JOIN employees
ON departments.id = employees.departmentsid
GROUP BY departments.name 
;
   
SELECT departments.name,employees.name,employees.salary
from departments
join employees
on departments.id = employees.departmentsid
order by employees.salary DESC
;
 SELECT departments.name,
min(employees.salary) AS min_salary
FROM departments
JOIN employees
ON departments.id = employees.departmentsid
GROUP BY departments.name 
order by min_salary asc
;
select departments.name,departments.id,employees.name,employees.salary,employees.phone
FROM departments
left join employees
on departments.id = employees.departmentsid
;
select departments.name,employees.name,employees.salary
FROM departments
right join employees
on departments.id = employees.departmentsid
;
   
   
create table employees_attendance(
id int primary key auto_increment ,
employeesid int,
attendancedate date,
check_in time ,
check_out time ,
status varchar(100),
foreign key (employeesid)references employees(id)
);
select* from employees_attendance;
insert into employees_attendance(employeesid,attendancedate,check_in,check_out,status)values
(8,'2020-06-03','08:10','05:00',"Late");
insert into employees_attendance(employeesid,attendancedate,check_in,check_out,status)values
(5,'2020-06-03','08:10','05:00',"Late"),
(7,'2020-06-03','08:30','05:00',"Late"),
(4,'2020-06-03','08:35','05:00',"Late"),
(6,'2020-06-03','08:35','05:00',"Late"),
(2,'2020-06-03','08:35','05:00',"Late"),
(3,'2020-06-03','08:35','05:00',"Late"),
(1,'2020-06-03','08:35','05:00',"Late")
;
create table payroll(
id int primary key auto_increment ,
employeeid int,
salary decimal (10,2) ,
bonus decimal (10,2),
deductions decimal (10,2),
netsalary  decimal (10,2),
payment_date date
);
insert into payroll (employeeid,salary,bonus,deductions,netsalary,payment_date)values
(1,12000,1500,500,13000,'2026-5-31'),
(2,8000,1000,500,8500,'2026-5-31'),
(3,7600,500,500,7600,'2026-5-31'),
(4,30000,2000,3000,29000,'2026-5-31'),
(5,30000,5000,6000,29000,'2026-5-31'),
(6,90000,0,80000,10000,'2026-5-31'),
(7,1000,1000,400,10600,'2026-5-31'),
(8,8900,1000,500,9400,'2026-5-31')
;
select * from payroll;
 create table leaverequests (
 id int primary key auto_increment ,
 employeesid int,
leavetype varchar(100),
startdate date ,
enddate date ,
status varchar(100),
foreign key (employeesid)references employees(id)
);

insert into leaverequests (employeesid,leavetype,startdate,enddate,status)values
(1,"sickleave",'2026-03-01','2026-04-01',"accept"),
(2,"annualleave",'2026-04-05','2026-05-05',"rejected"),
(3,"sickleave",'2026-02-09','2026-02-28',"rejected")
;	
select *from leaverequests
;
create table employeecontracts (
id int primary key auto_increment ,
employeesid int,
startdate date ,
enddate date ,
salary decimal ,
status varchar(100),
foreign key (employeesid) references employees(id)
);

insert into employeecontracts (employeesid,startdate,enddate,salary,status)values
(1,'2020-4-5','2030-4-5',12000,"active"),
(2,'2015-6-6','2035-6-6',8000,"active"),
(3,'2022-6-8','2032-6-8',7600,"active"),
(4,'2025-4-8','2036-4-8',30000,"active")
;
select* from  employeecontracts;
create table employeedocumelnts(
id int primary key auto_increment,
 employeesid int,
 documentnumper varchar(100),
 issuedate date,
 expirydate date,
 status varchar(100),
 foreign key(employeesid)references employees(id)
 );
 insert into employeedocumelnts (employeesid,documentnumper,issuedate,expirydate,status)values
 (1,44,'2013-2-3','2020-5-8',"valid"),
 (2,66,'2017-5-6','2017-7-9',"valid"),
 (3,47,'2021-5-5','2024-7-8',"valid"),
 (4,85,'2002-4-8','2024-7-8',"valid"),
 (5,69,'2006-7-9','2025-7-10',"valid"),
 (6,99,'2008-4-7','2026-7-6',"valid")
 ;
 select *from employeedocumelnts;
 create table employeetraining(
 id int primary key auto_increment,
 employeesid int,
 trainingname varchar(100),
 trainingtype varchar(100),
 startdate date ,
 enddate date ,
 status varchar(100),
 foreign key (employeesid) references employees(id)
 );
 insert into employeetraining(employeesid,trainingname,trainingtype,startdate,enddate,status) values
 (1,"SQL","technical",'2024-1-20','2024-1-20',"completed"),
 (2,"leaderchipskils","managment",'2024-3-5','2024-3-15',"completed"),
 (3,"microsoftexcel","technical",'2024-3-5','2024-3-15',"completed"),
 (4,"database","technical",'2024-3-5','2024-3-15',"completed")
 ;
 select * from employeetraining;
   
  -- ================= finance ================= 
  
  create table accounts(
  id int primary key auto_increment,
  account_name varchar(100),
  balance int,
  status varchar(100)
  );
  
  
  insert into accounts(account_name,status,balance)values
  ("bank_account","active",350000),
  ("sales_revenue","inactive",100000),
  ("office_expenses","inactive",60000),
  ("employee_salaries","active",75000);
  select * from accounts;
  
  create table journal_entries(
  id int primary key auto_increment,
  account_id int,
  entry_date date,
  description varchar(100),
   debit decimal(12,2),
   credit decimal(12,2),
    foreign key (account_id)references accounts(id)
    );
    
    insert into journal_entries ( account_id,entry_date,description,debit,credit)values
    (1,'2026-07-22',"capital_investment",00.0,500000.00),
    (2,'2026-07-22',"sales_revenue",0.00,250000.00),
    (3,'2026-07-23',"office_rent",0.00,300000.00),
    (4,'2026-07-23',"employee_salaries",0.00,700000.00);
select * from journal_entries;
 create table payments(
 id int primary key auto_increment,
 accountid int,
 paymentsdate date,
 amount decimal (10.2),
 paymentsmethod varchar (100),
 status varchar (100),
foreign key (accountid) references accounts(id)
 );
 insert into payments(accountid,paymentsdate,amount,paymentsmethod,status)values
 (1,'2020-12-20',5000,"cash","completed"),
 (2,'2020-12-20',4000,"Bank transefer","completed"),
 (3,'2026-12-10',14000,"Bank transefer","completed"),
 (4,'2026-12-30',15000,"Bank transefer","completed")
 ; 
 select * from payments;
 create table invoices(
 id int primary key auto_increment,
 accountid int,
 invoicesdate date,
 duedate date,
 amount decimal(10.2),
 invoicestype varchar(100),
 status varchar(100),
 foreign key (accountid) references accounts(id)
 );

 
 insert into invoices(accountid,invoicesdate,duedate,amount,invoicestype,status) values
 (1,'2025-12-5','2025-12-25',20000,"sales","paid"),
  (2,'2025-9-5','2025-12-25',2500,"sales","paid"),
   (3,'2025-7-5','2025-12-25',3400,"purchase","paid"),
    (4,'2025-8-5','2025-12-25',15000,"sales","paid")
    ;
    select * from invoices;
    
    
create table Expenses (
id int primary key auto_increment ,
accountid int,
expensedate date,
expensetype  varchar(100),
amount decimal (12,2),
description varchar(100),
status varchar(100),
foreign key (accountid) references accounts(id)
);

insert into Expenses (accountid,expensedate,expensetype,amount,description,status)values
(1,'2025-2-3',"Electrcity",850,"Electrcity bill for july","paid"),
(2,'2026-3-2',"internet",450,"monthly internet","paid"),
(3,'2026-4-4',"office supplies",1200,"pens","pending"),
(4,'2026-5-6',"maintenance",3000,"air conditioner ","paid")
;
select *from Expenses;
 create table taxes(
 id int primary key auto_increment,
 taxname varchar(100),
 taxtype varchar(100),
 taxrate decimal(10.2),
 status varchar(100)
 );
  
 insert into taxes(taxname,taxtype,taxrate,status) values 
 ("VAT","Salestax",14,"active"),
("incometax","directtax",20,"active"),
("salestax","indirecttax",22,"active"),
 ("importtax","directtax",5,"active")
 ;
  create table invoices_taxes(
  id int primary key auto_increment,
 taxesid int, 
 invoicesid int,
 foreign key (taxesid) references taxes(id),
 foreign key (invoicesid) references invoices(id)
 );
 insert into invoices_taxes (taxesid,invoicesid)values
 (1,3),
 (2,4),
 (3,2),
 (4,1)
 select* from taxes;
 select* from invoices_taxes;
 show tables;
 
create table budgets (
id int primary key auto_increment ,
name varchar(100),
startdate date,
enddate date,
totalamount decimal,
 status varchar (100)
 );
 insert into budgets (name,startdate,enddate,totalamount,status) values
("monyhly operting",'2026-1-1','2026-1-28',50000,"active"),
("markting budget",'2026-2-1','2026-2-28',25000,"active"),
("it budget",'2026-3-1','2026-3-28',40000,"completed"),
("hr budget",'2026-4-1','2026-4-28',18000,"active")
;
create table account_budget(
name varchar (100),
accountid int,
foreign key (accountid)references accounts(id),
budgetidsid int,
foreign key (budgetidsid)references budgets(id)
);
select * from account_budget ;

insert into account_budget(name,accountid,budgetidsid)values
("account_1",1,1),
("account_2",2,2),
("account_3",3,3),
("account_4",4,4)
;
create table financialtransactions(
id int primary key auto_increment,
accountid int,
transactionsdate date,
transactionstype varchar(100),
amount decimal(10,2),
statys varchar (100),
foreign key (accountid)references accounts(id)
);
insert into financialtransactions(accountid,transactionsdate,transactionstype,amount,statys)values
(1,'2024-5-9',"deposit",5000,"completed"),
(2,'2024-6-9',"deposit",20000,"completed"),
(3,'2024-7-10',"deposit",2000,"completed"),
(4,'2024-8-11',"deposit",3500,"completed")
;
select * from financialtransactions;

 -- ================= sales ================= 
 
 create table customers(
 id int primary key auto_increment,
 name varchar(100),
 phone varchar(100),
 email varchar(100),
 address varchar(100),
 status varchar(100)
 );
 insert into customers(name,phone,email,address,status)values
 ("ahmeed","01122820824","ahmeed@gamil.come","cairo","active"),
  ("ali","011229660824","ali@gamil.come","cairo","active"),
  ("sara","011229660824","sara@gamil.come","giza","active"),
  ("omar","011229660824","omar@gamil.come","cairo","active"),
  ("amr","011229660824","amr@gamil.come","mansoura","inactive")
  ;
  select * from customers 
  ;
  select count(*) as totalcustomers
  from customers
  ; 
 create table customer_addresses(
id int primary key auto_increment ,
customerid int,
addresses_type varchar (100),
street varchar(100),
city varchar(100),
country varchar(100),
foreign key (customerid)references customers(id)
);

insert into customer_addresses (customerid,addresses_type,street,city,country)values
(1,"home","15 nile street","cairo", "egypt"),
(2,"work","22 tahrir square","cairo", "egypt"),
(3,"home","8 el geish street","cairo", "egypt"),
(4,"work","15 nile street","cairo", "egypt")
;

  create table salesorders(
  id int primary key auto_increment,
  customers int,
  orderdate date,
  totalamount decimal (10.2),
  status varchar (100)
);
insert  into salesorders (customers,orderdate,totalamount,status) values
(1,'2025-10-20',16000,"completed"),
(2,'2025-4-20',16000,"completed"),
(3,'2025-1-20',2000,"completed"),
(4,'2025-12-20',30000,"completed")
;
select * from salesorders
;
 select sum(totalamount) as total_salesorders
  from salesorders
;
select customers, COUNT(*) AS Orders
from salesorders
where status = 'completed'
group by customers
having COUNT(*) >= 1
;
select customers.name,salesorders.totalamount
from customers
join salesorders
on customers.id= salesorders.customers
;
select customers.name,customers.email,salesorders.totalamount
from customers
join salesorders
on customers.id= salesorders.customers
;
select customers.name,customers.email,salesorders.totalamount
from customers
left join salesorders
on customers.id= salesorders.customers
;
create table sales_order_details(
id int primary key auto_increment ,
salesorderid int,
quantity int,
unit_price decimal(10.2),
total_price decimal(10.2),
foreign key (salesorderid)references salesorders(id)
);


insert into sales_order_details(salesorderid,quantity,unit_price,total_price)values
(1,2,500,1000),
(1,3,250,750),
(2,5,1000,5000),
(3,1,2500,2500),
(4,4,750,300)
;
select * from sales_order_details;


create table Quotations(
id int primary key auto_increment,
customerid int,
quotationdate date,
validuntil date,
amount decimal(10.2),
status varchar (100),
foreign key (customerid)references customers(id)
);
insert into Quotations(customerid,quotationdate,validuntil,amount,status)values
(1,'2025-7-9','2025-7-19',20000,"approved"),
(2,'2025-9-1','2025-10-19',8900,"approved"),
(3,'2025-11-9','2025-11-19',4000,"approved"),
(4,'2025-10-1','2025-12-19',2500,"rejected")
;
select * from Quotations;
create table sales_invoices(
id int primary key auto_increment ,
customerid int,
foreign key (customerid)references customers(id),
invoicesdate date,
due date ,
toyalamount decimal,
status varchar(100)
);
insert into sales_invoices (customerid,invoicesdate,due,toyalamount,status) values
(1,'2024-1-5','2024-1-20',15000,"paid"),
(2,'2024-2-5','2024-2-20',25000,"unpaid"),
(3,'2024-3-5','2024-3-20',18000,"paid"),
(4,'2024-4-5','2024-4-20',12000,"paiding")
;
show tables;
 -- ================= purchasing ================= 
create table suppliers (
id int primary key auto_increment,
name varchar(100),
phone varchar(100),
email varchar(100),
address varchar (100),
statys varchar (100)
);
insert into suppliers (name,phone,email,address,statys) values
("ABCccompany","012023838734","ABCccompany@gmail.com","cairo","active"),
("nilesupplies","01111867364","nilesupplies@gmail.com","cairo","active"),
("moderncompany","0122384674","moderncompanys@gmail.com","giza","active"),
("futurecompany","0122384674","futurecompany@gmail.com","giza","active")
;
select * from suppliers;
  
  create table supplier_contacts(
id int primary key auto_increment ,
supplierid int,
foreign key (supplierid)references suppliers(id),
contact_name varchar (100),
phone varchar(100),
email varchar(100),
position varchar(100)
);
insert into supplier_contacts(supplierid,contact_name,phone,email,position)values
(1,"ahmed hany ",01012415441,"ahmedhany@gmail.com","sales manager "),
(2,"mohamed morsy ",010304541921,"mohamedmorsy695@gmail.com","date analysis"),
(3,"amer ahmed ",01012415441,"amerahmed@gmail.com","sales manager "),
(3,"ahmed ail ",01012415441,"ahmedhany@gmail.com","account maanger ")
; 
select* from supplier_contacts;
create table purchase_orders(
id int primary key auto_increment ,
supplierid int,
foreign key (supplierid)references suppliers(id),
order_date date,
otal_amount decimal(10.2),
status varchar(100)
);
insert into purchase_orders (supplierid,order_date,otal_amount,status)values
(1,'2024-1-5',25000,"compled"),
(2,'2024-2-5',17000,"pending"),
(3,'2024-3-5',12000,"compled"),
(4,'2024-4-5',14000,"pending")
;

create table purchase_orderdetails(
id int primary key auto_increment,
purchase_orderid int,
foreign key(purchase_orderid)references purchase_orders(id),
quantity int,
unit_price decimal(10,2),
total_price decimal(10,2)
);
insert into purchase_orderdetails (purchase_orderid,quantity,unit_price,total_price)values
(1,10,800,10000),
(2,16,800,7600),
(3,9,800,4000),
(4,7,800,2000)
;
create table purchase_invoices(
id int primary key auto_increment ,
supplierid int,
foreign key (supplierid)references suppliers(id),
invoice_date date,
due_date date,
total_amount decimal(10.2),
status varchar(100)
);
insert into purchase_invoices(supplierid,invoice_date,due_date,total_amount,status)values
(1,'2024-1-1','2024-2-20',25000,"paid"),
(2,'2024-2-2','2024-3-20',19000,"unpaid"),
(3,'2024-3-4','2024-4-20',20000,"paid"),
(4,'2024-4-2','2024-5-20',15000,"paiding")
;
 -- ================= inventort ================= 
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    sku VARCHAR(50) UNIQUE,
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    min_quantity INT DEFAULT 0,
    max_quantity INT DEFAULT NULL,

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
        ON DELETE CASCADE,

    FOREIGN KEY (warehouse_id)
        REFERENCES warehouses(warehouse_id)
        ON DELETE CASCADE,

    UNIQUE (product_id, warehouse_id)
);
select * from  stock;




INSERT INTO products
(product_name, category_id, sku, price)
VALUES
('Laptop Dell', 1, 'DELL-001', 25000.00),
('Samsung Galaxy S24', 1, 'SAMS24-001', 35000.00),
('T-Shirt Black', 2, 'TSHIRT-B-001', 500.00),
('Office Chair', 3, 'CHAIR-001', 3000.00);


INSERT INTO categories (category_name, description)
VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Clothes and fashion products'),
('Furniture', 'Home and office furniture');


INSERT INTO warehouses (warehouse_name, location)
VALUES
('Cairo Warehouse', 'Cairo'),
('Alexandria Warehouse', 'Alexandria'),
('Giza Warehouse', 'Giza');

INSERT INTO stock
(product_id, warehouse_id, quantity, min_quantity, max_quantity)
VALUES
(1, 1, 50, 10, 100),
(1, 2, 20, 5, 50),
(2, 1, 30, 5, 60),
(3, 3, 100, 20, 200),
(4, 2, 15, 5, 30);

select* from stock;
 -- ================= operations ================= 
 CREATE TABLE projects (
    project_id INT  PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(150) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    status ENUM('PLANNED', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')
        DEFAULT 'PLANNED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * from projects;

CREATE TABLE project_tasks (
    task_id INT  PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    task_name VARCHAR(150) NOT NULL,
    description TEXT,
    start_date DATE,
    due_date DATE,
    status ENUM('TODO', 'IN_PROGRESS', 'COMPLETED')
        DEFAULT 'TODO',

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE CASCADE
);


CREATE TABLE employees_projects (
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    role VARCHAR(100),
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (employee_id, project_id),

    FOREIGN KEY (employee_id)
        REFERENCES employees(id)
        ON DELETE CASCADE,

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE CASCADE
);
alter table employees_projects
add id int  ;
select * from  employees_projects;


CREATE TABLE departments_projects (
    department_id INT NOT NULL,
    project_id INT NOT NULL,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (department_id, project_id,),

    FOREIGN KEY (department_id)REFERENCES departments(id)
        ON DELETE CASCADE,

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE CASCADE
);
alter table departments_projects 
add id int ;
select *  from departments_projects;
CREATE TABLE project_expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    expense_name VARCHAR(150) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    expense_date DATE,
    description TEXT,

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE CASCADE
);


CREATE TABLE project_documents (
    document_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    document_name VARCHAR(150) NOT NULL,
    document_url VARCHAR(500),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE CASCADE
);



INSERT INTO projects
(project_name, description, start_date, end_date, status)
VALUES
('Website Development',
 'Developing a company website',
 '2026-01-01',
 '2026-03-30',
 'IN_PROGRESS'),

('Mobile Application',
 'Building a mobile application',
 '2026-02-01',
 '2026-06-30',
 'PLANNED'),

('Inventory System',
 'Developing an inventory management system',
 '2025-10-01',
 '2026-01-30',
 'COMPLETED');
 
 
 INSERT INTO project_tasks
(project_id, task_name, description, start_date, due_date, status)
VALUES
(1, 'Design Website',
 'Create the website design',
 '2026-01-01',
 '2026-01-20',
 'COMPLETED'),

(1, 'Develop Backend',
 'Build the backend system',
 '2026-01-21',
 '2026-03-01',
 'IN_PROGRESS'),

(2, 'Create App Interface',
 'Design the mobile application interface',
 '2026-02-01',
 '2026-03-01',
 'TODO'),

(3, 'Create Database',
 'Create database tables',
 '2025-10-01',
 '2025-11-01',
 'COMPLETED');
 
 
 INSERT INTO employees_projects
(employee_id, project_id, role)
VALUES
(1, 1, 'Project Manager'),
(2, 1, 'Backend Developer'),
(3, 2, 'Frontend Developer'),
(1, 2, 'Team Leader'),
(2, 3, 'Database Developer');

INSERT INTO departments_projects
(department_id, project_id)
VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 3);

INSERT INTO project_expenses
(project_id, expense_name, amount, expense_date, description)
VALUES
(1, 'Web Hosting', 5000.00, '2026-01-10',
 'Website hosting cost'),

(1, 'Software License', 3000.00, '2026-01-15',
 'Software license purchase'),

(2, 'Development Tools', 7500.00, '2026-02-10',
 'Mobile development tools'),

(3, 'Server Cost', 10000.00, '2025-11-20',
 'Server expenses');
 
 INSERT INTO project_documents
(project_id, document_name, document_url)
VALUES
(1, 'Project Requirements',
 'https://example.com/project-requirements.pdf'),

(1, 'Project Plan',
 'https://example.com/project-plan.pdf'),

(2, 'Mobile App Requirements',
 'https://example.com/mobile-requirements.pdf'),

(3, 'Database Documentation',
 'https://example.com/database-documentation.pdf');
 -- ================= END ================= 


create database review4;

use review4;
-- create the table

create table employee
(id int primary key identity,
name varchar(20),
age int,
department varchar(30));

--add the salry column
alter table employee add salary int;

--see the table structure
exec sp_help employee;

--insert tthe values 
insert into employee values
('padma',23,'developer',30000),
('Latha',21,'tester',40000),
('padmaja',10,'Syber Security',35000),
('Shyam',19,'developer',12000),
('Daamini',24,'tester',34000);

--display the table

select * from employee;

--rename the column department

alter table employee rename column department dept;
exec sp_rename 'employee.department','dept','column'; 

--insert another row
insert into employee values('gaayathri',25,'syber security',23000);

--update salary column

update employee set salary=55000 where id=1;

--deleting all records where age less than 25
delete from employee where age<25;


--Retrive the names of employees in alphabetical order
select * from employee;
select * from employee order by name;

--Retrive the names and salaries of the 5 highest salries

select top 5 * from employee order by salary desc;

--retrive the names whose names start with 'A'

select * from employee where name like 'A%';

--skip first 2 data and retrive next 2 rows

select * from employee order by id offset 2 rows fetch next 2 rows only;

--drop department column
alter table employee drop column dept;

--inner join on employee and department table

create table department 
(d_id int primary key,
d_name varchar(20)
foreign key(d_id) references employee(id));



insert into department values(1,'developer'),(3,'tester'),(4,'syber security'),(5,'developer');

select * from employee;
select * from department;

select e.id,e.name,e.age,d.d_name
from employee e
inner join department d
on e.id=d.d_id;

create table product
(p_id int primary key,
p_name varchar(20),
price int);

insert into product values
(1,'mobile',10000),
(2,'laptop',50000),
(3,'college bag',500),
(4,'bottle',20);

create table customers
(c_id int primary key,
c_name varchar(20),
c_email varchar(50));

insert into customers values
(1,'padma','Padma123@gmail.com'),
(2,'padmaja','Padmaja123@gmail.com'),
(3,'kaavya','kaavya123@gmail.com'),
(5,'Latha','Latha123@gmail.com');

create table orders
(o_id int primary key,
c_id int,
p_id int,
quantity int
foreign key(c_id) references customers(c_id),
foreign key(p_id) references product(p_id));

insert into orders values
(1,1,1,2),
(2,2,2,2),
(3,5,3,2);

select * from product;
select * from customers;
select * from orders;

select o.o_id,c.c_name,p.p_name,o.quantity
from product p
inner join orders o
on p.p_id=o.p_id
inner join customers c
on c.c_id=o.c_id;







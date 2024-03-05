use sample;

CREATE TABLE Student (      
  id int PRIMARY KEY IDENTITY,     
  admission_no varchar(45) unique,  
  first_name varchar(45) NOT NULL,      
  last_name varchar(45) NOT NULL,  
  age int,  
  city varchar(25) NOT NULL      
);    

CREATE TABLE Fee (   
  admission_no varchar(45) primary key,  
  course varchar(45) NOT NULL,      
  amount_paid int, 
  foreign key(admission_no) references Student(admission_no)
  );


INSERT INTO Student (admission_no, first_name, last_name, age, city)       
VALUES (3354,'Latha', 'Evans', 13, 'Texas'),       
(2135, 'Paul', 'Ward', 15, 'Alaska'),       
(4321, 'Peter', 'Bennett', 14, 'California'),    
(4213,'Carlos', 'Patterson', 17, 'New York'),       
(5112, 'Rose', 'Huges', 16, 'Florida'),  
(6113, 'Marielia', 'Simmons', 15, 'Arizona'),    
(7555,'Antonio', 'Butler', 14, 'New York'),       
(8345, 'Daamini', 'Cox', 13, 'California'); 


INSERT INTO Fee (admission_no, course, amount_paid)       
VALUES (3354,'Java', 20000),       
(7555, 'Android', 22000),       
(4321, 'Python', 18000),    
(8345,'SQL', 15000),       
(5112, 'Machine Learning', 30000);  

select * from student;
select * from fee;

select s.id,s.first_name,s.city,f.admission_no,f.course
from student s
inner join fee f
on s.admission_no=f.admission_no;

select s.id,s.first_name,s.city,f.admission_no,f.course
from student s
join fee f
on s.admission_no=f.admission_no;

select * from student;
select * from fee;
--full join
select s.id,s.first_name,s.city,f.admission_no,f.course
from student s
full join fee f
on s.admission_no=f.admission_no;

--left outer join
select s.id,s.first_name,s.city,f.admission_no,f.course
from student s
left join fee f
on s.admission_no=f.admission_no;
-- right outer
select s.id,s.first_name,s.city,f.admission_no,f.course
from student s
right outer join fee f
on s.admission_no=f.admission_no;

select * from student;
select * from fee;
--self join
select s.id,s.first_name,s1.city
from student s,student s1
where s.Id!=s1.id and  s.city=s1.city;


select * from student;
select * from fee;
--self join
select s.id,s.first_name,s1.admission_no
from student s,student s1
where s.admission_no=s1.admission_no;

select * from student;
select * from fee;
--cross join
select s.id,s.first_name,f.admission_no
from student s
cross join fee f;

--inner join
select s.id,s.first_name,f.admission_no
from student s
join fee f
on s.admission_no=f.admission_no;

create table 
		customers(cutomerid int primary key,
		name varchar(50)not null,
        email varchar(50) unique,
		city varchar(50) default "unkonwn",
		age int check (age >= 18)
);

INSERT into customers(cutomerid,name,email,city,age)
values(101,"ram","ram@123.tn","cbe",21),
		(102,"sam","sam@123.com","kl",22),
			(103,"raja","raja@123.com","tn",33),
				(104,"vike","vike@123.com","kl",22),
					(105,"joi","joi@123.com","up",27),
						(106,"raji","raji@123.tn","cbe",21),
							(107,"gobi","gobi@123.com","dl",42),
								(108,"vera","vera@123.com",default,33),
									(109,"balu","balu@123.com","kl",22),
										(110,"kaml","kaml@123.com",default,29);


select * from customers ;
select * from customers where age >=30;

drop table sales_data;

create table 
	sales_data(cutomerid int primary key,
		product varchar(50)not null,
		productquantity int not null,
		productprice int not null,
			foreign key (cutomerid) references customers(cutomerid)
);

INSERT into sales_data(cutomerid,product,productquantity,productprice)
values(101,"laptop1",3,20000),
		(102,"laptop5",2,110000),
		  (103,"laptop3",1,40000),
			(104,"laptop1",1,20000),
			  (105,"laptop10",9,110000),
				(106,"laptop7",6,90000),
				  (107,"laptop5",10,110000),
					(108,"laptop1",3,20000),
					  (109,"laptop5",22,110000),
					    (110,"laptop3",6,40000);

select * from 
	customers
		where name like "%a";

select * from
	customers
		order by age asc;

update customers
	set city = "tn"
	where cutomerid="101";

select city,count(name) as totalcutomer
		from customers
			group by city 
				order by totalcutomer asc;

select * from sales_data;

select e.name,d.cutomerid,e.city,d.product
	from customers e
		inner join sales_data d
			on e.cutomerid=d.cutomerid ;

select c.name,c.cutomerid,c.city,s.product,(s.productquantity*s.productprice)
 as total_sales
		from customers c
			left join sales_data s
   on c.cutomerid=s.cutomerid ; 

ALTER TABLE sales_data
		DROP COLUMN total_amount;

ALTER TABLE
	sales_data
	add total_sales decimal(10,2);



select c.name,c.city, c.cutomerid,s.product,total_sales 
		from sales_data s
		join customers c
		on s.cutomerid=c.cutomerid;

SET 
	SQL_SAFE_UPDATES = 0;
	UPDATE sales_data
SET 
	total_sales = productquantity * productprice;
															-- Optional: re-enable
SET
	SQL_SAFE_UPDATES = 1;


INSERT into customers(cutomerid,name,email,city,age)
values(111,"ramram","ramram@123.tn","cbe",24),
          (112,"samsam","samsam@123.com","kl",24),
             (113,"rajaram","rajaram@123.com","tn",23),
                 (114,"vimal","vimal@123.com","kl",62),
                    (115,"kamala","kamala@123.com","up",57),
                (116,"rajaram","rajaram@123.tn","cbe",41), 
             (117,"gobiram","gobiram@123.com","dl",42),
          (118,"PRAVEEN","PRAVEEN@123.com",default,33),
        (119,"baluRAM","baluRAM@123.com","kl",19),
	(120,"KARTHIK","KARTHIK@123.com",default,29);

INSERT into sales_data(cutomerid,product,productquantity,productprice)
values(111,"laptop1",3,20000),
        (112,"laptop5",2,110000),
           (113,"laptop3",1,40000),
             (114,"laptop1",1,20000),
               (115,"laptop10",9,110000),
              (116,"laptop7",6,90000),
           (117,"laptop5",10,110000),
       (118,"laptop1",3,20000),
    (119,"laptop5",22,110000),
(120,"laptop3",6,40000);

 -- evennumber
select * from 
  sales_data
     where productquantity % 2 = 0  ;


-- same city as "rajaram"
select * from customers
	where city = (select city 
                  from customers 
				   where name = "ram"
);


-- list the name, city, product,quantity unique values : "DISTINCT" Not supported in some DBs
select distinct 
		c.name, c.city,p.product,p.productquantity,p.productprice
			from customers c
				join sales_data p 
			on c.cutomerid = p.cutomerid;

-- find the laptop highest number of unique customer
SELECT product, COUNT(DISTINCT cutomerid) AS unique_customers
		FROM sales_data
			GROUP BY product
			ORDER BY unique_customers DESC
LIMIT 1;


-- find the which laptop max total sales
SELECT product, MAX(total_sales) AS HighestSales
			FROM sales_data
				GROUP BY product
			ORDER BY HighestSales DESC 
limit 1 ;























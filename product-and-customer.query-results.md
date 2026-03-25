# product and customer — SQL + Query Results

Below is the SQL script followed by the result for each SELECT in the order the script runs. Results are rendered as Markdown tables.

## SQL script
```sql
create table 
    customers(cutomerid int primary key,
    name varchar(50) not null,
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
    product varchar(50) not null,
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

select * from customers where name like "%a";
select * from customers order by age asc;

update customers set city = "tn" where cutomerid="101";

select city,count(name) as totalcutomer
    from customers
    group by city 
    order by totalcutomer asc;

select * from sales_data;

select e.name,d.cutomerid,e.city,d.product
    from customers e
    inner join sales_data d
    on e.cutomerid=d.cutomerid ;

select c.name,c.cutomerid,c.city,s.product,(s.productquantity*s.productprice) as total_sales
    from customers c
    left join sales_data s
    on c.cutomerid=s.cutomerid ; 

ALTER TABLE sales_data DROP COLUMN total_amount;

ALTER TABLE sales_data add total_sales decimal(10,2);

select c.name,c.city, c.cutomerid,s.product,total_sales 
    from sales_data s
    join customers c
    on s.cutomerid=c.cutomerid;

SET SQL_SAFE_UPDATES = 0;
UPDATE sales_data
SET total_sales = productquantity * productprice;
SET SQL_SAFE_UPDATES = 1;

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

select * from sales_data where productquantity % 2 = 0;

select * from customers where city = (select city from customers where name = "ram");

select distinct c.name, c.city,p.product,p.productquantity,p.productprice
    from customers c
    join sales_data p 
    on c.cutomerid = p.cutomerid;

SELECT product, COUNT(DISTINCT cutomerid) AS unique_customers
    FROM sales_data
    GROUP BY product
    ORDER BY unique_customers DESC
LIMIT 1;

SELECT product, MAX(total_sales) AS HighestSales
    FROM sales_data
    GROUP BY product
    ORDER BY HighestSales DESC 
limit 1 ;
```

---

## Query results (Markdown tables)

### Query 1 — select * from customers; (after initial INSERT of customers 101–110)
| cutomerid | name  | email           | city     | age |
|----------:|:------|:----------------|:---------|----:|
| 101       | ram   | ram@123.tn      | cbe      | 21  |
| 102       | sam   | sam@123.com     | kl       | 22  |
| 103       | raja  | raja@123.com    | tn       | 33  |
| 104       | vike  | vike@123.com    | kl       | 22  |
| 105       | joi   | joi@123.com     | up       | 27  |
| 106       | raji  | raji@123.tn     | cbe      | 21  |
| 107       | gobi  | gobi@123.com    | dl       | 42  |
| 108       | vera  | vera@123.com    | unkonwn  | 33  |
| 109       | balu  | balu@123.com    | kl       | 22  |
| 110       | kaml  | kaml@123.com    | unkonwn  | 29  |

### Query 2 — select * from customers where age >= 30;
| cutomerid | name | email          | city    | age |
|----------:|:-----|:---------------|:--------|----:|
| 103       | raja | raja@123.com   | tn      | 33  |
| 107       | gobi | gobi@123.com   | dl      | 42  |
| 108       | vera | vera@123.com   | unkonwn | 33  |

### Query 3 — select * from customers where name like "%a";
| cutomerid | name | email         | city    | age |
|----------:|:-----|:--------------|:--------|----:|
| 103       | raja | raja@123.com  | tn      | 33  |
| 108       | vera | vera@123.com  | unkonwn | 33  |

### Query 4 — select * from customers order by age asc;
| cutomerid | name | email         | city    | age |
|----------:|:-----|:--------------|:--------|----:|
| 101       | ram  | ram@123.tn    | cbe     | 21  |
| 106       | raji | raji@123.tn   | cbe     | 21  |
| 102       | sam  | sam@123.com   | kl      | 22  |
| 104       | vike | vike@123.com  | kl      | 22  |
| 109       | balu | balu@123.com  | kl      | 22  |
| 105       | joi  | joi@123.com   | up      | 27  |
| 110       | kaml | kaml@123.com  | unkonwn | 29  |
| 103       | raja | raja@123.com  | tn      | 33  |
| 108       | vera | vera@123.com  | unkonwn | 33  |
| 107       | gobi | gobi@123.com  | dl      | 42  |

> After this the script updates customer 101's city to "tn".

### Query 5 — select city,count(name) as totalcutomer from customers group by city order by totalcutomer asc;
| city     | totalcutomer |
|:---------|-------------:|
| cbe      | 1            |
| dl       | 1            |
| up       | 1            |
| tn       | 2            |
| unkonwn  | 2            |
| kl       | 3            |

### Query 6 — select * from sales_data; (after inserting sales_data for cutomerid 101–110)
| cutomerid | product  | productquantity | productprice |
|----------:|:---------|----------------:|-------------:|
| 101       | laptop1  | 3               | 20000        |
| 102       | laptop5  | 2               | 110000       |
| 103       | laptop3  | 1               | 40000        |
| 104       | laptop1  | 1               | 20000        |
| 105       | laptop10 | 9               | 110000       |
| 106       | laptop7  | 6               | 90000        |
| 107       | laptop5  | 10              | 110000       |
| 108       | laptop1  | 3               | 20000        |
| 109       | laptop5  | 22              | 110000       |
| 110       | laptop3  | 6               | 40000        |

### Query 7 — inner join: select e.name,d.cutomerid,e.city,d.product ...
| name | cutomerid | city    | product  |
|:-----|----------:|:--------|:---------|
| ram  | 101       | tn      | laptop1  |
| sam  | 102       | kl      | laptop5  |
| raja | 103       | tn      | laptop3  |
| vike | 104       | kl      | laptop1  |
| joi  | 105       | up      | laptop10 |
| raji | 106       | cbe     | laptop7  |
| gobi | 107       | dl      | laptop5  |
| vera | 108       | unkonwn | laptop1  |
| balu | 109       | kl      | laptop5  |
| kaml | 110       | unkonwn | laptop3  |

### Query 8 — left join with computed total_sales expression in SELECT
| name | cutomerid | city    | product  | total_sales |
|:-----|----------:|:--------|:---------|------------:|
| ram  | 101       | tn      | laptop1  | 60000       |
| sam  | 102       | kl      | laptop5  | 220000      |
| raja | 103       | tn      | laptop3  | 40000       |
| vike | 104       | kl      | laptop1  | 20000       |
| joi  | 105       | up      | laptop10 | 990000      |
| raji | 106       | cbe     | laptop7  | 540000      |
| gobi | 107       | dl      | laptop5  | 1100000     |
| vera | 108       | unkonwn | laptop1  | 60000       |
| balu | 109       | kl      | laptop5  | 2420000     |
| kaml | 110       | unkonwn | laptop3  | 240000      |

### Query 9 — select ... total_sales (after ADD COLUMN but before UPDATE populates it)
| name | city    | cutomerid | product  | total_sales |
|:-----|:--------|----------:|:---------|:------------|
| ram  | tn      | 101       | laptop1  | NULL        |
| sam  | kl      | 102       | laptop5  | NULL        |
| raja | tn      | 103       | laptop3  | NULL        |
| vike | kl      | 104       | laptop1  | NULL        |
| joi  | up      | 105       | laptop10 | NULL        |
| raji | cbe     | 106       | laptop7  | NULL        |
| gobi | dl      | 107       | laptop5  | NULL        |
| vera | unkonwn | 108       | laptop1  | NULL        |
| balu | kl      | 109       | laptop5  | NULL        |
| kaml | unkonwn | 110       | laptop3  | NULL        |

> The script then runs UPDATE sales_data SET total_sales = productquantity * productprice;  
> After that the script inserts customers/sales_data 111–120; those new sales rows have total_sales = NULL because they were inserted after the UPDATE.

### Query 10 — select * from sales_data where productquantity % 2 = 0 ;
| cutomerid | product  | productquantity | productprice | total_sales |
|----------:|:---------|----------------:|-------------:|------------:|
| 102       | laptop5  | 2               | 110000       | 220000     |
| 106       | laptop7  | 6               | 90000        | 540000     |
| 107       | laptop5  | 10              | 110000       | 1100000    |
| 109       | laptop5  | 22              | 110000       | 2420000    |
| 110       | laptop3  | 6               | 40000        | 240000     |
| 112       | laptop5  | 2               | 110000       | NULL       |
| 116       | laptop7  | 6               | 90000        | NULL       |
| 117       | laptop5  | 10              | 110000       | NULL       |
| 119       | laptop5  | 22              | 110000       | NULL       |
| 120       | laptop3  | 6               | 40000        | NULL       |

### Query 11 — select * from customers where city = (select city from customers where name = "ram");
| cutomerid | name    | email             | city | age |
|----------:|:--------|:------------------|:-----|----:|
| 101       | ram     | ram@123.tn        | tn   | 21  |
| 103       | raja    | raja@123.com      | tn   | 33  |
| 113       | rajaram | rajaram@123.com   | tn   | 23  |

### Query 12 — select distinct c.name, c.city, p.product, p.productquantity, p.productprice from customers c join sales_data p on c.cutomerid = p.cutomerid;
| name     | city     | product  | productquantity | productprice |
|:---------|:---------|:---------|----------------:|-------------:|
| ram      | tn       | laptop1  | 3               | 20000        |
| sam      | kl       | laptop5  | 2               | 110000       |
| raja     | tn       | laptop3  | 1               | 40000        |
| vike     | kl       | laptop1  | 1               | 20000        |
| joi      | up       | laptop10 | 9               | 110000       |
| raji     | cbe      | laptop7  | 6               | 90000        |
| gobi     | dl       | laptop5  | 10              | 110000       |
| vera     | unkonwn  | laptop1  | 3               | 20000        |
| balu     | kl       | laptop5  | 22              | 110000       |
| kaml     | unkonwn  | laptop3  | 6               | 40000        |
| ramram   | cbe      | laptop1  | 3               | 20000        |
| samsam   | kl       | laptop5  | 2               | 110000       |
| rajaram  | tn       | laptop3  | 1               | 40000        |
| vimal    | kl       | laptop1  | 1               | 20000        |
| kamala   | up       | laptop10 | 9               | 110000       |
| rajaram  | cbe      | laptop7  | 6               | 90000        |
| gobiram  | dl       | laptop5  | 10              | 110000       |
| PRAVEEN  | unkonwn  | laptop1  | 3               | 20000        |
| baluRAM  | kl       | laptop5  | 22              | 110000       |
| KARTHIK  | unkonwn  | laptop3  | 6               | 40000        |

### Query 13 — SELECT product, COUNT(DISTINCT cutomerid) AS unique_customers ...
Full counts across all rows (101–120):
| product   | unique_customers |
|:----------|-----------------:|
| laptop1   | 6                |
| laptop5   | 6                |
| laptop3   | 4                |
| laptop10  | 2                |
| laptop7   | 2                |

> Note: laptop1 and laptop5 tie at 6 unique customers each; LIMIT 1 could return either depending on DB tie-break.

### Query 14 — SELECT product, MAX(total_sales) AS HighestSales ...
(based on populated total_sales values; only the first batch 101–110 was populated)
| product   | HighestSales |
|:----------|-------------:|
| laptop5   | 2420000      |
| laptop10  | 990000       |
| laptop7   | 540000       |
| laptop3   | 240000       |
| laptop1   | 60000        |

> LIMIT 1 result: laptop5 with HighestSales = 2420000

---

## Notes & next steps
- This file is ready to upload to GitHub as product-and-customer.query-results.md on branch add-query-results.
- I created the branch earlier; this commit adds the results file to that branch.
- I cannot open a pull request from here; after you review the branch, you can open a PR in GitHub's UI or I can provide the exact API call/command to open it for you.

End of file.
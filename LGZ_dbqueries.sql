/*
Team Name: LGZ
Members:Bahar Golmohammadi
		Li Liang
		Julie Zhou
*/

use MUJIDB

select*
from Customer;

select*
from Supplier;

select* 
from CountryRegion;

select*
from Product;

select*
from Purchase;

select*
from Orders;

select*
from Employee;

/*Aggregate Function*/
select c.CustomerID, c.FirstName, c.LastName, SUM(ordertotal) as OrderTotal
from Orders as o join Customer as c
on o.CustomerID = c.CustomerID
group by c.CustomerID, c.FirstName, c.LastName;

/*Full Outer Join*/
select FirstName, LastName, OrderID
from Purchase as p 
full outer join Employee as e
on p.EmployeeID = e.EmployeeID;

/*Inner Join*/
select FirstName, LastName, OrderID
from Purchase as p 
inner join Employee as e
on p.EmployeeID = e.EmployeeID;
/*Full outer join returns all the data for the two tables, Employee and Purchase. 
To a manager in MUJI, this might be useful becasue it tells which employees have and have not made any sales. 
For example, Olivia Logan has not made any sales, therefore, the data returned a null value for OrderID.
Whereas inner join only returns information about employees who have made a sale. */

/*Subquery*/
select OrderID, OrderTotal
from Orders
where Year(OrderDate)=2016
and OrderTotal>
(select avg(OrderTotal)
from Orders
where Year(OrderDate)=2016
) 

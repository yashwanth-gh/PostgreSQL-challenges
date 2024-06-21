CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    managerId INT
);
INSERT INTO Employee (id, name, department, managerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);


select * from Employee;

-- TO GET ALL THE MANAGER WHO HAVE AT LEAST 5 REPORTS
select e.managerid,count(*) as reports
from employee e
group by e.managerid
having count(*) > 4
order by reports desc;

-- TO GET ALL THE MANGERS NAME FROM THE PREVIOUS TABLE
select em.name
from employee em
join (select e.managerid,count(*) as reports
	from employee e
	group by e.managerid
	having count(*) > 4
	order by reports desc) rp
on rp.managerid = em.id;
	
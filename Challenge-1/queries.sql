-- drop table users;
create table users
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

insert into users values
(1, 'Sumit', 'sumit@gmail.com'),
(2, 'Reshma', 'reshma@gmail.com'),
(3, 'Farhana', 'farhana@gmail.com'),
(4, 'Robin', 'robin@gmail.com'),
(5, 'Robin', 'robin@gmail.com');

select * from users;

-- SOLUTION :
-- I USED WINDOW FUNTION AND PARTION TO GET THIS :
select x.user_id, x.user_name,x.email
from
	(select *,
	row_number() over (partition by user_name order by user_id) as rn
	from users u
	order by user_id) as x
where x.rn <> 1;



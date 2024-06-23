CREATE TABLE Signups (
    user_id INT PRIMARY KEY,
    time_stamp TIMESTAMP
);


INSERT INTO Signups (user_id, time_stamp) VALUES
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');


CREATE TABLE Confirmations (
    user_id INT,
    time_stamp TIMESTAMP,
    action VARCHAR(10),
    PRIMARY KEY (user_id, time_stamp),
    FOREIGN KEY (user_id) REFERENCES Signups(user_id)
);


INSERT INTO Confirmations (user_id, time_stamp, action) VALUES
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-07-14 14:00:00', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 12:58:28', 'confirmed'),
(7, '2021-06-14 13:59:27', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-02-28 23:59:59', 'timeout');

select s.user_id,count(c.action)
from signups s
left join confirmations c
on s.user_id = c.user_id
group by s.user_id;

SELECT t.user_id, t.action as timeout
FROM (
	select s.user_id,c.action
	from signups s
	left join confirmations c
	on s.user_id = c.user_id
) as t
WHERE t.action = 'timeout' OR t.action IS NULL;

SELECT t.user_id, t.action as confirmed
FROM (
	select s.user_id,c.action
	from signups s
	left join confirmations c
	on s.user_id = c.user_id
) as t
WHERE t.action = 'confirmed' OR t.action IS NULL;

SELECT t.user_id, count(t.action) as confirmed
FROM (
	select s.user_id,c.action
	from signups s
	left join confirmations c
	on s.user_id = c.user_id
) as t
WHERE t.action = 'confirmed' OR t.action IS NULL
group by t.user_id;

select s.user_id,count(c.action)
from signups s
left join confirmations c
on s.user_id = c.user_id
group by s.user_id
order by s.user_id;


SELECT sp.user_id,COALESCE(f.confirmed,0)
from (
SELECT t.user_id, count(t.action) as confirmed
FROM (
	select s.user_id,c.action
	from signups s
	left join confirmations c
	on s.user_id = c.user_id
) as t
WHERE t.action = 'confirmed' OR t.action IS NULL
group by t.user_id) as f
right join Signups sp
on f.user_id = sp.user_id
order by sp.user_id;

SELECT tba.user_id,(tba.count/tbb.coalesce) as confirmation_rate
FROM (select s.user_id,count(c.action)
from signups s
left join confirmations c
on s.user_id = c.user_id
group by s.user_id
order by s.user_id) tba
join (
SELECT sp.user_id, COALESCE(f.confirmed, 0) AS confirmed
FROM (
    SELECT s.user_id, COUNT(c.action) AS confirmed
    FROM signups s
    LEFT JOIN confirmations c ON s.user_id = c.user_id
    WHERE c.action = 'confirmed' OR c.action IS NULL
    GROUP BY s.user_id
) AS f
RIGHT JOIN signups sp ON f.user_id = sp.user_id
ORDER BY sp.user_id) tbb
on tba.user_id = tbb.user_id;

-- -correct
SELECT sp.user_id, COALESCE(f.confirmed, 0) AS confirmed
FROM (
    SELECT s.user_id, COUNT(c.action) AS confirmed
    FROM signups s
    LEFT JOIN confirmations c ON s.user_id = c.user_id
    WHERE c.action = 'confirmed' OR c.action IS NULL
    GROUP BY s.user_id
) AS f
RIGHT JOIN signups sp ON f.user_id = sp.user_id
ORDER BY sp.user_id;


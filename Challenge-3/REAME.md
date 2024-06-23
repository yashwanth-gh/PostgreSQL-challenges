## Problem Description

You are provided with two tables: `Signups` and `Confirmations`. The goal is to calculate the confirmation rate for each user. The confirmation rate is defined as the number of 'confirmed' messages divided by the total number of requested confirmation messages. If a user did not request any confirmation messages, their confirmation rate should be 0. The result should be rounded to two decimal places.

## Table Structures

### Signups Table

This table contains information about the signup time for each user.

```
+---------+---------------------+
| user_id | time_stamp          |
+---------+---------------------+
| int     | datetime            |
+---------+---------------------+
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |
+---------+---------------------+
```

### Confirmations Table

This table contains information about the confirmation messages requested by users. Each row indicates that a user requested a confirmation message at a certain time and whether that message was confirmed or expired.

```
+---------+---------------------+-----------+
| user_id | time_stamp          | action    |
+---------+---------------------+-----------+
| int     | datetime            | ENUM      |
+---------+---------------------+-----------+
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |
+---------+---------------------+-----------+
```

## Example

### Input

Signups Table:

```
+---------+---------------------+
| user_id | time_stamp          |
+---------+---------------------+
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |
+---------+---------------------+
```

Confirmations Table:

```
+---------+---------------------+-----------+
| user_id | time_stamp          | action    |
+---------+---------------------+-----------+
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |
+---------+---------------------+-----------+
```

### Output

```
+---------+-------------------+
| user_id | confirmation_rate |
+---------+-------------------+
| 3       | 0.00              |
| 7       | 1.00              |
| 2       | 0.50              |
| 6       | 0.00              |
+---------+-------------------+
```

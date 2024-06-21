# Write a SQL Query to fetch all the duplicate records in a table.

### **Table Name**: USERS

### **Note**: Record is considered duplicate if a user name is present more than once.

**Approach**: Partition the data based on user name and then give a row number to each of the partitioned user name. If a user name exists more than once then it would have multiple row numbers. Using the row number which is other than 1, we can identify the duplicate records.

#### TABLE :

```
+---------+-----------+-------------------+
| user_id | user_name |      email        |
+---------+-----------+-------------------+
|    1    |   Sumit   | sumit@gmail.com   |
|    2    |   Reshma  | reshma@gmail.com  |
|    3    |  Farhana  | farhana@gmail.com |
|    4    |   Robin   | robin@gmail.com   |
|    5    |   Robin   | robin@gmail.com   |
+---------+-----------+-------------------+
```

#### EXPECTED :

```
+---------+-----------+-------------------+
| user_id | user_name |      email        |
+---------+-----------+-------------------+
|    5    |   Robin   | robin@gmail.com   |
+---------+-----------+-------------------+

```

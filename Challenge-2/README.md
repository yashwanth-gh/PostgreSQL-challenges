# Problem: Finding Managers with at least Five Direct Reports

## Table: Employee

### Schema

| Column Name | Type    | Description                                    |
| ----------- | ------- | ---------------------------------------------- |
| id          | int     | Primary key for employee identification.       |
| name        | varchar | Name of the employee.                          |
| department  | varchar | Department in which the employee works.        |
| managerId   | int     | ID of the manager for the employee (nullable). |

### Constraints

- Each row represents an employee with their department and optionally their manager.
- If `managerId` is `null`, the employee does not have a manager.
- No employee can be their own manager.

### Problem Statement

Write a SQL query to find managers who have at least five direct reports.

### Example

#### Input

Employee table:

```
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
```

#### Output

```
+------+
| name |
+------+
| John |
+------+
```

### Explanation

- John is the manager (`managerId = null`) and has five direct reports (Dan, James, Amy, Anne, and Ron).

---

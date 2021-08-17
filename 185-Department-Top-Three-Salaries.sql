select rightTable.Name as Department, leftTable.Name as Employee, Salary
from Employee as leftTable
         join
     (
         select Id, Name from Department
     )rightTable
     on leftTable.DepartmentId = rightTable.Id
where (
          select count(distinct Salary)
          from Employee
          where Salary > leftTable.Salary AND DepartmentId = rightTable.Id
      ) < 3 and leftTable.DepartmentId = rightTable.Id;


SELECT d.Name as Department,
       e.Name as Employee,
       e.Salary as Salary
FROM Department d, Employee e
WHERE(
         SELECT COUNT(distinct Salary)
         FROM Employee
         WHERE Salary > e.Salary AND DepartmentId = d.Id
     ) < 3 AND e.DepartmentId = d.Id
ORDER BY d.Id, e.Salary desc;

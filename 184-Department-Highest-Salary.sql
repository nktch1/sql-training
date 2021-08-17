select rightTable.Name as Department, leftTable.Name as Employee, Salary
from Employee as leftTable
     join
     (
         select Id, Name from Department
     ) rightTable
     on leftTable.DepartmentId = rightTable.Id
where Salary = (select max(Salary) from Employee where DepartmentId = leftTable.DepartmentId)
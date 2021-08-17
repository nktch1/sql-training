select tableLeft.Name as Employee
from Employee tableLeft
    join (
        select Id, Name, Salary, ManagerID from Employee
    ) tableRight
    on tableLeft.ManagerId=tableRight.Id
where tableLeft.Salary > tableRight.Salary
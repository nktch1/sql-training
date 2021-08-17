select p1.id
from Weather p1
     join Weather p2
          on p1.Temperature > p2.Temperature and DATEDIFF(p1.recordDate, p2.recordDate) = 1 ;
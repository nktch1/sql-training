select
    if(g.Grade < 8, NULL, s.Name),                          # если оценка меньше 8, вывести NULL
    g.Grade,
    s.Marks
from Students s
         join Grades g
              on s.Marks between g.Min_Mark and g.Max_Mark  # объединить таблицы по оценке в интервале
order by g.Grade desc, s.Name                               # отсортировать по оценке и имени
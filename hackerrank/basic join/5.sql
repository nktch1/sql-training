select h.hacker_id, h.name, count(*) as c_count
from Hackers h
         join Challenges c
              on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name

having
        c_count =
        (
            # просто находится максимальный счетчик
            # и сравнивается со счетчиком из верхнего селекта
            select max(temp1.cnt) from
            (
                select count(*) as cnt
                from Challenges
                group by hacker_id
            ) temp1
        )

        or c_count in
        (
            # проверка на наличие дубликатов
            select temp2.cnt from
            (
                select count(*) as cnt
                from challenges
                group by hacker_id
            ) temp2

            group by temp2.cnt
            having count(temp2.cnt) = 1
        )

order by c_count desc, h.hacker_id
# посчитать сумму максимальных результатов по каждому заданию
select h.hacker_id, h.name, sum(t.score) as sum_score
from
     # найти максимальный результат каждого участника для каждого задания
    (
        select s.hacker_id, max(score) as score
        from Submissions s
        group by s.challenge_id, s.hacker_id
    ) t

    join Hackers h on t.hacker_id = h.hacker_id

group by h.hacker_id, h.name
# убрать нулевые результаты
having sum_score > 0
order by sum_score DESC, h.hacker_id, h.name
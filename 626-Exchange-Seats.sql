select
    (
        case
            when id % 2 = 0 then id - 1
            when id % 2 = 1 and id != t.cnt then id + 1
            else id
            end
        ) as id, student
from
    seat, (select count(*) as cnt from seat) as t
order by id
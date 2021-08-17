select w.id, wp.age, w.coins_needed, w.power
from Wands w
         join Wands_property wp
             # поиск минимальных по стоимости палочек
             # совпадающих по коду, исключая "злые" палочки
              on w.code = wp.code and wp.is_evil = 0 and w.coins_needed =
                 (
                     select min(coins_needed)
                     from Wands
                     where code = wp.code and power = w.power
                 )
order by w.power desc, wp.age desc
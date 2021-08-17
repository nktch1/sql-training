select Email from
    (
        select Email, count(Email) as cnt
        from Person
        group by Email
    ) tableWithCounter
where tableWithCounter.cnt > 1
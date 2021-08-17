SELECT CITY.NAME FROM CITY                              # выбрать имена городов
LEFT JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE    # объединить таблицу стран и городов по идентификатору страны
WHERE COUNTRY.CONTINENT = 'Africa'                      # выбрать только страны с Африканского континента

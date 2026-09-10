WITH filtered_sports AS (
    -- 1. Считаем статистику для Летних Игр
    SELECT 
        'Летние игры' as season,
        sport,
        ROUND(AVG(age::NUMERIC), 1) as avg_age,
        COUNT(DISTINCT id) as total_athletes
    FROM study_db_scheme.athletes_summer_games
    WHERE age IS NOT NULL AND age != 'NA' AND age != ''
    GROUP BY sport
    HAVING COUNT(DISTINCT id) > 500

    UNION ALL

    -- 2. Считаем статистику для Зимних Игр
    SELECT 
        'Зимние игры' as season,
        sport,
        ROUND(AVG(age::NUMERIC), 1) as avg_age,
        COUNT(DISTINCT id) as total_athletes
    FROM study_db_scheme.olympic_winter_results
    WHERE age IS NOT NULL AND age != 'NA' AND age != ''
    GROUP BY sport
    HAVING COUNT(DISTINCT id) > 500
)
-- Выводим результаты
(
    -- 5 видов спорта с самым высоким средним возрастом (среди всех сезонов)
    SELECT 'Самый высокий средний возраст' as "Категория", season as "Сезон", sport as "Вид спорта", avg_age as "Средний возраст", total_athletes as "Всего атлетов"
    FROM filtered_sports
    ORDER BY avg_age DESC
    LIMIT 5
)
UNION ALL
(
    -- 5 видов спорта с самым низким средним возрастом (среди всех сезонов)
    SELECT 'Самый низкий средний возраст' as "Категория", season as "Сезон", sport as "Вид спорта", avg_age as "Средний возраст", total_athletes as "Всего атлетов"
    FROM filtered_sports
    ORDER BY avg_age ASC
    LIMIT 5
)
ORDER BY "Категория" DESC, "Средний возраст" DESC;

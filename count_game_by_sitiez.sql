(
    -- 1. ТОП-10 городов для ЛЕТНИХ Олимпиад
    SELECT 
        'Летние игры' AS "Сезон",
        city AS "Город", 
        COUNT(DISTINCT games) AS "Количество Олимпиад"
    FROM study_db_scheme.athletes_summer_games
    GROUP BY city
    ORDER BY "Количество Олимпиад" DESC
    LIMIT 10
)
UNION ALL
(
    -- 2. ТОП-10 городов для ЗИМНИХ Олимпиад
    SELECT 
        'Зимние игры' AS "Сезон",
        city AS "Город", 
        COUNT(DISTINCT games) AS "Количество Олимпиад"
    FROM study_db_scheme.olympic_winter_results
    GROUP BY city
    ORDER BY "Количество Олимпиад" DESC
    LIMIT 10
);

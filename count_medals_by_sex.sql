SELECT 
    sex AS "Пол", 
    medal AS "Тип медали", 
    COUNT(*) AS "Количество медалей"
FROM study_db_scheme.athletes_summer_games
WHERE medal IS NOT NULL 
  AND medal IN ('Gold', 'Silver', 'Bronze') -- оставляем только эти три вида медалей
GROUP BY sex, medal
ORDER BY sex ASC, 
         CASE medal 
            WHEN 'Gold' THEN 1 
            WHEN 'Silver' THEN 2 
            WHEN 'Bronze' THEN 3 
         END ASC;

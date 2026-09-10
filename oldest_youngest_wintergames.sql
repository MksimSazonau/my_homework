(
    SELECT 'Самый молодой (Зима)' as type, name, sex, ROUND(age::NUMERIC) as final_age, team, games, sport, event, medal
    FROM study_db_scheme.olympic_winter_results
    WHERE age IS NOT NULL AND age != 'NA' AND age != '' 
      AND medal IS NOT NULL AND medal NOT IN ('NA', 'No medal')
    ORDER BY age::NUMERIC ASC LIMIT 1
)
UNION ALL
(
    SELECT 'Самый пожилой (Зима)' as type, name, sex, ROUND(age::NUMERIC) as final_age, team, games, sport, event, medal
    FROM study_db_scheme.olympic_winter_results
    WHERE age IS NOT NULL AND age != 'NA' AND age != '' 
      AND medal IS NOT NULL AND medal NOT IN ('NA', 'No medal')
    ORDER BY age::NUMERIC DESC LIMIT 1
);

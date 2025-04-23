SELECT team_name, AVG(average_rushing_yards_per_attempt::FLOAT) AS avg_rush
FROM rushingreceivingdata
WHERE team_name = :team_name
GROUP BY team_name;

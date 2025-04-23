-- This SQL query retrieves the average rushing yards for each team from the rushingreceivingdata table.
SELECT team_name, AVG(rushing_yards) as avg_rush 
FROM rushingreceivingdata 
GROUP BY team_name;

-- Sort players by rank and position
SELECT player_name, position, rank FROM quarterbackdata
UNION
SELECT player_name, position, rank FROM rushingreceivingdata
GROUP BY position, 
ORDER BY rank;
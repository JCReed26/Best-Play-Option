SELECT player_name, position
FROM quarterbackdata
WHERE team_name = $1
UNION
SELECT player_name, position
FROM rushingreceivingdata
WHERE team_name = $1;
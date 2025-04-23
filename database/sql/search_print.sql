SELECT player_name, position FROM quarterbackdata WHERE team_name = :team_name
UNION
SELECT player_name, position FROM rushingreceivingdata WHERE team_name = :team_name;

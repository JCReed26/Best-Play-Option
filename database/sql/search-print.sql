SELECT player_name, position, rank FROM quarterbackdata WHERE team_name = :team_name
UNION
SELECT player_name, position, rank FROM rushingreceivingdata WHERE team_name = :team_name;

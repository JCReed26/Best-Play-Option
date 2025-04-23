-- Sort players by position
SELECT team_name, player_name, position, rank FROM 
(
    SELECT team_name, player_name, position, rank FROM quarterbackdata WHERE team_name = %s
    UNION
    SELECT team_name, player_name, position, rank FROM rushingreceivingdata WHERE team_name = %s
) AS combined_players
GROUP BY team_name, player_name, position, rank
ORDER BY position;

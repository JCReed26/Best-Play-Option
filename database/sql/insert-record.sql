-- Sort players by rank
SELECT rank, player_name FROM quarterbackdata
UNION
SELECT rank, player_name FROM rushingreceivingdata
ORDER BY rank;
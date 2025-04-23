-- Sort players by position
SELECT position, player_name FROM quarterbackdata 
UNION 
SELECT position, player_name FROM rushingreceivingdata
GROUP BY position;
SELECT q.player_name, r.rushing_yards 
FROM quarterbackdata q
JOIN rushingreceivingdata r ON q.team_name = r.team_name;

UPDATE users
SET team = :new_team
WHERE username = :username;
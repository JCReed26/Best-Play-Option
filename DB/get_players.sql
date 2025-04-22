CREATE TABLE "mytable" (
  "SELECT player_name" text,
  "position FROM quarterbackdata WHERE team_name = $1" text
);

INSERT INTO "mytable" ("SELECT player_name","position FROM quarterbackdata WHERE team_name = $1")
VALUES
('UNION',NULL),
('SELECT player_name','position FROM rushingreceivingdata WHERE team_name = $1;');

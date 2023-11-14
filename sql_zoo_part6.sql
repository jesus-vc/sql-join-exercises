/* 
Exercises: https://sqlzoo.net/wiki/The_JOIN_operation
*/

SELECT matchid,player FROM goal
WHERE teamid='GER';

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

SELECT  player, teamid, stadium, mdate 
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';

SELECT  team1, team2, player 
FROM game JOIN goal on (id=matchid)
WHERE player LIKE 'Mario%';

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam on teamid=id
WHERE gtime<=10;

SELECT mdate, teamname
FROM game JOIN eteam ON team1=eteam.id
WHERE coach = 'Fernando Santos';

SELECT player
FROM goal JOIN game ON matchid=game.id
WHERE stadium = 'National Stadium, Warsaw';

SELECT DISTINCT(player)
FROM game JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER') AND teamid != 'GER';

SELECT teamname, COUNT(teamid)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname;

SELECT stadium, COUNT(matchid)
FROM game JOIN goal ON game.id=matchid
GROUP by stadium;

SELECT matchid,mdate, team1, team2,teamid
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL');

SELECT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id 
WHERE teamid='GER'
GROUP BY matchid;

SELECT mdate,
team1,
COALESCE(SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END),0) AS score1,
team2,
COALESCE(SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END),0) AS score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2 ASC;
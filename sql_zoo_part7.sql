/* 
Exercises: https://sqlzoo.net/wiki/More_JOIN_operations
*/

SELECT id, title
 FROM movie
 WHERE yr=1962;

SELECT yr
FROM movie
WHERE title= 'Citizen Kane';

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

SELECT id FROM actor WHERE name = 'Glenn Close';

SELECT id FROM movie WHERE title = 'Casablanca';

SELECT name FROM movie
JOIN casting ON movie.id=casting.movieid
JOIN actor ON casting.actorid=actor.id
WHERE title = 'Casablanca';


SELECT name FROM movie
JOIN casting ON movie.id=casting.movieid
JOIN actor ON casting.actorid=actor.id
WHERE title = 'Alien';

SELECT title FROM actor
JOIN casting ON actor.id=casting.actorid
JOIN movie ON casting.movieid=movie.id
WHERE name = 'Harrison Ford';

SELECT title FROM actor
JOIN casting ON actor.id=casting.actorid
JOIN movie ON casting.movieid=movie.id
WHERE name = 'Harrison Ford' AND casting.ord!=1;

SELECT title, actor.name FROM actor
JOIN casting ON actor.id=casting.actorid
JOIN movie ON casting.movieid=movie.id
WHERE name = 'Harrison Ford' AND casting.ord!=1;

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1;

SELECT title,name
FROM movie
JOIN casting ON (movie.id = casting.movieid AND ord=1)
JOIN actor ON actor.id=casting.actorid
WHERE movie.id IN (
  SELECT movieid FROM casting
WHERE actorid IN  (
  SELECT id FROM actor
  WHERE name='Julie Andrews');

SELECT name FROM actor
JOIN casting ON (actor.id=casting.actorid AND ord=1)
GROUP BY name
HAVING COUNT(movieid) >= 15
ORDER BY name ASC;

SELECT title, COUNT(actorid) from casting 
JOIN movie ON casting.movieid=movie.id
WHERE casting.movieid IN ( SELECT movie.id FROM movie WHERE yr=1978)
GROUP BY movieid
ORDER BY COUNT(actorid) DESC,title;

SELECT name FROM casting
JOIN actor ON casting.actorid=actor.id
WHERE casting.movieid IN (SELECT movieid FROM casting
WHERE actorid=(SELECT actor.id FROM actor WHERE name = 'Art Garfunkel'))
AND actorid!=(SELECT actor.id FROM actor WHERE name = 'Art Garfunkel');

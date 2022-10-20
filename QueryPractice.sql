-- This is my example window
SELECT * FROM actors;

SELECT TOP 2 * FROM actors;
SELECT TOP 10 * FROM actors;

SELECT FirstName, LastName FROM actors WHERE FirstName = 'Harrison';

SELECT DISTINCT FirstName, LastName FROM actors;

SELECT FirstName, LastName FROM actors WHERE FirstName = 'Harrison' AND LastName = 'Ford';

SELECT FirstName, LastName FROM actors WHERE FirstName = 'Harrison' OR FirstName = 'Tom';

SELECT FirstName, LastName FROM actors WHERE NOT FirstName = 'Harrison';

SELECT * FROM actors WHERE FirstName = 'Harrison' AND NOT Id = 5;

SELECT * FROM directors WHERE FirstName IN ('George', 'Steven');

SELECT * FROM movies;

SELECT * FROM movies WHERE Rank BETWEEN 200 AND 500;

SELECT * FROM movies WHERE Rank IN (200, 500, 301);

SELECT
MAX(Rank) AS 'Max Rank',
MIN(Rank) AS 'Min Rank',
AVG(Rank) AS 'Average Rank',
COUNT(*) AS 'All Records',
COUNT(Rank) AS 'All Ranked Records'
FROM movies;

SELECT d.FirstName, d.LastName, dg.Genre
FROM directors d
INNER JOIN directors_genres dg
ON d.Id = dg.DirectorId;

SELECT d.FirstName, d.LastName, dg.Genre 
FROM directors d
LEFT JOIN directors_genres dg
ON d.Id = dg.DirectorId;

SELECT d.FirstName, d.LastName, dg.Genre 
FROM directors d
RIGHT JOIN directors_genres dg
ON d.Id = dg.DirectorId;

SELECT d.FirstName, d.LastName, dg.Genre 
FROM directors d
FULL OUTER JOIN directors_genres dg
ON d.Id = dg.DirectorId;

SELECT d.FirstName, d.LastName, COUNT(dg.Genre) AS 'Number of Genres'
FROM directors d
INNER JOIN directors_genres dg
ON d.Id = dg.DirectorId
GROUP BY FirstName, LastName
HAVING COUNT(dg.Genre) > 2;

SELECT d.FirstName, d.LastName, COUNT(dg.Genre) AS 'Number of Genres'
FROM directors d
INNER JOIN directors_genres dg
ON d.Id = dg.DirectorId
GROUP BY FirstName, LastName
ORDER BY 3 DESC;

SELECT m.Id, m.Name, mg.Genre, m.Rank
FROM movies m INNER JOIN movies_genre mg
ON m.Id = mg.MovieId
WHERE m.Rank > 
	(
		SELECT AVG(Rank) -- Average is 357
		FROM movies
	)

SELECT m.Id, m.Name, mg.Genre, m.Rank
FROM movies m
INNER JOIN movies_genre mg
ON m.Id = mg.MovieId
WHERE m.Rank > 
	(
		SELECT AVG(Rank)
		FROM movies
	);


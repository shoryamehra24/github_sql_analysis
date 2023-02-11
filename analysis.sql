
CREATE DATABASE github

USE github;

-- DISTINCT languages in the database
SELECT DISTINCT language FROM repos;

SELECT * FROM repos;

-- Repositories with maximum stars
SELECT name, stars 
FROM repos
ORDER BY stars DESC
LIMIT 10;

-- Repositories with maximum forks
SELECT name, forks
FROM repos
ORDER BY forks DESC
LIMIT 10;


-- Number of repositories per language
SELECT language, COUNT(*) AS 'repositories'
FROM repos
GROUP BY language
ORDER BY 2 DESC;

-- Number of repositories per domain
SELECT domain, COUNT(*) AS 'repositories'
FROM repos
GROUP BY domain
ORDER BY 2 DESC;

-- Projects created by Facebook
SELECT name, language, stars 
FROM repos
WHERE name LIKE 'facebook/%';

-- Most liked languages
SELECT language, SUM(stars) AS 'stars'
FROM repos
GROUP BY language
ORDER BY 2 DESC
LIMIT 10;

-- Least liked language
SELECT language, stars
FROM repos
WHERE stars = (SELECT MIN(stars) FROM repos);



-- Most in-demand domains
SELECT domain, SUM(stars) AS 'total stars'
FROM repos
GROUP BY domain
ORDER BY 2 DESC;

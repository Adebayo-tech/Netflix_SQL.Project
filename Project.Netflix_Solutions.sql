-- NETFLIX PROJECT

-- 15 Business Problems & Solutions

-- 1. Count the number of Movies vs TV Shows

-- SOLUTION SELECT COUNT(case when show_type = 'Movie' then 1 END) no_of_movie, COUNT(case when show_type = 'TV Show' then 1 END) no_of_tv_show FROM netflix;

-- SOLUTION 2 SELECT show_type, COUNT(*) total_contents FROM netflix GROUP BY show_type;

-- 2. Find the most common rating for movies and TV shows

WITH num_of_ratings AS ( SELECT show_type, rating,		 COUNT(*) counts FROM netflix GROUP BY rating, show_type ORDER BY show_type, counts DESC )

SELECT * FROM num_of_ratings WHERE counts=( SELECT MAX(counts) FROM num_of_ratings WHERE show_type = 'Movie' ) OR counts=( SELECT MAX(counts) FROM num_of_ratings WHERE show_type = 'TV Show' );

-- 3. List all movies released in a specific year (e.g., 2020)

SELECT show_type, title, release_year FROM netflix WHERE show_type = 'Movie' AND release_year = '2020';

-- 4. Find the top 5 countries with the most content on Netflix

##(the country column contain csv which need to be further seperated to get accurate answer) WITH split_columns AS (

SELECT *,
			trim(SUBSTRING_INDEX(
				SUBSTRING_INDEX(country,',',numbers.n),
					',',-1)) 
						AS countries
	FROM netflix
	CROSS JOIN ( SELECT 1 AS n UNION ALL 
					 SELECT 2 UNION ALL
					 SELECT 3 UNION ALL
					 SELECT 4 UNION ALL
					 SELECT 5 UNION ALL
					 SELECT 6 UNION ALL
					 SELECT 7 UNION ALL
					 SELECT 8 UNION ALL
					 SELECT 9 UNION ALL
					 SELECT 10 UNION ALL
					 SELECT 11 UNION ALL
					 SELECT 12 ) numbers
	WHERE numbers.n <= LENGTH(country) - LENGTH(REPLACE(country,',', '')) +1
)

SELECT countries, COUNT() total_content FROM split_columns GROUP BY countries ORDER BY COUNT() DESC LIMIT 5;

-- 5. Identify movies with the longest duration

SELECT show_id, show_type, title, duration FROM netflix WHERE show_type = 'Movie' AND duration = (SELECT MAX(duration) FROM netflix);

-- 6. Find content added in the last 5 years

SELECT show_type, title, SUBSTRING(date_added,14) year_added FROM netflix WHERE (YEAR(NOW())-SUBSTRING(date_added,14)) <= 5;

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT show_type, title, director FROM netflix WHERE director LIKE '%Rajiv Chilaka%';

-- 8. List all TV shows with more than 5 seasons

SELECT show_type, title, duration FROM netflix WHERE show_type = 'TV Show' AND SUBSTRING_INDEX(duration,' ',1) > 5;

-- 9. Count the number of content items in each genre

-- the genre can be found in the 'listed_in' column

WITH genres AS ( SELECT , SUBSTRING_INDEX(SUBSTRING_INDEX(listed_in,',',numbers.n),',',-1) genre FROM netflix CROSS JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3) numbers WHERE numbers.n <= LENGTH(listed_in) - LENGTH(REPLACE(listed_in,',',''))+1 ) SELECT genre, COUNT() num_of_contents FROM genres GROUP BY genre ORDER BY num_of_contents DESC;

-- 10.Find each year and the average numbers of content release in India on netflix. -- return top 5 year with highest avg content release!

WITH numofcont AS ( SELECT country, release_year, COUNT(*) num_of_content FROM netflix WHERE country = 'India' GROUP BY release_year ) SELECT country, release_year, AVG(num_of_content) avg_numof_cont FROM numofcont GROUP BY release_year ORDER BY AVG(num_of_content)  DESC LIMIT 5;

-- 11. List all movies that are documentaries

WITH genres AS ( SELECT *, SUBSTRING_INDEX(SUBSTRING_INDEX(listed_in,',',numbers.n),',',-1) genre FROM netflix CROSS JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3) numbers WHERE numbers.n <= LENGTH(listed_in) - LENGTH(REPLACE(listed_in,',',''))+1 ) SELECT show_type, title, genre FROM genres WHERE genre = 'Documentaries';

-- 12. Find all content without a director

SELECT show_type, title, director FROM netflix WHERE director IS NULL OR director = '';

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT show_type, title, release_year FROM netflix WHERE YEAR(NOW()) - release_year <= 10 AND show_type = 'Movie' AND casts LIKE '%Salman Khan%';

-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

WITH cte AS ( SELECT show_type, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(casts,',',numbers.n),',',-1)) actors, country, COUNT(*) num_of_contents FROM netflix CROSS JOIN  (
SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50) numbers WHERE LENGTH(casts)-LENGTH(REPLACE(casts,',',''))+1 GROUP BY SUBSTRING_INDEX(SUBSTRING_INDEX(casts,',',numbers.n),',',-1)

)

SELECT DISTINCT * FROM cte WHERE country LIKE '%India%' AND show_type = 'Movie' ORDER BY num_of_contents DESC LIMIT 10;

-- 15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in -- the description field. Label content containing these keywords as 'Bad' and all other -- content as 'Good'. Count how many items fall into each category.movies_net

-- categorizing contents SELECT show_type, title, case when DESCRIPTION LIKE '%kill%' OR DESCRIPTION LIKE '%violence%' then 'Bad' ELSE 'Good' END AS category FROM netflix;

-- counting contents

SELECT case when DESCRIPTION LIKE '%kill%' OR DESCRIPTION LIKE '%violence%' then 'Bad' ELSE 'Good' END AS category, COUNT(*) num_of_contents_per_category FROM netflix GROUP BY 1;

SELECT * FROM netflix

want to upload this project on github, can you help with the overview, and other neccesary things to be written in the README

   

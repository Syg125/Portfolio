CREATE TABLE Netflix (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_added DATE,
    week DATE,
    category VARCHAR(50),
    show_title VARCHAR(255),
    season_title VARCHAR(255),
    weekly_rank INT,
    cumulative_weeks_in_top_10 INT,
    weekly_hours_viewed INT
);

INSERT INTO netflix
(date_added, week, category, show_title, season_title, weekly_rank, cumulative_weeks_in_top_10, weekly_hours_viewed) VALUES
('2024-01-05', '2024-01-01', 'TV Show', 'Stranger Things', 'Season 4', 1, 15, 45000000),
('2024-01-10', '2024-01-08', 'Movie', 'Money Heist', 'Part 5', 2, 10, 32000000),
('2024-01-15', '2024-01-15', 'TV Show', 'The Crown', 'Season 6', 3, 8, 28000000),
('2024-01-20', '2024-01-15', 'TV Show', 'Wednesday', 'Season 1', 4, 12, 26000000),
('2024-01-22', '2024-01-22', 'Movie', 'Lupin', 'Part 2', 5, 6, 20000000),
('2024-01-25', '2024-01-22', 'TV Show', 'Dark', 'Season 3', 6, 9, 18000000),
('2024-01-28', '2024-01-29', 'Movie', 'The Witcher', 'Season 3', 7, 7, 15000000),
('2024-02-02', '2024-01-29', 'TV Show', 'Bridgerton', 'Season 2', 8, 5, 12000000),
('2024-02-05', '2024-02-05', 'Movie', 'Manifest', 'Season 4', 9, 4, 10000000),
('2024-02-08', '2024-02-05', 'TV Show', 'Queen's Gambit', 'Season 1', 10, 3, 9000000),
('2024-02-12', '2024-02-12', 'TV Show', 'Narcos', 'Season 2', 1, 16, 42000000),
('2024-02-15', '2024-02-12', 'Movie', 'Shadow and Bone', 'Season 2', 2, 9, 31000000),
('2024-02-18', '2024-02-19', 'TV Show', 'You', 'Season 4', 3, 11, 27000000),
('2024-02-22', '2024-02-19', 'Movie', 'Elite', 'Season 6', 4, 8, 23000000),
('2024-02-25', '2024-02-26', 'TV Show', 'Outer Banks', 'Season 3', 5, 10, 21000000),
('2024-02-28', '2024-02-26', 'Movie', 'Cobra Kai', 'Season 5', 6, 6, 17000000),
('2024-03-02', '2024-03-04', 'TV Show', 'Sex Education', 'Season 4', 7, 5, 15000000),
('2024-03-05', '2024-03-04', 'Movie', '13 Reasons Why', 'Season 4', 8, 4, 12000000),
('2024-03-08', '2024-03-11', 'TV Show', 'Emily in Paris', 'Season 3', 9, 3, 9000000),
('2024-03-10', '2024-03-11', 'Movie', 'Squid Game', 'Season 1', 10, 2, 7000000);


-- 🎯 Q1: Get all content records in the Netflix table  
SELECT * FROM netflix;

--------------------------------------------------------

-- 🎯 Q2: Find all TV Shows with weekly hours viewed > 25,000,000  
SELECT * FROM netflix
WHERE category = 'TV Show' AND weekly_hours_viewed > 25000000;

--------------------------------------------------------

-- 🎯 Q3: Top 3 most viewed shows by weekly hours viewed  
SELECT show_title, season_title, weekly_hours_viewed
FROM netflix
ORDER BY weekly_hours_viewed DESC
LIMIT 3;

--------------------------------------------------------

-- 🎯 Q4: Top 2 shows with the best weekly rank (lowest rank number)  
SELECT show_title, category, season_title, weekly_rank
FROM netflix
ORDER BY weekly_rank ASC
LIMIT 2;

--------------------------------------------------------

-- 🎯 Q5: All shows with weekly rank = 1  
SELECT show_title, category, season_title, weekly_rank
FROM netflix
WHERE weekly_rank = 1;

--------------------------------------------------------

-- 🎯 Q6: Average weekly hours viewed by category (Movie / TV Show)  
SELECT category, AVG(weekly_hours_viewed) 
FROM netflix
GROUP BY category;

--------------------------------------------------------

-- 🎯 Q7: Show the maximum cumulative weeks in the top 10  
SELECT show_title, season_title, cumulative_weeks_in_top_10
FROM netflix
ORDER BY cumulative_weeks_in_top_10 DESC
LIMIT 1;

--------------------------------------------------------

-- 🎯 Q8: Content added in February 2024  
SELECT * FROM netflix
WHERE date_added BETWEEN "2024-02-01" AND "2024-02-28";

--------------------------------------------------------

-- 🎯 Q9: Content added in February 2024 ordered by category & date  
SELECT show_title, category, season_title, date_added 
FROM netflix
WHERE date_added BETWEEN "2024-02-01" AND "2024-02-28"
ORDER BY category, date_added;

--------------------------------------------------------

-- 🎯 Q10: Count of records by category  
SELECT category, COUNT(category) 
FROM netflix
GROUP BY category;

--------------------------------------------------------

-- 🎯 Q11: Total weekly hours viewed by category  
SELECT category, SUM(weekly_hours_viewed) 
FROM netflix
GROUP BY category;

--------------------------------------------------------

-- 🎯 Q12: First content added by date  
SELECT show_title, season_title, date_added 
FROM netflix
ORDER BY date_added ASC
LIMIT 1;

--------------------------------------------------------

-- 🎯 Q13: Distinct shows in top 5 weekly ranks  
SELECT DISTINCT show_title, season_title
FROM netflix
WHERE weekly_rank <= 5;

--------------------------------------------------------

-- 🎯 Q14: Top ranked shows (weekly_rank ≤ 5) grouped by category  
SELECT show_title, season_title, category, weekly_rank
FROM netflix
WHERE weekly_rank <= 5
GROUP BY category
ORDER BY weekly_rank ASC;

--------------------------------------------------------

-- 🎯 Q15: Top titles concatenated by category (top 5 weekly rank shows)  
SELECT category, GROUP_CONCAT(show_title ORDER BY weekly_rank) AS top_titles
FROM netflix
WHERE weekly_rank <= 5
GROUP BY category;

--------------------------------------------------------

-- 🎯 Q16: Earliest and latest content added  
(SELECT date_added, category, show_title, season_title FROM netflix ORDER BY date_added ASC LIMIT 1)
UNION
(SELECT date_added, category, show_title, season_title FROM netflix ORDER BY date_added DESC LIMIT 1);

/* GAMES DESCRIPTION */
SELECT * FROM games_description;


/* GAMES REVENUES */
SELECT * FROM games_revenue;

/* REVENUE: Calculate total revenue for each game: Total Revenue = Number_of_Purchases * Unit_Price */
SELECT *, 
Number_of_Purchases * Unit_Price AS Total_revenue
FROM games_revenue;


/* TABLE JOIN - GAMES_REVENUE & GAMES_DESCRIPTION SCHEMAS */
SELECT * FROM games_revenue JOIN games_description
ON games_revenue.game_id = games_description.game_id;

/* What are the top 5 games by revenue? */
SELECT games_description.game_name, /* Show game name column */
(games_revenue.Number_of_purchases * games_revenue.Unit_price) AS Total_revenue /* Calculate total revenue = number of purchases * unit price */
FROM games_description JOIN games_revenue /* Joining games_revenue & games_description tables */
ON games_description.game_id = games_revenue.game_id /* by related column: game_id */
ORDER BY Total_revenue DESC /* Descending order (High to Low) */ 
LIMIT 5; /* Show Top 5 Games ONLY */
 

/* Identify the top 3 genres by total revenue. */
SELECT games_description.genre, /* Results showing only Top 3 Genres by total revenue */
SUM(games_revenue.Number_of_purchases * games_revenue.Unit_price) AS Total_revenue 
/* Calculate total revenue = number of purchases * unit price. SUM: Calculate the total sum of all values within each genre group */
FROM games_revenue JOIN games_description /* Joining games_revenue & games_description tables */
ON games_revenue.game_id = games_description.game_id /* by related column: game_id */
GROUP BY games_description.genre /* Return one result for each genre */
ORDER BY Total_revenue DESC /* Descending order (High to Low) */ 
LIMIT 3; /* Show Top 3 Genres ONLY */


/* Which year generated most of the revenue in the company. */
SELECT games_description.year_released,
SUM(games_revenue.Number_of_purchases * games_revenue.Unit_price) AS Total_revenue 
/* Calculate total revenue = number of purchases * unit price + SUM all values within each genre group */
FROM games_description JOIN games_revenue /* Joining games_revenue & games_description tables */
ON games_description.game_id = games_revenue.game_id /* by related column: game_id */
GROUP BY games_description.year_released /* Return one result for each year_released */
ORDER BY Total_revenue DESC /* Descending order (High to Low) */ 
LIMIT 1; /* Show the year that generated the most revenue */

-- TEST MULTIPLE JOINS --

SELECT games_description.game_name, games_reviews.number_of_reviews_from_purchased_people,/* Descriptions & Reviews table columns  */
(games_revenue.Number_of_purchases * games_revenue.Unit_price) AS Total_revenue 
/* Games revenue column: Calculate total revenue = number of purchases * unit price */
FROM games_description 
JOIN games_revenue 
ON games_description.game_id = games_revenue.game_id 
JOIN games_reviews
ON games_description.game_id = games_reviews.game_id;
/* Joining games_revenue, games_description & games_reviews tables */

-- TEST ALL TABLE JOINS --

SELECT *
FROM games_description 
JOIN games_revenue 
ON games_description.game_id = games_revenue.game_id 
JOIN games_reviews
ON games_description.game_id = games_reviews.game_id;
/* Joining games_revenue, games_description & games_reviews tables */


/* GAMES REVIEWS */
SELECT * FROM games_reviews;
















-- JOIN QUERY --

/* SELECT games_table.column_name, /* Results showing only Top 5 Games by total revenue 
(games_revenue.Number_of_purchases * games_revenue.Unit_price) AS Total_revenue /* Calculate total revenue = number of purchases * unit price 
FROM games_revenue JOIN games_description /* Joining games_revenue & games_description tables 
ON games_revenue.game_id = games_description.game_id /* by related column: game_id 
ORDER BY Total_revenue DESC /* Descending order (High to Low) 
LIMIT 5; /* Show Top 5 Games ONLY */ 
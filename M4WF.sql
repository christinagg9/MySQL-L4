-- Task 4.  Advanced SQL: Window Functions --

-- Rank Games by Revenue --

/* Use RANK() to rank games by their total revenue within each genre */

SELECT games_description.game_name, games_description.genre, /* Results showing game_name & game_genre */
(games_revenue.Number_of_purchases * games_revenue.Unit_price) AS Total_revenue,
/* Calculate total revenue = number of purchases * unit price */
RANK () OVER(PARTITION BY games_description.genre ORDER BY games_revenue.Number_of_purchases * games_revenue.Unit_price DESC) AS genre_revenue_ranking
/* Ranking each game by genre from highest to lowest total revenue */ 
FROM games_revenue JOIN games_description 
ON games_revenue.game_id = games_description.game_id; 
/* Joining games_revenue & games_description tables by game_id */

-- OVER: games_descriptionKEYWORD THAT DEFINES THE WINDOWS FUNCTION --
-- PARTITION BY: DIVIDES DATA INTO GROUPS --
-- ORDER BY: DEFINES THE ORDER WITHIN EACH GROUP --
-- RANK: ASSIGNS A RANK TO EACH ROW WITHIN A GROUP BASSED ON A SPECIFIED ORDER -- 



-- Rank Games by Reviews --

SELECT games_description.game_name, games_description.genre, games_reviews.number_of_reviews_from_purchased_people, 
/* Results showing game_name & number_of_reviews_from_purchased_people */
RANK () OVER(PARTITION BY games_description.genre ORDER BY games_reviews.number_of_reviews_from_purchased_people DESC) AS genre_review_ranking
/* Ranking each game by reviews from highest to lowest total reviews */ 
FROM games_description JOIN games_reviews 
ON games_description.game_id = games_reviews.game_id; 
/* Joining games_description & games_reviews tables by game_id */



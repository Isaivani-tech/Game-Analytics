select * from categories
select * from competitions
select * from competitor_rankings
select * from competitors
select * from complexes
select * from venues

--Competitions and categories Table Analysis

--1. List all competitions along with their category name

SELECT c.competition_name, c.type, c.gender, cat.category_name
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id

--2. Count the number of competitions in each category

SELECT cat.category_name, COUNT(c.competition_id) AS competition_count
FROM Categories cat
LEFT JOIN Competitions c ON cat.category_id = c.category_id
GROUP BY cat.category_name

--3. Find all competitions of type 'doubles'

SELECT competition_name, type, gender, category_id
FROM Competitions
WHERE type = 'doubles'


--4. Get competitions that belong to a specific category (e.g., ITF Men)

SELECT competition_name, type, gender, category_id
FROM Competitions
WHERE category_id IN (SELECT category_id FROM Categories WHERE category_name = 'ITF Men') 

SELECT category_id FROM Categories WHERE category_name = 'ITF Men'

--5. Identify parent competitions and their sub-competitions

SELECT parent.competition_name AS parent_competition, child.competition_name AS sub_competition
FROM Competitions child
JOIN Competitions parent ON child.parent_id = parent.competition_id;

--6. Analyze the distribution of competition types by category

SELECT cat.category_name, c.type, COUNT(c.competition_id) AS competition_count
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id
GROUP BY cat.category_name, c.type;

--7. List all competitions with no parent (top-level competitions)

SELECT parent_id,competition_name, type, gender, category_id
FROM Competitions
WHERE parent_id = 'NaN'

-- Complexes and Venues Tables Analysis

--1. List all venues along with their associated complex name:

SELECT v.venue_name, c.complex_name
FROM Venues v
JOIN Complexes c ON v.complex_id = c.complex_id

--2. Count the number of venues in each complex:

SELECT c.complex_name, 
COUNT(v.venue_id) AS venue_count
FROM Venues v
JOIN Complexes c ON v.complex_id = c.complex_id
GROUP BY c.complex_name

--3. Get details of venues in a specific country (e.g., Chile):

SELECT * FROM Venues
WHERE country_name = 'Spain'

--4. Identify all venues and their timezones:

SELECT venue_name,timezone
FROM Venues

--5. Find complexes that have more than one venue:

SELECT c.complex_name
FROM Complexes c
JOIN Venues v ON c.complex_id = v.complex_id
GROUP BY c.complex_name
HAVING COUNT(v.venue_id) > 1

--6. List venues grouped by country:

SELECT country_name,STRING_AGG(venue_name, ', ') AS venue_list
FROM Venues
GROUP BY country_name

--7. Find all venues for a specific complex (e.g., Nacional):

SELECT * FROM Venues
WHERE complex_id = (SELECT complex_id FROM Complexes WHERE complex_name = 'Spo1 Park')

-- Competitor and competitor_rankings Table Analysis

-- 1. Get all competitors with their rank and points.

SELECT 
    c.name, 
    r.rank, 
    r.points 
FROM 
    Competitors c
JOIN 
    Competitor_Rankings r ON c.competitor_id = r.competitor_id

-- 2. Find competitors ranked in the top 5

SELECT 
    c.name, 
    r.rank 
FROM 
    Competitors c
JOIN 
    Competitor_Rankings r ON c.competitor_id = r.competitor_id
WHERE 
    r.rank <= 5

-- 3. List competitors with no rank movement (stable rank)

SELECT 
    c.name 
FROM 
    Competitors c
JOIN 
    Competitor_Rankings r ON c.competitor_id = r.competitor_id
WHERE 
    r.movement = 0

-- 4. Get the total points of competitors from a specific country (e.g., Croatia)

SELECT 
    c.name, 
    r.points 
FROM 
    Competitors c
JOIN 
    Competitor_Rankings r ON c.competitor_id = r.competitor_id
WHERE 
    c.country = 'Croatia'

-- 5. Count the number of competitors per country

SELECT 
    c.country, 
    COUNT(c.competitor_id) AS competitor_count
FROM 
    Competitors c
GROUP BY 
    c.country

-- 6. Find competitors with the highest points in the current week

SELECT 
    c.name, 
    r.points
FROM 
    Competitors c
JOIN 
    Competitor_Rankings r ON c.competitor_id = r.competitor_id
WHERE 
    r.points = (SELECT MAX(points) FROM Competitor_Rankings)

use world;

## Q1.Count how many cities are there in each country?
SELECT CountryCode, COUNT(*) AS total_cities
FROM city
GROUP BY CountryCode;

## Q2. Display all continents having more than 30 countries.
SELECT Continent, COUNT(*) AS total_countries
FROM country
GROUP BY Continent
HAVING COUNT(*) > 30;

## Q3.List regions whose total population exceeds 200 million?
SELECT Region, SUM(Population) AS total_population
FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000;

## Q4.Find the top 5 continents by average GNP per country?
SELECT Continent, AVG(GNP) AS avg_gnp
FROM country
GROUP BY Continent
ORDER BY avg_gnp DESC
LIMIT 5;

## Q5.Find the total number of official languages spoken in each continent?
SELECT c.Continent, COUNT(cl.Language) AS total_languages
FROM country c
JOIN countrylanguage cl
ON c.country_code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;


## Q6.Find the maximum and minimum GNP for each continent?
SELECT Continent,
       MAX(GNP) AS max_gnp,
       MIN(GNP) AS min_gnp
FROM country
GROUP BY Continent;

## Q7.Find the country with the highest average city population?
SELECT co.country_name, AVG(ci.Population) AS avg_city_population
FROM country co
JOIN city ci
ON co.country_code = ci.CountryCode
GROUP BY co.country_name
ORDER BY avg_city_population DESC
LIMIT 1;

## Q8.List continents where the average city population is greater than 200,000?
SELECT c.Continent, AVG(ci.Population) AS avg_city_population
FROM country c
JOIN city ci
ON c.country_code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;

## Q9.Find the total population and average life expectancy for each continent, ordered by average life expectancy descending?
SELECT Continent,
       SUM(Population) AS total_population,
       AVG(LifeExpectancy) AS avg_life_expectancy
FROM country
GROUP BY Continent
ORDER BY avg_life_expectancy DESC;

## Q10.Find the top 3 continents with the highest average life expectancy, only where total population is over 200 million?
SELECT Continent,
       AVG(LifeExpectancy) AS avg_life_expectancy,
       SUM(Population) AS total_population
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY avg_life_expectancy DESC
LIMIT 3;









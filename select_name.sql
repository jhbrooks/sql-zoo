-- 1. The country that starts with Y

SELECT name
FROM world
WHERE name LIKE 'Y%';

-- 2. The countries that end with y

SELECT name
FROM world
WHERE name LIKE '%y';

-- 3. The two countries that contain the letter x

SELECT name
FROM world
WHERE name LIKE '%x%';

-- 4. The countries that end with land

SELECT name
FROM world
WHERE name LIKE '%land';

-- 5. The three countries that start with C and end with ia

SELECT name
FROM world
WHERE name LIKE 'C%ia';

-- 6. The country with oo in its name

SELECT name
FROM world
WHERE name LIKE '%oo%';

-- 7. The countries with three or more occurrences of a in their names
SELECT name
FROM world
WHERE name LIKE '%a%a%a%';

-- 8. The countries with t as the second character in their names

SELECT name
FROM world
WHERE name LIKE '_t%';

-- 9. The countries that contain two o characters separated by two others

SELECT name
FROM world
WHERE name LIKE '%o__o%';

-- 10. The countries with names exactly four characters long

SELECT name
FROM world
WHERE name LIKE '____';

-- 11. The countries where the name is the same as that of the capital city

SELECT name
FROM world
WHERE name LIKE capital;

-- 12. The countries where the name of the capital city is the same as that of
--     the country, plus the word City

SELECT name
FROM world
WHERE capital LIKE concat(name, ' City');

-- 13. Capitals and country names for countries where the capital includes the
--     name of the country

SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%');

-- 14. Country names and capitals for countries where the capital is an
--     extension of the name of the country

SELECT name, capital
FROM world
WHERE capital LIKE concat(name, '_%');

-- 15. Country names and extensions for countries where the capital is an
--     extension of the name of the country

SELECT name, REPLACE(capital, name, '')
FROM world
WHERE capital LIKE concat(name, '_%');

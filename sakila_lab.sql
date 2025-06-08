USE sakila;
-- Display all available tables in the Sakila database.
SHOW tables;

-- Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor;
SELECT * FROM customer;
SELECT * FROM film;

--  Titles of all films from the film table
SELECT title FROM film;

-- List of languages used in films, with the column aliased as language from the language table
SELECT * FROM language;

SELECT DISTINCT l.name AS language
FROM language AS l
JOIN film AS f ON l.language_id = f.language_id;


-- List of first names of all employees from the staff table
SELECT * FROM staff;
SELECT first_name FROM staff;

-- Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

-- Determine the number of stores that the company has.
SELECT * FROM store;
SELECT * FROM address;

SELECT COUNT(*) AS total_stores
FROM store;

-- Determine the number of employees that the company has.
SELECT COUNT(*) AS total_staff
FROM staff;

-- Determine how many films are available for rent and how many have been rented.
SELECT * FROM inventory;
SELECT * FROM rental;

SELECT COUNT(DISTINCT film_id) AS films_available_for_rent
FROM inventory;

SELECT COUNT(DISTINCT inventory.film_id) AS films_rented
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id;

-- Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) AS last_names
FROM actor;

-- Retrieve the 10 longest films.
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

-- Retrieve all actors with the first name "SCARLETT"
SELECT first_name, last_name FROM actor
WHERE first_name = "SCARLETT" ;

-- Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT 
	title, 
    length 
FROM film
WHERE title LIKE "%ARMAGEDDON%" AND length > 100
;

-- Determine the number of films that include Behind the Scenes content
SELECT COUNT(*) AS films_with_bts FROM film
WHERE special_features LIKE "%Behind the Scenes%";

SELECT title
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
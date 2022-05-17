-- Week 5 - Wednesday
-- Questions

-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT *
FROM address
JOIN customer
On address.address_id = customer.address_id


-- 2. Get all payments above $6.99 with the Customer's Full name
-- HERE IS THE CODE FOR IT , I COULDN'sT FIND THE LAST NAME FOR THEM 
SELECT *
FROM customer
JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99


-- 3. Show all customers names who have made payments over $175(use
-- subqueries) --Have no idea why nothing shows up on the query.


SELECT customer_name
FROM customer
WHERE customer_id IN (
    SELECT amount
    FROM payment
    WHERE amount > 175
    GROUP BY amount
    
    )

-- 4. List all customers that live in Nepal (use the city
-- table) -My sql console says that customer.address_id doesnt exist
SELECT country, country.country_id
FROM city
JOIN country
ON country.country_id = city.country_id
JOIN address
ON city.city_id = address.city_id
JOIN customer
ON customer.address_id = address.address_id

-- 5. Which staff member had the most
-- transactions?
SELECT CONCAT(first_name,' ',last_name) as full_name, staff.staff_id
From staff
JOIN payment
ON payment.staff_id = staff.staff_id






-- 6. How many movies of each rating are
-- there? -- 194 for PG, 223 PG-13 , 195 for R, 178 for G, 210 for NC-17
SELECT *
FROM (SELECT COUNT(rating) as cnt_rate, rating
from film
GROUP BY rating) as cnts
;





-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT customer_id
FROM customer
WHERE customer_id IN (
    SELECT amount , customer_id
    FROM payment
    GROUP By payment.amount, payment.customer_id
    HAVING amount >= 6.99
   
    )



-- 8. How many free rentals did our store give away? 715 
SELECT COUNT(amount)
FROM rental
Join payment
On rental.customer_id = payment.customer_id
WHERE amount = 0.00


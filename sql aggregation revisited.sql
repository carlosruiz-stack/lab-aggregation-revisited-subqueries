USE SAKILA;

#select first name, last name and email address of customers that have rented a movie

SELECT c.customer_id, first_name, last_name, email
FROM customer
INNER JOIN rental
ON r.rental_id = c.customer_id;

# average payment by customer

SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS name,
    AVG(amount.p) AS average_pmt
FROM
    payments
    JOIN customers ON p.customer_id = c.customer_id
GROUP BY
    customer_id, customer_name;
    
# name and email address of customers that have rented acion movies

# write the query using multiple join statements

SELECT c.name, c.email
FROM customer
JOIN rental ON c.customer_id = r.customer_id
JOIN film ON r.film_id = f.film_id
WHERE film.genre = 'Action';

# write the query using sub queries with multiple WHERE clause and IN condition

SELECT name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM rental
    WHERE film_id IN (
        SELECT film_id
        FROM film 
        WHERE genre = 'Action'
    )
); 

# unable to verify results as I get output error

SELECT payment_id, amount,
    CASE
        WHEN amount BETWEEN 0 AND 2 THEN 'Low'
        WHEN amount BETWEEN 2 AND 4 THEN 'Medium'
        WHEN amount > 4 THEN 'High'
        ELSE 'Unknown'
    END AS label
FROM payments; 


    





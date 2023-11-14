-- write your queries here

SELECT first_name, last_name,COUNT(owner_id)
FROM owners JOIN vehicles ON owners.id=owner_id
GROUP BY first_name, last_name,owner_id
ORDER BY first_name ASC;

SELECT first_name, last_name,COUNT(*)
FROM owners JOIN vehicles ON owners.id=owner_id
GROUP BY first_name, last_name
ORDER BY first_name ASC;

SELECT * from owners FULL JOIN vehicles ON owners.id=owner_id;

SELECT first_name, last_name,ROUND(AVG(price)) AS average_price, COUNT(owner_id)
FROM owners JOIN vehicles ON owners.id=owner_id
GROUP BY first_name,last_name,owner_id
HAVING AVG(price) > 10000
ORDER BY first_name DESC;
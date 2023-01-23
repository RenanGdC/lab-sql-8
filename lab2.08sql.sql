Use sakila;

-- 1 Write a query to display for each store its store ID, city, and country.

SELECT * from country;

SELECT s.store_id, c.city, co.country FROM store s
Join city c
On c.last_update = s.last_update
Join country co
on co.country_id = c.country_id
Group by c.city;

-- 2 Write a query to display how much business, in dollars, each store brought in. (Done)

SELECT s.store_id, SUM(p.amount) as 'Total Business (in dollars)' FROM store s
join customer c
on c.store_id = s.store_id
join payment p
on c.customer_id = p.customer_id
GROUP BY store_id;

-- 3 Which film categories are longest? Done

SELECT category_id, MAX(length) as 'Longest Film Length'
FROM film f
join film_category fc
on f.film_id = fc.film_id
GROUP BY category_id
order by 'Longest Film Length' desc;

-- 4 Display the most frequently rented movies in descending order.

select * from film;

SELECT f.title, COUNT(rental_id) as 'Rental Count'
FROM rental r
join inventory i
ON r.inventory_id = i.inventory_id
JOIN film f 
on i.film_id = f.film_id
GROUP BY f.title
ORDER BY COUNT(rental_id) DESC;


-- 5 List the top five genres in gross revenue in descending order.

SELECT fc.category_id, SUM(p.amount) as 'Gross Revenue'
FROM film_category fc
join film f
on f.film_id = fc.film_id
join inventory i
on f.film_id = i.film_id
join rental r
on i.inventory_id = r.inventory_id
join payment p
on r.rental_id = p.rental_id
GROUP BY category_id
ORDER BY SUM(p.amount) DESC
LIMIT 5;

-- 6 Is "Academy Dinosaur" available for rent from Store 1?



SELECT rental_id, s.store_id
FROM rental r
JOIN inventory i 
on r.inventory_id = i.inventory_id
JOIN store s
ON i.store_id = s.store_id
JOIN film f 
ON i.film_id = f.film_id
WHERE f.title = 'Academy Dinosaur' AND s.store_id = 1
LIMIT 1;

-- 7 Get all pairs of actors that worked together. (unfortunately they came duplicated)

select * from film_actor; 

Select fa.actor_id as actor, actor2.actor_id  from film_actor fa
join film_actor as actor2
on fa.film_id = actor2.film_id
where fa.actor_id <> actor2.actor_id;


-- 8 Get all pairs of customers that have rented the same film more than 3 times.


-- 9 For each film, list actor that has acted in more films.
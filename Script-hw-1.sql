--Q1 How many actors are there with the last name 'Wahlberg'?: 
-- 2 actors with the last_name 'Wahlberg'
select * from actor

select last_name
from actor 
where last_name = 'Wahlberg'; 


--Q2 How many payments were made between $3.99 and $5.99?:
-- 4,804 payments made betwen 3.99 and 5.99
select * from payment 

select count(payment_id)
from payment
where amount >= 3.99 and amount <= 5.99;


--Q3 What film does the store have the most of? (search in inventory)
-- film 193 with 8
select * from inventory 


select film_id, count(film_id)
from inventory 
group by film_id 
order by count(film_id) desc;


--Q4 How many customers have the last name ‘William’?
-- 0 customers with last name 'William'
select * from customer

select last_name
from customer 
where last_name = 'William';


--Q5 What store employee (get the id) sold the most rentals?
-- salesperson 2 with 16,008 
select * from rental 

select staff_id, sum(staff_id)
from rental  
group by staff_id 
order by sum desc;


--Q6 How many different district names are there?
-- 378 different district names
select * from address 

select count(distinct district)
from address 


--Q7 What film has the most actors in it? (use film_actor table and get film_id)
-- film 508 with 15 actors
select * from film_actor 

select film_id, count(actor_id)
from film_actor 
group by film_id
order by count desc;


--Q8 From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 13 customer last names end with 'es' 
select * from customer 

select last_name, store_id
from customer
where last_name like '%es'
order by store_id asc;


--Q9 How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
-- 3
select * from payment 

select amount, count(amount)
from payment 
where customer_id between 380 and 430
group by amount having count(amount) > 250
order by amount desc;



--Q10 Within the film table, how many rating categories are there? And what rating has the most movies total?
--5 distinct rating categories, NC-17 is the category has the most movies
select * from film 

select count(distinct rating), max(rating)
from film

create database music;
use Music;
select * from track;

Q 1:- Who is the senior most employee based on the job title?

select employee_id,first_name,last_name,title from employee order by levels desc limit 1;

Q 2:- which countries has the most invoices ?

select billing_country as country, count(*) from invoice group by billing_country order by count(*) 
desc limit 1;

Q 3:- what are the top three value of total invoices ?

select total from invoice order by total desc limit 3;

Q 4:- which city has the best customer? We should like to through a promotional music festival in 
the city we made the most money. write a query that returns one city that has highest sum of 
invoice totals return both city name and sum of all invoice totals. 

select billing_city,sum(total) from invoice group by billing_city order by sum(total) desc limit 1;

Q 5:-Who is the best customer? The customer who has spent the most money will be declared as the best
customer. Write a query that returns the person who has spent the most money.

select c.customer_id,c.first_name,c.last_name,sum(v.total) from customer as c inner join invoice 
as v on c.customer_id=v.customer_id group by c.customer_id order by sum(v.total) desc limit 1 ;

Q 6:-Write a query to returnthe email, first name, last name and genre of all rock music listeners
return your list ordered alhabetically by email starting with a.
 
 select c.first_name,c.last_name,c.email from customer as c inner join invoice as i 
 on c.customer_id=i.customer_id inner join invoice_line as il on i.invoice_id=il.invoice_id 
 inner join track as t on il.track_id=t.track_id inner join genre as g on t.genre_id=g.genre_id 
 where g.name like "Rock" order by c.email;
 
 Q 7:-let invite artist who have written the most rock music in oue dataset. Write a query that returns 
 the artist name and total track countof the top 10 rock bands.
 
 select ar.name,count(ar.artist_id) from artist as ar inner join album2 as al on 
 ar.artist_id=al.artist_id inner join track as t on t.album_id=al.album_id inner join genre as g on 
 t.genre_id=g.genre_id where g.name like "Rock" group by ar.artist_id order by count(ar.artist_id)desc;
 
 Q 8:-Return all the track names that have a song length longer than the avg. song length. Return the 
 name and millisecond for each track. Order by song length with the longest song listed first.
 
 select name,milliseconds from track where milliseconds > ( select avg(milliseconds) from track) 
 order by milliseconds desc;



SELECT b.book_id, a.name, a.author_id, b.title
FROM books as b
join authors as a
    on a.author_id = b.author_id
where a.author_id BETWEEN 1 and 5;


select c.name, b.title, a.name, t.type
from transactions as t
join books as b
    ON t.book_id = b.book_id
join clients as c 
    on t.client_id = c.client_id
join authors as a 
    on b.author_id = a.author_id
where c.gender = 'M'
    and t.type IN ('sell', 'lend');


SELECT b.title, a.name 
from authors as a, books as b 
WHERE a.author_id = b.author_id
    limit 10;


SELECT b.title, a.name 
from books as b 
inner join authors as a
    on a.author_id = b.author_id
limit 10;


select a.author_id, a.name, a.nationality, b.title
from authors as a 
left JOIN books as b 
    on b.author_id = a.author_id
where a.author_id BETWEEN 1 and 5
order by a.author_id;


select a.author_id, a.name, a.nationality, COUNT(b.book_id)
from authors as a 
left JOIN books as b 
    on b.author_id = a.author_id
where a.author_id BETWEEN 1 and 5
GROUP by a.author_id
order by a.author_id;
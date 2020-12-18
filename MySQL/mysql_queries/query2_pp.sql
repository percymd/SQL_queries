Para comentar se usa: /*texto a insertar*/
o #{texto a insertar}


#¿Qué nacionalidades hay?
SELECT distinct nationality from authors
where nationality IS not NULL
ORDER BY nationality;


#¿Cuántos escritores hay de cada nacionalidad?
select nationality, COUNT(author_id) AS c_authors
from authors
where nationality IS not NULL
    and nationality NOT IN('RUS','AUS') 
    /*{NOT IN = <> pero solo una columna / IN para solo seccionar esos valores*/
GROUP BY nationality
Order by c_authors DESC, nationality asc;


#¿Cúantos libros hay de cada nacionalidad?
select nationality, COUNT(book_id) AS c_books
from authors, books
where nationality IS not NULL
GROUP BY nationality
Order by c_books DESC, nationality asc;


#¿Cuál es el promedio/desviación standard del precio de libros?
select nationality, COUNT(book_id)as libros,
    AVG(price) as prom, 
    STDDEV(price) as std
from books as b
JOIN authors as a
    on a.author_id = b.author_id
GROUP BY nationality
ORDER BY libros desc;


#¿Cuál es el precio máximo/mínimo de un libro?
SELECT a.nationality, max(price), min(price)
FROM books as b
join authors as a
    on a.author_id = b.author_id
GROUP BY nationality;


#¿Cómo quedaría el reporte de préstamos?
SELECT c.name, t.type, b.title, 
    CONCAT(a.name, " (", a.nationality,")") as author,
    TO_DAYS(NOW()) - TO_DAYS(t.created_at) as ago
FROM transactions as t 
LEFT JOIN clients as c 
    ON c.client_id = t.client_id
LEFT JOIN books as b 
    ON b.book_id = t.book_id
LEFT JOIN authors as a 
    ON b.author_id = a.author_id;


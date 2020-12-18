delete from authors where author_id = 161 limit 1

update tabla
SET 
    [columna = valor, ...]
WHERE
    [condiciones]
LIMIT 1;


update clients
SET active = 0
WHERE client_id = 80
LIMIT 1;

update clients
SET email = 'javier@gmail.com'
WHERE client_id = 7
    OR client_id = 9
LIMIT 1;

update clients
SET active = 0
WHERE client_id IN (1, 6 ,8 ,27, 90)
    OR name like '%Lopez%'

select client_id, name, active
from clients
where client_id IN (1, 6 ,8 ,27, 90)
    OR name like '%Lopez%';

truncate transactions;
/*Extract the first row*/
select *
from platzi.alumnos
fetch first 1 row only; /*or LIMIT 1;*/

/*Extract the first 5 rows*/
/*FETCH FIRST (ANSI) / LIMIT (NO ANSI)*/
select *
from platzi.alumnos
fetch first 5 row only; /*or LIMIT 5;*/


/*Assing a row_id to each row from alumnos*/
select *
from (
	select row_number() over() as row_id, *
	from platzi.alumnos
)as alumnos_with_row_num
;


/*Only extract one row (row_id = i)*/
select *
from (
	select row_number() over() as row_id, *
	from platzi.alumnos
)as alumnos_with_row_num
where row_id = 1;

/*Extract the firsts 5 rows*/
select *
from (
	select row_number() over() as row_id, *
	from platzi.alumnos
)as alumnos_with_row_num
where row_id < 6; /*row_id <= 5;*/

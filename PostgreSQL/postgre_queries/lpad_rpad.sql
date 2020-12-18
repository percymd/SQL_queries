/*lpad: agregar a la izquierda*/
/*rpad: agregar a la derecha*/

/*A 'sql' agregar '+' hasta completar los 15 espacios*/
select lpad('sql', 15,'+');


/*agregar sql a los 10 primeros id */
/*Se forma una especie de triangulo*/
select lpad('sql', id, '*')
from platzi.alumnos
where id < 10; 


/*Llenar carecteres para completar la logitud solicictada*/
select lpad('*', cast(row_id as int), '*')
from(
	select row_number() over() as row_id
	from platzi.alumnos
) as alumnos_with_row_id
where row_id <= 5;


/*Llenar carecteres para completar la logitud solicictada*/
select lpad('*', cast(row_id as int), '*')
from(
	select row_number() over(order by carrera_id) as row_id, *
	from platzi.alumnos
) as alumnos_with_row_id
where row_id <= 5
order by carrera_id;


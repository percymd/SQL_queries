/*Extraer varias opciones or especific rows*/
select *
from(
	select row_number() over() as row_id, *
	from platzi.alumnos
) as alumnos_with_row_num
where row_id in(1,5,10,12,15,20);


/*Extraer varias opciones or especific rows*/
select *
from(
	select row_number() over() as row_id, *
	from platzi.alumnos
) as alumnos_with_row_num
where row_id in(1,5,10,12,15,20); /*Podemos traer la inversa colocando el not antes del in*/



/*Alumnos cuyo tutor sea 30*/
select *
from platzi.alumnos
where id in (
	select id
	from platzi.alumnos
	where tutor_id = 30
);


/*Alumnos cuyo tutor sea 30 y lleve la carrera 31*/
select *
from platzi.alumnos
where id in (   /*Podemos traer la inversa colocando el not antes del in*/
	select id
	from platzi.alumnos
	where tutor_id = 30
		and carrera_id = 31
);
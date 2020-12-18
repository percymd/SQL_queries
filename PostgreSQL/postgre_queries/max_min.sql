/*Fecha de incorporacion mas reciente*/
select fecha_incorporacion
from platzi.alumnos
order by fecha_incorporacion desc
limit 1;


/*Fecha de incorporacion mas reciente por carrera*/
select carrera_id, max(fecha_incorporacion)
from platzi.alumnos
group by carrera_id
order by carrera_id;


/*Minimo nombre alfabeticamente por tutor_id*/
select tutor_id, min(nombre)
from platzi.alumnos
group by tutor_id
order by tutor_id;
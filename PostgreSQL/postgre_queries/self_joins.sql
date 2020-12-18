/*Tutores de cada alumno*/
select concat(a.nombre, ' ', a.apellido) as alumno,
		concat(t.nombre, ' ', t.apellido) as tutor
from platzi.alumnos as a
	inner join platzi.alumnos as t on a.tutor_id = t.id;


/*Tutores con mayor catidad de alumnos*/
select concat(t.nombre, ' ', t.apellido) as tutor,
		count(*) as alumnos_por_tutor
from platzi.alumnos as a
	inner join platzi.alumnos as t on a.tutor_id = t.id
group by tutor
order by alumnos_por_tutor desc;


/*10 tutores con mas alumnos a su cargo*/
select concat(t.nombre, ' ', t.apellido) as tutor,
		count(*) as alumnos_por_tutor
from platzi.alumnos as a
	inner join platzi.alumnos as t on a.tutor_id = t.id
group by tutor
order by alumnos_por_tutor desc
limit 10;

/*Promedio de alumnos por tutor*/
select avg(alumnos_por_tutor) as promedio_de_alumnos_por_tutor
from(
	select concat(t.nombre, ' ', t.apellido) as tutor,
		count(*) as alumnos_por_tutor
from platzi.alumnos as a
	inner join platzi.alumnos as t on a.tutor_id = t.id
group by tutor
) as alumnos_tutor;

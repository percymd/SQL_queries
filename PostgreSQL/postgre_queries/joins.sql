/*Extraer los alumnos y carreras*/
/*(Incluye alumnos con carreras o carreras sin alumnos)*/
select a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
from platzi.alumnos as a
	full outer join platzi.carreras as c
	on a.carrera_id = c.id
order by a.carrera_id;


/*Alumnos que no tienen carrera*/
/*Left joim exclusivo*/
select a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
from platzi.alumnos as a
	left join platzi.carreras as c
	on a.carrera_id = c.id
where c.id is null
order by a.carrera_id;

/*Almunos tengan o no carrera*/
/*Left join inclusivo*/
select a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
from platzi.alumnos as a
	left join platzi.carreras as c
	on a.carrera_id = c.id


/*Carreras tengan o no tengan alumnos*/
select a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
from platzi.alumnos as a
	right join platzi.carreras as c
	on a.carrera_id = c.id
order by c.id desc;


/*Alumnos que tienen carreras*/
/*Interseccion entre tablas*/
select a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
from platzi.alumnos as a
	inner join platzi.carreras as c
	on a.carrera_id = c.id
order by c.id desc;


/*Elementos que no se intersectan entre tablas*/
select a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
from platzi.alumnos as a
	full outer join platzi.carreras as c
	on a.carrera_id = c.id
where a.id is null
	or c.id is null
order by a.id desc, c.id desc;


/*Segunda colegiatura mas alta*/
select distinct colegiatura
from platzi.alumnos as a1
where 2 = (
	select count(distinct colegiatura)
	from platzi.alumnos as a2
	where a1.colegiatura <= a2.colegiatura
);


/*Segunda colegiatura mas alta*/
select distinct colegiatura
from platzi.alumnos
order by colegiatura desc
limit 1 offset 1;

/*Segunda colegiatura mas alta para tutor 20*/
select distinct colegiatura, tutor_id
from platzi.alumnos
where tutor_id = 20 
order by colegiatura desc
limit 1 offset 1;


/*Alumnos con la segunda colegiatura mas alta*/
select *
from platzi.alumnos as datos_alumnos
inner join(
	select distinct colegiatura
	from platzi.alumnos
	where tutor_id = 20
	order by colegiatura desc
	limit 1 offset 1
) as segunda_mayor_colegiatura
on datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;


/*Alumnos con la segunda colegiatura mas alta*/
select *
from platzi.alumnos as datos_alumnos
where colegiatura = (
	select distinct colegiatura
	from platzi.alumnos
	where tutor_id = 20
	order by colegiatura desc
	limit 1 offset 1
);

/*Presentar la segunda mitad de la tabla*/
select row_number() over() as row_id, *
from platzi.alumnos
offset(
	select count(*)/2
	from platzi.alumnos
);
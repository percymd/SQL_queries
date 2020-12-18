/*Colegiatura promedio por carrera*/
select *,
	avg(colegiatura) over(partition by carrera_id)
from platzi.alumnos;


/*promedio de toda la tabla*/
select *,
	avg(colegiatura) over()
from platzi.alumnos;


/*order by con sum, toma los que son iguales o mayores que la tupla actual*/
select *,
	sum(colegiatura) over(partition by carrera_id order by colegiatura)
from platzi.alumnos;


/*ranking de colegiatura*/
select *,
	rank() over(partition by carrera_id order by colegiatura desc)
from platzi.alumnos;


/*Ranking de las 2 mayores colegiaturas por carrera*/
select *
from(
	select *,
	rank() over(partition by carrera_id order by colegiatura desc) as brand_rank
	from platzi.alumnos
) as rank_colegiaturas_por_carrera
where brand_rank < 3
order by carrera_id, brand_rank;

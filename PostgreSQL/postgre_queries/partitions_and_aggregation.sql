/*Ordernar pro fecha de incorporacion*/
select row_number() over(order by fecha_incorporacion) as row_id, *
from platzi.alumnos;


select first_value(colegiatura) over(partition by carrera_id) as primera_colegiatura, *
from platzi.alumnos;


select last_value(colegiatura) over(partition by carrera_id) as primera_colegiatura, *
from platzi.alumnos;


select nth_value(colegiatura, 3) over(partition by carrera_id) as primera_colegiatura, *
from platzi.alumnos;


/*ranking sin gaps (1,1,1,2,2,3,3,3,..).*/
select *,
	dense_rank() over(partition by carrera_id order by colegiatura desc) as colegiatura_rank
from platzi.alumnos
order by carrera_id, colegiatura_rank;


--(rank-1) / (total rows -1)
select *,
	percent_rank() over(partition by carrera_id order by colegiatura desc) as colegiatura_rank
from platzi.alumnos
order by carrera_id, colegiatura_rank;
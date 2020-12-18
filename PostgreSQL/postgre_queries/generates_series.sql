/*Genera una lista del 1.1 al 4, cada 1.3 valores*/
select * 
from generate_series(1.1, 4, 1.3);


/*Tabla dinámica, lista cada 7 días desde hoy(current_date)*/
/*la s es la tabla dinamica que formamos*/
select current_date + s.a as dates
from generate_series(0,14,7) as s(a); /*lo cruzamos con la columna a*/


/*Gerera lista de valores cada 10 horas entre las fechas ingresadas*/
select * 
from generate_series('2020-09-01 00:00:00'::timestamp,
					'2020-09-04 12:00:00', '10 hours');


/*Alumnos que cuentan con carrera_id entre el 1 y el 10*/
select a.id,
		a.nombre,
		a.apellido,
		a.carrera_id,
		s.a 
from platzi.alumnos as a
	inner join generate_series(0,10) as s(a)
	on s.a = carrera_id
order by a.carrera_id;


/*Realizar triangulacion con ordinalidad*/
/*ordinalidad indica que valores sean crecientes*/
select lpad('*', CAST(ordinality as int), '*')
from generate_series(10,2,-2) with ordinality;
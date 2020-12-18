/*La fecha puede estar en formato string 
(no timestamp o datetime, el cual es mayormente usado)*/


/*Extraer años registrados*/
select extract(year from fecha_incorporacion) as ano_incorporacion
from platzi.alumnos;


/*Extraer años registrados*/
select date_part('year', fecha_incorporacion) as ano_incorporacion
from platzi.alumnos;


/*Fecha y hora de incorporacion de cada alumno*/
select date_part('year', fecha_incorporacion) as ano_incorporacion,
		date_part('month', fecha_incorporacion) as mes_incorporacion,
		date_part('day', fecha_incorporacion) as dia_incorporacion,
        date_part('hour', fecha_incorporacion) as hora_incorporacion,
		date_part('minute', fecha_incorporacion) as minuto_incorporacion,
		date_part('second', fecha_incorporacion) as segundo_incorporacion
from platzi.alumnos;


/*Alumnos que se incorporaron el 2019*/
select *
from platzi.alumnos
where(extract (year from fecha_incorporacion)) = 2019;


/*Alumnos que se incorporaron el 2019*/
select *
from platzi.alumnos
where(date_part('year', fecha_incorporacion))= 2019;

/*Alumnos que se incorporaron Mayo del 2018*/
select *
from platzi.alumnos
where(date_part('year', fecha_incorporacion))= 2019
and date_part('month', fecha_incorporacion)=5;


/*Alumnos que se incorporaron el 2020*/
select * 
from (
	select *,
		date_part('year', fecha_incorporacion) as ano_incorporacion
	from platzi.alumnos
) as alumnos_con_anos
where ano_incorporacion = 2020;

/*Alumnos que se incorporaron Mayo del 2018*/
select * 
from (
	select *,
		date_part('year', fecha_incorporacion) as ano_incorporacion,
        date_part('month', fecha_incorporacion) as mes_incorporacion
	from platzi.alumnos
) as alumnos_con_anos
where ano_incorporacion = 2018
      and mes_incorporacion = 5;

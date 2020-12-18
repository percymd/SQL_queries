/*Alumnos con los tutores 1, 2, 3 y 4*/
select *
from platzi.alumnos
where tutor_id in (1,2,3,4);


/*Alumnos con tutores del 1 al 10*/
select *
from platzi.alumnos
where tutor_id >= 1
	and tutor_id <= 10;

/*Alumnos con tutores del 1 al 10*/	
select *from platzi.alumnos
where tutor_id between 1 and 10;


/*El id 3 se encuentra en el rango (10, 20)*/
/*Respuesta booleano: False*/
select int4range(10, 20) @>3; /*El 4 significa: small int*/

/*El id 3 se encuentra en el rango (10, 20)*/
/*Respuesta booleano: True*/
select int4range(1, 20) @>3;


/*El rango (20.0,30.0) tiene caracteres dentro del rango (11.1, 22.2)*/
/*Respuesta booleano: True*/
select numrange(11.1, 22.2) && numrange(20.0, 30.0);

/*El rango (20.0,30.0) tiene caracteres dentro del rango (11.1, 22.2)*/
/*Respuesta booleano: False*/
select numrange(11.1, .19.9) && numrange(20.0, 30.0);


/*Limite mas alto del rango (15,25)*/
/*El 8 significa: rango entero normal*/
select upper(int8range(15,25));

/*Limite mas bajo del rango (15,25)*/
select lower(int8range(15,25));


/*Intersección entre rangos*/
select int4range(10,20) * int4range(15,25);


/*El rango esta vacio, respuesta booleana*/
select isempty(numrange(1,5));


/*Extraer tutor_id del 1 al 10*/
select *
from platzi.alumnos
where int4range(10,20) @> tutor_id;

/*Intersección de los rangos entre tutores y carreras*/
select numrange(
	(select min(tutor_id) from platzi.alumnos),
	(select max(tutor_id) from platzi.alumnos)
) * numrange(
	(select min(carrera_id) from platzi.alumnos),
	(select max(carrera_id) from platzi.alumnos)
);
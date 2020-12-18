/*Encontrar registros duplicados*/
select * 
from platzi.alumnos as ou
where (
	select count(*)
	from platzi.alumnos as inr
	where ou.id = inr.id
) > 1;

/*Encontrar registros duplicados*/
select(platzi.alumnos.*)::text, count(*)
from platzi.alumnos
group by platzi.alumnos.*
having count(*)>1;


/*Encontrar registro duplicado 
cuando tiene diferente id pero mismo contenido en los rows*/
select(platzi.alumnos.nombre,
	   platzi.alumnos.apellido,
	   platzi.alumnos.email,
	   platzi.alumnos.colegiatura,
	   platzi.alumnos.fecha_incorporacion,
	   platzi.alumnos.carrera_id,
	   platzi.alumnos.tutor_id
	  )::text, count(*)
from platzi.alumnos
group by platzi.alumnos.nombre,
	   platzi.alumnos.apellido,
	   platzi.alumnos.email,
	   platzi.alumnos.colegiatura,
	   platzi.alumnos.fecha_incorporacion,
	   platzi.alumnos.carrera_id,
	   platzi.alumnos.tutor_id
having count(*)>1;


/*Encontrar registro duplicado por cada particion*/
select *
from(
	select id,
	row_number() over(
		partition by
			nombre,
			apellido,
			email,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
		order by id asc
	) as row,
	*
	from platzi.alumnos
) as duplicados
where duplicados.row > 1;


/*Borrar registro duplicado por cada particion*/
delete from platzi.alumnos
where id in (
    select id
    from(
        select id,
        row_number() over(
            partition by
                nombre,
                apellido,
                email,
                colegiatura,
                fecha_incorporacion,
                carrera_id,
                tutor_id
            order by id asc
        ) as row,
        *
        from platzi.alumnos
    ) as duplicados
    where duplicados.row > 1
);

/*Borrar registro duplicado por cada particion*/
delete from platzi.alumnos
where id in(
    select id
    from(
        select id,
        row_number() over(
            partition by
                nombre,
                apellido,
                email,
                colegiatura,
                fecha_incorporacion,
                carrera_id,
                tutor_id
            order by id asc
        ) as row
        from platzi.alumnos
    ) as duplicados
    where duplicados.row > 1
);
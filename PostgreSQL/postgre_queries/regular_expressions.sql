select email
from platzi.alumnos
where email ~*'[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}';
/*De manera global, sin contar mayusculas y minisculas (~*),
tiene que encontrar que existan n numeros de manera alfabetica(A-Z),
del 0 al 9 o alfanumericos(0-9)
o que incluyan alguno de los signos de email '.', '_', '%', '+', '-', etc(._%+-)
especificamente tiene que haber este caracter: @ (@)
Luego del arroba indicamos que puede haber ciertos caracteres, como los detallados anteriormente
se le concatena un '.' porque tiene que finalizar en un '.'(\.)
al final de ese punto van letras ([A-Z])
de 2 a 4 caracteres ({2,4}), ejemplo: .edu, .gob, etc*/


/*Emails con terminacion de domino google*/
select email
from platzi.alumnos
where email ~*'[A-Z0-9._%+-]+@google[A-Z0-9.-]+\.[A-Z]{2,4}';
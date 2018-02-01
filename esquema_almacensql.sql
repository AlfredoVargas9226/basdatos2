--generamos la primer tabla
create table almacen (ID_ALMACEN INTEGER, UBICACION_ALMACEN VARCHAR2 (50),
constraint pk_ID_ALMACEN  primary key (ID_ALMACEN));
--(numero_almacen integer, ubicacion_almacen varchar2(50),
--constraint pk_num_alm primary key (numero_almacen));

create or replace procedure guardar_almacen(my_num_alm in integer,my_ubicacion in varchar2)
as

begin
--cuerpo o logica del procedimiento
insert into almacen values(my_num_alm, my_ubicacion);
end;
/

--usaremos un bloque pl sql para probar que esta bien nuestro procedimiento 

BEGIN
GUARDAR_ALMACEN(321, 'ECATEPEC');
END;
/

SELECT * FROM ALMACEN;
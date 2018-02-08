--generamos la primer tabla
create table almacen(ID_almacen integer, ubicacion_almacen varchar2(50),
constraint pk_ID_almacen primary key (ID_almacen));

create or replace procedure guardar_almacen(my_num_alm in integer,
my_ubicacion in varchar2)
as
begin
--CUERPO O LOGICA DEL PROCEDIMIENTO
insert into almacen values(my_num_alm, my_ubicacion);
end;
/
 select * from almacen;
--2do procedimiento
--USAMOS BLOQUE PLSQL PARA PROBAR QUE ESTA BIEN NUESTRO PROCEDIMIENTO

begin
guardar_almacen(321,'ecatepec');
end;
/
select * from almacen;


--creacion de tabla CLIENTE

create table cliente(numero_cliente integer, numero_almacen integer, nombre_cliente varchar2(80), 
constraint pk_n_c primary key(numero_cliente),
constraint fk1_n_a foreign key(numero_almacen) 
references almacen(id_almacen));

--creacion de la tabla vendedor
create table vendedor(numero_vendedor integer, nombre_vendedor varchar2(80), area_ventas varchar2(80), 
constraint pk_v primary key(numero_vendedor));

select * from vendedor;

-- crear ventas tabla

create table ventas(id_ventas inter, numero_clientes integer, numero_vendedor integer, monto_ventas float,
constraint pk_id_v primary key (id_vendedor),
constraint fk1_n_c1 foreign key(numero_cliente) references cliente (numero_cliente),
constraint fk1_n_ven foreign key (numero_vendedor) references vendedor(numero_vendor));
--pasos para generar un proceso almacenado para guardar una fila o registro de una tabla con pk impuesto o artificial
--1-generar una secuencia 
--2- generar el proceso y asociarlo


create table calificaciones (id_calificacion integer, materia varchar2(80), valor float,
constraint pk_id_cal primary key (id_calificacion));
--generar secuencia 
create sequence sec_calificaciones 
start with 1
increment by 1
nomaxvalue;
--aqui vienen el proceso chingon
create or replace procedure guardar_calificaciones(
my_id_calificacion out integer,my_materia in varchar2,
my_valor in float)
as
begin
select sec_calificaciones.nextval into my_id_calificacion from dual;
insert into calificaciones values(my_id_calificaciones, my_valor);
end;
/





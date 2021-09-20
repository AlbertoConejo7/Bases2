--Base de Datos el Baratico

--Bitacora transaccional : usuario ,ventas consultas acciones
-- trigger venta : descuenta del stock

--gerente deben quedar registradas, hora, día,
 --tipo de transacción, tabla y el usuario que realiza la operación



--cajeros: solo realizar ventas y consultar precios 


--gerente de area : aplicar modificaciones los productos
--modificaciones (descripción y cantidad) a los productos del área que le corresponde,



-- consulta de productos :por medio de código o descripción,

-- el gerente general es el único empleado que puede insertar nuevos productos, modificarlos, consultarlos y borrarlos (en el caso del que el producto se encuentre descontinuado), 


--Tabla usuarios cajero

--•	Usuario
--•	Número de caja
--•	Número de factura
--•	Monto total de la factura 
--•	Fecha de la venta 
--•	Hora de la venta


--tabla productos 

--1.	PLU: es un código de 4 a 5 dígitos único para cada producto en el área de frescos. 
--2.	EAN: código basado en la representación de un conjunto de líneas paralelas de distinto grosor y espaciado que en su conjunto contienen una determinada información, es decir, las barras y espacios del código representan pequeñas cadenas de caracteres. De este modo, el código de barras permite reconocer rápidamente un artículo de forma única, global y no ambigua y consta de 13 dígitos.
--3.	Descripción: descripción del producto ejemplo: “Piña Hawaiana”, esta información aplica para todos los productos 
--4.	Peso: en gramos en el caso de los productos frescos.
--5.	Precio: el precio que se maneja es el precio por kilogramos en el caso de los productos frescos; en el caso de los otros productos se maneja precio por unidad.
--6.	Cantidad: se maneja para todos aquellos productos que no pertenecen al departamento de frescos.



--tabla Bitacora
--•	Operación realizada
--•	Usuario quien realizó la operación
--•	Fecha
--•	Hora 
--•	Tabla afectada


--factura

--•	El número de la factura (el cual es único)
--•	El detalle de la factura: artículo (código), cantidad, subtotal, total, cajero, caja, fecha y hora. 



create table usuario(
   cedula int not null,
   nombre varchar(30) not null,
   apellido_1 varchar(30) not null,
   apellido_2 varchar(30) not null,
   direccion varchar(50),
   e_mail varchar(30),
   fecha_inscripcion date not null,
   constraint pkusuario primary key (cedula)
);


create table cajero(
  id_cajero varchar(30) not null,
  usuario int not null,
  constraint pkcajero primary key (id_cajero),
  constraint fkusuario foreign key (usuario) references usuario (cedula)
  
);

create table factura(
  numero_factura int not null,
  total float,
  cajero varchar(30) not null,
 numero_caja int,
  monto_total_factura float,
  fecha_venta date,
  hora_venta timestamp,
  constraint pkfactura primary key (numero_factura)
  
);



create table detalle(
id_factura int not null,
id_detalle int,
subtotal float,
articulo varchar(30) not null,
cantidad int,
constraint pkdetalle primary key (id_detalle),
constraint fkfactura foreign key (id_factura) references factura (numero_factura)

);

create table articulo( 
id_detalle int,
PLU varchar(5),
EAN varchar(13),
descripcion varchar(45),
peso int,
precio float,
cantidad int,
constraint pkean primary key (EAN),
constraint fkdetalle foreign key (id_detalle) references detalle (id_detalle)

);

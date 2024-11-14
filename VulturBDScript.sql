drop schema public;
create schema pagina;
create table pagina.marca(
IDMarca serial primary key,
Descripcion varchar (30)
);

create table pagina.Colores(
IDColor serial primary key,
Descripcion varchar (20)
);

create table pagina.autos(
IDAuto serial primary key,
Kilometraje float,
DueniosAnt smallint,
Modelo varchar (30),
Año smallint,
FK_Marca int,
FK_Color int,
foreign key (FK_Marca) references pagina.Marca (IDMarca) on update cascade on delete cascade,
foreign key (FK_Color) references pagina.Colores (IDColor) on update cascade on delete cascade
);


create table pagina.Usuarios(
IDusuario serial primary key,
Nombre varchar (30),
ApPaterno varchar (30),
ApMaterno varchar (30),
Contraseña varchar (15),
Correo varchar (60),
Edad smallint,
Telefono smallint
);

create table pagina.FormasPago(
IDFormapago serial primary key,
Descripcion varchar (20)
);

create table pagina.Ventas_encabezado(
IDVentasDetalle serial primary key,
Folio varchar (20),
Fecha date,
FK_Auto int,
FK_Formapago int,
foreign key (FK_Auto) references pagina.autos (IDAuto) on update cascade on delete cascade,
foreign key (FK_Formapago) references pagina.FormasPago (IDFormapago) on update cascade on delete cascade
);

create table pagina.Ventas_Detalles(
IDventas_detalle serial primary key,
Cantidad int,
Precio float,
FK_Auto int,
foreign key (FK_Auto) references pagina.autos (IDAuto) on update cascade on delete cascade
);

create table pagina.Inventario(
IDInventario serial primary key,
Cantidad int,
FK_Auto int,
foreign key (FK_Auto) references pagina.autos (IDAuto) on update cascade on delete cascade
);
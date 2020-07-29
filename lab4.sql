use Pedidos;
go

alter table movimientos.CabeceraPedido add tipoPed varchar(10)
go

alter table movimientos.CabeceraPedido add monto_total Money

alter table catalogo.Cliente add codigo_garante Money

insert into [catalogo].[Cliente] values (1, 500, 2.5, 'Quito', 'Av. Teniente', 'Calzado', 'oe-34', '1' )
insert into [catalogo].[Cliente] values (2, 500, 1.5, 'Quito', 'Balzar', 'San Bartolo', 'oe-32', '2' )
insert into [catalogo].[Cliente] values (3, 500, 1.9, 'Quito', 'Av. Quitumbe', 'Solanda', 'oe-18', '3' )

insert into [catalogo].[Fabrica] values (1, 'Fabrica1', 3050468)
insert into [catalogo].[Fabrica] values (2, 'Fabrica2', 3050468)
insert into [catalogo].[Fabrica] values (3, 'Fabrica3', 2040506)

insert into [catalogo].[Producto] values (1, 'Producto1', 'Disponible',  2.6)
insert into [catalogo].[Producto] values (2, 'Producto2', 'Disponible',  5.5)
insert into [catalogo].[Producto] values (3, 'Producto3', 'Disponible',  3)

insert into [movimientos].[CabeceraPedido] values (1, '2020-03-25', 1, 'abcd', 5)
insert into [movimientos].[CabeceraPedido] values (2, '2020-04-15', 1, 'efg', 2.5)
insert into [movimientos].[CabeceraPedido] values (3, '2020-05-05', 1, 'abcd', 3)

insert into [movimientos].[DetallePedido] values (1, 2, 5, 1, 1, 1)

insert into [movimientos].[Fabrica_Distribuye_Producto] values (1, 1, 'abd')
insert into [movimientos].[Fabrica_Distribuye_Producto] values (2, 2, 'abd')
insert into [movimientos].[Fabrica_Distribuye_Producto] values (3, 3, 'abd')


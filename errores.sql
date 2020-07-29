use master 
go

alter database [Pedidos]
set single_user
with rollback immediate;
go

alter database [Pedidos]
set read_only;
go

alter database [Pedidos]
set multi_user
go


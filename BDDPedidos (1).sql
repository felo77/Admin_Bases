USE master;
GO
CREATE DATABASE Pedidos
ON PRIMARY(
NAME = Pedidos_Primario,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Pedidos_Primario.mdf',
SIZE = 5MB,
MAXSIZE = 10MB,
FILEGROWTH = 10% ),
FILEGROUP Secundario
( NAME = Pedidos_Secundario,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Pedidos_Secundario.ndf',
SIZE = 5MB,
MAXSIZE = 10MB,
FILEGROWTH = 10% )
LOG ON 
(NAME = Pedidos_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\Log\Pedidos_log.ldf',
SIZE = 2MB,
MAXSIZE = 8MB,
FILEGROWTH = 1MB) ;

GO

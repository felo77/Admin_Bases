USE [master]
GO
/****** Object:  Database [Pedidos]    Script Date: 29/07/2020 0:52:53 ******/
CREATE DATABASE [Pedidos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pedidos_Primario', FILENAME = N'C:\BDD\DATA\Pedidos_Primario.mdf' , SIZE = 8192KB , MAXSIZE = 10240KB , FILEGROWTH = 10%), 
 FILEGROUP [Secundario] 
( NAME = N'Pedidos_Secundario', FILENAME = N'C:\BDD\DATA\Pedidos_Secundario.ndf' , SIZE = 5120KB , MAXSIZE = 10240KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Pedidos_log', FILENAME = N'C:\BDD\Log\Pedidos_log.ldf' , SIZE = 2048KB , MAXSIZE = 8192KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [Pedidos] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pedidos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pedidos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pedidos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pedidos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pedidos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pedidos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pedidos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pedidos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pedidos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pedidos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pedidos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pedidos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pedidos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pedidos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pedidos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pedidos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pedidos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pedidos] SET RECOVERY FULL 
GO
ALTER DATABASE [Pedidos] SET  MULTI_USER 
GO
ALTER DATABASE [Pedidos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pedidos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pedidos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pedidos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pedidos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pedidos', N'ON'
GO
ALTER DATABASE [Pedidos] SET QUERY_STORE = OFF
GO
USE [Pedidos]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Pedidos]
GO
/****** Object:  Schema [catalogo]    Script Date: 29/07/2020 0:52:54 ******/
CREATE SCHEMA [catalogo]
GO
/****** Object:  Schema [movimientos]    Script Date: 29/07/2020 0:52:54 ******/
CREATE SCHEMA [movimientos]
GO
/****** Object:  Table [catalogo].[Cliente]    Script Date: 29/07/2020 0:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Cliente](
	[numero_cliente] [int] NOT NULL,
	[limite_credito] [money] NOT NULL,
	[descuento] [float] NULL,
	[ciudad] [varchar](30) NOT NULL,
	[calle_principal] [varchar](30) NOT NULL,
	[barrio] [varchar](30) NOT NULL,
	[numero_casa] [char](10) NOT NULL,
	[codigo_garante] [money] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[numero_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Fabrica]    Script Date: 29/07/2020 0:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Fabrica](
	[numero_fabrica] [int] NOT NULL,
	[nombre_fabrica] [varchar](30) NOT NULL,
	[telefono_contacto] [int] NOT NULL,
 CONSTRAINT [PK_Fabrica] PRIMARY KEY CLUSTERED 
(
	[numero_fabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Producto]    Script Date: 29/07/2020 0:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Producto](
	[numero_producto] [int] NOT NULL,
	[descripcion] [varchar](max) NOT NULL,
	[stock] [varchar](20) NOT NULL,
	[precio_unitario] [money] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[numero_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario] TEXTIMAGE_ON [Secundario]
GO
/****** Object:  Table [movimientos].[CabeceraPedido]    Script Date: 29/07/2020 0:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[CabeceraPedido](
	[id_cabecera] [int] NOT NULL,
	[fecha_pedido] [date] NOT NULL,
	[numero_cliente] [int] NOT NULL,
	[tipoPed] [varchar](10) NULL,
	[monto_total] [money] NULL,
 CONSTRAINT [PK_CabeceraPedido] PRIMARY KEY CLUSTERED 
(
	[id_cabecera] ASC,
	[numero_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimientos].[cabezacuerpoP]    Script Date: 29/07/2020 0:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[cabezacuerpoP](
	[id_cabecera] [int] NOT NULL,
	[fecha_pedido] [date] NOT NULL,
	[numero_cliente] [int] NOT NULL,
	[numero_pedido] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_total] [money] NOT NULL,
	[numero_producto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [movimientos].[DetallePedido]    Script Date: 29/07/2020 0:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[DetallePedido](
	[numero_pedido] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_total] [money] NOT NULL,
	[numero_producto] [int] NOT NULL,
	[id_cabecera] [int] NOT NULL,
	[numero_cliente] [int] NOT NULL,
 CONSTRAINT [PK_DetallePedido] PRIMARY KEY CLUSTERED 
(
	[numero_pedido] ASC,
	[numero_producto] ASC,
	[id_cabecera] ASC,
	[numero_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimientos].[Fabrica_Distribuye_Producto]    Script Date: 29/07/2020 0:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[Fabrica_Distribuye_Producto](
	[numero_producto] [int] NOT NULL,
	[numero_fabrica] [int] NOT NULL,
	[exixtencia] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Fabrica_Distribuye_Producto] PRIMARY KEY CLUSTERED 
(
	[numero_producto] ASC,
	[numero_fabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [movimientos].[CabeceraPedido]  WITH CHECK ADD  CONSTRAINT [Realiza] FOREIGN KEY([numero_cliente])
REFERENCES [catalogo].[Cliente] ([numero_cliente])
GO
ALTER TABLE [movimientos].[CabeceraPedido] CHECK CONSTRAINT [Realiza]
GO
ALTER TABLE [movimientos].[DetallePedido]  WITH CHECK ADD  CONSTRAINT [Es parte de] FOREIGN KEY([id_cabecera], [numero_cliente])
REFERENCES [movimientos].[CabeceraPedido] ([id_cabecera], [numero_cliente])
GO
ALTER TABLE [movimientos].[DetallePedido] CHECK CONSTRAINT [Es parte de]
GO
ALTER TABLE [movimientos].[DetallePedido]  WITH CHECK ADD  CONSTRAINT [Tiene] FOREIGN KEY([numero_producto])
REFERENCES [catalogo].[Producto] ([numero_producto])
GO
ALTER TABLE [movimientos].[DetallePedido] CHECK CONSTRAINT [Tiene]
GO
ALTER TABLE [movimientos].[Fabrica_Distribuye_Producto]  WITH CHECK ADD  CONSTRAINT [Distribuye] FOREIGN KEY([numero_fabrica])
REFERENCES [catalogo].[Fabrica] ([numero_fabrica])
GO
ALTER TABLE [movimientos].[Fabrica_Distribuye_Producto] CHECK CONSTRAINT [Distribuye]
GO
ALTER TABLE [movimientos].[Fabrica_Distribuye_Producto]  WITH CHECK ADD  CONSTRAINT [Se Encuentra] FOREIGN KEY([numero_producto])
REFERENCES [catalogo].[Producto] ([numero_producto])
GO
ALTER TABLE [movimientos].[Fabrica_Distribuye_Producto] CHECK CONSTRAINT [Se Encuentra]
GO
USE [master]
GO
ALTER DATABASE [Pedidos] SET  READ_WRITE 
GO

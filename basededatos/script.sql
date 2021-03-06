USE [master]
GO
/****** Object:  Database [kimdolsoft]    Script Date: 14/10/2015 18:26:11 ******/
CREATE DATABASE [kimdolsoft]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kimdolsoft', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\kimdolsoft.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'kimdolsoft_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\kimdolsoft_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [kimdolsoft] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kimdolsoft].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kimdolsoft] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kimdolsoft] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kimdolsoft] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kimdolsoft] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kimdolsoft] SET ARITHABORT OFF 
GO
ALTER DATABASE [kimdolsoft] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kimdolsoft] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kimdolsoft] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kimdolsoft] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kimdolsoft] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kimdolsoft] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kimdolsoft] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kimdolsoft] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kimdolsoft] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kimdolsoft] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kimdolsoft] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kimdolsoft] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kimdolsoft] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kimdolsoft] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kimdolsoft] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kimdolsoft] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kimdolsoft] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kimdolsoft] SET RECOVERY FULL 
GO
ALTER DATABASE [kimdolsoft] SET  MULTI_USER 
GO
ALTER DATABASE [kimdolsoft] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kimdolsoft] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kimdolsoft] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kimdolsoft] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [kimdolsoft] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'kimdolsoft', N'ON'
GO
USE [kimdolsoft]
GO
/****** Object:  Schema [m2ss]    Script Date: 14/10/2015 18:26:12 ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [nvarchar](20) NOT NULL,
	[tipoDocumento] [nchar](3) NOT NULL,
	[primerNombre] [nvarchar](20) NOT NULL,
	[segundoNombre] [nvarchar](20) NULL DEFAULT (NULL),
	[primerApellido] [nvarchar](20) NOT NULL,
	[segundoApellido] [nvarchar](20) NULL DEFAULT (NULL),
	[telefono] [nvarchar](7) NOT NULL,
	[celular] [nvarchar](12) NULL DEFAULT (NULL),
	[email] [nvarchar](30) NULL DEFAULT (NULL),
	[direccion] [nvarchar](40) NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_cliente_idCliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[compra]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[fechaCompra] [datetime2](0) NOT NULL,
	[descuento] [int] NULL,
	[idProveedor] [nvarchar](20) NOT NULL,
	[valorCompra] [int] NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_compra_idCompra] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contacto]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacto](
	[idContacto] [nvarchar](12) NOT NULL,
	[tipoDocumento] [nchar](3) NOT NULL,
	[primerNombre] [nvarchar](20) NOT NULL,
	[segundoNombre] [nvarchar](20) NULL DEFAULT (NULL),
	[primerApellido] [nvarchar](20) NOT NULL,
	[segundoApellido] [nvarchar](20) NULL DEFAULT (NULL),
	[celular] [nvarchar](12) NOT NULL,
	[email] [nvarchar](40) NULL DEFAULT (NULL),
	[idProveedor] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_contacto_idContacto] PRIMARY KEY CLUSTERED 
(
	[idContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cuentausuario]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuentausuario](
	[idCuentaUsuario] [smallint] IDENTITY(5,1) NOT NULL,
	[nombreUsuario] [nvarchar](20) NOT NULL,
	[contrasena] [nvarchar](13) NOT NULL,
	[preguntaSeguridad] [nvarchar](50) NOT NULL,
	[respuestaSeguridad] [nvarchar](45) NOT NULL,
	[idEmpleado] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_cuentausuario_idCuentaUsuario] PRIMARY KEY CLUSTERED 
(
	[idCuentaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [cuentausuario$nombreUsuario_UNIQUE] UNIQUE NONCLUSTERED 
(
	[nombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detallecompra]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallecompra](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idCompra] [int] NOT NULL,
	[cantidad] [smallint] NOT NULL,
	[valorUnitario] [int] NOT NULL,
 CONSTRAINT [PK_detallecompra_idDetalle] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalledevolucion]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalledevolucion](
	[idDetalle] [int] IDENTITY(2,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idDevolucion] [int] NOT NULL,
	[descripcion] [nvarchar](250) NOT NULL,
	[cantidadADevolver] [smallint] NOT NULL,
	[cantidadPendiente] [smallint] NOT NULL,
 CONSTRAINT [PK_detalledevolucion_idDetalle] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detallemovimiento]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallemovimiento](
	[idDetalle] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[idMovimiento] [int] NOT NULL,
	[cantidad] [smallint] NOT NULL,
	[valorUnitaro] [int] NOT NULL,
 CONSTRAINT [PK_detallemovimiento_idDetalle] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[devolucion]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[devolucion](
	[idDevolucion] [int] IDENTITY(3,1) NOT NULL,
	[fechaDevolucion] [datetime2](0) NOT NULL,
	[idProveedor] [nvarchar](20) NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_devolucion_idDevolucion] PRIMARY KEY CLUSTERED 
(
	[idDevolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empleado]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idEmpleado] [nvarchar](12) NOT NULL,
	[tipoDocumento] [nchar](3) NOT NULL,
	[primerNombre] [nvarchar](20) NOT NULL,
	[segundoNombre] [nvarchar](20) NULL DEFAULT (NULL),
	[primerApellido] [nvarchar](20) NOT NULL,
	[segundoApellido] [nvarchar](20) NULL DEFAULT (NULL),
	[rol] [nvarchar](13) NOT NULL,
	[direccion] [nvarchar](40) NOT NULL,
	[email] [nvarchar](30) NOT NULL,
	[telefono] [nvarchar](7) NOT NULL,
	[celular] [nvarchar](12) NULL DEFAULT (NULL),
	[estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_empleado_idEmpleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[existencia]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[existencia](
	[idExistencia] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidadMinima] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[disponibilidad] [int] NOT NULL,
 CONSTRAINT [PK_existencia_idExistencia] PRIMARY KEY CLUSTERED 
(
	[idExistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marca]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca](
	[idMarca] [smallint] IDENTITY(2,1) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](200) NULL DEFAULT (NULL),
 CONSTRAINT [PK_marca_idMarca] PRIMARY KEY CLUSTERED 
(
	[idMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento](
	[idMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[fechaVenta] [datetime2](0) NOT NULL,
	[fechaEntrega] [datetime2](0) NULL,
	[descuento] [int] NULL,
	[idCliente] [nvarchar](20) NULL,
	[idEmpleado] [nvarchar](12) NOT NULL,
	[idTipoMovimiento] [smallint] NOT NULL,
	[valorTotal] [int] NOT NULL,
	[estado] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_movimiento_idMovimiento] PRIMARY KEY CLUSTERED 
(
	[idMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[presentacion]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presentacion](
	[idPresentacion] [smallint] IDENTITY(2,1) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](200) NULL DEFAULT (NULL),
 CONSTRAINT [PK_presentacion_idPresentacion] PRIMARY KEY CLUSTERED 
(
	[idPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[producto]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[idProducto] [int] IDENTITY(2,1) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[valor] [int] NOT NULL,
	[descripcion] [nvarchar](100) NULL DEFAULT (NULL),
	[idPresentacion] [smallint] NOT NULL,
	[idTipoProducto] [smallint] NOT NULL,
	[idMarca] [smallint] NOT NULL,
	[idUnidad] [smallint] NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_producto_idProducto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[idProveedor] [nvarchar](20) NOT NULL,
	[tipoDocumento] [nchar](3) NOT NULL,
	[empresa] [nvarchar](50) NOT NULL,
	[direccionEmpresa] [nvarchar](30) NOT NULL,
	[emailEmpresa] [nvarchar](40) NULL DEFAULT (NULL),
	[telefonoEmpresa] [nvarchar](10) NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_proveedor_idProveedor] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipomovimiento]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipomovimiento](
	[idTipoMovimiento] [smallint] NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[descripción] [nvarchar](200) NULL,
 CONSTRAINT [PK_tipomovimiento_idTipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[idTipoMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipoproducto]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoproducto](
	[idTipoProducto] [smallint] IDENTITY(2,1) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](200) NULL DEFAULT (NULL),
 CONSTRAINT [PK_tipoproducto_idTipoProducto] PRIMARY KEY CLUSTERED 
(
	[idTipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[unidad]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unidad](
	[idUnidad] [smallint] IDENTITY(2,1) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](200) NULL DEFAULT (NULL),
 CONSTRAINT [PK_unidad_idUnidad] PRIMARY KEY CLUSTERED 
(
	[idUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_Compra_Proveedor1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Compra_Proveedor1_idx] ON [dbo].[compra]
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_contacto_Proveedor1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_contacto_Proveedor1_idx] ON [dbo].[contacto]
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_Empleado_Cuenta_Usuario]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Empleado_Cuenta_Usuario] ON [dbo].[cuentausuario]
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_has_Compra_Compra1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_has_Compra_Compra1_idx] ON [dbo].[detallecompra]
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_has_Compra_Producto1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_has_Compra_Producto1_idx] ON [dbo].[detallecompra]
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_has_Devolución_Devolución1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_has_Devolución_Devolución1_idx] ON [dbo].[detalledevolucion]
(
	[idDevolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_has_Devolución_Producto1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_has_Devolución_Producto1_idx] ON [dbo].[detalledevolucion]
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_has_Venta_Producto1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_has_Venta_Producto1_idx] ON [dbo].[detallemovimiento]
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_has_Venta_Venta1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_has_Venta_Venta1_idx] ON [dbo].[detallemovimiento]
(
	[idMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_Devolución_Proveedor1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Devolución_Proveedor1_idx] ON [dbo].[devolucion]
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Existencia_Producto1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Existencia_Producto1_idx] ON [dbo].[existencia]
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_movimiento_Tipo Movimiento1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_movimiento_Tipo Movimiento1_idx] ON [dbo].[movimiento]
(
	[idTipoMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_Venta_Cliente1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Venta_Cliente1_idx] ON [dbo].[movimiento]
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_Venta_Empleado1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Venta_Empleado1_idx] ON [dbo].[movimiento]
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_Marca1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_Marca1_idx] ON [dbo].[producto]
(
	[idMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_Presentación1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_Presentación1_idx] ON [dbo].[producto]
(
	[idPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_Tipo producto1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_Tipo producto1_idx] ON [dbo].[producto]
(
	[idTipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Producto_Unidad1_idx]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [fk_Producto_Unidad1_idx] ON [dbo].[producto]
(
	[idUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idPresentación]    Script Date: 14/10/2015 18:26:12 ******/
CREATE NONCLUSTERED INDEX [idPresentación] ON [dbo].[producto]
(
	[idPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra] ADD  DEFAULT (NULL) FOR [descuento]
GO
ALTER TABLE [dbo].[movimiento] ADD  DEFAULT (NULL) FOR [fechaEntrega]
GO
ALTER TABLE [dbo].[movimiento] ADD  DEFAULT (NULL) FOR [descuento]
GO
ALTER TABLE [dbo].[tipomovimiento] ADD  DEFAULT (NULL) FOR [descripción]
GO
ALTER TABLE [dbo].[compra]  WITH NOCHECK ADD  CONSTRAINT [compra$fk_Compra_Proveedor1] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [compra$fk_Compra_Proveedor1]
GO
ALTER TABLE [dbo].[contacto]  WITH NOCHECK ADD  CONSTRAINT [contacto$fk_contacto_Proveedor1] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[contacto] CHECK CONSTRAINT [contacto$fk_contacto_Proveedor1]
GO
ALTER TABLE [dbo].[cuentausuario]  WITH NOCHECK ADD  CONSTRAINT [cuentausuario$fk_Empleado_Cuenta_Usuario] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[cuentausuario] CHECK CONSTRAINT [cuentausuario$fk_Empleado_Cuenta_Usuario]
GO
ALTER TABLE [dbo].[detallecompra]  WITH NOCHECK ADD  CONSTRAINT [detallecompra$fk_Producto_has_Compra_Compra1] FOREIGN KEY([idCompra])
REFERENCES [dbo].[compra] ([idCompra])
GO
ALTER TABLE [dbo].[detallecompra] CHECK CONSTRAINT [detallecompra$fk_Producto_has_Compra_Compra1]
GO
ALTER TABLE [dbo].[detallecompra]  WITH NOCHECK ADD  CONSTRAINT [detallecompra$fk_Producto_has_Compra_Producto1] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detallecompra] CHECK CONSTRAINT [detallecompra$fk_Producto_has_Compra_Producto1]
GO
ALTER TABLE [dbo].[detalledevolucion]  WITH NOCHECK ADD  CONSTRAINT [detalledevolucion$fk_detalle_devolucion_devolucion] FOREIGN KEY([idDevolucion])
REFERENCES [dbo].[devolucion] ([idDevolucion])
GO
ALTER TABLE [dbo].[detalledevolucion] CHECK CONSTRAINT [detalledevolucion$fk_detalle_devolucion_devolucion]
GO
ALTER TABLE [dbo].[detalledevolucion]  WITH NOCHECK ADD  CONSTRAINT [detalledevolucion$fk_Producto_has_Devolución_Producto1] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detalledevolucion] CHECK CONSTRAINT [detalledevolucion$fk_Producto_has_Devolución_Producto1]
GO
ALTER TABLE [dbo].[detallemovimiento]  WITH NOCHECK ADD  CONSTRAINT [detallemovimiento$fk_Producto_has_Venta_Producto1] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detallemovimiento] CHECK CONSTRAINT [detallemovimiento$fk_Producto_has_Venta_Producto1]
GO
ALTER TABLE [dbo].[detallemovimiento]  WITH NOCHECK ADD  CONSTRAINT [detallemovimiento$fk_Producto_has_Venta_Venta1] FOREIGN KEY([idMovimiento])
REFERENCES [dbo].[movimiento] ([idMovimiento])
GO
ALTER TABLE [dbo].[detallemovimiento] CHECK CONSTRAINT [detallemovimiento$fk_Producto_has_Venta_Venta1]
GO
ALTER TABLE [dbo].[devolucion]  WITH NOCHECK ADD  CONSTRAINT [devolucion$fk_devolucion_Proveedor] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[devolucion] CHECK CONSTRAINT [devolucion$fk_devolucion_Proveedor]
GO
ALTER TABLE [dbo].[existencia]  WITH NOCHECK ADD  CONSTRAINT [existencia$fk_Existencia_Producto1] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[existencia] CHECK CONSTRAINT [existencia$fk_Existencia_Producto1]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [fk_movimiento_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([idCliente])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [fk_movimiento_cliente]
GO
ALTER TABLE [dbo].[movimiento]  WITH NOCHECK ADD  CONSTRAINT [movimiento$fk_movimiento_Tipo Movimiento1] FOREIGN KEY([idTipoMovimiento])
REFERENCES [dbo].[tipomovimiento] ([idTipoMovimiento])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [movimiento$fk_movimiento_Tipo Movimiento1]
GO
ALTER TABLE [dbo].[movimiento]  WITH NOCHECK ADD  CONSTRAINT [movimiento$fk_Venta_Empleado1] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [movimiento$fk_Venta_Empleado1]
GO
ALTER TABLE [dbo].[producto]  WITH NOCHECK ADD  CONSTRAINT [producto$fk_Producto_Marca1] FOREIGN KEY([idMarca])
REFERENCES [dbo].[marca] ([idMarca])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto$fk_Producto_Marca1]
GO
ALTER TABLE [dbo].[producto]  WITH NOCHECK ADD  CONSTRAINT [producto$fk_producto_presentacion] FOREIGN KEY([idPresentacion])
REFERENCES [dbo].[presentacion] ([idPresentacion])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto$fk_producto_presentacion]
GO
ALTER TABLE [dbo].[producto]  WITH NOCHECK ADD  CONSTRAINT [producto$fk_Producto_Tipo producto1] FOREIGN KEY([idTipoProducto])
REFERENCES [dbo].[tipoproducto] ([idTipoProducto])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto$fk_Producto_Tipo producto1]
GO
ALTER TABLE [dbo].[producto]  WITH NOCHECK ADD  CONSTRAINT [producto$fk_Producto_Unidad1] FOREIGN KEY([idUnidad])
REFERENCES [dbo].[unidad] ([idUnidad])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto$fk_Producto_Unidad1]
GO
/****** Object:  StoredProcedure [dbo].[spCambiarContrasena]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spCambiarContrasena]  
   @contraAnti nvarchar(13),
   @contraNueva nvarchar(13),
   @id nvarchar(12)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(70)

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT cuentausuario.contrasena
                  FROM dbo.cuentausuario
                  WHERE cuentausuario.contrasena = @contraAnti AND cuentausuario.idEmpleado = @id
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.cuentausuario
               SET 
                  contrasena = @contraNueva
            WHERE cuentausuario.idEmpleado = @id

            SET @resp = N'Contraseña actualizada correctamente'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            SET @resp = N'La contraseña no se pudo actualizar'

            SELECT @resp

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spinsertUpdateCliente]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spinsertUpdateCliente]  
   @id nvarchar(20),
   @tip nchar(3),
   @pnom nvarchar(20),
   @snom nvarchar(20),
   @prap nvarchar(20),
   @seap nvarchar(20),
   @tel nvarchar(7),
   @cel nvarchar(12),
   @email nvarchar(30),
   @dir nvarchar(40),
   @est nvarchar(10)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(30)

      DECLARE
         @idmax int

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT cliente.idCliente
                  FROM dbo.cliente
                  WHERE cliente.idCliente = @id
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.cliente
               SET 
                  tipoDocumento = @tip, 
                  primerNombre = @pnom, 
                  segundoNombre = @snom, 
                  primerApellido = @prap, 
                  segundoApellido = @seap, 
                  telefono = @tel, 
                  celular = @cel, 
                  email = @email, 
                  direccion = @dir, 
                  estado = @est
            WHERE cliente.idCliente = @id

            SET @resp = N'Cliente actualizado correctamente'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            /* 
            *   SSMA error messages:
            *   M2SS0016: Identifier tid cannot be converted because it was not resolved.

            INSERT dbo.cliente(
               dbo.cliente.idCliente, 
               dbo.cliente.tipoDocumento, 
               dbo.cliente.primerNombre, 
               dbo.cliente.segundoNombre, 
               dbo.cliente.primerApellido, 
               dbo.cliente.segundoApellido, 
               dbo.cliente.telefono, 
               dbo.cliente.celular, 
               dbo.cliente.email, 
               dbo.cliente.direccion, 
               dbo.cliente.estado)
               VALUES (
                  @id, 
                  tid, 
                  @pnom, 
                  @snom, 
                  @prap, 
                  @seap, 
                  @tel, 
                  @cel, 
                  @email, 
                  @dir, 
                  @est)
            */



            SET @idMax = 
               (
                  SELECT CAST(max(cliente.idCliente) AS bigint)
                  FROM dbo.cliente
               )

            SET @resp = N'Cliente registrado correctamente'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdateContacto]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdateContacto]  
   @id nvarchar(12),
   @tid nchar(3),
   @pnom nvarchar(20),
   @snom nvarchar(20),
   @prap nvarchar(20),
   @seap nvarchar(20),
   @cel nvarchar(12),
   @email nvarchar(40),
   @idpr nvarchar(20)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(30)

      DECLARE
         @idmax int

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT contacto.idContacto
                  FROM dbo.contacto
                  WHERE contacto.idContacto = @id
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.contacto
               SET 
                  primerNombre = @pnom, 
                  segundoNombre = @snom, 
                  primerApellido = @prap, 
                  segundoApellido = @seap, 
                  celular = @cel, 
                  email = @email, 
                  idProveedor = @idpr
            WHERE contacto.idContacto = @id

            SET @resp = N'Contacto actualizado correctamente'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            INSERT dbo.contacto(
               dbo.contacto.idContacto, 
               dbo.contacto.tipoDocumento, 
               dbo.contacto.primerNombre, 
               dbo.contacto.segundoNombre, 
               dbo.contacto.primerApellido, 
               dbo.contacto.segundoApellido, 
               dbo.contacto.celular, 
               dbo.contacto.email, 
               dbo.contacto.idProveedor)
               VALUES (
                  @id, 
                  @tid, 
                  @pnom, 
                  @snom, 
                  @prap, 
                  @seap, 
                  @cel, 
                  @email, 
                  @idpr)

            SET @idMax = 
               (
                  SELECT CAST(max(contacto.idContacto) AS bigint)
                  FROM dbo.contacto
               )

            SET @resp = N'Contacto registrado correctamente'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdateDetalleDevolucion]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdateDetalleDevolucion]  
   @idp int,
   @idd int,
   @des nvarchar(250),
   @cantde smallint,
   @cantpe smallint,
   @idDetalle int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(70)

      DECLARE
         @idMax int

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT @idDetalle
                  FROM dbo.detalledevolucion
                  WHERE @idDetalle = @idDetalle
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.detalledevolucion
               SET 
                  idProducto = @idp, 
                  idDevolucion = @idd, 
                  descripcion = @des, 
                  cantidadADevolver = @cantde, 
                  cantidadPendiente = @cantpe
            WHERE @idDetalle = @idDetalle

            SET @resp = N'Detalle de devolución modificada'

            SELECT @resp AS Respuestas

         END
      ELSE 
         BEGIN

            INSERT dbo.detalledevolucion(
               dbo.detalledevolucion.idProducto, 
               dbo.detalledevolucion.idDevolucion, 
               dbo.detalledevolucion.descripcion, 
               dbo.detalledevolucion.cantidadADevolver, 
               dbo.detalledevolucion.cantidadPendiente)
               VALUES (
                  @idp, 
                  @idd, 
                  @des, 
                  @cantde, 
                  @cantpe)

            SET @idMax = 
               (
                  SELECT max(@idDetalle)
                  FROM dbo.detalledevolucion
               )

            SET @resp = N'Detalle de devolución registrada'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdateDevolucion]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdateDevolucion]  
   @fec datetime2(0),
   @idp nvarchar(20),
   @est nvarchar(10),
   @id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(70)

      DECLARE
         @idMax int

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT devolucion.idDevolucion
                  FROM dbo.devolucion
                  WHERE devolucion.idDevolucion = @id
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.devolucion
               SET 
                  estado = @est
            WHERE devolucion.idDevolucion = @id

            SET @resp = N'Estado modificado'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            /*
            *   SSMA informational messages:
            *   M2SS0231: Zero-date, zero-in-date and invalid dates to not null columns has been replaced with GetDate()/Constant date
            */

            INSERT dbo.devolucion(dbo.devolucion.fechaDevolucion, dbo.devolucion.idProveedor, dbo.devolucion.estado)
               VALUES (isnull(@fec, getdate()), @idp, @est)

            SET @idMax = 
               (
                  SELECT max(devolucion.idDevolucion)
                  FROM dbo.devolucion
               )

            SET @resp = N'Devolución registrada'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdateEmpleado]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdateEmpleado]  
   @idCu smallint,
   @nomUsu nvarchar(20),
   @contra nvarchar(13),
   @pre nvarchar(50),
   @res nvarchar(45),
   @idEm nvarchar(12),
   @tipoDoc nchar(3),
   @priNom nvarchar(20),
   @segNom nvarchar(20),
   @priApe nvarchar(20),
   @segApe nvarchar(20),
   @rol nvarchar(13),
   @dir nvarchar(40),
   @email nvarchar(30),
   @tel nvarchar(7),
   @cel nvarchar(12),
   @est nvarchar(10)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(50)

      DECLARE
         @idMaxCu smallint

      DECLARE
         @idMaxEm nvarchar(12)

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT empleado.idEmpleado
                  FROM dbo.empleado
                  WHERE CAST(empleado.idEmpleado AS float(53)) = 
                     (
                        SELECT cuentausuario.idEmpleado
                        FROM dbo.cuentausuario
                        WHERE cuentausuario.idEmpleado = @idEm
                     )
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.empleado
               SET 
                  tipoDocumento = @tipoDoc, 
                  primerNombre = @priNom, 
                  segundoNombre = @segNom, 
                  primerApellido = @priApe, 
                  segundoApellido = @segApe, 
                  rol = @rol, 
                  direccion = @dir, 
                  email = @email, 
                  telefono = @tel, 
                  celular = @cel, 
                  estado = @est
            WHERE empleado.idEmpleado = @idEm

            UPDATE dbo.cuentausuario
               SET 
                  nombreUsuario = @nomUsu, 
                  contrasena = @contra
            WHERE cuentausuario.idCuentaUsuario = @idCu

            SET @resp = N'Información del empleado actualizada correctamente'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            INSERT dbo.empleado(
               dbo.empleado.idEmpleado, 
               dbo.empleado.tipoDocumento, 
               dbo.empleado.primerNombre, 
               dbo.empleado.segundoNombre, 
               dbo.empleado.primerApellido, 
               dbo.empleado.segundoApellido, 
               dbo.empleado.rol, 
               dbo.empleado.direccion, 
               dbo.empleado.email, 
               dbo.empleado.telefono, 
               dbo.empleado.celular, 
               dbo.empleado.estado)
               VALUES (
                  @idEm, 
                  @tipoDoc, 
                  @priNom, 
                  @segNom, 
                  @priApe, 
                  @segApe, 
                  @rol, 
                  @dir, 
                  @email, 
                  @tel, 
                  @cel, 
                  @est)

            INSERT dbo.cuentausuario(
               dbo.cuentausuario.nombreUsuario, 
               dbo.cuentausuario.contrasena, 
               dbo.cuentausuario.preguntaSeguridad, 
               dbo.cuentausuario.respuestaSeguridad, 
               dbo.cuentausuario.idEmpleado)
               VALUES (
                  @nomUsu, 
                  @contra, 
                  @pre, 
                  @res, 
                  @idEm)

            SET @resp = N'Información del empleado registrada correctamente'

            SELECT @resp

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdateMarca]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdateMarca]  
   @nom nvarchar(20),
   @des nvarchar(200)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(50)

      DECLARE
         @idMax smallint

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT marca.nombre
                  FROM dbo.marca
                  WHERE marca.nombre = @nom
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.marca
               SET 
                  nombre = @nom, 
                  descripcion = @des
            WHERE marca.nombre = @nom

            SET @resp = N'Marca actualizada'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            INSERT dbo.marca(dbo.marca.nombre, dbo.marca.descripcion)
               VALUES (@nom, @des)

            SET @idMax = 
               (
                  SELECT max(marca.idMarca)
                  FROM dbo.marca
               )

            SET @resp = N'Marca registrada correctamente'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdatePresentacion]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdatePresentacion]  
   @nom nvarchar(20),
   @des nvarchar(200)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(50)

      DECLARE
         @idMax smallint

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT presentacion.nombre
                  FROM dbo.presentacion
                  WHERE presentacion.nombre = @nom
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.presentacion
               SET 
                  nombre = @nom, 
                  descripcion = @des
            WHERE presentacion.nombre = @nom

            SET @resp = N'Presentación actualizada'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            INSERT dbo.presentacion(dbo.presentacion.nombre, dbo.presentacion.descripcion)
               VALUES (@nom, @des)

            SET @idMax = 
               (
                  SELECT max(presentacion.idPresentacion)
                  FROM dbo.presentacion
               )

            SET @resp = N'Presentación registrada correctamente'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdateProducto]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdateProducto]  
   @nom nvarchar(20),
   @val int,
   @des nvarchar(100),
   @idp smallint,
   @idtp smallint,
   @idm smallint,
   @idu smallint,
   @est nvarchar(10)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(50)

      DECLARE
         @idMax smallint

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT producto.nombre
                  FROM dbo.producto
                  WHERE producto.nombre = producto.nombre
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.producto
               SET 
                  nombre = @nom, 
                  valor = @val, 
                  descripcion = @des, 
                  idPresentacion = @idp, 
                  idTipoProducto = @idtp, 
                  idMarca = @idm, 
                  idUnidad = @idu, 
                  estado = @est
            WHERE producto.nombre = @nom

            SET @resp = N'Producto actualizado'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            INSERT dbo.producto(
               dbo.producto.nombre, 
               dbo.producto.valor, 
               dbo.producto.descripcion, 
               dbo.producto.idPresentacion, 
               dbo.producto.idTipoProducto, 
               dbo.producto.idMarca, 
               dbo.producto.idUnidad, 
               dbo.producto.estado)
               VALUES (
                  @nom, 
                  @val, 
                  @des, 
                  @idp, 
                  @idtp, 
                  @idm, 
                  @idu, 
                  @est)

            SET @idMax = 
               (
                  SELECT max(producto.idProducto)
                  FROM dbo.producto
               )

            SET @resp = N'Producto registrado correctamente'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdateProveedor]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdateProveedor]  
   @id nvarchar(20),
   @tdoc nchar(3),
   @emp nvarchar(50),
   @dir nvarchar(30),
   @email nvarchar(40),
   @tel nvarchar(10),
   @est nvarchar(10)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(50)

      DECLARE
         @idMax smallint

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT proveedor.idProveedor
                  FROM dbo.proveedor
                  WHERE proveedor.idProveedor = @id
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.proveedor
               SET 
                  tipoDocumento = @tdoc, 
                  empresa = @emp, 
                  direccionEmpresa = @dir, 
                  emailEmpresa = @email, 
                  telefonoEmpresa = @tel, 
                  estado = @est
            WHERE proveedor.idProveedor = @id

            SET @resp = N'Proveedor actualizado'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            INSERT dbo.proveedor(
               dbo.proveedor.idProveedor, 
               dbo.proveedor.tipoDocumento, 
               dbo.proveedor.empresa, 
               dbo.proveedor.direccionEmpresa, 
               dbo.proveedor.emailEmpresa, 
               dbo.proveedor.telefonoEmpresa, 
               dbo.proveedor.estado)
               VALUES (
                  @id, 
                  @tdoc, 
                  @emp, 
                  @dir, 
                  @email, 
                  @tel, 
                  @est)

            SET @idMax = 
               (
                  SELECT CAST(max(proveedor.idProveedor) AS bigint)
                  FROM dbo.proveedor
               )

            SET @resp = N'Proveedor registrado'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdateTipoProducto]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdateTipoProducto]  
   @nom nvarchar(20),
   @des nvarchar(200)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(50)

      DECLARE
         @idMax smallint

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT tipoproducto.nombre
                  FROM dbo.tipoproducto
                  WHERE tipoproducto.nombre = @nom
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.tipoproducto
               SET 
                  nombre = @nom, 
                  descripcion = @des
            WHERE tipoproducto.nombre = @nom

            SET @resp = N'Tipo producto actualizado'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            INSERT dbo.tipoproducto(dbo.tipoproducto.nombre, dbo.tipoproducto.descripcion)
               VALUES (@nom, @des)

            SET @idMax = 
               (
                  SELECT max(tipoproducto.idTipoProducto)
                  FROM dbo.tipoproducto
               )

            SET @resp = N'Tipo producto registrado correctamente'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUpdateUnidad]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spInsertUpdateUnidad]  
   @nom nvarchar(20),
   @des nvarchar(200)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(50)

      DECLARE
         @idMax smallint

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT unidad.nombre
                  FROM dbo.unidad
                  WHERE unidad.nombre = @nom
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.unidad
               SET 
                  nombre = @nom, 
                  descripcion = @des
            WHERE unidad.nombre = @nom

            SET @resp = N'Unidad actualizada'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            INSERT dbo.unidad(dbo.unidad.nombre, dbo.unidad.descripcion)
               VALUES (@nom, @des)

            SET @idMax = 
               (
                  SELECT max(unidad.idUnidad)
                  FROM dbo.unidad
               )

            SET @resp = N'Unidad registrada correctamente'

            SELECT @resp, @idMax

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spNuevaContrasena]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spNuevaContrasena]  
   @id nvarchar(12),
   @contra nvarchar(13)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(70)

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT cuentausuario.idEmpleado
                  FROM dbo.cuentausuario
                  WHERE cuentausuario.idEmpleado = @id
               ) THEN 1
            ELSE 0
         END <> 0
         BEGIN

            UPDATE dbo.cuentausuario
               SET 
                  contrasena = @contra
            WHERE cuentausuario.idEmpleado = @id

            SET @resp = N'La contraseña se ha recuperado correctamente'

            SELECT @resp AS Respuesta

         END
      ELSE 
         BEGIN

            SET @resp = N'La contraseña no se pudo recuperar'

            SELECT @resp AS Respuesta

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spSelectCliente]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spSelectCliente]  
   @id nvarchar(20)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         cliente.idCliente, 
         cliente.tipoDocumento, 
         cliente.primerNombre, 
         cliente.segundoNombre, 
         cliente.primerApellido, 
         cliente.segundoApellido, 
         cliente.telefono, 
         cliente.celular, 
         cliente.email, 
         cliente.direccion, 
         cliente.estado
      FROM dbo.cliente
      WHERE cliente.idCliente = @id

   END
GO
/****** Object:  StoredProcedure [dbo].[spSelectPreguntaRespuestaSeguridad]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spSelectPreguntaRespuestaSeguridad]  
   @idEm nvarchar(12)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(70)

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT cuentausuario.idEmpleado
                  FROM dbo.cuentausuario
                  WHERE cuentausuario.idEmpleado = @idEm
               ) THEN 1
            ELSE 0
         END <> 0
         SELECT cuentausuario.preguntaSeguridad, cuentausuario.respuestaSeguridad
         FROM dbo.cuentausuario
         WHERE cuentausuario.idEmpleado = @idEm
      ELSE 
         BEGIN

            SET @resp = N'No existe un empleado con ese documento de identidad'

            SELECT @resp AS Respuesta

         END

   END
GO
/****** Object:  StoredProcedure [dbo].[spVerificarLogin]    Script Date: 14/10/2015 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[spVerificarLogin]  
   @usuario nvarchar(20),
   @contra nvarchar(13)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @resp nvarchar(70)

      IF 
         CASE 
            WHEN EXISTS 
               (
                  SELECT cuentausuario.nombreUsuario
                  FROM dbo.cuentausuario
                  WHERE cuentausuario.nombreUsuario = @usuario AND cuentausuario.contrasena = @contra
               ) THEN 1
            ELSE 0
         END <> 0
         SELECT c.nombreUsuario, e.rol
         FROM 
            dbo.empleado  AS e 
               INNER JOIN dbo.cuentausuario  AS c 
               ON e.idEmpleado = c.idEmpleado
         WHERE c.nombreUsuario = @usuario AND c.contrasena = @contra
      ELSE 
         BEGIN

            SET @resp = N'Usuario y/o contraseña incorrecta'

            SELECT @resp AS Respuesta

         END

   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spCambiarContrasena' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spCambiarContrasena'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spinsertUpdateCliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spinsertUpdateCliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdateContacto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdateContacto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdateDetalleDevolucion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdateDetalleDevolucion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdateDevolucion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdateDevolucion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdateEmpleado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdateEmpleado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdateMarca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdateMarca'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdatePresentacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdatePresentacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdateProducto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdateProducto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdateProveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdateProveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdateTipoProducto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdateTipoProducto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spInsertUpdateUnidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spInsertUpdateUnidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spNuevaContrasena' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spNuevaContrasena'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spSelectCliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spSelectCliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spSelectPreguntaRespuestaSeguridad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spSelectPreguntaRespuestaSeguridad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.spVerificarLogin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spVerificarLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.compra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'compra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.contacto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contacto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.cuentausuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cuentausuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.detallecompra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'detallecompra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.detalledevolucion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'detalledevolucion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.detallemovimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'detallemovimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.devolucion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'devolucion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.empleado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empleado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.existencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'existencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'marca'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.movimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'movimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.presentacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'presentacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'producto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'proveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.tipomovimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipomovimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.tipoproducto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipoproducto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'kimdolsoft.unidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'unidad'
GO
USE [master]
GO
ALTER DATABASE [kimdolsoft] SET  READ_WRITE 
GO

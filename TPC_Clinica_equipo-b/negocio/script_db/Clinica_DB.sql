USE [master]
GO
/****** Object:  Database [Clinica_DB]    Script Date: 10/07/2025 21:07:11 ******/
CREATE DATABASE [Clinica_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinica_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Clinica_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Clinica_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Clinica_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Clinica_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinica_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinica_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinica_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinica_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinica_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinica_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinica_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinica_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinica_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinica_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinica_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinica_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinica_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinica_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinica_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinica_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinica_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinica_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinica_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinica_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinica_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinica_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinica_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinica_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clinica_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Clinica_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinica_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinica_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinica_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Clinica_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Clinica_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Clinica_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [Clinica_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Clinica_DB]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_especialidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[matricula] [varchar](50) NULL,
	[persona_id] [int] NULL,
 CONSTRAINT [PK_medico] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico_Especialidad]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico_Especialidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[medico_id] [int] NOT NULL,
	[especialidad_id] [int] NOT NULL,
 CONSTRAINT [PK_medico_especialidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[persona_id] [int] NOT NULL,
	[historialClinico] [varchar](200) NULL,
	[tipoCobertura] [varchar](50) NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_paciente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerfilAcceso]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilAcceso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_perfilAcceso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](8) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fechaNacimiento] [date] NULL,
	[sexo] [varchar](10) NULL,
	[telefono] [varchar](50) NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[perfilAcceso_id] [int] NOT NULL,
	[persona_id] [int] NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Especialidad] ON 
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (1, N'Cardiología', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (2, N'Oftalmología', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (3, N'Kinesiología', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (4, N'Traumatología', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (5, N'Pediatría', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (6, N'Clínica Médica', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (7, N'Genecología', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (8, N'Obstetricia', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (9, N'Otorrinolaringología', 1)
GO
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico] ON 
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (1, N'123789-a', 1)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (2, N'331123-a', 2)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (3, N'123654-c', 3)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (4, N'332198-b', 4)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (5, N'134997-c', 5)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (6, N'ABC123', 8)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (7, N'M4567', 9)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (11, N'prueba2', 13)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (12, N'prueba3', 14)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (16, N'prueba4', 18)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (17, N'prueba5', 19)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (19, N'prueba6', 26)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (20, N'prueba7', 27)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (21, N'prueba8', 28)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (22, N'prueba9', 29)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (24, N'prueba10', 31)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (25, N'prueba11', 32)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (26, N'prueba12', 33)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (27, N'prueba13', 34)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (28, N'prueba14@gmail.com', 35)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (29, N'prueba15', 37)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (30, N'prueba16', 38)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (31, N'prueba17', 39)
GO
SET IDENTITY_INSERT [dbo].[Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico_Especialidad] ON 
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (2, 2, 2)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (3, 3, 3)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (4, 4, 7)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (5, 4, 8)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (6, 5, 9)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (7, 11, 1)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (8, 12, 1)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (9, 12, 2)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (10, 16, 5)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (11, 16, 6)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (12, 17, 9)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (13, 19, 3)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (14, 20, 5)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (15, 21, 4)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (16, 21, 6)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (17, 22, 1)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (19, 24, 1)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (20, 25, 3)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (21, 26, 5)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (22, 27, 2)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (23, 28, 9)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (24, 29, 5)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (25, 30, 7)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (26, 30, 8)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (27, 31, 1)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (28, 31, 5)
GO
SET IDENTITY_INSERT [dbo].[Medico_Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 
GO
INSERT [dbo].[Paciente] ([id], [persona_id], [historialClinico], [tipoCobertura], [activo]) VALUES (1, 8, NULL, N'Obra Social', 1)
GO
INSERT [dbo].[Paciente] ([id], [persona_id], [historialClinico], [tipoCobertura], [activo]) VALUES (2, 9, NULL, N'Obra Social', 1)
GO
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[PerfilAcceso] ON 
GO
INSERT [dbo].[PerfilAcceso] ([id], [descripcion]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[PerfilAcceso] ([id], [descripcion]) VALUES (2, N'Recepcionista')
GO
INSERT [dbo].[PerfilAcceso] ([id], [descripcion]) VALUES (3, N'Médico')
GO
SET IDENTITY_INSERT [dbo].[PerfilAcceso] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (1, N'35995247', N'Felipe', N'Díaz', CAST(N'1988-05-15' AS Date), N'Masculino', N'1122226784', N'felipediaz@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (2, N'31256998', N'Cristian', N'Sánchez', CAST(N'1983-02-26' AS Date), N'Masculino', N'1155628898', N'cristiansanchez@outlook.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (3, N'38559321', N'Carla', N'Gerli', CAST(N'1991-08-12' AS Date), N'Femenino', N'1154335356', N'carlagerli@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (4, N'41225693', N'Sara', N'Juárez', CAST(N'1997-03-11' AS Date), N'Femenino', N'1152112324', N'sarajuarez@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (5, N'38252938', N'Sergio', N'Rodríguez', CAST(N'1994-02-28' AS Date), N'Masculino', N'1155698845', N'sergiorodriguez@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (6, N'38435297', N'Javier', N'Rondón', CAST(N'1994-05-26' AS Date), N'Masculino', N'1122436791', N'rondon.javier@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (7, N'41378321', N'Juliana', N'García', CAST(N'1997-01-16' AS Date), N'Femenino', N'1127629991', N'juliana.garcia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (8, N'28991354', N'Sara', N'Garzón', CAST(N'1984-05-15' AS Date), N'Femenino', N'1123805699', N'sara_garzon@outlook.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (9, N'36722918', N'Cristian', N'Giménez', CAST(N'1988-02-28' AS Date), N'Masculino', N'1123996512', N'cristian_gimenezz@outlook.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (13, N'dnitest', N'prueba', N'apellidoprueba', NULL, NULL, NULL, N'mailprueba')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (14, N'11223344', N'Lucía', N'Ramírez', NULL, NULL, NULL, N'lucia@email.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (18, N'prueba2', N'prueba2', N'prueba2', NULL, NULL, NULL, N'prueba2@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (19, N'prueba3', N'prueba3', N'prueba3', NULL, NULL, NULL, N'prueba3@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (23, N'prueba4', N'prueba4', N'prueba4', NULL, NULL, NULL, N'prueba4@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (24, N'prueba5', N'prueba5', N'prueba5', NULL, NULL, NULL, N'prueba5@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (26, N'prueba6', N'prueba6', N'prueba6', NULL, NULL, NULL, N'prueba6@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (27, N'prueba7', N'prueba7', N'prueba7', NULL, NULL, NULL, N'prueba7@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (28, N'prueba8', N'prueba8', N'prueba8', NULL, NULL, NULL, N'prueba8@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (29, N'prueba9', N'prueba9', N'prueba9', NULL, NULL, NULL, N'prueba9@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (31, N'prueba10', N'prueba10', N'prueba10', NULL, NULL, NULL, N'prueba10@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (32, N'prueba11', N'prueba11', N'prueba11', NULL, NULL, NULL, N'prueba11@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (33, N'prueba12', N'prueba12', N'prueba12', NULL, NULL, NULL, N'prueba12@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (34, N'prueba13', N'prueba13', N'prueba13', NULL, NULL, NULL, N'prueba13@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (35, N'prueba14', N'prueba14', N'prueba14', NULL, NULL, NULL, N'prueba14@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (37, N'prueba15', N'prueba15', N'prueba15', NULL, NULL, NULL, N'prueba15@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (38, N'prueba16', N'prueba16', N'prueba16', NULL, NULL, NULL, N'prueba16@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (39, N'prueba17', N'prueba17', N'prueba17', NULL, NULL, NULL, N'prueba17@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (1, 3, 1, N'123abc', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (2, 3, 2, N'345def', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (3, 3, 3, N'678ghi', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (4, 3, 4, N'321cba', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (5, 3, 5, N'asd543', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (6, 1, 6, N'qwe123AD', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (7, 2, 7, N'556POI', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (8, 3, 13, N'1234', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (9, 3, 14, N'secreta123', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (13, 3, 18, N'prueba2', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (14, 3, 19, N'prueba3', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (18, 3, 23, N'', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (19, 3, 24, N'prueba5', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (21, 3, 26, N'prueba6', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (22, 3, 27, N'prueba7', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (23, 3, 28, N'prueba8', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (24, 3, 29, N'prueba9', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (26, 3, 31, N'prueba10', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (27, 3, 32, N'prueba11', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (28, 3, 33, N'prueba12', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (29, 3, 34, N'prueba13', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (30, 3, 35, N'prueba14', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (31, 3, 37, N'prueba15', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (32, 3, 38, N'prueba16', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (33, 3, 39, N'prueba17', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_especialidad]    Script Date: 10/07/2025 21:07:11 ******/
ALTER TABLE [dbo].[Especialidad] ADD  CONSTRAINT [UQ_especialidad] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_medico_matricula]    Script Date: 10/07/2025 21:07:11 ******/
ALTER TABLE [dbo].[Medico] ADD  CONSTRAINT [UQ_medico_matricula] UNIQUE NONCLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_medico_persona_id]    Script Date: 10/07/2025 21:07:11 ******/
ALTER TABLE [dbo].[Medico] ADD  CONSTRAINT [UQ_medico_persona_id] UNIQUE NONCLUSTERED 
(
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_paciente_id]    Script Date: 10/07/2025 21:07:11 ******/
ALTER TABLE [dbo].[Paciente] ADD  CONSTRAINT [UQ_paciente_id] UNIQUE NONCLUSTERED 
(
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_persona_dni]    Script Date: 10/07/2025 21:07:11 ******/
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [UQ_persona_dni] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_persona_email]    Script Date: 10/07/2025 21:07:11 ******/
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [UQ_persona_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_usuario_persona_id]    Script Date: 10/07/2025 21:07:11 ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [UQ_usuario_persona_id] UNIQUE NONCLUSTERED 
(
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Especialidad] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Paciente] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Persona]
GO
ALTER TABLE [dbo].[Medico_Especialidad]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad_Especialidad] FOREIGN KEY([especialidad_id])
REFERENCES [dbo].[Especialidad] ([id])
GO
ALTER TABLE [dbo].[Medico_Especialidad] CHECK CONSTRAINT [FK_Medico_Especialidad_Especialidad]
GO
ALTER TABLE [dbo].[Medico_Especialidad]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad_Medico] FOREIGN KEY([medico_id])
REFERENCES [dbo].[Medico] ([id])
GO
ALTER TABLE [dbo].[Medico_Especialidad] CHECK CONSTRAINT [FK_Medico_Especialidad_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Persona]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_PerfilAcceso] FOREIGN KEY([perfilAcceso_id])
REFERENCES [dbo].[PerfilAcceso] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_PerfilAcceso]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
/****** Object:  StoredProcedure [dbo].[SP_altaMedico]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_altaMedico]
    @dni VARCHAR(8),
    @nombre VARCHAR(50),
    @apellido VARCHAR(50),
	@matricula VARCHAR(50),
    @email VARCHAR(50),
    @pass VARCHAR(50),
	@medico_id INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRANSACTION;

		INSERT INTO Persona	(dni, nombre, apellido, email)
		VALUES (@dni, @nombre, @apellido, @email);

		DECLARE @persona_id INT = SCOPE_IDENTITY();

		INSERT INTO Usuario (perfilAcceso_id, persona_id, pass)
		VALUES (3, @persona_id, @pass);

		INSERT INTO Medico (matricula, persona_id)
		VALUES (@matricula, @persona_id);

		SET @medico_id = SCOPE_IDENTITY(); 

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_listarEspecialidadesPorMedico]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_listarEspecialidadesPorMedico] AS
SELECT ME.medico_id, E.Id, E.Descripcion
FROM Medico_Especialidad ME, Especialidad E
WHERE E.Id = ME.especialidad_id
GO
/****** Object:  StoredProcedure [dbo].[SP_listarMedicos]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_listarMedicos] AS
SELECT M.id, P.dni, P.nombre, P.apellido, M.matricula, P.email, U.activo
FROM Persona P, Usuario U, Medico M
WHERE P.id = U.persona_id AND P.id = M.persona_id
GO
/****** Object:  StoredProcedure [dbo].[SP_listarPaciente]    Script Date: 10/07/2025 21:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_listarPaciente] as
SELECT P.id, P.dni DNI, P.nombre Nombre, P.apellido Apellido , 
P.fechaNacimiento FechaNacimiento, P.sexo Sexo, P.telefono Telefono, 
P.email Email,PA.historialClinico HistorialClinico,PA.tipoCobertura TipoCobertura 
FROM Persona P LEFT JOIN Paciente PA ON P.id= PA.persona_id
GO
USE [master]
GO
ALTER DATABASE [Clinica_DB] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Clinica_DB]    Script Date: 27/8/2025 14:46:17 ******/
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
/****** Object:  Table [dbo].[Especialidad]    Script Date: 27/8/2025 14:46:17 ******/
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
/****** Object:  Table [dbo].[Medico]    Script Date: 27/8/2025 14:46:17 ******/
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
/****** Object:  Table [dbo].[Medico_Especialidad]    Script Date: 27/8/2025 14:46:17 ******/
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
/****** Object:  Table [dbo].[Medico_TurnoTrabajo]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico_TurnoTrabajo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[medico_id] [int] NOT NULL,
	[turnoTrabajo_id] [int] NOT NULL,
 CONSTRAINT [PK_medico_turnoTrabajo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 27/8/2025 14:46:17 ******/
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
/****** Object:  Table [dbo].[PerfilAcceso]    Script Date: 27/8/2025 14:46:17 ******/
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
/****** Object:  Table [dbo].[Persona]    Script Date: 27/8/2025 14:46:17 ******/
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
/****** Object:  Table [dbo].[Turno]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[motivoConsulta] [varchar](200) NULL,
	[observacionesMedico] [varchar](200) NULL,
	[paciente_id] [int] NOT NULL,
	[medico_id] [int] NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_turno] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoTrabajo]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoTrabajo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[diaSemana] [varchar](50) NOT NULL,
	[horaInicio] [time](7) NOT NULL,
	[horaFin] [time](7) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_turnoTrabajo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/8/2025 14:46:17 ******/
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
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (7, N'Ginecología', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (8, N'Obstetricia', 1)
GO
INSERT [dbo].[Especialidad] ([id], [descripcion], [activo]) VALUES (9, N'Otorrinolaringología', 1)
GO
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico] ON 
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (1, N'medico1', 3)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (2, N'medico2', 4)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (3, N'medico3', 5)
GO
INSERT [dbo].[Medico] ([id], [matricula], [persona_id]) VALUES (4, N'A112-123', 6)
GO
SET IDENTITY_INSERT [dbo].[Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico_Especialidad] ON 
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (1, 1, 5)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (7, 2, 3)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (8, 2, 4)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (9, 3, 9)
GO
INSERT [dbo].[Medico_Especialidad] ([id], [medico_id], [especialidad_id]) VALUES (10, 4, 2)
GO
SET IDENTITY_INSERT [dbo].[Medico_Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico_TurnoTrabajo] ON 
GO
INSERT [dbo].[Medico_TurnoTrabajo] ([id], [medico_id], [turnoTrabajo_id]) VALUES (2, 1, 2)
GO
INSERT [dbo].[Medico_TurnoTrabajo] ([id], [medico_id], [turnoTrabajo_id]) VALUES (3, 4, 2)
GO
INSERT [dbo].[Medico_TurnoTrabajo] ([id], [medico_id], [turnoTrabajo_id]) VALUES (4, 4, 4)
GO
SET IDENTITY_INSERT [dbo].[Medico_TurnoTrabajo] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 
GO
INSERT [dbo].[Paciente] ([id], [persona_id], [historialClinico], [tipoCobertura], [activo]) VALUES (1, 7, NULL, N'Sin Cobertura', 1)
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
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (1, N'admin1', N'admin1', N'admin1', CAST(N'1988-05-15' AS Date), N'Masculino', N'admin1', N'admin1@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (2, N'recep1', N'recep1', N'recep1', CAST(N'1988-05-15' AS Date), N'Femenino', N'recep1', N'recep1@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (3, N'medico1', N'medico1', N'medico1', NULL, NULL, NULL, N'medico1@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (4, N'medico2', N'medico2', N'medico2', NULL, NULL, NULL, N'medico2@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (5, N'medico3', N'medico3', N'medico3', NULL, NULL, NULL, N'medico3@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (6, N'33692123', N'Juan Carlos', N'López', NULL, NULL, NULL, N'lopez.juancarlos@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [dni], [nombre], [apellido], [fechaNacimiento], [sexo], [telefono], [email]) VALUES (7, N'39615123', N'Cristian', N'Gómez', CAST(N'1995-02-15' AS Date), N'Masculino', N'1123552367', N'gomez.cristian@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 
GO
INSERT [dbo].[Turno] ([id], [fecha], [hora], [motivoConsulta], [observacionesMedico], [paciente_id], [medico_id], [estado]) VALUES (1, CAST(N'2025-08-27' AS Date), CAST(N'10:30:00' AS Time), N'Visión borrosa', NULL, 1, 4, N'Nuevo')
GO
SET IDENTITY_INSERT [dbo].[Turno] OFF
GO
SET IDENTITY_INSERT [dbo].[TurnoTrabajo] ON 
GO
INSERT [dbo].[TurnoTrabajo] ([id], [diaSemana], [horaInicio], [horaFin], [activo]) VALUES (2, N'Lunes', CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
GO
INSERT [dbo].[TurnoTrabajo] ([id], [diaSemana], [horaInicio], [horaFin], [activo]) VALUES (4, N'Martes', CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
GO
INSERT [dbo].[TurnoTrabajo] ([id], [diaSemana], [horaInicio], [horaFin], [activo]) VALUES (6, N'Lunes', CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
GO
INSERT [dbo].[TurnoTrabajo] ([id], [diaSemana], [horaInicio], [horaFin], [activo]) VALUES (8, N'Lunes', CAST(N'16:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
GO
INSERT [dbo].[TurnoTrabajo] ([id], [diaSemana], [horaInicio], [horaFin], [activo]) VALUES (10, N'Martes', CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
GO
INSERT [dbo].[TurnoTrabajo] ([id], [diaSemana], [horaInicio], [horaFin], [activo]) VALUES (12, N'Martes', CAST(N'16:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
GO
INSERT [dbo].[TurnoTrabajo] ([id], [diaSemana], [horaInicio], [horaFin], [activo]) VALUES (13, N'Miércoles', CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
GO
SET IDENTITY_INSERT [dbo].[TurnoTrabajo] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (1, 1, 1, N'admin1', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (2, 2, 2, N'recep1', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (3, 3, 3, N'medico1', 1)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (4, 3, 4, N'medico2', 0)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (5, 3, 5, N'medico3', 0)
GO
INSERT [dbo].[Usuario] ([id], [perfilAcceso_id], [persona_id], [pass], [activo]) VALUES (6, 3, 6, N'lopez1234', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_especialidad]    Script Date: 27/8/2025 14:46:17 ******/
ALTER TABLE [dbo].[Especialidad] ADD  CONSTRAINT [UQ_especialidad] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_medico_matricula]    Script Date: 27/8/2025 14:46:17 ******/
ALTER TABLE [dbo].[Medico] ADD  CONSTRAINT [UQ_medico_matricula] UNIQUE NONCLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_medico_persona_id]    Script Date: 27/8/2025 14:46:17 ******/
ALTER TABLE [dbo].[Medico] ADD  CONSTRAINT [UQ_medico_persona_id] UNIQUE NONCLUSTERED 
(
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_paciente_id]    Script Date: 27/8/2025 14:46:17 ******/
ALTER TABLE [dbo].[Paciente] ADD  CONSTRAINT [UQ_paciente_id] UNIQUE NONCLUSTERED 
(
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_persona_dni]    Script Date: 27/8/2025 14:46:17 ******/
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [UQ_persona_dni] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_persona_email]    Script Date: 27/8/2025 14:46:17 ******/
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [UQ_persona_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_TurnoTrabajo]    Script Date: 27/8/2025 14:46:17 ******/
ALTER TABLE [dbo].[TurnoTrabajo] ADD  CONSTRAINT [UQ_TurnoTrabajo] UNIQUE NONCLUSTERED 
(
	[diaSemana] ASC,
	[horaInicio] ASC,
	[horaFin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_usuario_persona_id]    Script Date: 27/8/2025 14:46:17 ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [UQ_usuario_persona_id] UNIQUE NONCLUSTERED 
(
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Especialidad] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Paciente] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[TurnoTrabajo] ADD  CONSTRAINT [DF_TurnoTrabajo_Activo]  DEFAULT ((1)) FOR [activo]
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
ALTER TABLE [dbo].[Medico_TurnoTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_Medico_TurnoTrabajo_Medico] FOREIGN KEY([medico_id])
REFERENCES [dbo].[Medico] ([id])
GO
ALTER TABLE [dbo].[Medico_TurnoTrabajo] CHECK CONSTRAINT [FK_Medico_TurnoTrabajo_Medico]
GO
ALTER TABLE [dbo].[Medico_TurnoTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_Medico_TurnoTrabajo_TurnoTrabajo] FOREIGN KEY([turnoTrabajo_id])
REFERENCES [dbo].[TurnoTrabajo] ([id])
GO
ALTER TABLE [dbo].[Medico_TurnoTrabajo] CHECK CONSTRAINT [FK_Medico_TurnoTrabajo_TurnoTrabajo]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Persona]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Medico] FOREIGN KEY([medico_id])
REFERENCES [dbo].[Medico] ([id])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_Medico]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Paciente] FOREIGN KEY([paciente_id])
REFERENCES [dbo].[Paciente] ([id])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_Paciente]
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
/****** Object:  StoredProcedure [dbo].[SP_buscarPacientePorDni]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_buscarPacientePorDni]
    @Dni VARCHAR(8)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        P.id AS PersonaId,
        P.dni,
        P.nombre,
        P.apellido,
        P.fechaNacimiento,
        P.sexo,
        P.telefono,
        P.email,
        PA.id AS PacienteId,
        PA.tipoCobertura,
        PA.historialClinico,
        PA.activo
    FROM
        Persona P
    INNER JOIN
        Paciente PA ON P.id = PA.persona_id
    WHERE
        P.dni = @Dni;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_insertarPacientes]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_insertarPacientes] 

    @Dni VARCHAR(8),
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @FechaNacimiento DATE = NULL,   
    @Sexo VARCHAR(10) = NULL,
    @Telefono VARCHAR(50) = NULL, 
    @Email VARCHAR(50),

    @HistorialClinico VARCHAR(200) = NULL, 
    @TipoCobertura VARCHAR(50) = NULL,  
    @Activo BIT
AS
BEGIN
    SET NOCOUNT ON; -- Para evitar que SQL Server devuelva el número de filas afectadas

    DECLARE @PersonaId INT; -- Variable para almacenar el ID de la persona recién insertada

    BEGIN TRY
        -- Iniciar una transacción para asegurar la atomicidad de las inserciones
        BEGIN TRANSACTION;

        -- Insertar datos en la tabla Persona
        INSERT INTO Persona (dni, nombre, apellido, fechaNacimiento, sexo, telefono, email)
        VALUES (@Dni, @Nombre, @Apellido, @FechaNacimiento, @Sexo, @Telefono, @Email);

        -- Obtener el ID de la Persona recién insertada.
        SET @PersonaId = SCOPE_IDENTITY();

        -- Insertar datos en la tabla Paciente, usando el PersonaId obtenido
        INSERT INTO Paciente (persona_id, historialClinico, tipoCobertura, activo)
        VALUES (@PersonaId, @HistorialClinico, @TipoCobertura, @Activo);

        -- Si ambas inserciones fueron exitosas, confirmar la transacción
        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        -- Si ocurre algún error, deshacer la transacción para revertir cualquier cambio
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW; 
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_listarPaciente]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_listarPaciente] AS
	SELECT P.id, P.dni DNI, P.nombre Nombre, P.apellido Apellido,
	P.fechaNacimiento FechaNacimiento, P.sexo Sexo, P.telefono Telefono, 
	P.email Email,PA.historialClinico 'Historial Clinico', PA.tipoCobertura 'Tipo Cobertura', Pa.activo
	FROM Persona P, Paciente Pa
	WHERE P.id = Pa.persona_id
GO
/****** Object:  StoredProcedure [dbo].[SP_medicoInsertar]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_medicoInsertar]
    @dni VARCHAR(8),
    @nombre VARCHAR(50),
    @apellido VARCHAR(50),
    @matricula VARCHAR(50),
    @email VARCHAR(50),
    @pass VARCHAR(50),
    @medico_idSalida INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        
        DECLARE @persona_id INT;
        
        -- Insertar en Persona
        INSERT INTO Persona (dni, nombre, apellido, email)
        VALUES (@dni, @nombre, @apellido, @email);
        SET @persona_id = SCOPE_IDENTITY();
        
        -- Insertar en Usuario
        INSERT INTO Usuario (perfilAcceso_id, persona_id, pass)
        VALUES (3, @persona_id, @pass);
        
        -- Insertar en Medico y capturar Medico.id
        INSERT INTO Medico (matricula, persona_id)
        VALUES (@matricula, @persona_id);
        SET @medico_idSalida = SCOPE_IDENTITY();
        
        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_medicoListar]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_medicoListar]
	@id INT = NULL AS
	SELECT M.id 'MedicoId', P.id 'PersonaId', P.dni, P.nombre, P.apellido, M.matricula, P.email, U.activo, U.pass
	FROM Persona P, Usuario U, Medico M
	WHERE P.id = U.persona_id AND P.id = M.persona_id AND (@id IS NULL OR M.id = @id)
	ORDER BY P.apellido
GO
/****** Object:  StoredProcedure [dbo].[SP_medicoListarPorEspecialidades]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_medicoListarPorEspecialidades] AS
SELECT ME.medico_id, E.Id, E.Descripcion
FROM Medico_Especialidad ME, Especialidad E
WHERE E.Id = ME.especialidad_id
GO
/****** Object:  StoredProcedure [dbo].[SP_medicoModificar]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_medicoModificar]
    @idPersona INT,
    @dni VARCHAR(8),
    @nombre NVARCHAR(50),
    @apellido NVARCHAR(50),
    @matricula NVARCHAR(50),
    @email NVARCHAR(50),
    @pass NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

		UPDATE Persona
		SET
			dni = @dni,
			nombre = @nombre,
			apellido = @apellido,
			email = @email
		WHERE id = @idPersona

		UPDATE Usuario
		SET
			pass = @pass
		WHERE persona_id = @idPersona

		UPDATE Medico
		SET
			matricula = @matricula
		WHERE persona_id = @idPersona

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_modificarPaciente]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_modificarPaciente]

    @Dni VARCHAR(8),
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @FechaNacimiento DATE = NULL,
    @Sexo VARCHAR(10) = NULL,
    @Telefono VARCHAR(50) = NULL,
    @Email VARCHAR(50),

    @HistorialClinico VARCHAR(200) = NULL,
    @TipoCobertura VARCHAR(50) = NULL,
    @Activo BIT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PersonaId INT;

    BEGIN TRY

        BEGIN TRANSACTION;

        SELECT @PersonaId = P.id
        FROM Persona P
        WHERE P.dni = @Dni;

        IF @PersonaId IS NULL
        BEGIN

            RAISERROR('No se encontró ninguna persona con el DNI especificado.', 16, 1);
        END

        UPDATE Persona
        SET
            nombre = @Nombre,
            apellido = @Apellido,
            fechaNacimiento = @FechaNacimiento,
            sexo = @Sexo,
            telefono = @Telefono,
            email = @Email
        WHERE
            id = @PersonaId;

        UPDATE Paciente
        SET
            historialClinico = @HistorialClinico,
            tipoCobertura = @TipoCobertura,
            activo = @Activo
        WHERE
            persona_id = @PersonaId;

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_turnoListar]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_turnoListar]
AS
BEGIN
	SELECT
		-- Turno
		T.id 'TurnoId',
		T.fecha, T.hora, T.motivoConsulta, T.observacionesMedico,T.estado,
		-- Paciente
		P.id 'PacienteId',
		PP.nombre 'PacienteNombre', PP.apellido 'PacienteApellido', PP.dni 'PacienteDni',
		-- Médico
		M.id 'MedicoId', M.matricula,
		PM.apellido 'MedicoApellido', PM.nombre 'MedicoNombre',
		-- Especialidad
		E.descripcion 'Especialidad'
	FROM Turno T
	INNER JOIN Paciente P ON T.paciente_id = P.id
	INNER JOIN Persona PP ON P.persona_id = PP.id
	INNER JOIN Medico M ON T.medico_id = M.id
	INNER JOIN Persona PM ON M.persona_id = PM.id
	INNER JOIN Medico_Especialidad ME ON M.id = ME.medico_id
	INNER JOIN Especialidad E ON ME.especialidad_id = E.id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_turnoListarMedicosPorEspecialidad]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_turnoListarMedicosPorEspecialidad]
    @EspecialidadId INT
AS
BEGIN
    SELECT 
        m.id AS Id,
        p.nombre + ' ' + p.apellido AS NombreCompleto
    FROM Medico m
    INNER JOIN Persona p ON m.persona_id = p.id
    INNER JOIN Medico_Especialidad me ON m.id = me.medico_id
    INNER JOIN Especialidad e ON me.especialidad_id = e.id
    WHERE e.id = @EspecialidadId
    ORDER BY p.apellido, p.nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_turnoTrabajoActualizar]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_turnoTrabajoActualizar]
	@diaSemana VARCHAR(50),
	@horaInicio TIME,
	@horaFin TIME,
	@id INT
AS
	UPDATE TurnoTrabajo
	SET
		diaSemana = @diaSemana,
		horaInicio = @horaInicio,
		horaFin = @horaFin
	WHERE
		id = @id
GO
/****** Object:  StoredProcedure [dbo].[SP_turnoTrabajoListar]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_turnoTrabajoListar]
	@id INT = NULL
AS
	SELECT id, diaSemana, horaInicio, horaFin, activo
	FROM TurnoTrabajo
	WHERE (@id IS NULL OR id = @id)
	ORDER BY
		CASE diaSemana
            WHEN 'Lunes' THEN 1
            WHEN 'Martes' THEN 2
            WHEN 'Miércoles' THEN 3
            WHEN 'Jueves' THEN 4
            WHEN 'Viernes' THEN 5
            WHEN 'Sábado' THEN 6
        END,
		horaInicio ASC;
GO
/****** Object:  StoredProcedure [dbo].[SP_turnoTrabajoListarPorMedico]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_turnoTrabajoListarPorMedico]
    @medicoId INT
AS
SELECT
    TT.Id,
    TT.DiaSemana,
    TT.HoraInicio,
    TT.HoraFin,
    TT.Activo
FROM
    Medico_TurnoTrabajo MTT, TurnoTrabajo TT
WHERE
    MTT.turnoTrabajo_id = TT.id AND MTT.medico_id = @medicoId;
GO
/****** Object:  StoredProcedure [dbo].[SP_verificarDniExistente]    Script Date: 27/8/2025 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_verificarDniExistente]
    @Dni VARCHAR(8)
AS
    SELECT COUNT(P.id)
    FROM Persona P
    WHERE P.dni = @Dni;
GO
USE [master]
GO
ALTER DATABASE [Clinica_DB] SET  READ_WRITE 
GO

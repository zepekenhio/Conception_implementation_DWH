USE [DW]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 13/06/2022 8:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id_client] [int] NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[Age] [int] NOT NULL,
	[Nbre_enfants] [int] NOT NULL,
	[Ville] [varchar](100) NOT NULL,
	[Pays] [varchar](100) NOT NULL,
	[Revenus] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompagnieA]    Script Date: 13/06/2022 8:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompagnieA](
	[Id_compagnie] [varchar](100) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[Pays] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_compagnie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Datev]    Script Date: 13/06/2022 8:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datev](
	[Id_date] [int] NOT NULL,
	[Jour] [varchar](100) NOT NULL,
	[Mois] [varchar](100) NOT NULL,
	[Année] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destinations]    Script Date: 13/06/2022 8:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinations](
	[Id_destination] [varchar](100) NOT NULL,
	[Hotel] [varchar](100) NOT NULL,
	[Ville] [varchar](100) NOT NULL,
	[Pays] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_destination] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voyage]    Script Date: 13/06/2022 8:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voyage](
	[Id_destination] [varchar](100) NOT NULL,
	[Id_client] [int] NOT NULL,
	[Id_compagnie] [varchar](100) NOT NULL,
	[Id_date] [int] NOT NULL,
	[Montant] [float] NOT NULL,
	[Nbre_jours] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD FOREIGN KEY([Id_client])
REFERENCES [dbo].[Clients] ([Id_client])
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD FOREIGN KEY([Id_compagnie])
REFERENCES [dbo].[CompagnieA] ([Id_compagnie])
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD FOREIGN KEY([Id_date])
REFERENCES [dbo].[Datev] ([Id_date])
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD FOREIGN KEY([Id_destination])
REFERENCES [dbo].[Destinations] ([Id_destination])
GO
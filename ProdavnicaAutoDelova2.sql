USE [ProdavnicaAutoDelova]
GO
ALTER TABLE [dbo].[StavkaRacuna] DROP CONSTRAINT [FK_StavkaRacuna_Racun]
GO
ALTER TABLE [dbo].[StavkaRacuna] DROP CONSTRAINT [FK_StavkaRacuna_AutoDeo]
GO
ALTER TABLE [dbo].[Racun] DROP CONSTRAINT [FK_Racun_Korisnik]
GO
ALTER TABLE [dbo].[Magacin] DROP CONSTRAINT [FK_Magacin_AutoDeo]
GO
ALTER TABLE [dbo].[AutoDeo] DROP CONSTRAINT [FK_AutoDeo_Dobavljac]
GO
/****** Object:  Table [dbo].[StavkaRacuna]    Script Date: 27-Aug-17 03:13:32 ******/
DROP TABLE [dbo].[StavkaRacuna]
GO
/****** Object:  Table [dbo].[Racun]    Script Date: 27-Aug-17 03:13:32 ******/
DROP TABLE [dbo].[Racun]
GO
/****** Object:  Table [dbo].[Magacin]    Script Date: 27-Aug-17 03:13:32 ******/
DROP TABLE [dbo].[Magacin]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 27-Aug-17 03:13:32 ******/
DROP TABLE [dbo].[Korisnik]
GO
/****** Object:  Table [dbo].[Dobavljac]    Script Date: 27-Aug-17 03:13:32 ******/
DROP TABLE [dbo].[Dobavljac]
GO
/****** Object:  Table [dbo].[AutoDeo]    Script Date: 27-Aug-17 03:13:32 ******/
DROP TABLE [dbo].[AutoDeo]
GO
USE [master]
GO
/****** Object:  Database [ProdavnicaAutoDelova]    Script Date: 27-Aug-17 03:13:32 ******/
DROP DATABASE [ProdavnicaAutoDelova]
GO
/****** Object:  Database [ProdavnicaAutoDelova]    Script Date: 27-Aug-17 03:13:32 ******/
CREATE DATABASE [ProdavnicaAutoDelova] ON  PRIMARY 
( NAME = N'ProdavnicaAutoDelova', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ProdavnicaAutoDelova.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProdavnicaAutoDelova_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ProdavnicaAutoDelova_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProdavnicaAutoDelova].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET  MULTI_USER 
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET DB_CHAINING OFF 
GO
USE [ProdavnicaAutoDelova]
GO
/****** Object:  Table [dbo].[AutoDeo]    Script Date: 27-Aug-17 03:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoDeo](
	[sifraAutoDela] [int] NOT NULL,
	[Cena] [int] NOT NULL,
	[Opis] [nvarchar](50) NOT NULL,
	[sifraDobavljaca] [int] NOT NULL,
 CONSTRAINT [PK_AutoDeo] PRIMARY KEY CLUSTERED 
(
	[sifraAutoDela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dobavljac]    Script Date: 27-Aug-17 03:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dobavljac](
	[sifraDobavljaca] [int] NOT NULL,
	[nazivFirme] [nvarchar](50) NOT NULL,
	[brTelefona] [nvarchar](50) NOT NULL,
	[adresaDobavljaca] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dobavljac] PRIMARY KEY CLUSTERED 
(
	[sifraDobavljaca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 27-Aug-17 03:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[prezime] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Magacin]    Script Date: 27-Aug-17 03:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Magacin](
	[RedniBroj] [int] IDENTITY(1,1) NOT NULL,
	[SifraAutoDela] [int] NOT NULL,
	[Kolicina] [int] NOT NULL,
 CONSTRAINT [PK_Magacin] PRIMARY KEY CLUSTERED 
(
	[RedniBroj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Racun]    Script Date: 27-Aug-17 03:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racun](
	[SifraRacuna] [int] NOT NULL,
	[UkupnaVrednost] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Korisnik] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Racun] PRIMARY KEY CLUSTERED 
(
	[SifraRacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StavkaRacuna]    Script Date: 27-Aug-17 03:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StavkaRacuna](
	[SifraRacuna] [int] NOT NULL,
	[RedniBroj] [int] NOT NULL,
	[SifraAutoDela] [int] NOT NULL,
	[Kolicina] [int] NOT NULL,
	[Vrednost] [int] NOT NULL,
 CONSTRAINT [PK_StavkaRacuna] PRIMARY KEY CLUSTERED 
(
	[SifraRacuna] ASC,
	[RedniBroj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AutoDeo] ([sifraAutoDela], [Cena], [Opis], [sifraDobavljaca]) VALUES (1, 4000, N'branik', 2)
INSERT [dbo].[AutoDeo] ([sifraAutoDela], [Cena], [Opis], [sifraDobavljaca]) VALUES (2, 5000, N'disk', 2)
INSERT [dbo].[AutoDeo] ([sifraAutoDela], [Cena], [Opis], [sifraDobavljaca]) VALUES (3, 500, N'svecica', 1)
INSERT [dbo].[AutoDeo] ([sifraAutoDela], [Cena], [Opis], [sifraDobavljaca]) VALUES (4, 6000, N'Auspuh', 3)
INSERT [dbo].[AutoDeo] ([sifraAutoDela], [Cena], [Opis], [sifraDobavljaca]) VALUES (5, 3000, N'Far', 1)
INSERT [dbo].[AutoDeo] ([sifraAutoDela], [Cena], [Opis], [sifraDobavljaca]) VALUES (6, 1400, N'antena', 3)
INSERT [dbo].[AutoDeo] ([sifraAutoDela], [Cena], [Opis], [sifraDobavljaca]) VALUES (7, 2000, N'znak napred', 4)
INSERT [dbo].[AutoDeo] ([sifraAutoDela], [Cena], [Opis], [sifraDobavljaca]) VALUES (8, 2000, N'znak pozadi', 4)
INSERT [dbo].[Dobavljac] ([sifraDobavljaca], [nazivFirme], [brTelefona], [adresaDobavljaca]) VALUES (1, N'BMWDelovi', N'0115624528', N'Cara Dusana 23')
INSERT [dbo].[Dobavljac] ([sifraDobavljaca], [nazivFirme], [brTelefona], [adresaDobavljaca]) VALUES (2, N'AudiDelovi', N'0119632545', N'Kosovska 1')
INSERT [dbo].[Dobavljac] ([sifraDobavljaca], [nazivFirme], [brTelefona], [adresaDobavljaca]) VALUES (3, N'MercedesDelovi', N'0114564556', N'Autoput 442')
INSERT [dbo].[Dobavljac] ([sifraDobavljaca], [nazivFirme], [brTelefona], [adresaDobavljaca]) VALUES (4, N'VWDelovi', N'0116585241', N'Pancevacki put 11')
INSERT [dbo].[Dobavljac] ([sifraDobavljaca], [nazivFirme], [brTelefona], [adresaDobavljaca]) VALUES (5, N'RenoDelovi', N'0115648654', N'Batajnicki put bb')
INSERT [dbo].[Dobavljac] ([sifraDobavljaca], [nazivFirme], [brTelefona], [adresaDobavljaca]) VALUES (6, N'PeugeotDelovi', N'0113254564', N'Autoput 36')
INSERT [dbo].[Dobavljac] ([sifraDobavljaca], [nazivFirme], [brTelefona], [adresaDobavljaca]) VALUES (7, N'OpelDelovi', N'0115645654', N'Zrenjaninski put 22')
INSERT [dbo].[Korisnik] ([username], [password], [ime], [prezime], [email]) VALUES (N'srki', N'srki', N'Srdjan', N'Krivokuca', N'srdjan@gmail.com')
SET IDENTITY_INSERT [dbo].[Magacin] ON 

INSERT [dbo].[Magacin] ([RedniBroj], [SifraAutoDela], [Kolicina]) VALUES (8, 3, 410)
INSERT [dbo].[Magacin] ([RedniBroj], [SifraAutoDela], [Kolicina]) VALUES (9, 5, 70)
INSERT [dbo].[Magacin] ([RedniBroj], [SifraAutoDela], [Kolicina]) VALUES (10, 2, 150)
INSERT [dbo].[Magacin] ([RedniBroj], [SifraAutoDela], [Kolicina]) VALUES (11, 1, 100)
INSERT [dbo].[Magacin] ([RedniBroj], [SifraAutoDela], [Kolicina]) VALUES (12, 4, 20)
INSERT [dbo].[Magacin] ([RedniBroj], [SifraAutoDela], [Kolicina]) VALUES (13, 6, 0)
INSERT [dbo].[Magacin] ([RedniBroj], [SifraAutoDela], [Kolicina]) VALUES (14, 7, 0)
INSERT [dbo].[Magacin] ([RedniBroj], [SifraAutoDela], [Kolicina]) VALUES (15, 8, 0)
SET IDENTITY_INSERT [dbo].[Magacin] OFF
INSERT [dbo].[Racun] ([SifraRacuna], [UkupnaVrednost], [Date], [Korisnik]) VALUES (1, 10000, CAST(N'2017-03-03' AS Date), N'srki')
ALTER TABLE [dbo].[AutoDeo]  WITH CHECK ADD  CONSTRAINT [FK_AutoDeo_Dobavljac] FOREIGN KEY([sifraDobavljaca])
REFERENCES [dbo].[Dobavljac] ([sifraDobavljaca])
GO
ALTER TABLE [dbo].[AutoDeo] CHECK CONSTRAINT [FK_AutoDeo_Dobavljac]
GO
ALTER TABLE [dbo].[Magacin]  WITH CHECK ADD  CONSTRAINT [FK_Magacin_AutoDeo] FOREIGN KEY([SifraAutoDela])
REFERENCES [dbo].[AutoDeo] ([sifraAutoDela])
GO
ALTER TABLE [dbo].[Magacin] CHECK CONSTRAINT [FK_Magacin_AutoDeo]
GO
ALTER TABLE [dbo].[Racun]  WITH CHECK ADD  CONSTRAINT [FK_Racun_Korisnik] FOREIGN KEY([Korisnik])
REFERENCES [dbo].[Korisnik] ([username])
GO
ALTER TABLE [dbo].[Racun] CHECK CONSTRAINT [FK_Racun_Korisnik]
GO
ALTER TABLE [dbo].[StavkaRacuna]  WITH CHECK ADD  CONSTRAINT [FK_StavkaRacuna_AutoDeo] FOREIGN KEY([SifraAutoDela])
REFERENCES [dbo].[AutoDeo] ([sifraAutoDela])
GO
ALTER TABLE [dbo].[StavkaRacuna] CHECK CONSTRAINT [FK_StavkaRacuna_AutoDeo]
GO
ALTER TABLE [dbo].[StavkaRacuna]  WITH CHECK ADD  CONSTRAINT [FK_StavkaRacuna_Racun] FOREIGN KEY([SifraRacuna])
REFERENCES [dbo].[Racun] ([SifraRacuna])
GO
ALTER TABLE [dbo].[StavkaRacuna] CHECK CONSTRAINT [FK_StavkaRacuna_Racun]
GO
USE [master]
GO
ALTER DATABASE [ProdavnicaAutoDelova] SET  READ_WRITE 
GO

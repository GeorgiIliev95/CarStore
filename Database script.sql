USE [master]
GO
/****** Object:  Database [CarSystem]    Script Date: 25.4.2017 г. 23:11:22 ч. ******/
CREATE DATABASE [CarSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarSystem', FILENAME = N'C:\Users\Georgi\CarSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarSystem_log', FILENAME = N'C:\Users\Georgi\CarSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarSystem] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarSystem] SET  MULTI_USER 
GO
ALTER DATABASE [CarSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarSystem] SET QUERY_STORE = OFF
GO
USE [CarSystem]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CarSystem]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 25.4.2017 г. 23:11:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 25.4.2017 г. 23:11:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 25.4.2017 г. 23:11:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 25.4.2017 г. 23:11:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[TelephoneNumber] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Model]    Script Date: 25.4.2017 г. 23:11:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Horsepower] [int] NOT NULL,
	[MaxSpeed] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 25.4.2017 г. 23:11:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[ClientID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 25.4.2017 г. 23:11:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ModelID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[AccessoryID] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC,
	[OrderID] ASC,
	[AccessoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (0, N'No accessory', N'', NULL, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (1, N'A-class:5-twin-spoke wheel', N'Finish: black, red rim flange Wheel: 7.5 J x 18 ET 52 | Tyre: 225/40 R182', NULL, CAST(185.21 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (2, N'A-class:5-spoke whee', N'Finish: black, high-sheen
Wheel: 7.5 J x 18 ET 52 | Tyre: 225/40 R182', NULL, CAST(84.21 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (3, N'A-class: Emergency spare wheel', N'The emergency spare wheel must be secured in place in the load compartment in an emergency spare wheel bag. Emergency spare
wheel to comply with statutory requirements', NULL, CAST(46.52 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (4, N'A-class: 5-twin-spoke wheel', N'Finish: black
Wheel: 6.5 J x 16 ET 49 | Tyre: 205/55 R162', NULL, CAST(84.21 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (5, N'A-class: “Road” & “Track” decal kits.', N'Both decal kits (Road & Track) lend your vehicle a sporty look and underline its expressive design. The multi-piece “Road” decal kit with its
motor racing-themed “chequered flag” design can be combined with the “Track” decal kit, featuring a start number 1 and a Mercedes-Benz Sport Equipment windscreen
strip for racing use.', NULL, CAST(2542.85 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (6, N'A-class: SPORT badge', N'High-quality high-sheen badge for the wing', NULL, CAST(212.20 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (7, N'A-class: Brake system kit', N'Eye-catching looks and impressive performance to further emphasise your sporty appearance. The single-piston brake calliper is painted red and
branded with a Mercedes-Benz badge. In conjunction with perforated, internally ventilated brake discs (to be ordered separately if necessary), the kit optimises system
cooling and improves response in the wet.', NULL, CAST(2412.25 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (8, N'A-class: Illuminated Mercedes star', N'Let your star shine. Thanks to fibre-optic cables and LED technology, the central star emblem in your Mercedes’ radiator grille lights up when
you remotely lock/unlock the vehicle or open the door or tailgate. Only functions when engine is switched off.', NULL, CAST(884.21 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (9, N'A-class: SPORT door sill panels, illuminated', N'Elegant door sill panels in brushed stainless steel, with illuminated lettering. A distinctive, eye-catching accessory, whether in
daylight or at night – thanks to brightly illuminated “SPORT” lettering, set in an elegant ground stainless steel panel.', NULL, CAST(658.40 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (10, N'A-class: Carbon fibre-look rear trim strip', N'The Mercedes-Benz Sport Equipment rear trim strip, with its realistic carbon fibre look and individual, dynamic 3D effect, underlines
the vehicle’s dynamic appearance. No entry in vehicle documents required. Simple, secure fitting.', NULL, CAST(944.11 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (11, N'C-class: Multi-spoke wheel', N'Finish: matt black, high-sheen
Wheel: 7.5?J x 18 ET 44 | Tyre: 225/45 R18 XL', NULL, CAST(184.21 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (12, N'C-class: 10-spoke wheel', N'Finish: black, high-sheen rim flange
Wheel: 7.5?J x 19 ET 44 | Tyre: 225/40 R19 XL', NULL, CAST(142.51 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (13, N'C-class: Primed rear spoiler', N'Discreet spoiler, fitted to the boot lid, subtly
accentuating the rear contours of the Saloon. A
high-quality primed finish allows the product to
be painted in the required colour. Highly durable
thanks to precision-fit, dimensionally stable
polyurethane. ', NULL, CAST(485.21 AS Decimal(10, 2)))
INSERT [dbo].[Accessory] ([ID], [Name], [Description], [Image], [Price]) VALUES (14, N'C-class:  SPORT steering wheel', N'Black Mercedes-Benz Sport Equipment steering
wheel, with flattened bottom section and perforated
central grip area.', NULL, CAST(161.15 AS Decimal(10, 2)))
INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'Limousine')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (2, N'Tourer')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (3, N'T-Model')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (4, N'ShootingBrakes')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (5, N'Coupe')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (6, N'Cabriolet')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (7, N'Offroader')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (8, N'MPV')
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (1, N'A-class', 1)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (2, N'E-class limousine', 1)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (3, N'C-class limousine', 1)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (4, N'S-class', 1)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (5, N'Mercedes-Maybach S-class', 1)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (6, N'B-class Tourer', 2)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (7, N'C-class T-Model', 3)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (8, N'E-class Estate', 3)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (9, N'CLS-class ShootingBrake', 4)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (10, N'CLA ShootingBrake', 4)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (11, N'C-class coupe', 5)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (12, N'CLS-class coupe', 5)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (13, N'E-class coupe', 5)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (14, N'CLA-class', 5)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (15, N'S-class coupe', 5)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (16, N'GLE coupe', 5)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (17, N'GLC coupe', 5)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (18, N'E-class Cabriolet', 6)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (19, N'S-class Cabriolet', 6)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (20, N'SL roadster', 6)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (21, N'GLA-class', 7)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (22, N'GLE SUV', 7)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (23, N'GLC SUV', 7)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (24, N'G-class', 7)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (25, N'GLS SUV', 7)
INSERT [dbo].[Class] ([ID], [Name], [CategoryID]) VALUES (26, N'V-class', 8)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [BirthDate], [Email], [TelephoneNumber]) VALUES (1, N'Willie', N'Murray', CAST(N'1974-03-14' AS Date), N'cebuposeph@gmail.com', N'(251) 546-9442 ')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [BirthDate], [Email], [TelephoneNumber]) VALUES (2, N'Tami', N'Young', CAST(N'1985-04-24' AS Date), N'tami_young@yahoo.com', N'(125) 546-4478 ')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [BirthDate], [Email], [TelephoneNumber]) VALUES (3, N'Amanda', N'Richardson', CAST(N'1988-08-28' AS Date), N'amanda.richardson@gmail.com', N'(949) 569-4371 ')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [BirthDate], [Email], [TelephoneNumber]) VALUES (4, N'Bruce', N'Kelley', CAST(N'1974-12-11' AS Date), N'bruce_kelley@gmail.com', N'(630) 446-8851 ')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [BirthDate], [Email], [TelephoneNumber]) VALUES (5, N'Teresa', N'Romero', CAST(N'1990-10-06' AS Date), N'teresa_romero@gmail.com', N'(226) 906-2721 ')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [BirthDate], [Email], [TelephoneNumber]) VALUES (6, N'Phillip', N'Blair', CAST(N'1986-07-16' AS Date), N'phillip_blair@gmail.com', N'(671) 925-1352 ')
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (1, N'A160', 102, 190, N'A-class.PNG', CAST(37160.77 AS Decimal(10, 2)), 1)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (2, N'A180', 112, 202, N'A-class.PNG', CAST(38921.02 AS Decimal(10, 2)), 1)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (3, N'A200', 156, 224, N'A-class.PNG', CAST(43223.84 AS Decimal(10, 2)), 1)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (4, N'A220 4MATIC', 184, 228, N'A-class.PNG', CAST(49775.87 AS Decimal(10, 2)), 1)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (5, N'A250', 211, 240, N'A-class.PNG', CAST(49286.92 AS Decimal(10, 2)), 1)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (6, N'A50 Sport 4MATIX', 218, 240, N'A-class.PNG', CAST(61804.23 AS Decimal(10, 2)), 1)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (7, N'E200', 184, 240, N'E-class.PNG', CAST(68062.88 AS Decimal(10, 2)), 2)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (8, N'E200 4MATIC', 184, 233, N'E-class.PNG', CAST(76277.37 AS Decimal(10, 2)), 2)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (9, N'E250', 211, 250, N'E-class.PNG', CAST(75886.20 AS Decimal(10, 2)), 2)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (10, N'E300', 245, 250, N'E-class.PNG', CAST(83220.57 AS Decimal(10, 2)), 2)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (11, N'E220d', 194, 240, N'E-class.PNG', CAST(74908.29 AS Decimal(10, 2)), 2)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (12, N'Mercedes-AMG E 43 4MATIC', 401, 250, N'E-class.PNG', CAST(118914.46 AS Decimal(10, 2)), 2)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (13, N'C160', 129, 216, N'C-class.PNG', CAST(48406.79 AS Decimal(10, 2)), 3)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (14, N'C200 4MATIC', 184, 229, N'C-class.PNG', CAST(62097.60 AS Decimal(10, 2)), 3)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (15, N'C200', 184, 237, N'C-class.PNG', CAST(55252.20 AS Decimal(10, 2)), 3)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (16, N'C300', 245, 250, N'C-class.PNG', CAST(65324.72 AS Decimal(10, 2)), 3)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (17, N'C350 e', 279, 250, N'C-class.PNG', CAST(74908.29 AS Decimal(10, 2)), 3)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (18, N'C 400 4MATIC', 333, 250, N'C-class.PNG', CAST(76961.91 AS Decimal(10, 2)), 3)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (19, N'S 350 d', 258, 250, N'S-class.PNG', CAST(136321.35 AS Decimal(10, 2)), 4)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (20, N'S 500 4MATIC', 455, 250, N'S-class.PNG', CAST(183652.44 AS Decimal(10, 2)), 4)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (21, N'S 600 L', 530, 250, N'S-class.PNG', CAST(273327.24 AS Decimal(10, 2)), 4)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (22, N'Mercedes-AMG S 63 AMG', 585, 250, N'S-class.PNG', CAST(251813.11 AS Decimal(10, 2)), 4)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (23, N'Mercedes-AMG S 63 AMG 4MATIC L', 585, 250, N'S-class.PNG', CAST(257191.65 AS Decimal(10, 2)), 4)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (24, N'Mercedes-AMG S 65 AMG L', 630, 250, N'S-class.PNG', CAST(389405.75 AS Decimal(10, 2)), 4)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (25, N'Mercedes-Maybach S 500', 455, 250, N'Maybach.PNG', CAST(222671.25 AS Decimal(10, 2)), 5)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (26, N'Mercedes-Maybach S 500 4MATIC', 455, 250, N'Maybach.PNG', CAST(228929.90 AS Decimal(10, 2)), 5)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (27, N'Mercedes-Maybach S 600', 530, 250, N'Maybach.PNG', CAST(309118.93 AS Decimal(10, 2)), 5)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (10567732, N'Mercedes-AMG C 63 S', 510, 250, N'C-class AMG.PNG', CAST(124195.00 AS Decimal(10, 2)), 11)
INSERT [dbo].[Model] ([ID], [Name], [Horsepower], [MaxSpeed], [Image], [Price], [ClassID]) VALUES (66594887, N'C 250 d', 204, 247, N'C-class.PNG', CAST(65520.00 AS Decimal(10, 2)), 11)
INSERT [dbo].[Order] ([ID], [OrderDate], [Price], [ClientID]) VALUES (1, CAST(N'2016-04-24T00:00:00.000' AS DateTime), CAST(46063.10 AS Decimal(10, 2)), 6)
INSERT [dbo].[Order] ([ID], [OrderDate], [Price], [ClientID]) VALUES (2, CAST(N'2016-05-12T00:00:00.000' AS DateTime), CAST(67629.93 AS Decimal(10, 2)), 2)
INSERT [dbo].[Order] ([ID], [OrderDate], [Price], [ClientID]) VALUES (3, CAST(N'2015-06-30T00:00:00.000' AS DateTime), CAST(77447.12 AS Decimal(10, 2)), 3)
INSERT [dbo].[Order] ([ID], [OrderDate], [Price], [ClientID]) VALUES (4, CAST(N'2016-10-24T00:00:00.000' AS DateTime), CAST(75253.65 AS Decimal(10, 2)), 4)
INSERT [dbo].[Order] ([ID], [OrderDate], [Price], [ClientID]) VALUES (5, CAST(N'2017-03-08T00:00:00.000' AS DateTime), CAST(51300.45 AS Decimal(10, 2)), 5)
INSERT [dbo].[Order] ([ID], [OrderDate], [Price], [ClientID]) VALUES (2996453, CAST(N'2017-06-14T00:00:00.000' AS DateTime), CAST(62886.47 AS Decimal(10, 2)), 5)
INSERT [dbo].[Order] ([ID], [OrderDate], [Price], [ClientID]) VALUES (11285943, CAST(N'2017-04-10T00:00:00.000' AS DateTime), CAST(118914.46 AS Decimal(10, 2)), 6)
INSERT [dbo].[Order] ([ID], [OrderDate], [Price], [ClientID]) VALUES (45196527, CAST(N'2017-06-06T00:00:00.000' AS DateTime), CAST(125168.08 AS Decimal(10, 2)), 4)
INSERT [dbo].[Order] ([ID], [OrderDate], [Price], [ClientID]) VALUES (54804595, CAST(N'2018-01-26T00:00:00.000' AS DateTime), CAST(57830.04 AS Decimal(10, 2)), 5)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (3, 1, 4)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (3, 1, 5)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (3, 1, 6)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 1)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 2)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 3)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 4)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 5)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 6)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 7)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 8)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 9)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (4, 54804595, 10)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (5, 5, 1)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (5, 5, 8)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (5, 5, 10)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (6, 2, 5)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (6, 2, 6)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (6, 2, 7)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (6, 2, 9)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (12, 11285943, 0)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (14, 2996453, 12)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (14, 2996453, 13)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (14, 2996453, 14)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (17, 4, 11)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (17, 4, 14)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (18, 3, 13)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (10567732, 45196527, 11)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (10567732, 45196527, 12)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (10567732, 45196527, 13)
INSERT [dbo].[OrderDetail] ([ModelID], [OrderID], [AccessoryID]) VALUES (10567732, 45196527, 14)
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Category]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Class]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Accessory] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessory] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Accessory]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Model] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Model]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
USE [master]
GO
ALTER DATABASE [CarSystem] SET  READ_WRITE 
GO

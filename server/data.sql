USE [master]
GO
/****** Object:  Database [Furniturs]    Script Date: 21/02/2022 15:15:59 ******/
CREATE DATABASE [Furniturs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Furniturs', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.SQL\MSSQL\DATA\Furniturs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Furniturs_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.SQL\MSSQL\DATA\Furniturs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Furniturs] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Furniturs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Furniturs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Furniturs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Furniturs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Furniturs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Furniturs] SET ARITHABORT OFF 
GO
ALTER DATABASE [Furniturs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Furniturs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Furniturs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Furniturs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Furniturs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Furniturs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Furniturs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Furniturs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Furniturs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Furniturs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Furniturs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Furniturs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Furniturs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Furniturs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Furniturs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Furniturs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Furniturs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Furniturs] SET RECOVERY FULL 
GO
ALTER DATABASE [Furniturs] SET  MULTI_USER 
GO
ALTER DATABASE [Furniturs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Furniturs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Furniturs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Furniturs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Furniturs] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Furniturs', N'ON'
GO
ALTER DATABASE [Furniturs] SET QUERY_STORE = OFF
GO
USE [Furniturs]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Furniturs]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 21/02/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[CategoryCode] [int] NOT NULL,
	[CategoryName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[CategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21/02/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductCode] [int] NOT NULL,
	[ProductName] [varchar](20) NOT NULL,
	[description] [varchar](50) NULL,
	[CategoryCode] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[Picture] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDitails]    Script Date: 21/02/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDitails](
	[Id_identity] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseCode] [int] NOT NULL,
	[ProductCode] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_PurchaseDitails] PRIMARY KEY CLUSTERED 
(
	[Id_identity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 21/02/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[PurchaseCode] [int] NOT NULL,
	[PurchaseDate] [date] NOT NULL,
	[UserCode] [int] NOT NULL,
	[Sum] [int] NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[PurchaseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21/02/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserCode] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[UserPhone] [varchar](20) NOT NULL,
	[UserAddress] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorys] ([CategoryCode], [CategoryName]) VALUES (24, N'ספות')
INSERT [dbo].[Categorys] ([CategoryCode], [CategoryName]) VALUES (34, N'שולחנות')
INSERT [dbo].[Categorys] ([CategoryCode], [CategoryName]) VALUES (44, N'חדרים')
INSERT [dbo].[Categorys] ([CategoryCode], [CategoryName]) VALUES (54, N'מיטות')
INSERT [dbo].[Categorys] ([CategoryCode], [CategoryName]) VALUES (64, N'כסאות')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (1, N' חדר 1', N'חדר תכלת עם רהוט עץ', 44, 2500.0000, N'../../../assets/חדרים/חדר 1.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (2, N'חדר 2', N'חדר נוער מעוצב', 44, 3000.0000, N'../../../assets/חדרים/חדר 2.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (3, N'חדר 3', N'חדר זוגי מעוצב בסגנון איטלקי', 44, 10000.0000, N'../../../assets/חדרים/חדר 3.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (4, N'חדר 4', N'חדר בשביל הנסיכה שלכם', 44, 8000.0000, N'../../../assets/חדרים/חדר 4.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (5, N'חדר 5', N'סלון יוקרתי', 44, 15000.0000, N'../../../assets/חדרים/חדר 4.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (6, N'חדר 6', N'חדר בצבע ירוק תפוח', 44, 7000.0000, N'../../../assets/חדרים/חדר 6.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (7, N'חדר 7', N'חדר ילדות מפואר', 44, 12000.0000, N'../../../assets/חדרים/חדר 7.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (8, N'חדר 8', N'חדר תינוקות מפנק', 44, 5000.0000, N'../../../assets/חדרים/חדר 9.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (11, N'חדר 9', N'חדר ורוד', 44, 10000.0000, N'../../../assets/חדרים/חדר 10.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (12, N'חדר 10', N'פינת ספות מפוארת', 44, 20000.0000, N'../../../assets/חדרים/חדר 11.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (13, N'חדר 11', N'לובי מקורי', 44, 30000.0000, N'../../../assets/חדרים/חדר 12.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (14, N'חדר 12', N'סלון עשיר', 44, 12000.0000, N'../../../assets/חדרים/חדר 13.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (15, N'חדר 13', N'פינת מדרגות מתפתלת', 44, 5000.0000, N'../../../assets/חדרים/חדר 14.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (17, N'כסא 1', N'כסא עץ סלוני', 64, 600.0000, N'../../../assets/כסאות/כסא 1.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (18, N'חדר 14', N'פינת ספות אמריקאית', 44, 15500.0000, N'../../../assets/חדרים/חדר 15.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (19, N'חדר 15', N'מטבח אדום', 44, 100000.0000, N'../../../assets/חדרים/חדר 16.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (22, N'חדר 16', N'מטבח עץ בשילוב שחור', 44, 99999.0000, N'../../../assets/חדרים/חדר 17.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (23, N'חדר 17', N'חדר משרדי סגלגל', 44, 7900.0000, N'../../../assets/חדרים/חדר 18.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (24, N'חדר 18', N'מטבח בסגנון מרוקאי', 44, 50500.0000, N'../../../assets/חדרים/חדר 19.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (25, N'חדר 19', N'פינת ישיבה מפנקת', 44, 2500.0000, N'../../../assets/חדרים/חדר 20.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (26, N'חדר 20', N'חדר מעוצב אלוף ע"י המעצבת אסתי לב', 44, 12000.0000, N'../../../assets/חדרים/חדר 21.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (27, N'חדר 21', N'חדור כתום בסגנון ארופאי', 44, 11100.0000, N'../../../assets/חדרים/חדר 23.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (28, N'חדר 22', N'חדר אמבטיה שעד שלא קניתם לא הבנתם', 44, 20500.0000, N'../../../assets/חדרים/חדר 25.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (29, N'חדר 23', N'אמטיה בצבעי הירוק תפוח', 44, 12000.0000, N'../../../assets/חדרים/חדר 26.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (30, N'חדר 24', N'חדר שינה סולידי', 44, 22300.0000, N'../../../assets/חדרים/חדר 27.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (31, N'חדר 25', N'פינת ספות גרוזינית', 44, 11400.0000, N'../../../assets/חדרים/חדר 28.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (32, N'חדר 26', N'פינת אוכל שלא כל אחד יכול לפרגן לעצמו', 44, 2500.0000, N'../../../assets/חדרים/חדר 29.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (33, N'חדר 27', N'חדר תינוקות רך ומרגיע', 44, 6500.0000, N'../../../assets/חדרים/חדר 31.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (37, N'מיטה 1', N'מיטה מפנקת לחלומות קסומים', 54, 5600.0000, N'../../../assets/מיטות/מיטה (1).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (38, N'מיטה 2', N'מיטה לנסיכה החמודה שלכם במחיר מציאה', 54, 4100.0000, N'../../../assets/מיטות/מיטה (2).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (39, N'מיטה 3', N'מיטת נוער ששווה לנסות', 54, 3950.0000, N'../../../assets/מיטות/מיטה (3).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (40, N'ספה 1', N'ספה מחוטבת לסלון בסגנון איטלקי', 24, 4850.0000, N'../../../assets/ספות/ספה (1).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (41, N'ספה 2', N'ספה מלכותית חזקה במיוחד', 24, 8900.0000, N'../../../assets/ספות/ספה (2).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (42, N'ספה 3', N'ספה ורודה לחדר הבנות שלכם', 24, 5210.0000, N'../../../assets/ספות/ספה (3).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (43, N'ספה 4', N'ספה פחוסה', 24, 15420.0000, N'../../../assets/ספות/ספה (4).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (45, N'ספה 5', N'ספה מטפסת בצבע ורוד תות', 24, 12300.0000, N'../../../assets/ספות/ספה (5).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (46, N'ספה 6', N'ספה סגלגלה מתאימה לחדר לחדר משרדים', 24, 3600.0000, N'../../../assets/ספות/ספה (6).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (47, N'ספה 7', N'כורסא בסגנון עתיק', 24, 9210.0000, N'../../../assets/ספות/ספה (7).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (48, N'ספה 8', N'ספה רגילה בצבע ורוד זורח', 24, 4360.0000, N'../../../assets/ספות/ספה (8).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (49, N'כסא 2', N'כסא סלוני בורדו קטיפה', 64, 1000.0000, N'../../../assets/כסאות/כסא 2.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (50, N'כסא 3', N'כסא סלוני מחוטב תסיומת עץ', 64, 1200.0000, N'../../../assets/כסאות/כסא 3.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (51, N'כסא 4', N'כסא נוער צהוב שובב', 64, 300.0000, N'../../../assets/כסאות/כסא 4.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (52, N'כסא 5', N'כסא לבן אלגנטי נמוך בסגנון אטלקי', 64, 1500.0000, N'../../../assets/כסאות/כסא 5.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (53, N'כסא 6', N'כסא בר אדום יין', 64, 500.0000, N'../../../assets/כסאות/כסא 6.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (54, N'כסא 7', N'כסא משרדי עור אמיתי', 64, 2500.0000, N'../../../assets/כסאות/כסא 7.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (55, N'כסא 8', N'כסא ביצה שחור מבריק ', 64, 600.0000, N'../../../assets/כסאות/כסא 8.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (56, N'כסא 9', N'כסא מפותל מעץ דחוס', 64, 250.0000, N'../../../assets/כסאות/כסא 9.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (57, N'כסא 10', N'כסא מפנק שלא תרצו לקום ממנו', 64, 2000.0000, N'../../../assets/כסאות/כסא 10.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (58, N'כסא 11', N'כסא דמוי קש ', 64, 50.0000, N'../../../assets/כסאות/כסא 11.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (59, N'כסא 13', N'כסא מטבח אדום בוהק מגניב', 64, 550.0000, N'../../../assets/כסאות/כסא 13.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (60, N'כסא 14', N'כסא נדנדה בסגנון עתיק', 64, 355.0000, N'../../../assets/כסאות/כסא 14.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (61, N'כסא 15', N'כסא לחדר ילדים ירוק ', 64, 250.0000, N'../../../assets/כסאות/כסא 15.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (62, N'כסא 17', N'כסא מנהלים מעור חום', 64, 750.0000, N'../../../assets/כסאות/כסא 17.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (63, N'כסא 18', N'כסא גן ורוד', 64, 150.0000, N'../../../assets/כסאות/כסא 18.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (64, N'כסא 19', N'כסא מתנדנד לגינה פסטורלי', 64, 450.0000, N'../../../assets/כסאות/כסא 19.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (65, N'כסא 16', N'זוג כסאות ביצה נוחות', 64, 300.0000, N'../../../assets/כסאות/כסא 16.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (66, N'כסא 20', N'כסא גן ירוק', 64, 120.0000, N'../../../assets/כסאות/כסא 20.jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (67, N'ספה 9', N'כסא מחוטב בסגנון מרוקאי', 24, 9800.0000, N'../../../assets/ספות/ספה (9).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (68, N'ספה 10', N'ספה פינתית לבנה', 24, 13500.0000, N'../../../assets/ספות/ספה (10).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (69, N'ספה 11', N'ספה אדומה נוחה ביותר', 24, 7800.0000, N'../../../assets/ספות/ספה (11).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (70, N'ספה 12', N'כורסת נוחות לבנה', 24, 5680.0000, N'../../../assets/ספות/ספה (12).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (71, N'ספה 13', N'פוף תכלת מפנק', 24, 250.0000, N'../../../assets/ספות/ספה (13).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (72, N'שולחן 1', N'שולחן סלוני מעץ מלא', 34, 2500.0000, N'../../../assets/שולחנות/שולחן (1).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (73, N'שולחן 2', N'שולחן לפינת אוכל בסגנון עתיק', 34, 1500.0000, N'../../../assets/שולחנות/שולחן (2).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (74, N'שולחן 3', N'שולחן מסעדה+2 כסאות', 34, 4500.0000, N'../../../assets/שולחנות/שולחן (3).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (75, N'שולחן 4', N'שולחן אלגנטי עם רגל מחוטבת', 34, 6200.0000, N'../../../assets/שולחנות/שולחן (4).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (76, N'שולחן 5', N'שולחן לפינת איפור', 34, 2480.0000, N'../../../assets/שולחנות/שולחן (5).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (77, N'שולחן 6', N'פינת אוכל בסגנון סולידי', 34, 5200.0000, N'../../../assets/שולחנות/שולחן (6).jpg')
INSERT [dbo].[Products] ([ProductCode], [ProductName], [description], [CategoryCode], [Cost], [Picture]) VALUES (254, N'שולחן סלוני מקורי', N'שולחן ביצור יחודי', 34, 5600.0000, N'')
SET IDENTITY_INSERT [dbo].[PurchaseDitails] ON 

INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (1, 104, 73, 4)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (2, 104, 72, 5)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (3, 104, 72, 2)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (4, 104, 73, 2)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (5, 104, 72, 2)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (6, 104, 73, 2)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (7, 104, 73, 4)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (8, 104, 74, 3)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (9, 0, 45, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (10, 104, 1, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (11, 0, 72, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (12, 0, 73, 2)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (13, 104, 41, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (14, 104, 40, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (44, 104, 73, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (45, 104, 76, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (46, 0, 41, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (47, 0, 40, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (48, 104, 73, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (49, 104, 40, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (50, 104, 42, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (51, 104, 43, 3)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (52, 104, 41, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (53, 104, 41, 5)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (54, 104, 40, 2)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (55, 104, 42, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (56, 104, 40, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (57, 104, 42, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (58, 104, 41, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (59, 104, 1, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (60, 104, 74, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (61, 104, 76, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (62, 104, 75, 1)
INSERT [dbo].[PurchaseDitails] ([Id_identity], [PurchaseCode], [ProductCode], [Amount]) VALUES (63, 104, 1, 1)
SET IDENTITY_INSERT [dbo].[PurchaseDitails] OFF
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (0, CAST(N'2022-02-14' AS Date), 0, 0)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (104, CAST(N'2022-02-14' AS Date), 104, 13500)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (1500, CAST(N'2022-02-20' AS Date), 104, 1500)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (2500, CAST(N'2022-02-15' AS Date), 104, 2500)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (3980, CAST(N'2022-02-20' AS Date), 104, 3980)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (5500, CAST(N'2022-02-15' AS Date), 0, 5500)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (13180, CAST(N'2022-02-21' AS Date), 104, 13180)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (13750, CAST(N'2022-02-15' AS Date), 104, 13750)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (18960, CAST(N'2022-02-21' AS Date), 104, 18960)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (19500, CAST(N'2022-02-14' AS Date), 104, 19500)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (23500, CAST(N'2022-02-18' AS Date), 3248, 23500)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (24310, CAST(N'2022-02-16' AS Date), 3716, 24310)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (59410, CAST(N'2022-02-21' AS Date), 104, 59410)
INSERT [dbo].[Purchases] ([PurchaseCode], [PurchaseDate], [UserCode], [Sum]) VALUES (65220, CAST(N'2022-02-21' AS Date), 104, 65220)
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (0, 0, N'', N'', N'')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (101, 213526353, N'Dassy', N'0737521999', N'Beit shemesh')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (102, 123456789, N'Yossi', N'029919972', N'Ashdod')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (103, 987654321, N'David', N'0527698625', N'Jerusalem')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (104, 212215180, N'Esty', N'0533184039', N'Dimona')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (105, 37311628, N'Sara', N'0527698625', N'Beit Shemesh')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (109, 212215187, N'vity', N'0527695152', N'הרצוג 45')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (111, 2155784, N'רבקה', N'0533124856', N'הצבעוני 15')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (155, 21155555, N'reh', N'0556746978', N'etwh')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (888, 55555555, N'Leah', N'0556746978', N'bkasc')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (1234, 288484444, N'Rivka', N'0533124856', N'הצבעוני 15')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (3248, 324856566, N'chevi', N'0504133999', N'רשי 41')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (3615, 324101963, N'רבקה', N'0533178525', N'אלגזי')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (3715, 0, N'toby', N'0548503973', N'rashi 107')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (3716, 212795999, N'sara', N'5725072', N'Beitar')
INSERT [dbo].[Users] ([UserCode], [UserId], [UserName], [UserPhone], [UserAddress]) VALUES (333830982, 333830982, N'Sury', N'02-6743425', N'שרי ישראל 11')
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categorys] FOREIGN KEY([CategoryCode])
REFERENCES [dbo].[Categorys] ([CategoryCode])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categorys]
GO
ALTER TABLE [dbo].[PurchaseDitails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDitails_Products] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Products] ([ProductCode])
GO
ALTER TABLE [dbo].[PurchaseDitails] CHECK CONSTRAINT [FK_PurchaseDitails_Products]
GO
ALTER TABLE [dbo].[PurchaseDitails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDitails_Purchases] FOREIGN KEY([PurchaseCode])
REFERENCES [dbo].[Purchases] ([PurchaseCode])
GO
ALTER TABLE [dbo].[PurchaseDitails] CHECK CONSTRAINT [FK_PurchaseDitails_Purchases]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_Users] FOREIGN KEY([UserCode])
REFERENCES [dbo].[Users] ([UserCode])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_Users]
GO
USE [master]
GO
ALTER DATABASE [Furniturs] SET  READ_WRITE 
GO

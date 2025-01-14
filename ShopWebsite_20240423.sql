USE [master]
GO
/****** Object:  Database [ShopWebsite]    Script Date: 2024/4/23 下午 11:36:11 ******/
CREATE DATABASE [ShopWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopWebsite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopWebsite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopWebsite] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopWebsite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopWebsite] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [ShopWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopWebsite', N'ON'
GO
ALTER DATABASE [ShopWebsite] SET QUERY_STORE = OFF
GO
USE [ShopWebsite]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminNum] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupNum] [bigint] NULL,
	[AdminAcc] [nvarchar](50) NULL,
	[AdminPwd] [nvarchar](50) NULL,
	[AdminName] [nvarchar](50) NULL,
	[AdminPublish] [bit] NULL,
	[LastLogin] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [bigint] NULL,
	[EditTime] [datetime] NULL,
	[Editor] [bigint] NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminGroup]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminGroup](
	[GroupNum] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
	[GroupInfo] [nvarchar](max) NULL,
	[GroupPublish] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [bigint] NULL,
	[EditTime] [datetime] NULL,
	[Editor] [bigint] NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoginGroup] PRIMARY KEY CLUSTERED 
(
	[GroupNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminRole]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminRole](
	[RoleNum] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupNum] [bigint] NULL,
	[MenuSubNum] [bigint] NULL,
	[Role] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [bigint] NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoginRole] PRIMARY KEY CLUSTERED 
(
	[RoleNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerNum] [bigint] IDENTITY(1,1) NOT NULL,
	[Lang] [nvarchar](50) NULL,
	[ProductClass] [bigint] NULL,
	[BannerSort] [bigint] NULL,
	[BannerTitle] [nvarchar](max) NULL,
	[BannerDescription] [nvarchar](max) NULL,
	[BannerContxt] [nvarchar](max) NULL,
	[BannerImg1] [nvarchar](max) NULL,
	[BannerImgUrl] [nvarchar](max) NULL,
	[BannerImgAlt] [nvarchar](max) NULL,
	[BannerPublish] [bit] NULL,
	[BannerPutTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [bigint] NULL,
	[EditTime] [datetime] NULL,
	[Editor] [bigint] NULL,
	[IP] [nvarchar](50) NULL,
	[BannerOffTime] [datetime] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[BannerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [bigint] IDENTITY(1,1) NOT NULL,
	[NewsId] [bigint] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuGroup]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuGroup](
	[MenuGroupNum] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuGroupSort] [bigint] NULL,
	[MenuGroupId] [nvarchar](100) NULL,
	[MenuGroupName] [nvarchar](100) NULL,
	[MenuGroupIcon] [nvarchar](50) NULL,
	[MenuGroupInfo] [nvarchar](100) NULL,
	[MenuGroupUrl] [nvarchar](100) NULL,
	[MenuGroupPublish] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [bigint] NULL,
	[EditTime] [datetime] NULL,
	[Editor] [bigint] NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuGroup] PRIMARY KEY CLUSTERED 
(
	[MenuGroupNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuSub]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuSub](
	[MenuSubNum] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuGroupId] [nvarchar](50) NULL,
	[MenuSubSort] [bigint] NULL,
	[MenuSubId] [nvarchar](50) NULL,
	[MenuSubName] [nvarchar](50) NULL,
	[MenuSubRole] [nvarchar](50) NULL,
	[MenuSubIcon] [nvarchar](50) NULL,
	[MenuSubInfo] [nvarchar](50) NULL,
	[MenuSubUrl] [nvarchar](100) NULL,
	[MenuSubPublish] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [bigint] NULL,
	[EditTime] [datetime] NULL,
	[Editor] [bigint] NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuSub] PRIMARY KEY CLUSTERED 
(
	[MenuSubNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsNum] [bigint] IDENTITY(1,1) NOT NULL,
	[Lang] [nvarchar](50) NULL,
	[NewsClass] [bigint] NOT NULL,
	[NewsSort] [bigint] NULL,
	[NewsTitle] [nvarchar](max) NULL,
	[NewsDescription] [nvarchar](max) NULL,
	[NewsContxt] [nvarchar](max) NULL,
	[NewsImg1] [nvarchar](max) NULL,
	[NewsImgUrl] [nvarchar](max) NULL,
	[NewsImgAlt] [nvarchar](max) NULL,
	[NewsPublish] [bit] NULL,
	[NewsViews] [bigint] NULL,
	[NewsPutTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [bigint] NULL,
	[EditTime] [datetime] NULL,
	[Editor] [bigint] NULL,
	[IP] [nvarchar](50) NULL,
	[NewsOffTime] [datetime] NULL,
	[Tag] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsClass]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsClass](
	[NewsClassNum] [bigint] IDENTITY(1,1) NOT NULL,
	[NewsClassSort] [bigint] NULL,
	[NewsClassId] [nvarchar](50) NULL,
	[NewsClassName] [nvarchar](50) NULL,
	[NewsClassLevel] [bigint] NULL,
	[NewsClassPre] [bigint] NULL,
	[NewsClassPublish] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [bigint] NULL,
	[EditTime] [datetime] NULL,
	[Editor] [bigint] NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_NewsClass] PRIMARY KEY CLUSTERED 
(
	[NewsClassNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[ShippingAddress] [nvarchar](max) NOT NULL,
	[TotalAmount] [bigint] NOT NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Quantity] [bigint] NOT NULL,
	[Price] [bigint] NOT NULL,
	[Discount] [bigint] NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductNum] [bigint] IDENTITY(1,1) NOT NULL,
	[Lang] [nvarchar](50) NULL,
	[ProductClass] [bigint] NOT NULL,
	[ProductSort] [bigint] NULL,
	[ProductDepartment] [nvarchar](max) NULL,
	[ProductId] [nvarchar](max) NULL,
	[ProductTitle] [nvarchar](max) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductContxt] [nvarchar](max) NULL,
	[ProductImg1] [nvarchar](max) NULL,
	[ProductImgUrl] [nvarchar](max) NULL,
	[ProductImgAlt] [nvarchar](max) NULL,
	[ProductImgList] [nvarchar](max) NULL,
	[ProductImgListAlt] [nvarchar](max) NULL,
	[ProductVideo1] [nvarchar](max) NULL,
	[ProductPrice] [bigint] NOT NULL,
	[ProductPublish] [bit] NULL,
	[ProductPutTime] [datetime] NULL,
	[CreateTime] [datetime] NOT NULL,
	[Creator] [bigint] NULL,
	[EditTime] [datetime] NULL,
	[Editor] [bigint] NULL,
	[IP] [nvarchar](max) NULL,
	[ProductOffTime] [datetime] NULL,
	[Tag] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Product_1] PRIMARY KEY CLUSTERED 
(
	[ProductNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductClass]    Script Date: 2024/4/23 下午 11:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductClass](
	[ProductClassNum] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductClassSort] [bigint] NULL,
	[ProductClassId] [nvarchar](50) NULL,
	[ProductClassName] [nvarchar](50) NULL,
	[ProductClassLevel] [bigint] NULL,
	[ProductClassPre] [bigint] NULL,
	[ProductClassPublish] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [bigint] NULL,
	[EditTime] [datetime] NULL,
	[Editor] [bigint] NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductClassNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminNum], [GroupNum], [AdminAcc], [AdminPwd], [AdminName], [AdminPublish], [LastLogin], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (1, 1, N'Admin', N'123456', N'admin', 1, CAST(N'2024-04-23T04:29:21.000' AS DateTime), CAST(N'2011-03-23T11:12:00.000' AS DateTime), 1, CAST(N'2024-02-17T14:16:19.000' AS DateTime), 3, N'192.168.0.211')
INSERT [dbo].[Admin] ([AdminNum], [GroupNum], [AdminAcc], [AdminPwd], [AdminName], [AdminPublish], [LastLogin], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (3, 1, N'Ａlex', N'123456', N'蔡宇庭', 1, CAST(N'2024-02-17T14:15:59.000' AS DateTime), CAST(N'2023-04-11T17:29:03.000' AS DateTime), 1, CAST(N'2023-04-17T02:16:36.000' AS DateTime), 1, NULL)
INSERT [dbo].[Admin] ([AdminNum], [GroupNum], [AdminAcc], [AdminPwd], [AdminName], [AdminPublish], [LastLogin], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (4, 1, N'Oli', N'123456', N'謝昱孝', 1, CAST(N'2023-04-17T02:20:20.000' AS DateTime), CAST(N'2023-04-11T17:31:58.000' AS DateTime), 1, CAST(N'2023-06-08T00:52:02.000' AS DateTime), 1, NULL)
INSERT [dbo].[Admin] ([AdminNum], [GroupNum], [AdminAcc], [AdminPwd], [AdminName], [AdminPublish], [LastLogin], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (5, 1, N'Wayne', N'123456', N'林恆隆', 1, CAST(N'2023-06-08T15:39:19.000' AS DateTime), CAST(N'2023-04-17T02:15:56.000' AS DateTime), 1, CAST(N'2023-06-08T00:51:50.000' AS DateTime), 1, NULL)
INSERT [dbo].[Admin] ([AdminNum], [GroupNum], [AdminAcc], [AdminPwd], [AdminName], [AdminPublish], [LastLogin], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (6, 2, N'DingDing', N'123456', N'丁靖瑜', 0, CAST(N'2023-05-10T18:29:23.000' AS DateTime), CAST(N'2023-04-17T11:26:33.000' AS DateTime), 1, CAST(N'2023-04-17T11:59:42.000' AS DateTime), 1, NULL)
INSERT [dbo].[Admin] ([AdminNum], [GroupNum], [AdminAcc], [AdminPwd], [AdminName], [AdminPublish], [LastLogin], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (8, 1, N'shiun', N'12345', N'shiun', 1, NULL, CAST(N'2023-05-05T01:50:40.000' AS DateTime), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[AdminGroup] ON 

INSERT [dbo].[AdminGroup] ([GroupNum], [GroupName], [GroupInfo], [GroupPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (1, N'系統管理者', N'最高管理員', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, NULL, 1, N'192.168.1.34')
INSERT [dbo].[AdminGroup] ([GroupNum], [GroupName], [GroupInfo], [GroupPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (2, N'一般管理者', N'一般功能管理', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-06-08T01:04:11.000' AS DateTime), 1, N'192.168.1.26')
SET IDENTITY_INSERT [dbo].[AdminGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[AdminRole] ON 

INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (1, 1, 1, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (2, 1, 2, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (3, 1, 3, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (4, 1, 4, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (5, 1, 5, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (6, 1, 6, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (7, 1, 7, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (8, 1, 8, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (9, 1, 9, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (10, 1, 10, N'C,R,,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (11, 1, 11, N'C,R,U,D', CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (37, 2, 4, N'D', CAST(N'2023-02-07T18:02:17.000' AS DateTime), 1, N'192.168.1.26')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (38, 2, 5, N'C,R,U,D', CAST(N'2023-02-07T18:02:17.000' AS DateTime), 1, N'192.168.1.26')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (39, 2, 6, N'C,R,U,D', CAST(N'2023-02-07T18:02:17.000' AS DateTime), 1, N'192.168.1.26')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (40, 2, 7, N'C,R,U,D', CAST(N'2023-02-07T18:02:17.000' AS DateTime), 1, N'192.168.1.26')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (41, 2, 8, N'C,R,U,D', CAST(N'2023-02-07T18:02:17.000' AS DateTime), 1, N'192.168.1.26')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (42, 2, 11, N'C,R,U,D', CAST(N'2023-02-07T18:02:17.000' AS DateTime), 1, N'192.168.1.26')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (43, 2, 1, N'R', CAST(N'2023-02-08T09:50:22.000' AS DateTime), 1, N'192.168.1.26')
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (44, 5, 1, N'C,R,U,D', CAST(N'2023-05-04T01:35:58.000' AS DateTime), 1, NULL)
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (45, 5, 2, N'C,R,U,D', CAST(N'2023-05-04T01:36:24.000' AS DateTime), 1, NULL)
INSERT [dbo].[AdminRole] ([RoleNum], [GroupNum], [MenuSubNum], [Role], [CreateTime], [Creator], [IP]) VALUES (46, 1, 12, N'C,R,U,D', CAST(N'2023-06-05T14:36:37.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[AdminRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerNum], [Lang], [ProductClass], [BannerSort], [BannerTitle], [BannerDescription], [BannerContxt], [BannerImg1], [BannerImgUrl], [BannerImgAlt], [BannerPublish], [BannerPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [BannerOffTime]) VALUES (7, NULL, NULL, NULL, N'打造個人化數位生活', N'提供多元化的數位產品和服務，讓您定制並享受獨特的數位生活體驗。', N'<p>提供多元化的數位產品和服務，讓您定制並享受獨特的數位生活體驗。</p>
', N'2023_05_09_02_24_32_3953.jpg', NULL, NULL, 1, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T02:33:23.000' AS DateTime), 1, CAST(N'2023-09-07T20:55:06.000' AS DateTime), 1, NULL, CAST(N'2025-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Banner] ([BannerNum], [Lang], [ProductClass], [BannerSort], [BannerTitle], [BannerDescription], [BannerContxt], [BannerImg1], [BannerImgUrl], [BannerImgAlt], [BannerPublish], [BannerPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [BannerOffTime]) VALUES (10, NULL, NULL, NULL, N'專注品質，追求卓越', N'我們致力於提供優質產品，為您提供卓越的使用體驗和無與倫比的價值。', N'<p>我們致力於提供優質產品，為您提供卓越的使用體驗和無與倫比的價值。</p>
', N'2023_05_09_02_26_35_1307.jpg', NULL, NULL, 1, CAST(N'2023-05-06T00:00:00.000' AS DateTime), CAST(N'2023-05-06T16:54:04.000' AS DateTime), 1, CAST(N'2023-09-07T20:56:04.000' AS DateTime), 1, NULL, CAST(N'2025-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Banner] ([BannerNum], [Lang], [ProductClass], [BannerSort], [BannerTitle], [BannerDescription], [BannerContxt], [BannerImg1], [BannerImgUrl], [BannerImgAlt], [BannerPublish], [BannerPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [BannerOffTime]) VALUES (11, NULL, NULL, NULL, N'結合科技與美學的完美融合', N'將科技和美學融合在一起，創造出令人驚艷的設計和功能結合的產品。', N'<p>將科技和美學融合在一起，創造出令人驚艷的設計和功能結合的產品。</p>
', N'2023_05_09_02_27_11_7518.jpg', NULL, NULL, 1, CAST(N'2023-05-09T00:00:00.000' AS DateTime), CAST(N'2023-05-09T01:59:35.000' AS DateTime), 1, CAST(N'2023-09-07T20:54:11.000' AS DateTime), 1, NULL, CAST(N'2030-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentId], [NewsId], [UserName], [Email], [Message]) VALUES (1, 42, N'Alex', N'yuting0912@gmail.com', N'挖ㄨ~好棒喔')
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuGroup] ON 

INSERT [dbo].[MenuGroup] ([MenuGroupNum], [MenuGroupSort], [MenuGroupId], [MenuGroupName], [MenuGroupIcon], [MenuGroupInfo], [MenuGroupUrl], [MenuGroupPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (1, 1, N'A', N'帳號管理', N'fa fa-user', N'帳號管理', N'#', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuGroup] ([MenuGroupNum], [MenuGroupSort], [MenuGroupId], [MenuGroupName], [MenuGroupIcon], [MenuGroupInfo], [MenuGroupUrl], [MenuGroupPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (2, 2, N'B', N'廣告管理', N'fa fa-photo', N'廣告管理', N'#', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuGroup] ([MenuGroupNum], [MenuGroupSort], [MenuGroupId], [MenuGroupName], [MenuGroupIcon], [MenuGroupInfo], [MenuGroupUrl], [MenuGroupPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (3, 3, N'C', N'消息管理', N'fa fa-newspaper-o', N'消息管理', N'#', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuGroup] ([MenuGroupNum], [MenuGroupSort], [MenuGroupId], [MenuGroupName], [MenuGroupIcon], [MenuGroupInfo], [MenuGroupUrl], [MenuGroupPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (4, 4, N'D', N'產品管理', N'fa fa-gift', N'產品管理', N'#', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuGroup] ([MenuGroupNum], [MenuGroupSort], [MenuGroupId], [MenuGroupName], [MenuGroupIcon], [MenuGroupInfo], [MenuGroupUrl], [MenuGroupPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (5, 5, N'E', N'檔案下載', N'fa fa-mortar-board', N'檔案下載', N'#', 0, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuGroup] ([MenuGroupNum], [MenuGroupSort], [MenuGroupId], [MenuGroupName], [MenuGroupIcon], [MenuGroupInfo], [MenuGroupUrl], [MenuGroupPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (6, 6, N'F', N'聯絡我們', N'fa fa-envelope', N'連絡我們管理', N'#', 0, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuGroup] ([MenuGroupNum], [MenuGroupSort], [MenuGroupId], [MenuGroupName], [MenuGroupIcon], [MenuGroupInfo], [MenuGroupUrl], [MenuGroupPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (7, 7, N'G', N'訂單管理', N'fa fa-envelope', N'訂單管理', N'#', 1, CAST(N'2023-06-05T14:21:24.960' AS DateTime), 1, NULL, NULL, N'192.168.1.34')
SET IDENTITY_INSERT [dbo].[MenuGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuSub] ON 

INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (1, N'A', 0, N'A01', N'帳號設定', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/Admin/Index', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (2, N'A', 0, N'A02', N'群組設定', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/AdminGroup/Index', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (4, N'B', 0, N'B02', N'廣告設定', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/Banner/Index', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (5, N'C', 0, N'C02', N'消息設定', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/News/Index', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (6, N'C', 0, N'C01', N'消息類別', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/NewsClass/Index', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (7, N'D', 0, N'D02', N'產品設定', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/Product/Index', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (8, N'D', 0, N'D01', N'產品類別', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/ProductClass/Index', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (9, N'E', 0, N'E02', N'檔案設定', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/download/Index', 0, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (10, N'E', 0, N'E01', N'檔案類別', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/downloadclass/Index', 0, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (11, N'F', 0, N'F01', N'聯絡我們', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/contact/Index', 0, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
INSERT [dbo].[MenuSub] ([MenuSubNum], [MenuGroupId], [MenuSubSort], [MenuSubId], [MenuSubName], [MenuSubRole], [MenuSubIcon], [MenuSubInfo], [MenuSubUrl], [MenuSubPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (12, N'G', 0, N'G01', N'訂單管理', N'V,L,N,M,D', NULL, NULL, N'/BackEnd/Orders/Index', 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T12:30:00.000' AS DateTime), 1, N'192.168.1.34')
SET IDENTITY_INSERT [dbo].[MenuSub] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (35, NULL, 8, NULL, N'因應美制裁，長江存儲傳不到 1 年燒光 70 億美元，急募資', N'因應美制裁，長江存儲傳不到 1 年燒光 70 億美元，急募資', N'<table>
	<tbody>
		<tr>
			<td>
			<p><a href="https://img.technews.tw/wp-content/uploads/2021/12/21114112/shutterstock_1914386887-624x416.jpg" title="因應美制裁，長江存儲傳不到 1 年燒光 70 億美元，急募資"><img alt="因應美制裁，長江存儲傳不到 1 年燒光 70 億美元，急募資" src="https://img.technews.tw/wp-content/uploads/2021/12/21114112/shutterstock_1914386887-624x416.jpg" style="height:416px; width:624px" /></a></p>

			<p><br />
			&nbsp;</p>

			<p>中國最大 NAND 型快閃記憶體製造商長江存儲（YMTC）2022 年 12 月遭華盛頓列入貿易黑名單、不得採購美國設備生產晶片。為了適應美國嚴厲管制，傳出長江存儲先前募集的 70 億美元幾已消耗殆盡，隨著手上現金見底，該公司決定大舉募資。</p>

			<p>英國金融時報11月1日引述未具名消息人士<a href="https://www.ft.com/content/4dcaaf91-d77f-4c70-97bf-69ba6a4e94f9">報導</a>，長江存儲最新一輪的募資金額已超越目標。目前無法確認確切數字，但募資額應有數十億美元之譜。</p>

			<p>長江存儲去年獲得股東增資50億人民幣（相當於70億美元），其股東包括國家大基金（China Integrated Circuit Industry Investment Fund）。報導引述兩名消息人士指出，置換設備、研發新元件及核心晶片製造設備，已消耗掉長江存儲手上多數現金，讓該公司時隔不到一年，就得再次募資。</p>

			<p>其他消息人士則透露，長江存儲這一輪的募資案，獲得國內投資人超額認購。華盛頓10月祭出最新出口禁令前，長江存儲就已結束募資，投資人力挺顯示中國內部團結面對美國制裁。</p>

			<p>兩名公司投資人表示，長江存儲打算加碼向中國供應商採購，無法輕易替代的設備則會詢問一些日本、南韓及歐洲廠商能否供應，假使行不通，長江存儲會與供應商一同投入開發工作。</p>

			<p>（本文由&nbsp;<a href="https://www.moneydj.com//kmdj/news/newsviewer.aspx?a=db7bdd7f-5f94-4d67-a2a7-ef75af805497">MoneyDJ新聞</a>&nbsp;授權轉載；首圖來源：shutterstock）</p>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>
', N'shutterstock_1914386887-624x416.jpg', NULL, NULL, 1, 0, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-02T20:01:33.000' AS DateTime), 1, CAST(N'2023-11-02T20:01:58.000' AS DateTime), 1, NULL, CAST(N'2030-12-31T00:00:00.000' AS DateTime), N'晶片,記憶體')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (36, NULL, 8, NULL, N'2024 年是 AI PC 元年！義隆電葉儀皓：Arm PC 後年將明顯成長', N' 2024 年是 AI PC 元年！義隆電葉儀皓：Arm PC 後年將明顯成長', N'<p><a href="https://img.technews.tw/wp-content/uploads/2022/03/18130319/S__87253058-624x468.jpg" title="2024 年是 AI PC 元年！義隆電葉儀皓：Arm PC 後年將明顯成長"><img alt="2024 年是 AI PC 元年！義隆電葉儀皓：Arm PC 後年將明顯成長" src="https://img.technews.tw/wp-content/uploads/2022/03/18130319/S__87253058-624x468.jpg" style="height:468px; width:624px" /></a></p>

<p><br />
&nbsp;</p>

<p>義隆電今日舉辦法說會，董事長葉儀皓表示，2024 年是 AI PC 元年，吸引晶片業者打進處理器市場，有利義隆電發揮人機介面優勢，其中 ARM PC 因為明年是第一年，滲透率不會很高，但預計 2025 年開始會有顯著成長。</p>

<p>&nbsp;</p>

<p>義隆電第三季營收 35.01 億元，季增 15%，年增 24.2%；稅後淨利 7.59 億元，季增 68.3%，年增 55.5%；毛利率 47.2%，季增 3.1 個百分點，年增 0.7 個百分點；營業利益率為 26.7%，季增 8.2 個百分點，年增 7.8 個百分點；每股稅後淨利（EPS） 2.69 元。</p>

<p>義隆電第三季產品營收占比，觸控板占 48%、觸控螢幕占 15%、指紋辨識占 15%、指向裝置占 10%、MCU 占 6%、其他占 6%，義隆電累計前三季營收 89.48 億元，年減 19.14%，每股稅後淨利（EPS）5.51 元。</p>

<p>義隆電指出，第三季營收優於預期，包括常態性訂單與急單貢獻，庫存自 2022 年第三季庫存開始去化至今，預估年底就將恢復正常水位，明年第一季將回歸產業季節性模式，目前看第四季仍會有急單，但是較前兩季少，預估營收落在 29~31 億元，季減 11.5~17.17%，毛利率落在 46~48%。</p>

<p>針對 AI PC，葉儀皓表示，2024 年會是 AI PC 元年，目前各家科技大廠都已積極投入，義隆電具有人機介面優勢，確實有相關案子正在進行中，但 Arm PC 只是第一年，滲透率不會很高，預計要到 2025 年會有比較明顯的成長。</p>

<p>葉儀皓強調AI PC 分成兩種雲端運算和邊緣運算兩種，雲端運算的 AI PC 比例約 20~30%，義隆電就是在自家晶片加進 AI 算力，至於邊緣運算的&nbsp;&nbsp;AI PC 比例較低，但未來 CPU 會有 AI 的算力，義隆電加進 CPU 的算力。</p>

<p>（首圖來源：科技新報）</p>
', N'S__87253058-624x468.jpg', NULL, NULL, 1, 0, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-02T20:03:07.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2030-12-31T00:00:00.000' AS DateTime), N'AI,人工智慧,IC設計,半導體')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (37, NULL, 8, NULL, N'2 奈米以下競爭白熱化！一次看完台積電、三星、英特爾先進製程進度', N'2 奈米以下競爭白熱化！一次看完台積電、三星、英特爾先進製程進度', N'<p><a href="https://img.technews.tw/wp-content/uploads/2023/10/19180532/waferc007_2534_x7mZ_0-800x640.jpg" title="2 奈米以下競爭白熱化！一次看完台積電、三星、英特爾先進製程進度"><img alt="2 奈米以下競爭白熱化！一次看完台積電、三星、英特爾先進製程進度" src="https://img.technews.tw/wp-content/uploads/2023/10/19180532/waferc007_2534_x7mZ_0-800x640.jpg" style="height:640px; width:800px" /></a></p>

<p>三星代工副總裁 Jeong Gi-Tae 近日接受媒體採訪時透露，即將推出的 SF1.4（1.4奈米級）製程，預期 2027 年量產，加速開發 2.5D / 3D 整合異質結構封裝，使三大晶圓代工巨頭的先進製程競爭變得更加白熱化。</p>

<h3><strong>台積電：N3P 製程優於 Intel 18A，N2&nbsp;將是業界最先進製程</strong></h3>

<p>半導體產業先前傳出，由於遇到尚未曝光的問題，台積電和三星的 3 奈米良率都難超過 60%，其中台積電良率僅 55%，距離正常良率仍有一段距離。不過台積電總裁魏哲家認為，目前看 N3 需求比三個月前來得好，有助台積 2024 年健康成長。</p>

<p>&nbsp;</p>

<p><a href="https://img.technews.tw/wp-content/uploads/2023/11/02171817/Zoe%E8%A3%BD%E5%9C%962.jpg" title=""><img alt="" src="https://img.technews.tw/wp-content/uploads/2023/11/02171817/Zoe%E8%A3%BD%E5%9C%962.jpg" /></a></p>

<p>他也預期，2023 年台積電 3 奈米將貢獻全年晶圓營收的中個位數（mid-single digit，即 4%-6%）百分比。</p>

<p>此外，針對競爭對手的 18A 製程，魏哲家認為自家 N3P 製程的 PPA，在成本和技術成熟度更好，至於接下來的 N2 製程技術，推出時將會是業界最先進的製程。</p>

<p><a href="https://img.technews.tw/wp-content/uploads/2023/05/12081441/TSMC_Roadmap.png" title=""><img alt="" src="https://img.technews.tw/wp-content/uploads/2023/05/12081441/TSMC_Roadmap.png" /></a></p>

<h3><strong>英特爾：18A 製程爭取第四間客戶代工訂單</strong></h3>

<p>英特爾執行長 Pat Gelsinger 透露，18A 已取得三家客戶代工訂單，希望年底前爭取到第四位客戶，先進製程 18A 計畫於 2024 年底開始生產，其中一位客戶已先付款，外界預期可能是輝達或高通。</p>

<p>&nbsp;</p>

<p><a href="https://img.technews.tw/wp-content/uploads/2023/11/02171819/Zoe%E8%A3%BD%E5%9C%963.jpg" title=""><img alt="" src="https://img.technews.tw/wp-content/uploads/2023/11/02171819/Zoe%E8%A3%BD%E5%9C%963.jpg" /></a></p>

<p>英特爾指出，Intel 4 與 Intel 3 製程相近，Intel 20A 與 Intel 18A 製程也較為相近，因此會主打 Intel 3 與 Intel 18A 給晶圓代工客戶，而 Intel 4、Intel 20A 較可能由內部自行使用，如果客戶想要採用後兩者製程方案，英特爾也不會拒絕。</p>

<p><a href="https://img.technews.tw/wp-content/uploads/2023/08/22192009/intel.jpg" title=""><img alt="" src="https://img.technews.tw/wp-content/uploads/2023/08/22192009/intel.jpg" /></a></p>

<p>&nbsp;</p>

<h3><strong>三星：2025 年先開始量產 SF2，優先用於三星自家產品</strong></h3>

<p>由於三奈米製程良率陷入瓶頸，有消息傳出，三星打算直接轉向更先進的 2 奈米。根據三星代工論壇（SFF）計畫，2025 年先開始量產 2 奈米製程（SF2），用於行動領域；2026 年擴展到高效能運算（HPC）應用，2027 年再擴展至汽車領域。</p>

<p>此外，三星也跟英特爾一樣會先代工自家產品，2 奈米製程產品會先用於三星產品，而非外部客戶產品。</p>

<p><a href="https://img.technews.tw/wp-content/uploads/2023/11/02174011/zoe%E8%A3%BD%E5%9C%964.jpg" title=""><img alt="" src="https://img.technews.tw/wp-content/uploads/2023/11/02174011/zoe%E8%A3%BD%E5%9C%964.jpg" /></a></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><a href="https://img.technews.tw/wp-content/uploads/2023/11/02173040/Samsung_3nm_Plan.jpeg" title=""><img alt="" src="https://img.technews.tw/wp-content/uploads/2023/11/02173040/Samsung_3nm_Plan.jpeg" /></a></p>

<p>整體來說，現階段雖以台積電 N3 家族較為全面，N3E、N3X、N3P 等製程系列較占上風，但到 2 奈米可能增加變數，因為是採用全新 GAAFET 架構，但不管台積電 N2、Intel 18A 和三星 SF2，都有其競爭力，也期待未來先進製程的發展。</p>

<p>（首圖來源：<a href="https://pr.tsmc.com/chinese/gallery-fabs-inside">台積電</a>）</p>
', N'waferc007_2534_x7mZ_0-800x640.jpg', NULL, NULL, 1, 0, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-02T20:04:58.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2030-12-31T00:00:00.000' AS DateTime), N'半導體,晶圓 ,晶片')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (38, NULL, 8, NULL, N'蘇姿丰信心滿滿，指 MI300 將成 AMD 史上最快銷售 10 億美元產品', N' 蘇姿丰信心滿滿，指 MI300 將成 AMD 史上最快銷售 10 億美元產品', N'<p><a href="https://img.technews.tw/wp-content/uploads/2023/07/17150152/AMD-LISA-800x533.jpg" title="蘇姿丰信心滿滿，指 MI300 將成 AMD 史上最快銷售 10 億美元產品"><img alt="蘇姿丰信心滿滿，指 MI300 將成 AMD 史上最快銷售 10 億美元產品" src="https://img.technews.tw/wp-content/uploads/2023/07/17150152/AMD-LISA-800x533.jpg" style="height:533px; width:800px" /></a></p>

<p><br />
&nbsp;</p>

<p>多年來，AMD 一直試圖從 NVIDIA 手中奪取資料中心 GPU 市場的占比，不過，AMD 始終沒有獲得太大成功，很大程度上是因為對其 Instinct GPU 的軟體支援不佳所造成。然而，目前看起來情況正在好轉當中，因為該公司終於有了突破性的產品。至少，AMD 執行長蘇姿丰相信，即將推出的 Instinct MI300 系列資料中心 GPU 將是該公司最快達到營收 10 億美元的產品。</p>

<p>&nbsp;</p>

<p>AMD 執行長蘇姿丰在該公司財報會議上表示，我們現在預計第四季資料中心 GPU 的營收上達到約 4 億美元的水準。隨著全年營收的成長，預計到 2024 年將超過2 0 億美元。其中，這一成長將使 MI300 成為 AMD 歷史上最快達到 10 億美元銷售金額的產品。</p>

<p>AMD 的 Instinct MI300 系列有望比其前一代產品更為成功，主要是因為該系列產品不僅適用於超級電腦和特定資料中心，還因為這些處理器的效能和軟體功能具有競爭力，因此適用於計劃進行人工智慧訓練和推理的雲端服務供應商當中。</p>

<p>事實上，AMD 已經向美國勞倫斯利弗莫爾國家實驗室 (LLNL) 的 El Capitan 超級電腦提供 Instinct MI300A 加速處理單元。據了解，這是首批效能超過 2 ExaFLOPS 的電腦之一。而 AMD 提供的 Instinct MI300A 採用多晶片設計，具有三個八核心的 Zen 4 小晶片，以及多個 CDNA3 小晶片，適用於人工智慧 (AI) 和高效能運算 (HPC) 等工作執行上。</p>

<p><a href="https://img.technews.tw/wp-content/uploads/2023/06/14031441/DSC_0139-e1686683700792.jpg" title=""><img alt="" src="https://img.technews.tw/wp-content/uploads/2023/06/14031441/DSC_0139-e1686683700792.jpg" /></a></p>

<p>而在未來幾週當中，AMD 還計劃開始向雲端服務供應商出貨其 Instinct MI300X 處理器。與 MI300A 不同，AMD 的 MI300X 僅使用 CDNA3 架構的小晶片來達成 AI 和 HPC 工作執行，其作用類似於典型的計算 GPU。</p>

<p>對此，蘇姿丰表示，Instinct MI300A 於本月初開始量產，以支援 El Capitan Exascale 超級電腦。另外，還預計在未來幾週內開始量產 Instinct MI300X GPU 加速器，以領先提供給雲端運算和 OEM 客戶。</p>

<p>AMD 方面強調，AMD Instinct MI300A 和 MI300X 加速器的開發和驗證正在按計畫進行，目前性能已經達到或超過了公司的內部預期。就軟體而言，AMD 擴大了其人工智慧軟體生態系統，並於上一季當中在增強其 ROCm 平台的效能和功能方面獲得重大突破。此外，ROCm 已融入主流 PyTorch 和 TensorFlow 生態系統當中。而 Hugging Face 型號現已持續更新和驗證，可在一般 AMD 硬體，尤其是 Instinct 加速器上執行。</p>

<p>(首圖來源：科技新報攝)</p>
', N'AMD-LISA-800x533.jpg', NULL, NULL, 1, 0, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-02T20:05:47.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2030-12-31T00:00:00.000' AS DateTime), N'AI人工智慧,IC設計,半導體')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (39, NULL, 9, NULL, N'無法破解的量子加密通訊防駭強度提升，新量子衛星鎖定中高軌道', N' 無法破解的量子加密通訊防駭強度提升，中國新量子衛星鎖定中高軌道', N'<p><a href="https://img.technews.tw/wp-content/uploads/2023/11/02152355/quantum-satellite-data-communication-800x533.jpg" title="無法破解的量子加密通訊防駭強度提升，中國新量子衛星鎖定中高軌道"><img alt="無法破解的量子加密通訊防駭強度提升，中國新量子衛星鎖定中高軌道" src="https://img.technews.tw/wp-content/uploads/2023/11/02152355/quantum-satellite-data-communication-800x533.jpg" style="height:533px; width:800px" /></a></p>

<p><br />
&nbsp;</p>

<p>中國在 2016 年發射世界首顆量子科學實驗衛星「墨子號」，於該領域率先取得重大成就，此後幾年更悄悄開展後續任務，該國下顆量子衛星預計發射至中、高地軌道，大幅提升量子加密通訊強度，所需技術也變得更具挑戰性。</p>

<p>&nbsp;</p>

<p>2016 年 8 月 16 日，中國在中國科學院太空科學先導專案一期支持下，發射該國完全自主研發的世界首顆量子科學實驗衛星「墨子號」至低地軌道，率先開展一系列太空量子科學實驗，並首次實現洲際量子密鑰傳輸：2017 年成功將金鑰分別發送至中國德令哈、南山地面站，兩者相距約 1,200 公里；2018 年進一步成功將金鑰分別發送至中國、奧地利地面站，兩者相距 7,600 公里。</p>

<p>當時，美國甚至還沒有可運作的量子密鑰分發（quantum key distribution，QKD）衛星系統，墨子號成功後，歐美國家迅速跟進強化太空量子科學、乃至整個量子資訊領域佈局。</p>

<p>過去 7、8 年國際上提出許多量子科學探測衛星計畫，但到目前為止，無論小型或單向量子實驗，仍還沒有全面進行量子通訊測試的衛星。</p>

<p>中國也沒有因此滿足，今年 10 月 15 日，中國科學院院士王建宇在第三屆中國太空科學大會上說：「低軌量子金鑰衛星網路、中高軌道量子科學實驗平台是未來主要發展方向。」</p>

<p>低地軌道上，該國打算組建由多顆奈米量子衛星構成的低軌量子金鑰衛星網路，提供保密通訊和金鑰分發服務。</p>

<p><a href="https://img.technews.tw/wp-content/uploads/2023/11/02152520/security-data.jpg" title=""><img alt="" src="https://img.technews.tw/wp-content/uploads/2023/11/02152520/security-data.jpg" /></a></p>

<p><strong>▲ 中國打算組建由多顆奈米量子衛星構成的低軌量子金鑰衛星網路。（Source：<a href="https://pixabay.com/zh/illustrations/security-secure-locked-technology-2168233/">pixabay</a>）</strong></p>

<p>該國也在籌備新的量子衛星，希望建立包含衛星系統、科學應用系統、地面支撐系統、運載系統、發射場系統、測控系統的中高軌量子衛星工程系統，目標將 QKD 通訊從低地軌道提升至中高軌道。</p>

<p>中高軌量子科學實驗衛星比墨子號複雜得多，中國科學家必須在更長距離上準確傳輸量子密鑰，這也代表他們必須具備更多關鍵技術能力，比如星地光路對準、星載量子光源、系統偏振保持、近衍射極限量子發射、微振動抑制技術等。</p>

<p>王建宇表示，中高軌量子科學實驗衛星目標進行全天時量子通訊實驗，與經典通訊網路實現無縫銜接，為量子通訊應用奠定基礎；還會進行地球尺度量子力學完備性檢驗，探討重力場的量子效應檢驗、重力紅移測量等新方法。</p>

<p>量子密鑰分發、量子金鑰加密技術採用量子纏結原理，將在未來形成通訊流無法被破解的局面，還可絕對檢測是否有第三方在傳輸過程截獲消息，雖然某種程度上訊號仍可被高明手法封鎖。</p>

<p>目前中國已不是唯一投入量子衛星領域的國家，歐洲太空總署去年宣布正在準備發射一顆展示量子密鑰分發技術的衛星，稱為 Eagle-1。</p>

<ul>
	<li><a href="https://www.tomshardware.com/tech-industry/quantum-computing/chinas-quantum-satellite-program-designed-to-transmit-unhackable-information">China&rsquo;s Quantum Satellite Program Designed to Transmit Unhackable Information</a></li>
	<li><a href="https://www.space.com/china-quantum-communications-satellite-higher-orbit-plans">China plans to take &lsquo;hack-proof&rsquo; quantum satellite technology to new heights</a></li>
</ul>

<p>（首圖來源：<a href="https://pixabay.com/zh/illustrations/globe-space-galaxy-data-technology-6858907/">pixabay</a>）</p>
', N'quantum-satellite-data-communication-800x533.jpg', NULL, NULL, 1, 0, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-02T20:16:09.000' AS DateTime), 1, CAST(N'2023-11-02T20:16:35.000' AS DateTime), 1, NULL, CAST(N'2030-12-31T00:00:00.000' AS DateTime), N'低軌衛星,尖端科技,航太科技')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (41, NULL, 9, NULL, N'台灣太空國際年會！鐳洋布局地＋空推出「高性能通訊天線模組」', N'台灣太空國際年會登場！鐳洋布局地＋空推出「高性能通訊天線模組」', N'<p><a href="https://img.technews.tw/wp-content/uploads/2023/10/30120250/948503-800x600.jpg" title="台灣太空國際年會登場！鐳洋布局地＋空推出「高性能通訊天線模組」"><img alt="台灣太空國際年會登場！鐳洋布局地＋空推出「高性能通訊天線模組」" src="https://img.technews.tw/wp-content/uploads/2023/10/30120250/948503-800x600.jpg" style="width:100%"/></a></p>

<p><br />
&nbsp;</p>

<p>台灣太空國際年會（TASTI）今日在台北南港展覽二館首度登場，鐳洋科技創辦人王奕翔指出，因應次世代衛星通訊發展，鐳洋推出高性能通訊天線模組，整合地面端與太空端所有客戶需求，迎接衛星通訊新時代。</p>

<p>&nbsp;</p>

<p>為打造太空發展整合平台，國科會責成國家太空中心（TASA）整合台灣太空產業發展協會（TSIDA）、台灣低軌衛星產業聯誼會（TLEOSIA）、台灣太空科學聯盟（TSU）等重要產官學研組織，共同舉辦為期一週的台灣太空國際年會（TASTI），預計參與人數將達 1,500 人。</p>

<p>年會規劃多種型態的交流活動，包含產業攤位、學術論文海報、產業論壇、國際研討會等，國家太空中心表示，期望透過系列活動凝聚台灣太空能量，讓太空年會不僅成為台灣太空領域最大規模的國際展會，更能吸引國際廠商來台訪問，為台灣低軌衛星產業鏈帶來更多商機。</p>

<p>國家太空中心為提升國內產業界衛星設計製造能力，促進衛星新創公司搶進國際衛星產業鏈，而在第三期國家太空科技發展長程計畫中，國科會交付國家太空中心執行「新創追星計畫」，推動國內衛星產業發展立方衛星星系計畫。</p>

<p>「新創追星計畫」自今年 8 月公開招標，分別由芳興科技、創未來科技、鐳洋科技三家廠商得標，並將分別研製 4 枚 6U 以上的立方衛星形成星系，預計透過 12 枚立方衛星，初步部署台灣衛星星系，其中「通訊 IoT 物聯網立方衛星」將由鐳洋執行。</p>

<p>今年 5 月獲佳世達投資的鐳洋科技，已在今年 8 月登錄戰略新板興櫃，王奕翔指出，鐳洋去年設立先進射頻研發中心「次世代天線實驗室」，今年初與中央大學共同成立「立方衛星整測實驗室」，搭配自動化陣列天線校正演算法，成為業界唯一在低軌衛星地面接收站、陣列天線、通訊籌載系統上，提供最完整方案的服務商。</p>

<p>鐳洋今年同時取得國家太空中心「3U 通訊立方衛星研發製造案」及「通訊 IoT 物聯網立方衛星（6U）星系研製」兩案，有望在與國家太空中心及中央大學的共同努力，今年底達成台灣自製立方衛星的願景，並在明年陸續發射到太空執行通訊 IoT 物聯網任務。</p>

<p>國立中央大學指出，過去一顆完整衛星總計需幾十億元台幣，6U 立方衛星考慮人力後只需要 2,000 萬元，發射費用 800~900 萬元，類似於 SpaceX 量產型的火箭的價格，成本優勢可望帶動立方衛星應用與需求。</p>

<p>國科會積極推動太空研發補助與投資抵減等，加速低軌衛星地面通訊設備產業發展，力拚地面設備產值在 2025 年增加 800 億元，衝上 3,000 億元大關，國家太空中心表示，看好整體太空科技，包括衛星製造、發射服務、地面設備、應用服務產值將在 2029 年衝上兆元，成為新兆元產業。</p>

<p>（首圖來源：鐳洋科技）</p>
', N'948503-800x600.jpg', NULL, NULL, 1, 0, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-02T20:22:04.000' AS DateTime), 1, CAST(N'2023-11-03T20:35:13.000' AS DateTime), 1, NULL, CAST(N'2030-12-31T00:00:00.000' AS DateTime), N'低軌衛星,公司治理,航太科技')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (42, NULL, 9, NULL, N'首屆台灣太空國際年會，蔡總統：產業投資加碼超過 400 億元', N'首屆台灣太空國際年會，蔡總統：產業投資加碼超過 400 億元 ......', N'<p>台灣首顆自製氣象衛星「獵風者」於本月成功升空，航太產業再跨一大步，而今（30）日台灣於太空領域最大規模的國際盛事「台灣太空國際年會」也盛大展開，來自超過 15 個國家專家學者與會，蔡英文總統於開幕致詞表示台灣有能力進軍全球太空產業，為跟上最尖端技術，政府更加碼超過 400億元投入低軌通訊衛星研製、國家發射場規劃、人才培育。</p>

<p>首屆台灣太空國際年會（Taiwan international Assembly of Space Science, Technology, and Industry，TASTI）10 月 30 日於南港展覽館二館 7 樓展開，議題包含衛星製造、發射服務、地面設備、應用服務等 4 大目標市場，都是目前台灣發展太空領域重點項目，國科會將全力支持推動。</p>

<p>蔡英文總統、國科會吳政忠主委、國家太空中心（TASA）主任吳宗信等均蒞臨大會，蔡總統開幕致詞表示，「獵風者衛星」已證明台灣不僅有半導體、精密製造優勢，更有能力進軍全球太空產業。</p>

<p>2017年，台灣首顆自製光學遙測衛星「福衛五號」升空，標誌台灣有自主研發太空衛星能力；2019 年，「福衛七號」6 枚衛星升空，展現台灣太空科技。今年獵風者衛星升空，則讓世界看見台灣具備大型科研系統運作能力。</p>

<p>蔡總統指出，「太空三期計畫」自 2019 年開始，10 年內投入 251 億經費，更加碼逾 400 億元投入低軌通訊衛星研製、國家發射場規劃、人才培育等，而太空科技產業也納入「六大核心戰略產業」，持續強化接軌國際最先進研究和技術。</p>

<p>目前太空產業相關產值超過 2,000 億元，預計到 2025 年增加至少 800 億元達 3,000 億元，相當 100 億美元。</p>

<p>TASTI 活動會場還展示國家太空中心研發成果，包括 10 月初剛升空的獵風者衛星模型、1:2 入軌火箭模型、衛星關鍵元件等。</p>

<p>（首圖來源：國家太空中心提供）</p>
', N'tasti-800x493.jpg', NULL, NULL, 1, 0, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-02T20:37:33.000' AS DateTime), 1, CAST(N'2023-11-02T20:55:25.000' AS DateTime), 1, NULL, CAST(N'2030-12-31T00:00:00.000' AS DateTime), N'低軌衛星,科技政策,航太科技')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[NewsClass] ON 

INSERT [dbo].[NewsClass] ([NewsClassNum], [NewsClassSort], [NewsClassId], [NewsClassName], [NewsClassLevel], [NewsClassPre], [NewsClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (8, 1, NULL, N'半導體', NULL, NULL, 1, CAST(N'2023-11-02T19:59:59.000' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[NewsClass] ([NewsClassNum], [NewsClassSort], [NewsClassId], [NewsClassName], [NewsClassLevel], [NewsClassPre], [NewsClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (9, 2, NULL, N'低軌衛星', NULL, NULL, 1, CAST(N'2023-11-02T20:14:47.000' AS DateTime), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NewsClass] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CustomerName], [Email], [OrderDate], [PaymentMethod], [ShippingAddress], [TotalAmount], [OrderStatus]) VALUES (4, N'蔡宇庭', N'yuting09120310@gmail.com', CAST(N'2023-06-08' AS Date), N'貨到付款', N'新北市板橋區漢生東路193巷', 82470, N'已出貨')
INSERT [dbo].[Order] ([OrderID], [CustomerName], [Email], [OrderDate], [PaymentMethod], [ShippingAddress], [TotalAmount], [OrderStatus]) VALUES (6, N'蔡宇庭', N'yuting09120310@gmail.com', CAST(N'2023-09-02' AS Date), N'貨到付款', N'新北市板橋區漢生東路193巷', 161350, N'確認中')
INSERT [dbo].[Order] ([OrderID], [CustomerName], [Email], [OrderDate], [PaymentMethod], [ShippingAddress], [TotalAmount], [OrderStatus]) VALUES (7, N'呂仁傑', N'gfzch150@gmail.com', CAST(N'2023-09-08' AS Date), N'貨到付款', N'歐比斯', 69566, N'確認中')
INSERT [dbo].[Order] ([OrderID], [CustomerName], [Email], [OrderDate], [PaymentMethod], [ShippingAddress], [TotalAmount], [OrderStatus]) VALUES (8, N'簡玉秋', N'yuchiu1107@gmail.com', CAST(N'2023-11-15' AS Date), N'貨到付款', N'新北市板橋區', 201796, N'已出貨')
INSERT [dbo].[Order] ([OrderID], [CustomerName], [Email], [OrderDate], [PaymentMethod], [ShippingAddress], [TotalAmount], [OrderStatus]) VALUES (10004, N'蔡宇庭', N'yuting09120310@gmail.com', CAST(N'2024-03-31' AS Date), N'貨到付款', N'測試', 91600, N'確認中')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (50, 4, 11, 5, 4500, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (51, 4, 10, 3, 19990, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (53, 6, 6, 3, 42090, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (54, 6, 7, 4, 8770, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (55, 7, 8, 4, 6429, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (56, 7, 7, 5, 8770, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (57, 8, 19, 2, 36900, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (58, 8, 16, 4, 31999, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (10050, 10004, 15, 4, 22900, NULL)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (15, NULL, 13, NULL, NULL, NULL, N'ACER Aspire7 A715-76G-506G 12代i5★RTX3050電競筆電', N'i5-12450H ∥ RTX3050 ∥ 512G PCIe', N'<p>規格說明<br />
&nbsp;A715-76G-506G 詳細規格表</p>

<p>型號：A715-76G-506G<br />
作業系統：Windows 11 Home</p>

<p>CPU&nbsp;&nbsp; &nbsp;　&nbsp;&nbsp; &nbsp;　<br />
CPU：Intel&reg; Core&trade; i5-12450H<br />
clock/Turbo：2.0 GHz/4.4 GHz<br />
Cores/Threads：8/12<br />
L3 Cache：12 MB</p>

<p>晶片組：N</p>

<p>LCD　<br />
尺寸/規格：15.6&quot; IPS/霧面/LED背光<br />
解析度：FHD 1920 x 1080<br />
色域：NTSC 45%<br />
亮度：250 nits</p>

<p>顯示晶片：NVIDIA&reg; GeForce RTX&trade; 3050</p>

<p>VRAM：4G-GDDR6</p>

<p>散熱設計<br />
風扇：2<br />
熱導管：3</p>

<p>記憶體<br />
記憶體(實際出貨)：8GB DDR4<br />
記憶體支援容量(總插槽數量/總容量)：2/32GB</p>

<p>Audio&nbsp;&nbsp; &nbsp;　&nbsp;&nbsp; &nbsp;　<br />
Dolby：N　<br />
Acer TrueHarmony：Y<br />
DTS&reg; Audio：N<br />
Acer Purified.Voice：Y<br />
built in speaker：Y<br />
Built-in microphone：Y</p>

<p>鍵盤：白色背光</p>

<p>儲存空間<br />
儲存空間(實際出貨)：512GB NVMe PCIe Gen4 SSD<br />
支援擴充空間(包含已安裝部分)：M.2 SSD *2</p>

<p>光碟機：N</p>

<p>Webcam：HD (1280 x 720) with Temporal Noise Reduction(TNR)</p>

<p>無線網路：Wi-Fi 6(802.11a/b/g/n+ax)<br />
MU-MIMO RX<br />
Dual Band (2.4 GHz/5 GHz)</p>

<p>藍牙：Bluetooth&reg; 5.1</p>

<p>區域網路<br />
RJ-45：Y</p>

<p>Kensington lock slot：Y</p>

<p>尺寸(mm)：362.3 (W) x 237.4 (D) x 19.9 (H) mm</p>

<p>材質：A蓋鋁合金</p>

<p>重量：2.1 kg</p>

<p>電源變壓器：135W</p>

<p>電池：50Wh Li-ion battery</p>

<p>Battery Life：Up to 5.5 hours (MobileMark2018)<br />
Up to 8 hours (video playback)<br />
Up to 8 hours (web browsing)</p>

<p>Input/Output&nbsp;&nbsp; &nbsp;<br />
Card Reader：N<br />
USB Type-C：1 (USB 3.2 Gen 2)(DisplayPort)(Thunderbolt 4)(DC-in 20 V; 65 W)<br />
Type-C 支援影像傳輸：Y<br />
USB Type-A：3(USB 3.2 Gen 1)<br />
HDMI：Y(HDMI 2.0)<br />
External display (VGA) port：N<br />
DisPlay Port：N<br />
可外接螢幕數量：2<br />
耳機/喇叭輸出：Y(與耳機/喇叭輸出共用jack)<br />
麥克風輸入：Y(與耳機/喇叭輸出共用jack)</p>

<p>安全&nbsp;&nbsp; &nbsp;<br />
指紋辨識：Y<br />
TPM：N</p>

<p>保固：台灣2年</p>
', N'000001_1697421145.jpg', NULL, NULL, N'l000001_1697421145.jpg,l000002_1697421146.jpg,l000003_1697421146.jpg,l000004_1697421146.jpg', NULL, NULL, 22900, 1, CAST(N'2023-10-28T00:00:00.000' AS DateTime), CAST(N'2023-10-29T00:24:47.000' AS DateTime), 1, CAST(N'2024-01-01T02:52:59.000' AS DateTime), 1, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), N'ACER,Aspire7,宏碁')
INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (16, NULL, 13, NULL, NULL, NULL, N'ASUS TUF Gaming F15 FX707ZC4 17.3吋電競筆電', N'i7-12700H/16GB/RTX 3050/512G PCIe', N'<h3>規格說明<br />
ASUS TUF Gaming F17 機甲灰 FX707ZC4-0031A12700H0H &nbsp;詳細規格表&nbsp;<br />
--------------------------------------------&nbsp;<br />
●主要規格:&nbsp;<br />
--------------------------------------------&nbsp;<br />
處理器：12th Gen Intel&reg; Core&trade; i7-12700H Processor 2.3 GHz (24M Cache, up to 4.7 GHz, 14 cores: 6 P-cores and 8 E-cores)<br />
記憶體：16GB DDR4-3200 SO-DIMM<br />
硬碟：512GB PCIe&reg; 3.0 NVMe&trade; M.2 SSD<br />
獨立顯卡：NVIDIA&reg; GeForce RTX&trade; 3050 4GB GDDR6(具備MUX獨顯直連)<br />
螢幕：17.3 &quot;(薄邊框)/FHD (1920 x 1080) 16:9/144Hz/IPS-level/Anti-glare/Adaptive-Sync<br />
無線網路：Wi-Fi 6(802.11ax) (Dual band) 2*2 + Bluetooth&reg; 5.2<br />
光碟機： 無<br />
重量： 2.60 Kg<br />
厚度： 2.29 ~ 2.54 cm<br />
電池：56WHrs, 4S1P, 4-cell Li-ion<br />
電源：6.0, 200W AC Adapter, Output: 20V DC, 10A, 200W, Input: 100-240V AC, 50/60Hz universal<br />
作業系統：Windows 11 Home<br />
保固：2年全球保固 + 首年免預付完美保固<br />
--------------------------------------------&nbsp;<br />
●輸入輸出介面(I/O):&nbsp;<br />
--------------------------------------------&nbsp;<br />
1x RJ45 LAN port<br />
1x Thunderbolt&trade; 4 support DisplayPort&trade;<br />
1x USB 3.2 Gen 2 Type-C support DisplayPort&trade; / G-SYNC<br />
2x USB 3.2 Gen 1 Type-A<br />
1x HDMI 2.1 TMDS<br />
1x 3.5mm Combo Audio Jack<br />
720P HD camera<br />
Built-in array microphone<br />
Backlit Chiclet Keyboard 1-Zone RGB<br />
2-speaker system<br />
AI noise-canceling technology<br />
Dolby Atmos<br />
Hi-Res certification</h3>
', N'000001_1688027064.jpg', NULL, NULL, N'l000001_1698050963.jpg,l000002_1698050963.jpg,l000003_1698050964.jpg', NULL, NULL, 31999, 1, CAST(N'2023-10-28T00:00:00.000' AS DateTime), CAST(N'2023-10-29T00:31:40.000' AS DateTime), 1, CAST(N'2024-03-25T09:28:31.000' AS DateTime), 1, NULL, CAST(N'2024-12-30T00:00:00.000' AS DateTime), N'華碩,ASUS,TUF')
INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (18, NULL, 13, NULL, NULL, NULL, N'ACER Aspire 5 A515-58P-30EZ 灰', N'i3-1305U ∥ 8G ∥ 512G PCIe', N'<p>規格說明<br />
&nbsp;A515-58P-30EZ 詳細規格表</p>

<p>型號：A515-58P-30EZ<br />
作業系統：Windows 11 Home</p>

<p>CPU&nbsp;&nbsp; &nbsp;　&nbsp;&nbsp; &nbsp;　<br />
CPU：Intel&reg; Core&trade; i3-1305U<br />
clock/Turbo：1.6 GHz/4.5 GHz<br />
Cores/Threads：5/6<br />
L3 Cache：10 MB</p>

<p>晶片組：N</p>

<p>LCD　<br />
尺寸/規格：15.6&quot;/霧面/LED背光<br />
解析度：FHD 1920 x 1080<br />
色域：NTSC 45%<br />
亮度：220 nits</p>

<p>顯示晶片：Intel&reg; UHD Graphics</p>

<p>VRAM：N</p>

<p>散熱設計<br />
風扇：1<br />
熱導管：2</p>

<p>記憶體<br />
記憶體(實際出貨)：8GB LPDDR5(Onboard)<br />
記憶體支援容量(總插槽數量/總容量)：0/8GB</p>

<p>Audio<br />
Acer TrueHarmony：<br />
DTS&reg; Audio：<br />
Acer Purified.Voice：Y<br />
built in speaker：Y<br />
Built-in microphone：Y</p>

<p>鍵盤：無背光</p>

<p>儲存空間<br />
儲存空間(實際出貨)：512GB PCIe Gen4 SSD<br />
支援擴充空間(包含已安裝部分)：M.2 SSD *1</p>

<p>Webcam：HD (1280 x 720) with Temporal Noise Reduction(TNR)</p>

<p>無線網路：802.11a/b/g/n/ac+ax<br />
Dual Band (2.4 GHz and 5 GHz)<br />
2x2 MU-MIMO</p>

<p>藍牙：Bluetooth&reg; 5.1</p>

<p>區域網路<br />
RJ-45：N</p>

<p>Kensington lock slot：Y</p>

<p>尺寸(mm)：362.9 (W) x 237.5 (D) x /17.99 (H) mm</p>

<p>材質：塑膠</p>

<p>重量：1.78 kg</p>

<p>電源變壓器：65W</p>

<p>電池：50Wh Li-ion battery</p>

<p>Battery Life：Up to 9.5 hours (MobileMark2018)<br />
Up to 14 hours (video playback)<br />
Up to 13.5 hours (web browsing)</p>

<p>Input/Output&nbsp;&nbsp; &nbsp;<br />
Card Reader：N<br />
USB Type-C：N<br />
Type-C 支援影像傳輸：N<br />
USB Type-A：2(USB 3.2 Gen 1)<br />
HDMI：Y(HDMI 2.1)<br />
External display (VGA) port：N<br />
DisPlay Port：N<br />
可外接螢幕數量：1<br />
耳機/喇叭輸出：Y(與耳機/喇叭輸出共用jack)<br />
麥克風輸入：Y(與耳機/喇叭輸出共用jack)</p>

<p>安全<br />
指紋辨識：N<br />
TPM：N</p>

<p>保固：台灣2年</p>
', N'000001_1698035133.jpg', NULL, NULL, N'l000001_1698035134.jpg,l000002_1698035134.jpg,l000003_1698035134.jpg,l000004_1698035134.jpg', NULL, NULL, 13900, 1, CAST(N'2023-10-28T00:00:00.000' AS DateTime), CAST(N'2023-10-29T01:52:41.000' AS DateTime), 1, CAST(N'2023-11-15T18:44:31.000' AS DateTime), 1, NULL, CAST(N'2023-12-31T00:00:00.000' AS DateTime), N'ACER,Aspire,宏碁')
INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (19, NULL, 13, NULL, NULL, NULL, N'MSI微星 Cyborg 15 A13UDX-210TW', N'i7-13700H ∥ 16G ∥ RTX3050 ∥ 1T SSD', N'<p>規格說明</p>

<p>型 &nbsp;號：Cyborg 15 A13UDX-210TW-TB71370H16GXXDX11MA<br />
螢 &nbsp;幕：15.6&quot; FHD (1920x1080), 144Hz, IPS-Level<br />
處理器：Intel&reg; Core&trade;i7-13700H (2.4GHz/Turbo 5.0GHz)(Cache 24MB)<br />
記憶體：16GB(8G*2) DDR5-5200 ,2Slots ,Max 64GB&nbsp;<br />
硬 &nbsp;碟：1TB M.2 SSD (NVMe PCIe)<br />
顯示晶片：GeForce RTX3050 筆記型電腦GPU 6GB GDDR6<br />
插 &nbsp;槽：2 Slots Number of SO-DIMM Slot、1x M.2 SSD slot (NVMe PCIe Gen4)</p>

<p>I/O連接埠：<br />
1x Type-C USB3.2 Gen1/DP<br />
2x Type-A USB3.2 Gen1<br />
1x HDMI&trade; 2.1 (4K @ 60Hz)<br />
1x RJ45<br />
&nbsp;&nbsp; &nbsp;<br />
視訊鏡頭：HD type (30fps@720p)<br />
音 &nbsp;效：2x 2W Speaker、1x Mic-in/Headphone-out Combo Jack<br />
光碟機：無,請另購外接式光碟機<br />
支援網路：Gb LAN、802.11 ax Wi-Fi 6 + Bluetooth v5.2<br />
鍵盤/輸入裝置：Single Backlit Keyboard (Blue)<br />
電 &nbsp;池：3-Cell / 53.5 Battery (Whr)<br />
變壓器：120 W adapter<br />
作業系統：Windows 11 Home<br />
尺寸及重量：359.36 x 250.34 x 21.95~22.9 mm / 1.98 kg<br />
保 &nbsp;固：2 年保固 / 台灣地區2年到府收送<br />
免費客服電話：0800-018880</p>
', N'000001_1690164584.jpg', NULL, NULL, N'l000001_1690346421.jpg,l000002_1690346421.jpg,l000003_1690346421.jpg,l000004_1690346422.jpg', NULL, NULL, 36900, 1, CAST(N'2023-10-28T00:00:00.000' AS DateTime), CAST(N'2023-10-29T02:08:40.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2023-12-31T00:00:00.000' AS DateTime), N'Cyborg,微星')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductClass] ON 

INSERT [dbo].[ProductClass] ([ProductClassNum], [ProductClassSort], [ProductClassId], [ProductClassName], [ProductClassLevel], [ProductClassPre], [ProductClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (13, 1, NULL, N'筆記型電腦', NULL, NULL, 1, CAST(N'2023-10-29T00:22:40.000' AS DateTime), 1, CAST(N'2023-10-29T00:23:03.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductClass] OFF
GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DF_Admin_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[AdminGroup] ADD  CONSTRAINT [DF_LoginGroup_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[AdminRole] ADD  CONSTRAINT [DF_LoginRole_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[MenuGroup] ADD  CONSTRAINT [DF_MenuGroup_MenuGroupSort]  DEFAULT ((0)) FOR [MenuGroupSort]
GO
ALTER TABLE [dbo].[MenuGroup] ADD  CONSTRAINT [DF_MenuGroup_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[MenuSub] ADD  CONSTRAINT [DF_MenuSub_MenuSubSort]  DEFAULT ((0)) FOR [MenuSubSort]
GO
ALTER TABLE [dbo].[MenuSub] ADD  CONSTRAINT [DF_MenuSub_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_NewsViews]  DEFAULT ((0)) FOR [NewsViews]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner', @level2type=N'COLUMN',@level2name=N'BannerContxt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsSort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsContxt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsImg1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsImgAlt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsPublish'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsPutTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'EditTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Editor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsOffTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ProductImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ProductImgAlt'
GO
USE [master]
GO
ALTER DATABASE [ShopWebsite] SET  READ_WRITE 
GO

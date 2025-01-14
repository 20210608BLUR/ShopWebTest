USE [ShopWebsite]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[AdminGroup]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[AdminRole]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[Banner]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[MenuGroup]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[MenuSub]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[NewsClass]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2023/10/5 上午 11:05:49 ******/
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
/****** Object:  Table [dbo].[ProductClass]    Script Date: 2023/10/5 上午 11:05:49 ******/
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

INSERT [dbo].[Admin] ([AdminNum], [GroupNum], [AdminAcc], [AdminPwd], [AdminName], [AdminPublish], [LastLogin], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (1, 1, N'Admin', N'12345', N'admin', 1, CAST(N'2023-09-28T11:50:13.000' AS DateTime), CAST(N'2011-03-23T11:12:00.000' AS DateTime), 1, NULL, NULL, N'192.168.0.211')
INSERT [dbo].[Admin] ([AdminNum], [GroupNum], [AdminAcc], [AdminPwd], [AdminName], [AdminPublish], [LastLogin], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (3, 1, N'Ａlex', N'123456', N'蔡宇庭', 1, NULL, CAST(N'2023-04-11T17:29:03.000' AS DateTime), 1, CAST(N'2023-04-17T02:16:36.000' AS DateTime), 1, NULL)
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

INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (27, NULL, 6, NULL, N'Minisforum將Intel Core i5-12650H CPU和Mini-ITX主機板與MXM卡搭配使用，並有三個M.2 SSD', N'Minisforum將Intel Core i5-12650H CPU和Mini-ITX主機板與MXM卡搭配使用，並有三個M.2 SSD', N'<table cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>Minisforum正在進軍一個新的市場，推出了他們的首款獨立主機板EYERTEC AD650i。這款Mini-ITX主機板配備了Intel Core i5-12650H Alder Lake 10核CPU，這是一款行動CPU。它與大多數其他Mini-ITX主機板的區別在於省略了此類主機板中常見的PCIe x16插槽。<br />
			<br />
			AD650i的一個顯著特點是採用MXM的固態儲存擴充卡。雖然該公司尚未透露有關潛在MXM GPU支援的訊息，但該主機板包含一個擴充卡，最多可使用三個PCIe Gen3 M.2設備。此外該擴充卡還支援一系列RAID配置，包括RAID0、RAID1和RAID5，為用戶將該系統用作伺服器提供了多種選擇。此外該主機板還支援兩個額外的2.5吋SATA SSD。<br />
			<img alt="MINISFORUM-AD650-MINIITX-1200x624.jpg" id="aimg_478758" src="https://www.xfastest.com/data/attachment/forum/202309/07/192749svft1tcevw9wvwvt.jpg.thumb.jpg" style="height:416px; width:800px" title="MINISFORUM-AD650-MINIITX-1200x624.jpg" /><br />
			該系統被宣傳為打造高速家庭NAS的不錯選擇。該系統缺乏獨立GPU，但Plex等影片轉碼伺服器能夠利用Intel iGPU Quick Sync加速，它仍然應該能夠處理四個並行4K HEVC影片串流。<br />
			<br />
			該系統還支援USB4和2.5G網卡。用戶還可以將HDMI顯示器插入該系統。需要注意的是該產品並不是完整的MiniPC，而是預裝了某些零件的主機板。CPU散熱器和CPU本身包含在包裝中，但記憶體和儲存選擇由用戶自行決定，具體取決於他們的喜好或選擇的配置。該系統現已在TikTok Shop（所有地方）上提供，售價為2599 元人民幣（354美元）。此價格包含CPU和帶有擴展插槽的主機板，而用戶則需要根據自己的需求和喜好單獨購買DDR4記憶體和儲存。</td>
		</tr>
	</tbody>
</table>
', N'192749svft1tcevw9wvwvt.jpg.thumb.jpg', NULL, NULL, 1, 0, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-07T20:38:10.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2024-09-30T00:00:00.000' AS DateTime), N'Intel Core,CPU,Mini-ITX,M.2')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (29, NULL, 6, NULL, N'Acer上網文書筆電 《Aspire 3》 視訊學習、追劇娛樂 一機搞定', N'Acer上網文書筆電 《Aspire 3》 視訊學習、追劇娛樂 一機搞定', N'<p><img alt="20230907-1.jpg" id="aimg_478681" src="https://www.xfastest.com/data/attachment/forum/202309/07/123245z3p1xpdikupcfy4c.jpg.thumb.jpg" style="height:360px; width:720px" title="20230907-1.jpg" /></p>

<p><br />
Acer上網文書筆電Aspire 3 (A315-24P-R6X9)新款上市，全新搭載AMD Ryzen&trade; 5 7520U 處理器及AMD RadeonTM 顯示晶片，內建512GB SSD儲存及 8GB RAM，流暢效能、儲存空間可維持生產力；具有輕薄簡約1.78kg、18.9mm機身設計，好看且移動便利；搭配15.6吋窄邊框16:9霧面大螢幕，具備Acer BlueLightShieldTM技術，降低藍光曝射，減少眼睛疲勞不適、保護眼睛；抬升式的軸承設計，不僅散熱佳、可減少機身磨損，也讓使用者有更舒適的打字體驗，也便於清潔；支援Wi-Fi6 提供更快速穩定的連線能力，擁有Acer TNR(暫時性降噪)技術，配合HD Webcam提供清晰的視訊畫面；Acer Purified.Voice純音功能，提升視訊時的音訊品質，讓網路學習品質穩定；具有齊全連接埠，Type-C *2 + HDMI 2.1及音訊耳機接口，可外接最多三個螢幕；擁有長達13.5小時長效電力，文書工作、視訊學習、生活娛樂一機搞定，推出銀色新品，建議售價21,900元，全台Acer旗艦專售店、網購皆有販售。<br />
<br />
宏碁筆記型電腦服務受到肯定，擁有三大保障：第一：全台最多服務據點，目前有23點進行服務；第二：領先業界58分鐘快速維修；第三：原廠直營客服，一通電話直接問，專業諮詢最快速！同時提供三大保固承諾：第一：2年完全保固；第二：無亮點有限保固，可憑發票30日內至直營服務中心免費更換一次；第三：國際旅約保固，國際旅行有保障。</p>
', N'123245z3p1xpdikupcfy4c.jpg.thumb.jpg', NULL, NULL, 1, 0, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-07T20:42:04.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2023-09-30T00:00:00.000' AS DateTime), N'Acer,Aspire 3')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (30, NULL, 6, NULL, N'華擎科技發表AMD Radeon™ RX 7800 XT與Radeon™ RX 7700 XT系列顯示卡', N'華擎科技發表AMD Radeon™ RX 7800 XT與Radeon™ RX 7700 XT系列顯示卡', N'<table cellspacing="0" style="-webkit-text-stroke-width:0px; background-color:#ffffff; border-collapse:collapse; border:undefined; color:#444444; empty-cells:show; font-family:MicrosoftJhengHei,&quot;Microsoft YaHei&quot;,&quot;Segoe UI&quot;,Tahoma,Arial; font-size:13px; font-style:normal; font-variant-caps:normal; font-variant-ligatures:normal; font-weight:400; letter-spacing:normal; orphans:2; overflow-wrap:break-word; table-layout:fixed; text-align:start; text-decoration-color:initial; text-decoration-style:initial; text-decoration-thickness:initial; text-transform:none; white-space:normal; widows:2; width:815.5px; word-spacing:0px">
	<tbody>
		<tr>
			<td style="background-color:#ffffff"><span style="font-size:16px"><span style="font-family:Helvetica">全球主機板、顯示卡與迷你電腦領導廠商華擎科技(ASRock Inc.)，今日正式推出採用AMD Radeon&trade; RX 7800 XT和Radeon&trade; RX 7700 XT GPU的全新Phantom Gaming、Steel Legend和Challenger系列顯示卡。<br />
			<br />
			全新華擎AMD Radeon&trade; RX 7800 XT和Radeon&trade; RX 7700 XT系列顯示卡植基於突破性的AMD RDNA&trade; 3架構，分別配備60個和54個重新設計的計算單元，以及第二代AMD Infinity Cache&trade;技術。它們還配備AMD Radiance Display&trade;引擎、完整的AV1編碼，並針對高性能1440p遊戲、串流媒體和內容創作應用程式進行了最佳化。華擎AMD Radeon&trade; RX 7800 XT系列顯示卡還提供了步入4K遊戲的強大動力。</span></span><br />
			&nbsp;
			<div><span style="font-size:16px"><span style="font-family:Helvetica"><img alt="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" id="aimg_478684" src="https://www.xfastest.com/data/attachment/forum/202309/07/130140vtl2h5f7h6eltlh2.jpg.thumb.jpg" style="cursor:pointer; height:360px; overflow-wrap:break-word; width:720px" title="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" /></span></span></div>

			<div class="tip_horn" style="width:11px">&nbsp;</div>
			<br />
			<br />
			<span style="font-size:16px"><span style="font-family:Helvetica">全新華擎AMD Radeon&trade; RX 7800 XT和Radeon&trade; RX 7700 XT系列顯示卡分別配備高速16GB和12GB GDDR6顯示記憶體，速度分別為19.5Gbps和18Gbps，並經過預超頻以提供更高水準的性能。AMD Radiance Display&trade;引擎提供每通道12位元色，最多可呈現680億種顏色，從而實現令人難以置信的顏色精度。<br />
			<br />
			此外，華擎AMD Radeon&trade; RX 7800 XT和Radeon&trade; RX 7700 XT系列顯示卡支援各種華擎獨家功能，包括條紋環形/軸流風扇、導流鰭片、超貼合熱導管、金屬背板和Polychrome SYNC燈效技術，提供優秀的冷卻效率、堅固的結構和精美的ARGB燈光效果。憑藉這些獨特的功能，華擎AMD Radeon&trade; RX 7800 XT和Radeon&trade; RX 7700 XT系列顯示卡可說是4K/2K遊戲玩家和創作者的理想選擇。<br />
			<br />
			<strong>華擎AMD Radeon RX 7800 XT Phantom Gaming 16GB OC顯示卡<br />
			華擎AMD Radeon RX 7700 XT Phantom Gaming 12GB OC顯示卡</strong></span></span>

			<div><span style="font-size:16px"><span style="font-family:Helvetica"><img alt="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" id="aimg_478685" src="https://www.xfastest.com/data/attachment/forum/202309/07/130550op49fthgqvhhfgjf.jpg.thumb.jpg" style="cursor:pointer; height:600px; overflow-wrap:break-word; width:720px" title="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" /></span></span></div>

			<div class="tip_horn" style="width:11px">&nbsp;</div>
			&nbsp;

			<div><span style="font-size:16px"><span style="font-family:Helvetica"><img alt="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" id="aimg_478686" src="https://www.xfastest.com/data/attachment/forum/202309/07/130600uukcvvkkzkkbbsic.jpg.thumb.jpg" style="cursor:pointer; overflow-wrap:break-word" title="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" /></span></span></div>

			<div class="tip_horn" style="width:11px">&nbsp;</div>
			<br />
			<span style="font-size:16px"><span style="font-family:Helvetica">華擎AMD Radeon RX 7800 XT Phantom Gaming 16GB OC和華擎AMD Radeon RX 7700 XT Phantom Gaming 12GB OC顯示卡分別提供高達2565 MHz和2599 MHz的加速頻率，並配備Phantom Gaming三風扇冷卻系統提供卓越的散熱性能，條紋環形扇、導流鰭片和超貼合熱導管大幅提升散熱效率。金屬中框和金屬背板增強了結構並防止顯示卡扭曲變形。ARGB風扇和ARGB燈板與Polychrome SYNC軟體相結合，允許用戶完全自定義和控制燈光效果。憑藉這些獨特的功能，精美的黑紅配色設計和工廠預超頻，使華擎AMD Radeon RX 7800 XT Phantom Gaming 16GB OC和華擎AMD Radeon RX 7700 XT Phantom Gaming 12GB OC顯示卡完美地為1440p遊戲玩家量身訂製。<br />
			<br />
			<strong>華擎AMD Radeon RX 7800 XT Steel Legend 16GB OC顯示卡<br />
			華擎AMD Radeon RX 7700 XT Steel Legend 12GB OC顯示卡</strong></span></span>

			<div><span style="font-size:16px"><span style="font-family:Helvetica"><img alt="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" id="aimg_478687" src="https://www.xfastest.com/data/attachment/forum/202309/07/130730kt975puf7fsutm96.jpg.thumb.jpg" style="cursor:pointer; overflow-wrap:break-word" title="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" /></span></span></div>

			<div class="tip_horn" style="width:11px">&nbsp;</div>
			&nbsp;

			<div><span style="font-size:16px"><span style="font-family:Helvetica"><img alt="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" id="aimg_478688" src="https://www.xfastest.com/data/attachment/forum/202309/07/130739xnlq9olnw6boo969.jpg.thumb.jpg" style="cursor:pointer; overflow-wrap:break-word" title="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" /></span></span></div>

			<div class="tip_horn" style="width:11px">&nbsp;</div>
			<br />
			<span style="font-size:16px"><span style="font-family:Helvetica">專為白色主題PC打造的華擎AMD Radeon RX 7800 XT Steel Legend 16GB OC和華擎AMD Radeon RX 7700 XT Steel Legend 12GB OC顯示卡分別提供高達2520 MHz和2599 MHz的加速頻率。三風扇散熱設計搭配獨家的條紋軸流扇、導流鰭片和超貼合熱導管等技術，提供出色的散熱效果。金屬中框和金屬背板增強了結構並防止顯示卡PCB板彎。ARGB風扇結合Polychrome SYNC燈效軟體，允許用戶自定義和控制燈光效果。這些實用的功能、獨特的白色迷彩設計以及工廠預超頻，使華擎AMD Radeon RX 7800 XT Steel Legend 16GB OC和華擎AMD Radeon RX 7700 XT Steel Legend 12GB OC顯示卡成為白色 PC組裝者的優質選擇。<br />
			<br />
			<strong>華擎AMD Radeon RX 7800 XT Challenger 16GB OC顯示卡<br />
			華擎AMD Radeon RX 7700 XT Challenger 12GB OC顯示卡</strong></span></span>

			<div><span style="font-size:16px"><span style="font-family:Helvetica"><img alt="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" id="aimg_478689" src="https://www.xfastest.com/data/attachment/forum/202309/07/130856anqn2stqo25ksmru.jpg.thumb.jpg" style="cursor:pointer; overflow-wrap:break-word" title="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" /></span></span></div>

			<div class="tip_horn" style="width:11px">&nbsp;</div>
			&nbsp;

			<div><span style="font-size:16px"><span style="font-family:Helvetica"><img alt="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" id="aimg_478690" src="https://www.xfastest.com/data/attachment/forum/202309/07/130910p5dhjdwpxxzdvq7v.jpg.thumb.jpg" style="cursor:pointer; overflow-wrap:break-word" title="20230906_華擎科技發表 AMD Radeon™ RX 7800 XT 與 Radeon™ RX 7700 XT 系列顯示卡_.jpg" /></span></span></div>

			<div class="tip_horn" style="width:11px">&nbsp;</div>
			<br />
			<span style="font-size:16px"><span style="font-family:Helvetica">主流的華擎AMD Radeon RX 7800 XT Challenger 16GB OC和華擎AMD Radeon RX 7700 XT Challenger 12GB OC顯示卡分別提供高達2475 MHz和2584 MHz的加速頻率。它們都配備全新設計的雙風扇散熱器、獨家條紋軸流扇和超貼合熱導管，提供高效率的散熱能力。LED指示燈則讓顯示卡更加搶眼。金屬背板增強了結構。高品質超合金顯示卡料件，讓長時間運作更加穩定。出廠預超頻則提供更高的性能。這些實用的設計使華擎AMD Radeon RX 7800 XT Challenger 16GB OC和華擎AMD Radeon RX 7700 XT Challenger 12GB OC顯示卡成為系統組裝商和主流用戶的划算選擇。<br />
			<br />
			<span style="font-size:small">*產品規格若有後續變更，將不會另行通知。</span></span></span></td>
		</tr>
	</tbody>
</table>
', N'130140vtl2h5f7h6eltlh2.jpg.thumb.jpg', NULL, NULL, 1, 0, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-07T20:44:34.000' AS DateTime), 1, CAST(N'2023-09-07T20:44:53.000' AS DateTime), 1, NULL, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'Radeon RX 7800,華擎,顯示卡')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (31, NULL, 6, NULL, N'Intel第一代Core Ultra Meteor Lake CPU規格洩露：Core Ultra 9 185H頻率將高達5.1GHz', N'Intel第一代Core Ultra Meteor Lake CPU規格洩露：Core Ultra 9 185H頻率將高達5.1GHz', N'<table cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>Intel第一代 Core Ultra、Meteor Lake、CPU規格已經洩露，讓我們可以一睹即將推出的行動產品陣容的預期。<br />
			<img alt="Intel-Core-Branding-New-For-Meteor-Lake-CPUs-_10 (1).png" id="aimg_478606" src="https://www.xfastest.com/data/attachment/forum/202309/06/195725zljmi3mi0yf10ig9.png.thumb.jpg" style="height:450px; width:800px" title="Intel-Core-Branding-New-For-Meteor-Lake-CPUs-_10 (1).png" /><br />
			最新洩露的規格來自Bilibili的金豬升級，他分享了Core Ultra三款配置，包括Core Ultra 9 185H、Core Ultra 7 165H以及最近洩漏的Core Ultra 7 155H 。所有這三款晶片都被指定為Core Ultra主流系列中的高階產品。
			<blockquote>
			<ul>
				<li>Core Ultra 7 155H 4.8/4.8/4.5/4.3+3.8/2.8</li>
				<li>Core Ultra 7 165H 5/5/4.7/4.4+3.8/2.8</li>
				<li>Core Ultra 9 185H 5.1/5.1/4.8/4.5+3.8/2.8</li>
			</ul>
			</blockquote>
			<br />
			<br />
			Intel Core Ultra 9 185H Meteor Lake CPU規格：<br />
			<br />
			因此從規格來看Intel Core Ultra 9 185H CPU可能是有相同6+8+2核心配置的旗艦產品。其中包括6個採用Redwood Cove架構的性能核心、8個採用Crestmont 架構的效率核心，以及另外兩個使用SOC模組中相同架構的E核心。看起來該晶片的基本頻率為3.8GHz，透過TVB技術可提升至4.5GHz（標稱值）和5.1GHz。這與之前的報告一致，該報告強調Meteor Lake CPU的頻率確實會高於5.0GHz。<br />
			<br />
			Intel Core Ultra 7 165H Meteor Lake CPU規格：<br />
			<br />
			第二個型號是Intel Core Ultra 7 165H，其峰值提升頻率為5.0GHz，因此也滿足5GHz障礙，而Core Ultra 7 155H的峰值頻率將為4.8GHz。這意味著我們之前看到的測試確實報告了最終的時脈速度，但在Geekbench日誌中CPU時脈不是很一致，因此會影響性能。<br />
			<br />
			Intel Core Ultra 5 125H Meteor Lake CPU規格：<br />
			<br />
			現在也有了Intel Core Ultra 5 125H CPU的測試和規格，它是一個4+8+2型號，基本時脈為3.60GHz，升壓時脈約為4.5GHz。該CPU被發現在HP Omen Transcent遊戲筆記型電腦中，在ST測試中得分為2208分，在MT測試中得分為11563分。<br />
			<br />
			像往常一樣，最好等待最終的測試或那些看起來更接近發布的測試。未來幾天將進行測試的大多數晶片可能仍然只是ES產品，正如其較低的ST性能所指出的那樣。<br />
			<br />
			到目前為止我們透過洩密或官方數據共看到了六款Intel Core Ultra Meteor Lake CPU型號。之後可能會有更多型號，特別是因為Core Ultra 5部分以及採用Raptor Lake Refresh系列的標準Core（非Ultra）產品尚未完全曝光。該公司預計將在本月的創新活動中推出第一代Core Ultra Meteor Lake系列， 並於2023年秋季正式發布。</td>
		</tr>
	</tbody>
</table>
', N'195725zljmi3mi0yf10ig9.png.thumb.jpg', NULL, NULL, 1, 0, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-07T20:46:48.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'Intel Core Ultra 5,Intel')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (32, NULL, 4, NULL, N'Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板', N'Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板', N'<p>在昨晚於北京舉行的小米發表會上，除了摺疊機 MIX Fold 3 之外，另一主角便是品牌有史以來最大尺寸的安卓平板 Xiaomi Pad 6 Max。配備 2,880 x 1,800 解析度的 14 吋 10-bit 螢幕，比起 Xiaomi Pad 6 Pro 的 11 吋螢幕大 62%，支援 120Hz 更新率、HDR10 和 Dolby Vision 畫質和 600nits 亮度。<br />
<br />
<img alt="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" src="https://timgm.eprice.com.hk/hk/pad/img/2023-08/15/69049/eprice_1_77de008019874072362ddacf8075b9d8.jpg" title="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" /></p>

<h2><br />
<br />
可同時開啟 4 款程式</h2>

<p>Xiaomi Pad 6 Max 的螢幕以 Gorilla Glass 5 覆蓋保護，機身內建 8 個揚聲器，對應 Dolby Atmos 音效。小米為 Xiaomi Pad 6 Max 選用了 Snapdragon 8+ Gen 1 處理器，基本版提供 8GB RAM 和 256GB 存儲，也有 16GB RAM 和 1TB 儲存的高階版可供選擇。小米特別在 MIUI for Pad 系統介面作出調整，用戶可以同時開啟多達 4 個程式視窗。<br />
&nbsp;</p>

<h2><br />
可當作行動電源使用</h2>

<p>機身內建 10,000mAh 電池，官方聲稱可以應付 2 天的使用需要，同時支援 67W 有線快充，只需 30 分鐘就可以充電 50%，充滿 100% 也只需 68 分鐘，Xiaomi Pad 6 Max 還提供 33W 逆向供電給其他裝置使用。機身正面有 2000 萬畫素自拍鏡頭，旁邊有 LED 燈提示鏡頭使用中，內建 4 個收麥克風特別為視訊通話而設，機背的相機則為 5000 萬畫素。<br />
&nbsp;</p>

<h2><br />
未知是否會在海外上市</h2>

<p>Xiaomi Pad 6 Max 採用金屬一體成形機身，厚度只有 6.53mm，重量 750g，有黑色和銀色兩款顏色選擇。為了配合這大尺寸平板，小米特別推出智慧觸控鍵盤，也有額外選購的手寫筆，其 5ms 低延時適合繪畫或書寫筆記，手寫筆同時可以充當雷射筆使用。Xiaomi Pad 6 Max 的售價由 3,800 至 4,800 人民幣（約 NT$16,690 至 NT$21,100）不等。Xiaomi Pad 6 Max 目前台灣並無引進規劃。<br />
<br />
<iframe src="https://www.youtube.com/embed/g6Vw-MLZHFo?wmode=opaque"></iframe><br />
<br />
<img alt="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" src="https://timgm.eprice.com.hk/hk/pad/img/2023-08/15/69049/eprice_1_1f62b03d28a364519824f53dc2c04be8.jpg" title="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" /><br />
<br />
<img alt="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" src="https://timgm.eprice.com.hk/hk/pad/img/2023-08/15/69049/eprice_1_a43991cebfaeb1b72aa6891513c5495f.jpg" title="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" /><br />
<br />
<img alt="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" src="https://timgm.eprice.com.hk/hk/pad/img/2023-08/15/69049/eprice_1_5aab1a4b086c7551624de011d9d6b6bc.jpg" title="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" /><br />
<br />
<img alt="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" src="https://timgm.eprice.com.hk/hk/pad/img/2023-08/15/69049/eprice_1_5db7ec5084b921d6d63f84972b76d98e.jpg" title="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" /><br />
<br />
<img alt="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" src="https://timgm.eprice.com.hk/hk/pad/img/2023-08/15/69049/eprice_1_32d37614e5c46a4d21bd2cd1c342e895.jpg" title="Xiaomi Pad 6 Max 發表   小米史上最大尺寸高階平板" /></p>
', N'eprice_1_77de008019874072362ddacf8075b9d8.jpg', NULL, NULL, 1, 0, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-07T20:51:15.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'小米平板')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (33, NULL, 5, NULL, N'只有高通處理器版本？三星S24 Ultra傳啟用2億畫素HP2SX感光元件', N'只有高通處理器版本？三星S24 Ultra傳啟用2億畫素HP2SX感光元件', N'<p>三星下一代旗艦手機 SAMSUNG Galaxy S24 Ultra 預期延續前代<a href="https://www.sogi.com.tw/articles/samsung_galaxy_s24_ultra/6260261" target="_blank">四鏡頭主相機</a>配置，且可能依照不同市場而有<a href="https://www.sogi.com.tw/articles/samsung_galaxy_s24/6260272" target="_blank">三星 Exynos 2400</a>、高通 Snapdragon 8 Gen 3 for Galaxy 等不同的處理器版本。最新消息顯示，SAMSUNG Galaxy S24 Ultra 主鏡頭繼續採用 2 億畫素規格，但將搭配新的 ISOCELL 感光元件；另傳出該機僅會有高通行動平台版本。<br />
<br />
<img alt="只有高通處理器版本？三星S24 Ultra傳啟用2億畫素HP2SX感光元件" src="https://d2lfcsub12kx0l.cloudfront.net/tw/article/img/202309/2023090406270425213_ExtraLargeSize-640x640.jpg" title="只有高通處理器版本？三星S24 Ultra傳啟用2億畫素HP2SX感光元件" /></p>

<p>&nbsp;</p>

<p>▲SAMSUNG Galaxy S24 Ultra 傳聞主鏡頭啟用新的感光元件，搭配 2 億畫素規格。（圖片來源：<a href="https://www.sogi.com.tw/articles/samsung_galaxy_s24_ultra/6260284#:~:text=%E8%88%87%E5%89%8D%E4%BB%A3%E4%B8%8D%E5%90%8C%E3%80%82-,%EF%BC%88%E5%9C%96%E7%89%87%E4%BE%86%E6%BA%90%EF%BC%9AYouTube%EF%BC%89,-%E4%BE%86%E6%BA%90%E9%82%84%E6%8F%90%E5%88%B0" target="_blank">YouTube</a>）<br />
<br />
科技部落客 Ice Universe 近日宣稱取得 SAMSUNG Galaxy S24 Ultra 主鏡頭規格細節，表示該機將配置 ISOCELL HP2SX 感光元件，規格大致與 Galaxy S23 Ultra 所採用的 ISOCELL HP2 感光元件相近，同樣維 2 億畫素、1/1.3 吋大小、0.6&mu;m 像素尺寸，因此預期新的 ISOCELL HP2SX 感光元件是 ISOCELL HP2 的優化版本。<br />
<br />
<img alt="只有高通處理器版本？三星S24 Ultra傳啟用2億畫素HP2SX感光元件" src="https://d2lfcsub12kx0l.cloudfront.net/tw/article/img/202309/2023090406330494163_ExtraLargeSize-640x640.jpg" title="只有高通處理器版本？三星S24 Ultra傳啟用2億畫素HP2SX感光元件" />▲SAMSUNG Galaxy S24 Ultra 傳將啟用&nbsp;ISOCELL HP2 感光元件優化版本&nbsp;ISOCELL HP2SX。<br />
<br />
之前，Ice Universe 也曾透露，包括歐洲等市場的 SAMSUNG Galaxy S24 系列新機將採用三星 Exynos 2400 處理器，其他市場推出高通 Snapdragon 8 Gen 3 for Galaxy 版本。不過，近日出現不同的說法，內容提到僅會有 SAMSUNG Galaxy S24、Galaxy S24+ 才會因應不同市場推出不同處理器的版本，但規格最高的 Galaxy S24 Ultra 仍會只採用高通 Snapdragon 處理器。<br />
<br />
<img alt="只有高通處理器版本？三星S24 Ultra傳啟用2億畫素HP2SX感光元件" src="https://d2lfcsub12kx0l.cloudfront.net/tw/article/img/202309/2023090406430421644_ExtraLargeSize-640x640.jpg" title="只有高通處理器版本？三星S24 Ultra傳啟用2億畫素HP2SX感光元件" />▲SAMSUNG Galaxy S24 Ultra 預期跟前代一樣配置高通行動平台，不會有雙處理器版本差異。（圖為 SAMSUNG Galaxy S23 Ultra）</p>
', N'130140vtl2h5f7h6eltlh2.jpg.thumb.jpg', NULL, NULL, 1, 0, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-07T20:53:11.000' AS DateTime), 1, CAST(N'2023-09-07T21:03:08.000' AS DateTime), 1, NULL, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'S24 Ultra,三星')
INSERT [dbo].[News] ([NewsNum], [Lang], [NewsClass], [NewsSort], [NewsTitle], [NewsDescription], [NewsContxt], [NewsImg1], [NewsImgUrl], [NewsImgAlt], [NewsPublish], [NewsViews], [NewsPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [NewsOffTime], [Tag]) VALUES (34, NULL, 4, NULL, N'測試', N'測試', N'<p>測試</p>
', N'52264259958_c497f3ff52_o.jpg', NULL, NULL, 1, 0, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-07T21:10:29.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2023-09-30T00:00:00.000' AS DateTime), N'測試')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[NewsClass] ON 

INSERT [dbo].[NewsClass] ([NewsClassNum], [NewsClassSort], [NewsClassId], [NewsClassName], [NewsClassLevel], [NewsClassPre], [NewsClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (4, 1, NULL, N'平板', NULL, NULL, 1, CAST(N'2023-01-16T12:00:00.000' AS DateTime), 1, CAST(N'2023-09-07T20:35:44.000' AS DateTime), 1, N'192.168.1.220')
INSERT [dbo].[NewsClass] ([NewsClassNum], [NewsClassSort], [NewsClassId], [NewsClassName], [NewsClassLevel], [NewsClassPre], [NewsClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (5, 2, NULL, N'手機', NULL, NULL, 1, CAST(N'2023-09-07T20:36:07.000' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[NewsClass] ([NewsClassNum], [NewsClassSort], [NewsClassId], [NewsClassName], [NewsClassLevel], [NewsClassPre], [NewsClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (6, 3, NULL, N'電腦', NULL, NULL, 1, CAST(N'2023-09-07T20:36:13.000' AS DateTime), 1, CAST(N'2023-09-07T20:36:20.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[NewsClass] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CustomerName], [Email], [OrderDate], [PaymentMethod], [ShippingAddress], [TotalAmount], [OrderStatus]) VALUES (4, N'蔡宇庭', N'yuting09120310@gmail.com', CAST(N'2023-06-08' AS Date), N'貨到付款', N'新北市板橋區漢生東路193巷', 82470, N'已出貨')
INSERT [dbo].[Order] ([OrderID], [CustomerName], [Email], [OrderDate], [PaymentMethod], [ShippingAddress], [TotalAmount], [OrderStatus]) VALUES (6, N'蔡宇庭', N'yuting09120310@gmail.com', CAST(N'2023-09-02' AS Date), N'貨到付款', N'新北市板橋區漢生東路193巷', 161350, N'確認中')
INSERT [dbo].[Order] ([OrderID], [CustomerName], [Email], [OrderDate], [PaymentMethod], [ShippingAddress], [TotalAmount], [OrderStatus]) VALUES (7, N'呂仁傑', N'gfzch150@gmail.com', CAST(N'2023-09-08' AS Date), N'貨到付款', N'歐比斯', 69566, N'確認中')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (50, 4, 11, 5, 4500, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (51, 4, 10, 3, 19990, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (53, 6, 6, 3, 42090, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (54, 6, 7, 4, 8770, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (55, 7, 8, 4, 6429, NULL)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (56, 7, 7, 5, 8770, NULL)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (6, NULL, 7, NULL, NULL, NULL, N'技嘉 GeForce RTX 4080 16GB GAMING OC', N'GeForce RTX™ 4080 16GB GAMING OC', N'<ul>
	<li>
	<p>繪圖核心</p>

	<p>GeForce RTX&trade; 4080</p>
	</li>
	<li>
	<p>核心時脈</p>

	<p>2535 MHz (Reference Card: 2505 MHz)</p>
	</li>
	<li>
	<p>CUDA&reg; Cores</p>

	<p>9728</p>
	</li>
	<li>
	<p>記憶體時脈</p>

	<p>22.4 Gbps</p>
	</li>
	<li>
	<p>記憶體容量</p>

	<p>16 GB</p>
	</li>
	<li>
	<p>記憶體規格</p>

	<p>GDDR6X</p>
	</li>
	<li>
	<p>記憶體介面</p>

	<p>256 bit</p>
	</li>
	<li>
	<p>匯流排</p>

	<p>PCI-E 4.0</p>
	</li>
	<li>
	<p>最大數位解析度</p>

	<p>7680x4320</p>
	</li>
	<li>
	<p>多螢幕支援</p>

	<p>4</p>
	</li>
	<li>
	<p>尺寸</p>

	<p>L=342 W=150 H=75 mm</p>
	</li>
	<li>
	<p>PCB 規格</p>

	<p>ATX</p>
	</li>
	<li>
	<p>DirectX 支援</p>

	<p>12 Ultimate</p>
	</li>
	<li>
	<p>OpenGL 支援</p>

	<p>4.6</p>
	</li>
	<li>
	<p>建議電源供應</p>

	<p>850W</p>
	</li>
	<li>
	<p>供電接口</p>

	<p>16 Pin*1</p>
	</li>
	<li>
	<p>輸出</p>

	<p>DisplayPort 1.4a *3<br />
	HDMI 2.1 *1</p>
	</li>
	<li>
	<p>配件</p>

	<p>1. Quick guide<br />
	2. Warranty registration<br />
	3. Anti-sag bracket<br />
	4. Anti-sag bracket installation guide<br />
	5. One 16 pin to triple 8-pin power adaptor</p>
	</li>
</ul>
', N'2023_05_19_01_31_47_0592.jpg', NULL, NULL, NULL, NULL, NULL, 42090, 1, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-19T01:31:47.000' AS DateTime), 1, CAST(N'2023-06-13T00:05:34.000' AS DateTime), 1, NULL, CAST(N'2024-05-31T00:00:00.000' AS DateTime), N'技嘉,顯示卡')
INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (7, NULL, 7, NULL, NULL, NULL, N'微星 GeForce GTX 1630 VENTUS XS 4G OC', N' GeForce GTX 1630 VENTUS XS 4G OC ', N'<p>◆ 顯示晶片 ：NVIDIA&reg; GeForce&reg; GTX 1630<br />
◆ 記憶體 ：4GB GDDR6<br />
◆ 核心時脈 ：1815 MHz<br />
◆ 記憶體介面：64-bit<br />
◆ 最高解析度：7680x4320<br />
◆ 輸出端子 ：DP / HDMI / DVI<br />
◆ 體積(長x寬x高)： 17.8 x 11.2 x 3.9cm</p>
', N'2023_05_19_01_59_35_5571.jpg', NULL, NULL, NULL, NULL, NULL, 8770, 1, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-19T01:59:35.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2023-12-01T00:00:00.000' AS DateTime), N'微星,顯示卡')
INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (8, NULL, 8, NULL, NULL, NULL, N'Intel i5-12500處理器', N'i5-12500', N'<p>★ 腳位：1700<br />
★ 基礎頻率：3.0 GHz<br />
★ 快取記憶體：18 MB<br />
★ 核心/執行緒: 6 / 12<br />
★ 顯示：UHD770<br />
★ TDP：65 W</p>
', N'2023_05_19_02_00_48_8670.jpg', NULL, NULL, NULL, NULL, NULL, 6429, 1, CAST(N'2023-05-19T00:00:00.000' AS DateTime), CAST(N'2023-05-19T02:00:48.000' AS DateTime), 1, CAST(N'2023-05-31T01:34:20.000' AS DateTime), 1, NULL, CAST(N'2023-11-19T00:00:00.000' AS DateTime), N'英特爾,Intel,中央處理器,CPU')
INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (10, NULL, 9, NULL, NULL, NULL, N'技嘉 Z790 AORUS MASTER主機板', N'技嘉 Z790 AORUS MASTER主機板', N'<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">中央處理器(CPU)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">* 詳細支援列表請參考 &quot;CPU 支援列表&quot;</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">LGA1700插槽，支援第十三代及第十二代Intel<sup>&reg;</sup>&nbsp;Core&trade;、Pentium<sup>&reg;</sup>&nbsp;Gold 及Celeron<sup>&reg;</sup>處理器*</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">L3快取記憶體取決於CPU</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">晶片組</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">Intel<sup>&reg;</sup>&nbsp;Z790 高速晶片組</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">記憶體</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">(CPU和記憶體的配置可能會影響支援的記憶體類型、速度和DRAM模組數量，請至技嘉網站查詢記憶體模組支援列表。)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援DDR5 8000(O.C) / 7950(O.C) / 7900(O.C) / 7800(O.C) / 7600(O.C.) / 7400(O.C.) / 7200(O.C.) / 7000(O.C.) / 6800(O.C.) / 6600(O.C.) / 6400(O.C.) / 6200(O.C.) / 6000(O.C.) / 5800(O.C.) / 5600(O.C.) / 5400(O.C.) / 5200(O.C.) / 4800 / 4000</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">4個DDR5 DIMM插槽，最高支援到192 GB (單一插槽支援48 GB容量)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援雙通道記憶體技術</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援ECC Un-buffered DIMM 1Rx8/2Rx8記憶體(non-ECC模式運作)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援non-ECC Un-buffered DIMM 1Rx8/2Rx8/1Rx16記憶體</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援Extreme Memory Profile (XMP)記憶體</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">顯示功能</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">內建於有顯示功能的處理器-支援Intel<sup>&reg;</sup>&nbsp;HD Graphics： (顯示功能所支援的規格將因使用的CPU而有差異。)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個DisplayPort插座，可支援至最高4096x2304@60 Hz的解析度<br />
* 支援DisplayPort 1.2版本及HDCP 2.3。</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">音效</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">內建Realtek<sup>&reg;</sup>&nbsp;ALC1220-VB晶片<br />
* 前端音源插座提供的音效輸出孔支援DSD音訊。</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">內建ESS ES9118 DAC晶片</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援DTS:X<sup>&reg;</sup>&nbsp;Ultra</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援High Definition Audio</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援2/4/5.1聲道<br />
* 透過音效軟體可以重新定義音源插座功能，若要啟動5.1聲道音效輸出，請 進入音效軟體設定。</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援S/PDIF輸出</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">網路</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">內建Marvell<sup>&reg;</sup>&nbsp;AQtion AQC113C 10GbE網路晶片<br />
(10 Gbps/5 Gbps/2.5 Gbps/1 Gbps/100 Mbps)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">無線通訊模組</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">Intel<sup>&reg;</sup>&nbsp;Killer&trade; Wi-Fi 6E AX1690 (實際傳輸速度將因使用環境及設備而有所差異。)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">WIFI a, b, g, n, ac, ax，支援2.4/5/6 GHz無線頻段</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">BLUETOOTH 5.3</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援11ax 160MHz無線通信標準，可支援至最高2.4 Gbps</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">擴充槽</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">內建於CPU： 內建於晶片組：</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個PCI Express x16插槽，支援PCIe 5.0及x16運作規格(PCIEX16)<br />
* 由於PCIEX16插槽與M2C_CPU插座共享頻寬，所以當M2C_CPU插座安裝裝 置時，PCIEX16插槽最高以x8頻寬運作。<br />
* 為發揮顯示卡最大效能，安裝一張顯示卡時務必安裝至PCIEX16插槽。</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個PCI Express x16插槽，支援PCIe 3.0及x4運作規格(PCIEX4)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個PCI Express x16插槽，支援PCIe 3.0及x1運作規格(PCIEX1)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">儲存裝置介面</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">內建於CPU： 內建於晶片組： NVMe SSD支援建構RAID 0、RAID 1、RAID 5及RAID 10<br />
SATA硬碟支援建構RAID 0、RAID 1、RAID 5及RAID 10</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個M.2插座(支援Socket 3，Mkey，type 25110/2280 PCIe 5.0 x4/x2 SSD) (M2C_CPU)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個M.2插座(支援Socket 3，Mkey，type 22110/2280 PCIe 4.0 x4/x2 SSD) (M2A_CPU)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個M.2插座(支援Socket 3，Mkey，type 22110/2280 PCIe 4.0 x4/x2 SSD) (M2Q_SB)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個M.2插座(支援Socket 3，M key，type 2280/2260 PCIe 4.0 x4/x2 SSD) (M2P_SB)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個M.2插座(支援Socket 3，M key，type 2280/2260 SATA及PCIe 4.0 x4/x2 SSD) (M2M_SB)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">4個SATA 6Gb/s插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">USB</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">內建於晶片組： 內建於晶片組+2個USB 3.2 Gen 2 Hub： 內建於晶片組+2個USB 3.2 Gen 1 Hub： 內建於晶片組+USB 2.0 Hub：</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">3個USB Type-C<sup>&reg;</sup>連接埠，支援USB 3.2 Gen 2x2 (2個在後方面板，1個 需經由排線從主機板內USB插座接出)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個USB Type-C<sup>&reg;</sup>連接埠在後方面板，支援USB 3.2 Gen 1</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">7個USB 3.2 Gen 2 Type-A連接埠(紅色)在後方面板</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">8個USB 3.2 Gen 1連接埠(4個在後方面板，4個需經由排線從主機板 內USB插座接出)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">4個USB 2.0/1.1連接埠，需經由排線從主機板內USB插座接出</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">內接插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個24-pin ATX主電源插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個8-pin ATX 12V電源插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個CPU風扇插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個CPU水冷風扇插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">4個系統風扇插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">4個系統風扇/水冷幫浦插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個可編程LED燈條電源插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個RGB LED燈條電源插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">5個M.2 Socket 3插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">4個SATA 6Gb/s插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個前端控制面板插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個前端音源插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個USB Type-C<sup>&reg;</sup>插座，支援USB 3.2 Gen 2x2</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個USB 3.2 Gen 1插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個USB 2.0/1.1插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個噪音偵測插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個Thunderbolt&trade;擴充子卡插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個安全加密模組插座(限搭配GC-TPM2.0 SPI/GC-TPM2.0 SPI 2.0使用)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個電源按鈕</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個系統重置按鈕</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個系統重置針腳</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個清除CMOS資料針腳</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個感溫線針腳</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">電壓量測點</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">後方面板裝置連接插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個Q-Flash Plus按鈕</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個清除CMOS資料按鈕</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個SMA天線連接埠(2T2R)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個DisplayPort插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個USB Type-C<sup>&reg;</sup>連接埠，支援USB 3.2 Gen 1</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個USB Type-C<sup>&reg;</sup>連接埠，支援USB 3.2 Gen 2x2</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">7個USB 3.2 Gen 2 Type-A連接埠(紅色)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">4個USB 3.2 Gen 1連接埠</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個RJ-45埠</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個S/PDIF光纖輸出插座</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">2個音源接頭</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">I/O控制器</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">內建iTE<sup>&reg;</sup>&nbsp;I/O 控制晶片</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">硬體監控</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">電壓偵測</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">溫度偵測</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">風扇轉速偵測</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">水冷系統流速偵測</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">風扇故障警告</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">智慧風扇控制<br />
* 是否支援智慧風扇(幫浦)控制功能會依不同的散熱風扇(幫浦)而定。</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">噪音偵測</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">BIOS</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">1個256 Mbit flash</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">使用經授權AMI UEFI BIOS</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">PnP 1.0a、DMI 2.7、WfM 2.0、SM BIOS 2.7、ACPI 5.0</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">附加工具程式</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援GIGABYTE Control Center (GCC)<br />
* GCC支援的程式會因不同主機板而有所差異；各程式所支援的功能也會依 主機板的規格而不同。</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援Q-Flash</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援Q-Flash Plus</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援Smart Backup</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">附贈軟體</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">Norton<sup>&reg;</sup>&nbsp;Internet Security (OEM 版本)</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">LAN bandwidth management software</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">作業系統</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援Windows 11 64-bit</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">支援Windows 10 64-bit</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">PCB規格</span></span></p>

<p><span style="font-family:Tahoma,Geneva,sans-serif"><span dir="ltr" lang="es">E-ATX規格；30.5公分x 26.0公分</span></span></p>
', N'2023_05_28_04_19_56_5947.jpg', NULL, NULL, NULL, NULL, NULL, 19990, 1, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-28T03:55:24.000' AS DateTime), 1, CAST(N'2023-06-02T16:14:07.000' AS DateTime), 1, NULL, CAST(N'2023-07-28T00:00:00.000' AS DateTime), N'技嘉,主機板')
INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (11, NULL, 10, NULL, NULL, NULL, N'芝奇  皇家戟-尊爵版', N'芝奇 G.SKILL Trident Z Royal Elite 皇家戟-尊爵版', N'<p>記憶體類型</p>

<p>DDR4</p>

<p>容量</p>

<p>16GB (8GBx2)</p>

<p>對應通道</p>

<p>雙通道</p>

<p>測試速度 (XMP/EXPO)</p>

<p>3600 MT/s</p>

<p>測試時序 (XMP/EXPO)</p>

<p>14-15-15-35</p>

<p>測試電壓 (XMP/EXPO)</p>

<p>1.55V</p>

<p>Registered/Unbuffered</p>

<p>Unbuffered</p>

<p>除錯 (ECC)</p>

<p>Non-ECC</p>

<p>SPD 速度 (Default)</p>

<p>2133 MT/s</p>

<p>SPD 電壓 (Default)</p>

<p>1.20V</p>

<p>風扇裝置</p>

<p>無</p>

<p>保固</p>

<p>終身保固</p>

<p>特色</p>

<p>支援 Intel XMP 2.0 (Extreme Memory Profile)</p>
', N'2023_05_28_04_23_25_5209.jpg', NULL, NULL, NULL, NULL, NULL, 4500, 1, CAST(N'2023-05-28T00:00:00.000' AS DateTime), CAST(N'2023-05-28T04:23:25.000' AS DateTime), 1, CAST(N'2023-05-31T01:35:12.000' AS DateTime), 1, NULL, CAST(N'2023-08-22T00:00:00.000' AS DateTime), N'芝奇,記憶體')
INSERT [dbo].[Product] ([ProductNum], [Lang], [ProductClass], [ProductSort], [ProductDepartment], [ProductId], [ProductTitle], [ProductDescription], [ProductContxt], [ProductImg1], [ProductImgUrl], [ProductImgAlt], [ProductImgList], [ProductImgListAlt], [ProductVideo1], [ProductPrice], [ProductPublish], [ProductPutTime], [CreateTime], [Creator], [EditTime], [Editor], [IP], [ProductOffTime], [Tag]) VALUES (13, NULL, 8, NULL, NULL, NULL, N'Ryzen R7-5700X 3.4GHz 8核心 中央處理器', N'Ryzen R7-5700X 3.4GHz 8核心 中央處理器', N'<p>◆CPU 核心數：8</p>

<p>◆執行緒數：16</p>

<p>◆最大超頻時脈：最高可達 4.6GHz</p>

<p>◆基本時脈：3.4GHz</p>

<p>◆總計 L1 快取：512KB</p>

<p>◆總計 L2 快取：4MB</p>

<p>◆總計 L3 快取：32MB</p>

<p>◆預設 TDP/TDP：65W</p>

<p>◆TSMC 7nm FinFET</p>

<p>◆封裝：AM4</p>

<p>◆散熱解決方案 (PIB)：Not included</p>
', N'2023_05_31_01_33_43_8395.jpg', NULL, NULL, NULL, NULL, NULL, 9470, 1, CAST(N'2023-05-31T00:00:00.000' AS DateTime), CAST(N'2023-05-31T01:33:43.000' AS DateTime), 1, NULL, NULL, NULL, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Ryzen,AMD')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductClass] ON 

INSERT [dbo].[ProductClass] ([ProductClassNum], [ProductClassSort], [ProductClassId], [ProductClassName], [ProductClassLevel], [ProductClassPre], [ProductClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (7, 1, NULL, N'顯示卡', NULL, NULL, 1, CAST(N'2023-05-19T01:24:03.000' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ProductClass] ([ProductClassNum], [ProductClassSort], [ProductClassId], [ProductClassName], [ProductClassLevel], [ProductClassPre], [ProductClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (8, 2, NULL, N'中央處理器', NULL, NULL, 1, CAST(N'2023-05-19T01:26:57.000' AS DateTime), 1, CAST(N'2023-05-19T01:30:40.000' AS DateTime), 1, NULL)
INSERT [dbo].[ProductClass] ([ProductClassNum], [ProductClassSort], [ProductClassId], [ProductClassName], [ProductClassLevel], [ProductClassPre], [ProductClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (9, 3, NULL, N'主機板', NULL, NULL, 1, CAST(N'2023-05-28T03:54:41.000' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ProductClass] ([ProductClassNum], [ProductClassSort], [ProductClassId], [ProductClassName], [ProductClassLevel], [ProductClassPre], [ProductClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (10, 4, NULL, N'記憶體', NULL, NULL, 1, CAST(N'2023-05-28T04:22:11.000' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ProductClass] ([ProductClassNum], [ProductClassSort], [ProductClassId], [ProductClassName], [ProductClassLevel], [ProductClassPre], [ProductClassPublish], [CreateTime], [Creator], [EditTime], [Editor], [IP]) VALUES (11, 1, NULL, N'硬碟', NULL, NULL, 1, CAST(N'2023-09-15T02:33:41.000' AS DateTime), 1, CAST(N'2023-09-15T02:33:46.000' AS DateTime), 1, NULL)
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

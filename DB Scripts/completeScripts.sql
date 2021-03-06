USE [Menuwrap]
GO
/****** Object:  Table [dbo].[Filter]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Filter](
	[Filter_Id] [int] IDENTITY(1,1) NOT NULL,
	[Filter_name] [varchar](51) NOT NULL,
	[Filter_desc] [varchar](101) NULL,
PRIMARY KEY CLUSTERED 
(
	[Filter_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cuisine]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cuisine](
	[Cuisine_Id] [int] IDENTITY(1,1) NOT NULL,
	[cuisine_name] [varchar](41) NULL,
	[Cuisine_level] [int] NOT NULL,
	[parent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cuisine_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_name] [varchar](50) NOT NULL,
	[Isactive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[State_Id] [int] IDENTITY(1,1) NOT NULL,
	[State_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[State_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[Rolename] [varchar](100) NOT NULL,
	[Isactive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Email_Id] [varchar](100) NOT NULL,
	[Contact] [varchar](11) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role_Id] [int] NOT NULL,
	[addr] [varchar](51) NULL,
	[Zipcode] [int] NOT NULL,
	[Isactive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FoodItem](
	[Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_name] [varchar](50) NOT NULL,
	[Cusine_Id] [int] NULL,
	[No_time_sold] [int] NOT NULL,
	[Is_street] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Item_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Filter_cat_map]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filter_cat_map](
	[Filter_cat_map_id] [int] IDENTITY(1,1) NOT NULL,
	[Filter_Id] [int] NOT NULL,
	[category_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Filter_cat_map_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[City_Id] [int] IDENTITY(1,1) NOT NULL,
	[City_name] [varchar](50) NOT NULL,
	[State_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[City_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[Location_Id] [int] IDENTITY(1,1) NOT NULL,
	[Location_name] [varchar](50) NOT NULL,
	[city_Id] [int] NOT NULL,
	[Zipcode] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Location_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cat_food_map]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_food_map](
	[cat_food_mid] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_food_mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Restaurant](
	[Resturant_Id] [int] IDENTITY(1,1) NOT NULL,
	[Restaurant_name] [varchar](56) NOT NULL,
	[Rest_Desc] [varchar](501) NULL,
	[Rest_addr] [varchar](200) NULL,
	[Location_Id] [int] NOT NULL,
	[Zipcode] [int] NOT NULL,
	[Rest_mailId] [varchar](61) NULL,
	[Is_active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Resturant_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Res_food_map]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Res_food_map](
	[Res_food_mId] [int] IDENTITY(1,1) NOT NULL,
	[Resturant_Id] [int] NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Cost] [int] NOT NULL,
	[Avail_From] [time](7) NULL,
	[Avail_to] [time](7) NULL,
	[No_time_Sold] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Res_food_mId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Res_food_mId] [int] NOT NULL,
	[Order_DT] [datetime] NOT NULL,
	[Is_delivered] [int] NOT NULL,
	[Delivery_DT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 04/05/2015 18:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[Comment_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [varchar](500) NULL,
	[Rating] [float] NULL,
	[Item_Id] [int] NULL,
	[Resturant_Id] [int] NULL,
	[Res_food_mId] [int] NULL,
	[Isactive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Comment_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__cuisine__parent__2B947552]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[cuisine]  WITH CHECK ADD FOREIGN KEY([parent])
REFERENCES [dbo].[cuisine] ([Cuisine_Id])
GO
/****** Object:  ForeignKey [FK__user__Role_Id__0C1BC9F9]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Role_Id])
GO
/****** Object:  ForeignKey [FK__FoodItem__Cusine__39E294A9]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[FoodItem]  WITH CHECK ADD FOREIGN KEY([Cusine_Id])
REFERENCES [dbo].[cuisine] ([Cuisine_Id])
GO
/****** Object:  ForeignKey [FK__Filter_ca__categ__4B0D20AB]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Filter_cat_map]  WITH CHECK ADD FOREIGN KEY([category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
/****** Object:  ForeignKey [FK__Filter_ca__Filte__4A18FC72]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Filter_cat_map]  WITH CHECK ADD FOREIGN KEY([Filter_Id])
REFERENCES [dbo].[Filter] ([Filter_Id])
GO
/****** Object:  ForeignKey [FK__City__State_Id__4A8310C6]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([State_Id])
REFERENCES [dbo].[State] ([State_Id])
GO
/****** Object:  ForeignKey [FK__Location__city_I__1975C517]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Location]  WITH CHECK ADD FOREIGN KEY([city_Id])
REFERENCES [dbo].[City] ([City_Id])
GO
/****** Object:  ForeignKey [FK__Cat_food___Categ__3F9B6DFF]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Cat_food_map]  WITH CHECK ADD FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
/****** Object:  ForeignKey [FK__Cat_food___Item___3EA749C6]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Cat_food_map]  WITH CHECK ADD FOREIGN KEY([Item_Id])
REFERENCES [dbo].[FoodItem] ([Item_Id])
GO
/****** Object:  ForeignKey [FK__Restauran__Locat__62E4AA3C]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Restaurant]  WITH CHECK ADD FOREIGN KEY([Location_Id])
REFERENCES [dbo].[Location] ([Location_Id])
GO
/****** Object:  ForeignKey [FK__Res_food___Item___689D8392]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Res_food_map]  WITH CHECK ADD FOREIGN KEY([Item_Id])
REFERENCES [dbo].[FoodItem] ([Item_Id])
GO
/****** Object:  ForeignKey [FK__Res_food___Restu__67A95F59]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Res_food_map]  WITH CHECK ADD FOREIGN KEY([Resturant_Id])
REFERENCES [dbo].[Restaurant] ([Resturant_Id])
GO
/****** Object:  ForeignKey [FK__Order__Res_food___75F77EB0]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Res_food_mId])
REFERENCES [dbo].[Res_food_map] ([Res_food_mId])
GO
/****** Object:  ForeignKey [FK__Order__UserId__75035A77]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[user] ([UserId])
GO
/****** Object:  ForeignKey [FK__comment__Item_Id__6E565CE8]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([Item_Id])
REFERENCES [dbo].[FoodItem] ([Item_Id])
GO
/****** Object:  ForeignKey [FK__comment__Res_foo__703EA55A]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([Res_food_mId])
REFERENCES [dbo].[Res_food_map] ([Res_food_mId])
GO
/****** Object:  ForeignKey [FK__comment__Restura__6F4A8121]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([Resturant_Id])
REFERENCES [dbo].[Restaurant] ([Resturant_Id])
GO
/****** Object:  ForeignKey [FK__comment__UserId__6D6238AF]    Script Date: 04/05/2015 18:35:37 ******/
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[user] ([UserId])
GO

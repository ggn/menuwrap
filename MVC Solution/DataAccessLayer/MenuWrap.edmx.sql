
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/16/2015 09:36:40
-- Generated from EDMX file: C:\Users\abc\Desktop\Menuwrap\Menuwrap V.01\DataAccessLayer\MenuWrap.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Menuwrap];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Cat_food___Categ__10566F31]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cat_food_map] DROP CONSTRAINT [FK__Cat_food___Categ__10566F31];
GO
IF OBJECT_ID(N'[dbo].[FK__Cat_food___Item___114A936A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cat_food_map] DROP CONSTRAINT [FK__Cat_food___Item___114A936A];
GO
IF OBJECT_ID(N'[dbo].[FK__City__State_Id__0E6E26BF]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[City] DROP CONSTRAINT [FK__City__State_Id__0E6E26BF];
GO
IF OBJECT_ID(N'[dbo].[FK__comment__Item_Id__17036CC0]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comment] DROP CONSTRAINT [FK__comment__Item_Id__17036CC0];
GO
IF OBJECT_ID(N'[dbo].[FK__comment__Res_foo__17F790F9]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comment] DROP CONSTRAINT [FK__comment__Res_foo__17F790F9];
GO
IF OBJECT_ID(N'[dbo].[FK__comment__Restura__18EBB532]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comment] DROP CONSTRAINT [FK__comment__Restura__18EBB532];
GO
IF OBJECT_ID(N'[dbo].[FK__comment__UserId__19DFD96B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comment] DROP CONSTRAINT [FK__comment__UserId__19DFD96B];
GO
IF OBJECT_ID(N'[dbo].[FK__cuisine__parent__09A971A2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cuisine] DROP CONSTRAINT [FK__cuisine__parent__09A971A2];
GO
IF OBJECT_ID(N'[dbo].[FK__Filter_ca__categ__0C85DE4D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Filter_cat_map] DROP CONSTRAINT [FK__Filter_ca__categ__0C85DE4D];
GO
IF OBJECT_ID(N'[dbo].[FK__Filter_ca__Filte__0D7A0286]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Filter_cat_map] DROP CONSTRAINT [FK__Filter_ca__Filte__0D7A0286];
GO
IF OBJECT_ID(N'[dbo].[FK__FoodItem__Cusine__0B91BA14]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FoodItem] DROP CONSTRAINT [FK__FoodItem__Cusine__0B91BA14];
GO
IF OBJECT_ID(N'[dbo].[FK__Location__city_I__0F624AF8]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Location] DROP CONSTRAINT [FK__Location__city_I__0F624AF8];
GO
IF OBJECT_ID(N'[dbo].[FK__Order__Res_food___151B244E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK__Order__Res_food___151B244E];
GO
IF OBJECT_ID(N'[dbo].[FK__Order__UserId__160F4887]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK__Order__UserId__160F4887];
GO
IF OBJECT_ID(N'[dbo].[FK__Res_food___Item___1332DBDC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Res_food_map] DROP CONSTRAINT [FK__Res_food___Item___1332DBDC];
GO
IF OBJECT_ID(N'[dbo].[FK__Res_food___Restu__14270015]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Res_food_map] DROP CONSTRAINT [FK__Res_food___Restu__14270015];
GO
IF OBJECT_ID(N'[dbo].[FK__Restauran__Locat__123EB7A3]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Restaurant] DROP CONSTRAINT [FK__Restauran__Locat__123EB7A3];
GO
IF OBJECT_ID(N'[dbo].[FK__user__Role_Id__0A9D95DB]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[user] DROP CONSTRAINT [FK__user__Role_Id__0A9D95DB];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cat_food_map]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cat_food_map];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[City]', 'U') IS NOT NULL
    DROP TABLE [dbo].[City];
GO
IF OBJECT_ID(N'[dbo].[comment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[comment];
GO
IF OBJECT_ID(N'[dbo].[cuisine]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cuisine];
GO
IF OBJECT_ID(N'[dbo].[Filter]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Filter];
GO
IF OBJECT_ID(N'[dbo].[Filter_cat_map]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Filter_cat_map];
GO
IF OBJECT_ID(N'[dbo].[FoodItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FoodItem];
GO
IF OBJECT_ID(N'[dbo].[Location]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Location];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[Res_food_map]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Res_food_map];
GO
IF OBJECT_ID(N'[dbo].[Restaurant]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Restaurant];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[State]', 'U') IS NOT NULL
    DROP TABLE [dbo].[State];
GO
IF OBJECT_ID(N'[dbo].[user]', 'U') IS NOT NULL
    DROP TABLE [dbo].[user];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cat_food_map'
CREATE TABLE [dbo].[Cat_food_map] (
    [cat_food_mid] int IDENTITY(1,1) NOT NULL,
    [Item_Id] int  NOT NULL,
    [Category_Id] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Category_Id] int IDENTITY(1,1) NOT NULL,
    [Category_name] varchar(50)  NOT NULL,
    [Isactive] bit  NOT NULL
);
GO

-- Creating table 'Cities'
CREATE TABLE [dbo].[Cities] (
    [City_Id] int IDENTITY(1,1) NOT NULL,
    [City_name] varchar(50)  NOT NULL,
    [State_Id] int  NOT NULL
);
GO

-- Creating table 'comments'
CREATE TABLE [dbo].[comments] (
    [Comment_Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Comment1] varchar(500)  NULL,
    [Rating] float  NULL,
    [Item_Id] int  NULL,
    [Resturant_Id] int  NULL,
    [Res_food_mId] int  NULL,
    [Isactive] bit  NOT NULL
);
GO

-- Creating table 'cuisines'
CREATE TABLE [dbo].[cuisines] (
    [Cuisine_Id] int IDENTITY(1,1) NOT NULL,
    [cuisine_name] varchar(41)  NULL,
    [Cuisine_level] int  NOT NULL,
    [parent] int  NULL
);
GO

-- Creating table 'Filters'
CREATE TABLE [dbo].[Filters] (
    [Filter_Id] int IDENTITY(1,1) NOT NULL,
    [Filter_name] varchar(51)  NOT NULL,
    [Filter_desc] varchar(101)  NULL
);
GO

-- Creating table 'Filter_cat_map'
CREATE TABLE [dbo].[Filter_cat_map] (
    [Filter_cat_map_id] int IDENTITY(1,1) NOT NULL,
    [Filter_Id] int  NOT NULL,
    [category_Id] int  NOT NULL
);
GO

-- Creating table 'FoodItems'
CREATE TABLE [dbo].[FoodItems] (
    [Item_Id] int IDENTITY(1,1) NOT NULL,
    [Item_name] varchar(50)  NOT NULL,
    [Cusine_Id] int  NULL,
    [No_time_sold] int  NOT NULL,
    [Is_street] bit  NOT NULL,
    [isVeg] bit  NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Location_Id] int IDENTITY(1,1) NOT NULL,
    [Location_name] varchar(50)  NOT NULL,
    [city_Id] int  NOT NULL,
    [Zipcode] int  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Order_Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Res_food_mId] int  NOT NULL,
    [Order_DT] datetime  NOT NULL,
    [Is_delivered] int  NOT NULL,
    [Delivery_DT] datetime  NULL
);
GO

-- Creating table 'Res_food_map'
CREATE TABLE [dbo].[Res_food_map] (
    [Res_food_mId] int IDENTITY(1,1) NOT NULL,
    [Resturant_Id] int  NOT NULL,
    [Item_Id] int  NOT NULL,
    [Cost] int  NOT NULL,
    [Avail_From] time  NULL,
    [Avail_to] time  NULL,
    [No_time_Sold] int  NOT NULL
);
GO

-- Creating table 'Restaurants'
CREATE TABLE [dbo].[Restaurants] (
    [Resturant_Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_name] varchar(56)  NOT NULL,
    [Rest_Desc] varchar(501)  NULL,
    [Rest_addr] varchar(200)  NULL,
    [Location_Id] int  NOT NULL,
    [Zipcode] int  NOT NULL,
    [Rest_mailId] varchar(61)  NULL,
    [Is_active] bit  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Role_Id] int IDENTITY(1,1) NOT NULL,
    [Rolename] varchar(100)  NOT NULL,
    [Isactive] bit  NOT NULL
);
GO

-- Creating table 'States'
CREATE TABLE [dbo].[States] (
    [State_Id] int IDENTITY(1,1) NOT NULL,
    [State_name] varchar(50)  NOT NULL
);
GO

-- Creating table 'users'
CREATE TABLE [dbo].[users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [Username] varchar(100)  NOT NULL,
    [Email_Id] varchar(100)  NOT NULL,
    [Contact] varchar(11)  NOT NULL,
    [Password] varchar(50)  NOT NULL,
    [Role_Id] int  NOT NULL,
    [addr] varchar(51)  NULL,
    [Zipcode] int  NOT NULL,
    [Isactive] bit  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [cat_food_mid] in table 'Cat_food_map'
ALTER TABLE [dbo].[Cat_food_map]
ADD CONSTRAINT [PK_Cat_food_map]
    PRIMARY KEY CLUSTERED ([cat_food_mid] ASC);
GO

-- Creating primary key on [Category_Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Category_Id] ASC);
GO

-- Creating primary key on [City_Id] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [PK_Cities]
    PRIMARY KEY CLUSTERED ([City_Id] ASC);
GO

-- Creating primary key on [Comment_Id] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [PK_comments]
    PRIMARY KEY CLUSTERED ([Comment_Id] ASC);
GO

-- Creating primary key on [Cuisine_Id] in table 'cuisines'
ALTER TABLE [dbo].[cuisines]
ADD CONSTRAINT [PK_cuisines]
    PRIMARY KEY CLUSTERED ([Cuisine_Id] ASC);
GO

-- Creating primary key on [Filter_Id] in table 'Filters'
ALTER TABLE [dbo].[Filters]
ADD CONSTRAINT [PK_Filters]
    PRIMARY KEY CLUSTERED ([Filter_Id] ASC);
GO

-- Creating primary key on [Filter_cat_map_id] in table 'Filter_cat_map'
ALTER TABLE [dbo].[Filter_cat_map]
ADD CONSTRAINT [PK_Filter_cat_map]
    PRIMARY KEY CLUSTERED ([Filter_cat_map_id] ASC);
GO

-- Creating primary key on [Item_Id] in table 'FoodItems'
ALTER TABLE [dbo].[FoodItems]
ADD CONSTRAINT [PK_FoodItems]
    PRIMARY KEY CLUSTERED ([Item_Id] ASC);
GO

-- Creating primary key on [Location_Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Location_Id] ASC);
GO

-- Creating primary key on [Order_Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Order_Id] ASC);
GO

-- Creating primary key on [Res_food_mId] in table 'Res_food_map'
ALTER TABLE [dbo].[Res_food_map]
ADD CONSTRAINT [PK_Res_food_map]
    PRIMARY KEY CLUSTERED ([Res_food_mId] ASC);
GO

-- Creating primary key on [Resturant_Id] in table 'Restaurants'
ALTER TABLE [dbo].[Restaurants]
ADD CONSTRAINT [PK_Restaurants]
    PRIMARY KEY CLUSTERED ([Resturant_Id] ASC);
GO

-- Creating primary key on [Role_Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Role_Id] ASC);
GO

-- Creating primary key on [State_Id] in table 'States'
ALTER TABLE [dbo].[States]
ADD CONSTRAINT [PK_States]
    PRIMARY KEY CLUSTERED ([State_Id] ASC);
GO

-- Creating primary key on [UserId] in table 'users'
ALTER TABLE [dbo].[users]
ADD CONSTRAINT [PK_users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category_Id] in table 'Cat_food_map'
ALTER TABLE [dbo].[Cat_food_map]
ADD CONSTRAINT [FK__Cat_food___Categ__10566F31]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[Categories]
        ([Category_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Cat_food___Categ__10566F31'
CREATE INDEX [IX_FK__Cat_food___Categ__10566F31]
ON [dbo].[Cat_food_map]
    ([Category_Id]);
GO

-- Creating foreign key on [Item_Id] in table 'Cat_food_map'
ALTER TABLE [dbo].[Cat_food_map]
ADD CONSTRAINT [FK__Cat_food___Item___114A936A]
    FOREIGN KEY ([Item_Id])
    REFERENCES [dbo].[FoodItems]
        ([Item_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Cat_food___Item___114A936A'
CREATE INDEX [IX_FK__Cat_food___Item___114A936A]
ON [dbo].[Cat_food_map]
    ([Item_Id]);
GO

-- Creating foreign key on [category_Id] in table 'Filter_cat_map'
ALTER TABLE [dbo].[Filter_cat_map]
ADD CONSTRAINT [FK__Filter_ca__categ__0C85DE4D]
    FOREIGN KEY ([category_Id])
    REFERENCES [dbo].[Categories]
        ([Category_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Filter_ca__categ__0C85DE4D'
CREATE INDEX [IX_FK__Filter_ca__categ__0C85DE4D]
ON [dbo].[Filter_cat_map]
    ([category_Id]);
GO

-- Creating foreign key on [State_Id] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [FK__City__State_Id__0E6E26BF]
    FOREIGN KEY ([State_Id])
    REFERENCES [dbo].[States]
        ([State_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__City__State_Id__0E6E26BF'
CREATE INDEX [IX_FK__City__State_Id__0E6E26BF]
ON [dbo].[Cities]
    ([State_Id]);
GO

-- Creating foreign key on [city_Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [FK__Location__city_I__0F624AF8]
    FOREIGN KEY ([city_Id])
    REFERENCES [dbo].[Cities]
        ([City_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Location__city_I__0F624AF8'
CREATE INDEX [IX_FK__Location__city_I__0F624AF8]
ON [dbo].[Locations]
    ([city_Id]);
GO

-- Creating foreign key on [Item_Id] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [FK__comment__Item_Id__17036CC0]
    FOREIGN KEY ([Item_Id])
    REFERENCES [dbo].[FoodItems]
        ([Item_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__comment__Item_Id__17036CC0'
CREATE INDEX [IX_FK__comment__Item_Id__17036CC0]
ON [dbo].[comments]
    ([Item_Id]);
GO

-- Creating foreign key on [Res_food_mId] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [FK__comment__Res_foo__17F790F9]
    FOREIGN KEY ([Res_food_mId])
    REFERENCES [dbo].[Res_food_map]
        ([Res_food_mId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__comment__Res_foo__17F790F9'
CREATE INDEX [IX_FK__comment__Res_foo__17F790F9]
ON [dbo].[comments]
    ([Res_food_mId]);
GO

-- Creating foreign key on [Resturant_Id] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [FK__comment__Restura__18EBB532]
    FOREIGN KEY ([Resturant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Resturant_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__comment__Restura__18EBB532'
CREATE INDEX [IX_FK__comment__Restura__18EBB532]
ON [dbo].[comments]
    ([Resturant_Id]);
GO

-- Creating foreign key on [UserId] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [FK__comment__UserId__19DFD96B]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__comment__UserId__19DFD96B'
CREATE INDEX [IX_FK__comment__UserId__19DFD96B]
ON [dbo].[comments]
    ([UserId]);
GO

-- Creating foreign key on [Cusine_Id] in table 'FoodItems'
ALTER TABLE [dbo].[FoodItems]
ADD CONSTRAINT [FK__FoodItem__Cusine__0B91BA14]
    FOREIGN KEY ([Cusine_Id])
    REFERENCES [dbo].[cuisines]
        ([Cuisine_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__FoodItem__Cusine__0B91BA14'
CREATE INDEX [IX_FK__FoodItem__Cusine__0B91BA14]
ON [dbo].[FoodItems]
    ([Cusine_Id]);
GO

-- Creating foreign key on [Filter_Id] in table 'Filter_cat_map'
ALTER TABLE [dbo].[Filter_cat_map]
ADD CONSTRAINT [FK__Filter_ca__Filte__0D7A0286]
    FOREIGN KEY ([Filter_Id])
    REFERENCES [dbo].[Filters]
        ([Filter_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Filter_ca__Filte__0D7A0286'
CREATE INDEX [IX_FK__Filter_ca__Filte__0D7A0286]
ON [dbo].[Filter_cat_map]
    ([Filter_Id]);
GO

-- Creating foreign key on [Item_Id] in table 'Res_food_map'
ALTER TABLE [dbo].[Res_food_map]
ADD CONSTRAINT [FK__Res_food___Item___1332DBDC]
    FOREIGN KEY ([Item_Id])
    REFERENCES [dbo].[FoodItems]
        ([Item_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Res_food___Item___1332DBDC'
CREATE INDEX [IX_FK__Res_food___Item___1332DBDC]
ON [dbo].[Res_food_map]
    ([Item_Id]);
GO

-- Creating foreign key on [Location_Id] in table 'Restaurants'
ALTER TABLE [dbo].[Restaurants]
ADD CONSTRAINT [FK__Restauran__Locat__123EB7A3]
    FOREIGN KEY ([Location_Id])
    REFERENCES [dbo].[Locations]
        ([Location_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Restauran__Locat__123EB7A3'
CREATE INDEX [IX_FK__Restauran__Locat__123EB7A3]
ON [dbo].[Restaurants]
    ([Location_Id]);
GO

-- Creating foreign key on [Res_food_mId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK__Order__Res_food___151B244E]
    FOREIGN KEY ([Res_food_mId])
    REFERENCES [dbo].[Res_food_map]
        ([Res_food_mId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Order__Res_food___151B244E'
CREATE INDEX [IX_FK__Order__Res_food___151B244E]
ON [dbo].[Orders]
    ([Res_food_mId]);
GO

-- Creating foreign key on [UserId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK__Order__UserId__160F4887]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Order__UserId__160F4887'
CREATE INDEX [IX_FK__Order__UserId__160F4887]
ON [dbo].[Orders]
    ([UserId]);
GO

-- Creating foreign key on [Resturant_Id] in table 'Res_food_map'
ALTER TABLE [dbo].[Res_food_map]
ADD CONSTRAINT [FK__Res_food___Restu__14270015]
    FOREIGN KEY ([Resturant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Resturant_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Res_food___Restu__14270015'
CREATE INDEX [IX_FK__Res_food___Restu__14270015]
ON [dbo].[Res_food_map]
    ([Resturant_Id]);
GO

-- Creating foreign key on [Role_Id] in table 'users'
ALTER TABLE [dbo].[users]
ADD CONSTRAINT [FK__user__Role_Id__0A9D95DB]
    FOREIGN KEY ([Role_Id])
    REFERENCES [dbo].[Roles]
        ([Role_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__user__Role_Id__0A9D95DB'
CREATE INDEX [IX_FK__user__Role_Id__0A9D95DB]
ON [dbo].[users]
    ([Role_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------


-- --------------------------------------------------
-- Insert Scripts has started
-- --------------------------------------------------

insert into Roles values ('Admin',1)
insert into Roles values ('Member',1)

insert into [Categories] values ('Starter',1)
insert into [Categories] values ('Snacks',1)
insert into [Categories] values ('Lunch',1)
insert into [Categories] values ('Maincourse',1)

insert into States values ('Maharashtra')
insert into States values ('Goa')
insert into States values ('Gujarat')

insert into Cities values ('Mumbai',1)
insert into Cities values ('Thane',1)
insert into Cities values ('Pune',1)


insert into Locations values ('L.B.S. Marg,Ghatkopar(w)', 1,400086)
insert into Locations values ('Near Ghatkpar Railway Station', 1,400077)


insert into FoodItems values('Veg Crispy', Null, 0,0,0)
insert into FoodItems values('Paneer Chilly', Null,0,0,0)
insert into FoodItems values('Mendu Wada',Null,0,1,0)
insert into FoodItems values('Pav Bhaji',Null,0,1,0)
insert into FoodItems values('Masala Dosa',Null,0,1,0)
insert into FoodItems values('Paneer Tikka',Null,0,0,0)
insert into FoodItems values('Bhendi Fry',Null,0,0,0)
insert into FoodItems values('paneer shahi Kurma',Null,0,0,0)
insert into FoodItems values('paneer Kofta',Null,0,0,0)
insert into FoodItems values('veg patiyala',Null,0,0,0)
insert into FoodItems values('Thali',Null,0,0,0)
insert into FoodItems values('Misal Pav',Null,0,1,0)
insert into FoodItems values('Mix vegetable',Null,0,0,0)
insert into FoodItems values('Paneer Tikka Masala',Null,0,0,0)


 
insert into cat_food_map values(1,1)
insert into cat_food_map values(2,1)
insert into cat_food_map values(3,2)
insert into cat_food_map values(4,2)
insert into cat_food_map values(5,2)
insert into cat_food_map values(6,4)
insert into cat_food_map values(7,4)
insert into cat_food_map values(8,4)
insert into cat_food_map values(9,4)
insert into cat_food_map values(10,4)
insert into cat_food_map values(11,3)
insert into cat_food_map values(12,2)
insert into cat_food_map values(13,4)
insert into cat_food_map values(14,3)
 
 
 
 
 

insert into Restaurants values('SPIRIT','Eat,Chill,Unwind','Opp.Ashok Silk Mill,LBS Marg,Ghatkopar(west))',1,400086,'',1)
insert into Restaurants values('POP-UP','Multi Cuisine Family Restaurant','Opp.Shanti Niketan Garden,Next To Vijay Sales,L.B.S.Road,Ghatkopar(West)',1,400086,'',1)
insert into Restaurants values('Thambbi','Veg Restaurant','Patanwala CoMpd,Opp Shreyas Talkies,LBS Road,Ghatkopar(west)',1,400086,'',1)
insert into Restaurants values('Hotel SAMRAT','Pure Veg','Shree Ganesh CHS LTD.,Opp.Railway Station,Ghatkopar(E),',2,400077,'',1)
insert into Restaurants values('Cafe Shalimar New American','Family Restaurant','Opp.Dargah,LBS Marg,Ghatkopar(West)',1,400086,'',1)
insert into Restaurants values('UDIPI VIHAR','Pure Veg','Sainath Nagar,Nr. Shreyas Cinema,Ghatkopar(West)',1,400086,'',1)
insert into Restaurants values('SHIV SAGAR','Pure Veg','A/3,Shanti Kunj,Jawahar Road,Opp.Ghatkpar Railway Station,Ghatkopar(East)',2,400077,'',1)


insert into res_food_map values(1,6,210,null,null,0)
insert into res_food_map values(1,13,170,null,null,0)
insert into res_food_map values(2,1,180,null,null,0)
insert into res_food_map values(2,6,210,null,null,0)
insert into res_food_map values(3,3,50,null,null,0)
insert into res_food_map values(3,5,60,null,null,0)
insert into res_food_map values(3,12,55,null,null,0)
insert into res_food_map values(3,4,78,null,null,0)
insert into res_food_map values(4,4,120,null,null,0)
insert into res_food_map values(4,5,70,null,null,0)
insert into res_food_map values(5,14,180,null,null,0)
insert into res_food_map values(5,11,100,null,null,0)
insert into res_food_map values(5,2,110,null,null,0)
insert into res_food_map values(6,5,55,null,null,0)
insert into res_food_map values(6,2,135,null,null,0)
insert into res_food_map values(6,12,55,null,null,0)
insert into res_food_map values(6,11,125,null,null,0)
insert into res_food_map values(6,7,125,null,null,0)
insert into res_food_map values(6,14,145,null,null,0)
insert into res_food_map values(6,13,125,null,null,0)
insert into res_food_map values(6,8,100,null,null,0)
insert into res_food_map values(6,4,95,null,null,0)
insert into res_food_map values(7,5,55,null,null,0)
insert into res_food_map values(7,12,50,null,null,0)
insert into res_food_map values(7,4,95,null,null,0)
insert into res_food_map values(7,13,85,null,null,0)
insert into res_food_map values(7,9,150,null,null,0)
insert into res_food_map values(7,6,150,null,null,0)
insert into res_food_map values(7,8,150,null,null,0)
insert into res_food_map values(7,7,95,null,null,0)
insert into res_food_map values(7,14,160,null,null,0)
-- --------------------------------------------------
-- Insert Scripts has Ended
-- --------------------------------------------------

-- --------------------------------------------------
-- Alter Scripts has started
-- --------------------------------------------------
ALTER TABLE FoodItems ADD FilterId INT REFERENCES Filters(Filter_Id)
-- --------------------------------------------------
-- Alter Scripts has started
-- --------------------------------------------------
create table [Roles] 
(
Role_Id int primary key not null identity(1,1),
Rolename varchar(100) not null,
Isactive bit not null
)
insert into Roles values ('Admin',1)
insert into Roles values ('Member',1)
select * from roles
--drop table roles

create table [user] 
(
UserId int primary key not null identity(1,1),
Username varchar(100) not null,
Email_Id varchar(100) not null,
Contact varchar(11) not null,
Password varchar(50) not null,
Role_Id int not null foreign key references Roles(Role_Id),
addr varchar(100),
/*Location_Id int not null foreign key references Location(Location_Id),*/
Zipcode int not null,
Isactive bit not null
)

select * from [user]

--drop table [user]

create table [Category]
(
Category_Id int primary key not null identity(1,1),
Category_name varchar(50) not null,
Isactive bit not null
)
insert into Category values ('Starter',1)
insert into Category values ('Snacks',1)
insert into Category values ('Lunch',1)
insert into Category values ('Maincourse',1)

select * from category

--drop table category

Create table [State]
(
State_Id int primary key not null identity(1,1),
State_name varchar(50) not null,
)
insert into State values ('Goa')
insert into State values ('Maharashtra')
insert into State values ('Gujarat')

--drop table [State]

select * from [State]

Create table [City]
(
City_Id int primary key not null identity(1,1),
City_name varchar(50) not null,
State_Id int not null foreign key references State(State_Id)
)
insert into City values ('Mumbai',2)
insert into City values ('Thane',2)
insert into City values ('Pune',2)
select * from City
--drop table city

/*
Create table [Area]
(
Area_Id int primary key not null identity(1,1),
Area_name varchar(50) not null,
City_Id int not null foreign key references City(City_Id)
)

insert into Area values ('Ghatkopar',1)
insert into Area values ('Dadar', 1)
insert into Area values ('Andheri', 1)

drop table area 
select * from area */

Create table [Location]
(
Location_Id int primary key not null identity(1,1),
Location_name varchar(50) not null,
City_Id int not null foreign key references City(City_Id),
Zipcode int not null
)

--drop table location
select * from Location

insert into Location values ('L.B.S. Marg,Ghatkopar(w)', 1,400086)
insert into Location values ('Near Ghatkpar Railway Station', 1,400077)



create table [Cuisine]
(
Cuisine_Id int primary key not null identity(1,1),
Item_name varchar(50) not null,
Cuisine_level int,
parent int foreign key references Cuisine(Cuisine_Id)
)


Create table [FoodItem] 
(
Item_Id int primary key not null identity(1,1),
Item_name varchar(50) not null,
Cuisine_Id int foreign key references Cuisine(Cuisine_Id),
No_time_sold int not null,
Is_street bit not null
)

insert into FoodItem values('Veg Crispy', Null, 0,0)
insert into FoodItem values('Paneer Chilly', Null,0,0)
--drop table FoodItem


select * from FoodItem
 
 create table [Cat_food_map] 
(
cat_food_mid int primary key not null identity(1,1),
Item_Id int not null foreign key references FoodItem(Item_Id),
Category_Id int not null foreign key references Category(Category_Id)
)
 
 --drop table Cat_food_map
 
Create table [Restaurant]
(
Resturant_Id int primary key not null identity(1,1),
Restaurant_name varchar(56) not null,
Rest_Desc  varchar(100),
Rest_addr  varchar(151),
Location_Id int not null foreign key references Location(Location_Id),
Zipcode int not null,
Rest_mailId varchar(61),
Is_active bit not null
)


insert into Restaurant values('SPIRIT','Eat,Chill,Unwind','Opp.Ashok Silk Mill,LBS Marg,Ghatkopar(west))',1,400086,'',1)
insert into Restaurant values('POP-UP','Multi Cuisine Family Restaurant','Opp.Shanti Niketan Garden,Next To Vijay Sales,L.B.S.Road,Ghatkopar(West)',1,400086,'',1)
insert into Restaurant values('Thambbi','Veg Restaurant','Patanwala CoMpd,Opp Shreyas Talkies,LBS Road,Ghatkopar(west)',1,400086,'',1)
insert into Restaurant values('Hotel SAMRAT','Pure Veg','Shree Ganesh CHS LTD.,Opp.Railway Station,Ghatkopar(E),',2,400077,'',1)
insert into Restaurant values('Cafe Shalimar New American','Family Restaurant','Opp.Dargah,LBS Marg,Ghatkopar(West)',1,400086,'',1)
insert into Restaurant values('UDIPI VIHAR','Pure Veg','Sainath Nagar,Nr. Shreyas Cinema,Ghatkopar(West)',1,400086,'',1)
insert into Restaurant values('SHIV SAGAR','Pure Veg','A/3,Shanti Kunj,Jawahar Road,Opp.Ghatkpar Railway Station,Ghatkopar(East)',2,400077,'',1)

--drop table restaurant

select * from Restaurant


create table [Res_food_map]
(
Res_food_mId int primary key not null identity(1,1),
Resturant_Id int not null foreign key references Restaurant(Resturant_Id),
Item_Id int not null foreign key references FoodItem(Item_Id),
Cost int not null,
Avail_From Time,
Avail_to Time,
No_time_Sold int not null,
)
/*
insert into res_food_map values(1,1)
insert into res_food_map values(1,2)*/

--drop table Rest_food_map

create table [comment]
(
Comment_Id int primary key not null identity(1,1),
UserId int not null foreign key references [User](UserId),
Comment varchar(500),
Rating Float,
Item_Id int foreign key references FoodItem(Item_Id),
Resturant_Id int foreign key references Restaurant(Resturant_Id),
Res_food_mId int foreign key references res_food_map(Res_food_mId),
Isactive bit not null
)

--drop table comment

create table [Order]
(
Order_Id int primary key not null identity(1,1),
UserId int not null foreign key references [User](UserId),
Res_food_mId int not null foreign key references res_food_map(Res_food_mId),
Order_DT datetime not Null ,
Is_delivered int not null,
Delivery_DT  datetime 
)
--drop table [Order]
create table [Filter]
(
Filter_Id int primary key not null identity(1,1),
Filter_name varchar(51),
Filter_desc varchar(101)
)

create table [Filter_cat_map]
(
Filter_cat_map_id int primary key not null identity(1,1),
Filter_Id int not null foreign key references Filter(Filter_Id),
category_Id int not null foreign key references Category(Category_Id)
)
create table [Roles] 
(
Role_Id int primary key not null identity(1,1),
Rolename varchar(100) not null,
Isactive bit not null
)
insert into Roles values ('Admin',1)
insert into Roles values ('Member',1)
select * from roles
drop table roles

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

drop table [user]

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

drop table category

Create table [State]
(
State_Id int primary key not null identity(1,1),
State_name varchar(50) not null,
)
insert into State values ('Maharashtra')
insert into State values ('Goa')
insert into State values ('Gujarat')

drop table [State]

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
drop table city

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

drop table location
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
insert into FoodItem values('Mendu Wada',Null,0,1)
insert into FoodItem values('Pav Bhaji',Null,0,1)
insert into FoodItem values('Masala Dosa',Null,0,1)
insert into FoodItem values('Paneer Tikka',Null,0,0)
insert into FoodItem values('Bhendi Fry',Null,0,0)
insert into FoodItem values('paneer shahi Kurma',Null,0,0)
insert into FoodItem values('paneer Kofta',Null,0,0)
insert into FoodItem values('veg patiyala',Null,0,0)
insert into FoodItem values('Thali',Null,0,0)
insert into FoodItem values('Misal Pav',Null,0,1)
insert into FoodItem values('Mix vegetable',Null,0,0)
insert into FoodItem values('Paneer Tikka Masala',Null,0,0)



drop table FoodItem


select * from FoodItem
 
 create table [Cat_food_map] 
(
cat_food_mid int primary key not null identity(1,1),
Item_Id int not null foreign key references FoodItem(Item_Id),
Category_Id int not null foreign key references Category(Category_Id)
)
 
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
 
 
 
 
 
 drop table Cat_food_map
 
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

drop table restaurant

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


drop table Rest_food_map

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

drop table comment

create table [Order]
(
Order_Id int primary key not null identity(1,1),
UserId int not null foreign key references [User](UserId),
Res_food_mId int not null foreign key references res_food_map(Res_food_mId),
Order_DT datetime not Null ,
Is_delivered int not null,
Delivery_DT  datetime 
)
drop table [Order]
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
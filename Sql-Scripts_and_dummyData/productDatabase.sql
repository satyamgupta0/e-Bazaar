show databases;
create database product;
use product;
show tables;

create table default_products(serialID int NOT NULL AUTO_INCREMENT,productID varchar(30), subCategory varchar(50),productName varchar(100),  productPrice double,
			productUnit int,productQualities varchar(250), mfg varchar(250),sellerID varchar(50),  PRIMARY KEY (serialId));
            
insert into default_products(productID , subCategory,productName,  productPrice,
			productUnit,productQualities, mfg )   values("notAssigned", "laptop2", "HP Power",45600.99,10,"cheap","not available");
            

 create table electronics(serialID int NOT NULL AUTO_INCREMENT,productID varchar(30), subCategory varchar(50),productName varchar(100),  productPrice double,
			productUnit int,productQualities varchar(250), mfg varchar(250),sellerID varchar(50),  PRIMARY KEY (serialId));
create table grocery(serialID int NOT NULL AUTO_INCREMENT,productID varchar(30), subCategory varchar(50),productName varchar(100),  productPrice double,
			productUnit int,productQualities varchar(250), mfg varchar(250),sellerID varchar(50),  PRIMARY KEY (serialId));
create table clothing(serialID int NOT NULL AUTO_INCREMENT,productID varchar(30), subCategory varchar(50),productName varchar(100),  productPrice double,
			productUnit int,productQualities varchar(250), mfg varchar(250),sellerID varchar(50),  PRIMARY KEY (serialId));
commit;
select * from clothing;
commit;

       
		
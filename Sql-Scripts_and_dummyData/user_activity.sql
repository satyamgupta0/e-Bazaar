create database user_activity;
use user_activity;
create table vendor_activity(
serialID int NOT NULL AUTO_INCREMENT,    
activityTime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
userID varchar(50),
userName varchar(50), 
activityName varchar(50),
activityDescription varchar(200),
productID varchar(50),
PRIMARY KEY (serialId));


create table customer_activity(
serialID int NOT NULL AUTO_INCREMENT,    
activityTime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
userID varchar(50),
userName varchar(50), 
activityName varchar(50),
activityDescription varchar(200),
productID varchar(50),
PRIMARY KEY (serialId));

create table null_activity(
serialID int NOT NULL AUTO_INCREMENT,    
activityTime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
userID varchar(50),
userName varchar(50), 
activityName varchar(50),
activityDescription varchar(200),
productID varchar(50),
PRIMARY KEY (serialId));

select * from customer_activity;



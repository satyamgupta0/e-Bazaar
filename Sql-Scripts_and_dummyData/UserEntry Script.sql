show databases;
create database user_signup_login_DATA_for_admin;
use user_signup_login_DATA_for_admin;
create table signinDetails(serialID int NOT NULL AUTO_INCREMENT,
    userID varchar(55) NOT NULL,
    logintime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,  
	fetchedUserName varchar(50),
    fetchedUserRegistrationID varchar(30),
    userType varchar(10),
    PRIMARY KEY (serialId));
   
select * from signindetails;
insert into signindetails(userID,fetchedUserName,fetchedUserRegistrationID,usertype) values("userid@gmail.com","none","none",'customer');

create table userRegistrationDetails( userSerialID int NOT NULL AUTO_INCREMENT,
username varchar(50), 
userEmailid  varchar(50) unique ,
userMobNumber varchar(13),
userPassword varchar(50),
userAddress  varchar (500),
registrationTime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
userUniqueID varchar(50),
userType varchar(20),
PRIMARY KEY (userSerialId)
 );
 
 
 
 select * from userregistrationdetails;
 commit;

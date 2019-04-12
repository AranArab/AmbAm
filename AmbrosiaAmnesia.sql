drop table Comments;
drop table Person;
drop table Restaurant;


create table Restaurant(
	Restaurant_name varchar(70) not null,
    R_Location varchar(30) not null,
    General_Description varchar(300) not null,
    Menu varchar(300) not null,
    Culture Varchar(30) not null,
    FF_SI Varchar(10) not null,
    Time_Spent numeric not null,
	RID numeric unique not null,
	primary key(RID));

create table Person(
	Person_name varchar(30) not null,
    Username varchar(15) not null unique,
    P_word varchar(30) not null,
    Dist_Trav numeric not null,
    Price_Range numeric not null,
    Culture varchar(30) not null,
    Diet varchar(30) not null,
    PID numeric not null,
    RID numeric not null unique,
    foreign key(RID) references Restaurant(RID),
    primary key(PID));
    
create table Comments(
	Person_name varchar(30) not null,
    RID numeric unique not null,
    PID numeric unique not null,
    C_Text varchar(300) not null,
    foreign key(RID) references Restaurant(RID),
    foreign key(PID) references Person(PID),
    primary key(RID, PID));
    
insert into Restaurant values('Olive Garden', 6, 'Friends not family. Breadsticks.', 'Breadsticks', 'Italian', 'S', 75, 1);
insert into Restaurant values('Red Lobster', 5, 'Seafood with Cheddar Bay Biscuits', 'Bottomless Shrimp', 'Seafood', 'S', 90, 11);
insert into Restaurant values('Hibachi Factory', 1, 'Japanese fast and deliverable', 'Hibachi chicken', 'Japanese', 'F', 15, 10);
insert into Restaurant values('Tandur Indian Kitchen', 6, 'Family style Indian', 'Curry', 'Indian', 'F', 30, 9);
insert into Restaurant values('The French Market Creperie Downtown', 1, 'Classic French pastries', 'Crossiants', 'French', 'S', 60, 8);
insert into Restaurant values('Victor’s Taco Shop', 1, 'Traditional Mexican tacos', 'Chicken Tacos', 'Mexican', 'S',30, 7);
insert into Restaurant values('Chaiyo Thai & Sushi Bar', 1, 'Classic Thai and Sushi', 'California Roll', 'Thai', 'S', 45, 6);
insert into Restaurant values('Copper Cellar', 0, 'Burger Nights', 'BBQ Burger', 'America', 'S', 65, 5);

insert into Person values('Aran', 'TurtleSoup', 'TurtleSouptwo', 8, 3, 'Indian', 'Vegetarian', 1, 9);

insert into Comments values('Aran', 9, 1, 'Nice');
    
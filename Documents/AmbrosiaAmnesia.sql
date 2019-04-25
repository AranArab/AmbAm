use sarab1;

/*drop table message_board;
drop table comments;
drop table Histories;
drop table Person;
drop table Restaurant;
*/

create table Restaurant(
	id INT NOT NULL AUTO_INCREMENT,
	R_name varchar(70) not null,
    R_Distance varchar(30) not null,
    General_Description varchar(300) not null,
    Menu varchar(300) not null,
    R_KOF varchar(30) not null,
    R_Price numeric not null,
    R_Diet varchar(60),
    R_Time_Limit numeric not null,
	primary key(id)
);

create table Person(
	id INT NOT NULL AUTO_INCREMENT,
	Person_fname varchar(60) not null,
    Person_lname varchar(30) not null,
    phone_number varchar(10) not null unique,
    Email varchar(60) not null unique,
    Username varchar(15) not null unique,
    P_word varchar(40) not null,
    Diet varchar(30) not null,
    primary key(id)
);

create table Histories(
    Distance numeric,
    Diet varchar(30), 
    /* KOF is Kind of Food */
    KOF varchar(60),
    /* Time spent at resaurant in minutes */
    Time_Limit numeric not null,
    Username varchar(15) not null unique,
	id INT NOT NULL AUTO_INCREMENT,
    foreign key (id) references Person(id),
    foreign key (id) references Restaurant(id),
    Price numeric not null,
    PRIMARY KEY (id)
);

create table comments(
	id INT NOT NULL AUTO_INCREMENT,
    Content varchar(140) not null,
    foreign key (id) references Person(id),
    foreign key (id) references Restaurant(id),
    primary key (id)
);

create table message_board(
    id INT NOT NULL AUTO_INCREMENT,
	Content varchar(700) not null,
    foreign key (id) references Person(id),
    foreign key (id) references Restaurant(id),
    primary key (id)
);

    
ALTER USER 'sarab1'@'%' IDENTIFIED WITH mysql_native_password BY 'sarab1@421';
    
  

select R_name from Restaurant, History where 
Restaurant(R_Price) <= History(Price) and Restaurant(R_Distance) <= History(Distance) and 
Restaurant(R_Diet) = History(Diet) and Restaurant(R_KOF) = History(KOF);


/* 
Search Button:
add search information to history using 'insert into' function
use select code whenever the search button is pressed

Sign up Button:
add information to Person whenever sign up button is pressed 

Sign in Button:
pull information from Person whenever sign in button is pressed
*/
    
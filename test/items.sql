CREATE TABLE items (
id	int auto_increment primary key,
code varchar(20) not null unique,
name varchar(100) not null,
category enum('잡화','음료','it','도서') not null,
price int not null,
stock int not null,
created_at datetime default current_timestamp
);
-- SQL challenge table schemata

--Create the database

create database crowdfunding_db;

--Create the tables

drop table if exists subcategory; -- use this line to drop table(s) if needed

create table contacts(
	contact_id int primary key not null,
	first_name varchar(50) not null,
	last_name varchar(100) not null,
	email varchar(200) not null
);

create table category(
	category_id varchar(5) primary key not null,
	category varchar(50) not null
);

create table subcategory(
	subcategory_id varchar(8) primary key not null,
	subcategory varchar(50) not null
);

create table campaign(
	cf_id serial primary key not null,
	contact_id int not null,
	foreign key (contact_id) references contacts(contact_id),
	company_name varchar(200) not null,
	description varchar(500) not null,
	goal int not null,
	pledged int not null,
	outcome varchar(20) not null,
	backers_count int not null,
	country varchar(2) not null,
	currency varchar(3) not null,
	launched_date date not null,
	end_date date not null,
	category_id varchar(5) not null,
	foreign key (category_id) references category(category_id),
	subcategory_id varchar(8) not null,
	foreign key (subcategory_id) references subcategory(subcategory_id)
);

--Queries to test database

select * from category;
select * from subcategory;
select * from contacts;
select * from campaign;

--Queries to filter the data

select first_name, last_name from contacts where last_name like 'V%' order by last_name;
select category_id, avg(goal) as average_goal from campaign where outcome = 'failed' group by category_id;


------------------------ PART II

--1. Create Database
create database alta_online_shop2;

-- Create Tables
-- 2a.
create table users (
	usersid SERIAL primary key,
	name VARCHAR(100),
	address_id INT,
	dob DATE,
	status_user VARCHAR(50),
	gender VARCHAR(10),
	created_at TIMESTAMP,
	updated_at TIMESTAMP
);

-- 2b.
create table product (
    productid SERIAL primary key,
    product_name VARCHAR(100),
    merk VARCHAR(100)
        
);

create table product_type (
    product_typeid SERIAL primary key,
    type_name VARCHAR(100)
    
);

create table product_description (
    product_descriptionid SERIAL primary key,
    description TEXT

);

alter table product add column  product_typeid INT;

alter table product add column  product_descriptionid INT;

alter table product add foreign key (product_typeid) references product_type(product_typeid);

alter table product add foreign key (product_descriptionid) references product_description(product_descriptionid);


create table payment_method (
    payment_methodid SERIAL primary key,
    method_name VARCHAR(100)
);

-- 2c.
create table transaction (
    transactionid SERIAL primary key,
    userid INT,
    transaction_date TIMESTAMP,
    foreign key(usersid) references users(usersid)
);

create table transaction_detail (
    transaction_detailid SERIAL primary key,
    transactionid INT,
    productid INT,
    quantity INT,
    price DECIMAL,
    foreign key(transactionid) references transaction(transactionid),
    foreign key(productid) references product(productid),
    foreign key(payment_methodid) references payment_method(payment_methodid)
 ); 

-- 3. Create Table Kurir
create table kurir (
    id SERIAL primary key,
    name VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
  
);

-- 4. Tambah column ongkos_dasar pada Table Kurir
alter table kurir add column ongkos_dasar DECIMAL;
  
-- 5. Rename table Kurir to Shipping
alter table kurir rename to shipping;

-- 6. Drop table Shipping
drop table shipping;

-- 7a.
create table description (
	descriptionid SERIAL primary key,
	description TEXT,
	foreign key(payment_methidid) references payment_method(payment_methodid)
);

-- 7b.
create table address (
    addressid SERIAL primary key,
    address TEXT,
 	foreign key(usersid) references users(usersid)
);

-- 7c. 
create table user_payment_method_detail (
    user_payment_method_detailid SERIAL primary key,
    usersid INT,
    payment_methodid INT,
    foreign key(usersid) references users(usersid),
    foreign key(payment_methodid) references payment_method(payment_methodid)
);

-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Tue Aug 18 15:27:25 2009
-- 


BEGIN TRANSACTION;

--
-- Table: actor
--
DROP TABLE actor;

CREATE TABLE actor (
  actor_id INTEGER PRIMARY KEY NOT NULL,
  first_name VARCHAR(45) NOT NULL DEFAULT '',
  last_name VARCHAR(45) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

--
-- Table: actor_info
--
DROP TABLE actor_info;

CREATE TABLE actor_info (
  actor_id SMALLINT(5) NOT NULL DEFAULT '0',
  first_name VARCHAR(45) NOT NULL DEFAULT '',
  last_name VARCHAR(45) NOT NULL DEFAULT '',
  film_info VARCHAR(341)
);

--
-- Table: category
--
DROP TABLE category;

CREATE TABLE category (
  category_id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(25) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

--
-- Table: country
--
DROP TABLE country;

CREATE TABLE country (
  country_id INTEGER PRIMARY KEY NOT NULL,
  country VARCHAR(50) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

--
-- Table: customer_list
--
DROP TABLE customer_list;

CREATE TABLE customer_list (
  id SMALLINT(5) NOT NULL DEFAULT '0',
  name VARCHAR(91) NOT NULL DEFAULT '',
  address VARCHAR(50) NOT NULL DEFAULT '',
  zip_code VARCHAR(10),
  phone VARCHAR(20) NOT NULL DEFAULT '',
  city VARCHAR(50) NOT NULL DEFAULT '',
  country VARCHAR(50) NOT NULL DEFAULT '',
  notes VARCHAR(6) NOT NULL DEFAULT '',
  sid TINYINT(3) NOT NULL DEFAULT ''
);

--
-- Table: film_list
--
DROP TABLE film_list;

CREATE TABLE film_list (
  fid SMALLINT(5) DEFAULT '0',
  title VARCHAR(255),
  description TEXT,
  category VARCHAR(25) NOT NULL DEFAULT '',
  price DECIMAL(4) DEFAULT '4.99',
  length SMALLINT(5),
  rating ENUM(5) DEFAULT 'G',
  actors VARCHAR(341)
);

--
-- Table: film_text
--
DROP TABLE film_text;

CREATE TABLE film_text (
  film_id INTEGER PRIMARY KEY NOT NULL DEFAULT '',
  title VARCHAR(255) NOT NULL DEFAULT '',
  description TEXT
);

--
-- Table: language
--
DROP TABLE language;

CREATE TABLE language (
  language_id INTEGER PRIMARY KEY NOT NULL,
  name CHAR(20) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

--
-- Table: nicer_but_slower_film_list
--
DROP TABLE nicer_but_slower_film_list;

CREATE TABLE nicer_but_slower_film_list (
  fid SMALLINT(5) DEFAULT '0',
  title VARCHAR(255),
  description TEXT,
  category VARCHAR(25) NOT NULL DEFAULT '',
  price DECIMAL(4) DEFAULT '4.99',
  length SMALLINT(5),
  rating ENUM(5) DEFAULT 'G',
  actors VARCHAR(341)
);

--
-- Table: sales_by_film_category
--
DROP TABLE sales_by_film_category;

CREATE TABLE sales_by_film_category (
  category VARCHAR(25) NOT NULL DEFAULT '',
  total_sales DECIMAL(27)
);

--
-- Table: sales_by_store
--
DROP TABLE sales_by_store;

CREATE TABLE sales_by_store (
  store VARCHAR(101) NOT NULL DEFAULT '',
  manager VARCHAR(91) NOT NULL DEFAULT '',
  total_sales DECIMAL(27)
);

--
-- Table: staff_list
--
DROP TABLE staff_list;

CREATE TABLE staff_list (
  id TINYINT(3) NOT NULL DEFAULT '0',
  name VARCHAR(91) NOT NULL DEFAULT '',
  address VARCHAR(50) NOT NULL DEFAULT '',
  zip_code VARCHAR(10),
  phone VARCHAR(20) NOT NULL DEFAULT '',
  city VARCHAR(50) NOT NULL DEFAULT '',
  country VARCHAR(50) NOT NULL DEFAULT '',
  sid TINYINT(3) NOT NULL DEFAULT ''
);

--
-- Table: city
--
DROP TABLE city;

CREATE TABLE city (
  city_id INTEGER PRIMARY KEY NOT NULL,
  city VARCHAR(50) NOT NULL DEFAULT '',
  country_id SMALLINT(5) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE INDEX city_idx_country_id ON city (country_id);

--
-- Table: film
--
DROP TABLE film;

CREATE TABLE film (
  film_id INTEGER PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL DEFAULT '',
  description TEXT,
  release_year YEAR(4),
  language_id TINYINT(3) NOT NULL DEFAULT '',
  original_language_id TINYINT(3),
  rental_duration TINYINT(3) NOT NULL DEFAULT '3',
  rental_rate DECIMAL(4) NOT NULL DEFAULT '4.99',
  length SMALLINT(5),
  replacement_cost DECIMAL(5) NOT NULL DEFAULT '19.99',
  rating ENUM(5) DEFAULT 'G',
  special_features varchar(54),
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE INDEX film_idx_language_id ON film (language_id);

CREATE INDEX film_idx_original_language_id ON film (original_language_id);

--
-- Table: address
--
DROP TABLE address;

CREATE TABLE address (
  address_id INTEGER PRIMARY KEY NOT NULL,
  address VARCHAR(50) NOT NULL DEFAULT '',
  address2 VARCHAR(50),
  district VARCHAR(20) NOT NULL DEFAULT '',
  city_id SMALLINT(5) NOT NULL DEFAULT '',
  postal_code VARCHAR(10),
  phone VARCHAR(20) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE INDEX address_idx_city_id ON address (city_id);

--
-- Table: film_actor
--
DROP TABLE film_actor;

CREATE TABLE film_actor (
  actor_id SMALLINT(5) NOT NULL DEFAULT '',
  film_id SMALLINT(5) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (actor_id, film_id)
);

CREATE INDEX film_actor_idx_actor_id ON film_actor (actor_id);

CREATE INDEX film_actor_idx_film_id ON film_actor (film_id);

--
-- Table: film_category
--
DROP TABLE film_category;

CREATE TABLE film_category (
  film_id SMALLINT(5) NOT NULL DEFAULT '',
  category_id TINYINT(3) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (film_id, category_id)
);

CREATE INDEX film_category_idx_category_id ON film_category (category_id);

CREATE INDEX film_category_idx_film_id ON film_category (film_id);

--
-- Table: staff
--
DROP TABLE staff;

CREATE TABLE staff (
  staff_id INTEGER PRIMARY KEY NOT NULL,
  first_name VARCHAR(45) NOT NULL DEFAULT '',
  last_name VARCHAR(45) NOT NULL DEFAULT '',
  address_id SMALLINT(5) NOT NULL DEFAULT '',
  picture BLOB,
  email VARCHAR(50),
  store_id TINYINT(3) NOT NULL DEFAULT '',
  active TINYINT(1) NOT NULL DEFAULT '1',
  username VARCHAR(16) NOT NULL DEFAULT '',
  password VARCHAR(40),
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE INDEX staff_idx_address_id ON staff (address_id);

CREATE INDEX staff_idx_store_id ON staff (store_id);

--
-- Table: store
--
DROP TABLE store;

CREATE TABLE store (
  store_id INTEGER PRIMARY KEY NOT NULL,
  manager_staff_id TINYINT(3) NOT NULL DEFAULT '',
  address_id SMALLINT(5) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE INDEX store_idx_address_id ON store (address_id);

CREATE INDEX store_idx_manager_staff_id ON store (manager_staff_id);

CREATE UNIQUE INDEX idx_unique_manager ON store (manager_staff_id);

--
-- Table: customer
--
DROP TABLE customer;

CREATE TABLE customer (
  customer_id INTEGER PRIMARY KEY NOT NULL,
  store_id TINYINT(3) NOT NULL DEFAULT '',
  first_name VARCHAR(45) NOT NULL DEFAULT '',
  last_name VARCHAR(45) NOT NULL DEFAULT '',
  email VARCHAR(50),
  address_id SMALLINT(5) NOT NULL DEFAULT '',
  active TINYINT(1) NOT NULL DEFAULT '1',
  create_date DATETIME(19) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE INDEX customer_idx_address_id ON customer (address_id);

CREATE INDEX customer_idx_store_id ON customer (store_id);

--
-- Table: inventory
--
DROP TABLE inventory;

CREATE TABLE inventory (
  inventory_id INTEGER PRIMARY KEY NOT NULL,
  film_id SMALLINT(5) NOT NULL DEFAULT '',
  store_id TINYINT(3) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE INDEX inventory_idx_film_id ON inventory (film_id);

CREATE INDEX inventory_idx_store_id ON inventory (store_id);

--
-- Table: rental
--
DROP TABLE rental;

CREATE TABLE rental (
  rental_id INTEGER PRIMARY KEY NOT NULL,
  rental_date DATETIME(19) NOT NULL DEFAULT '',
  inventory_id MEDIUMINT(8) NOT NULL DEFAULT '',
  customer_id SMALLINT(5) NOT NULL DEFAULT '',
  return_date DATETIME(19),
  staff_id TINYINT(3) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE INDEX rental_idx_customer_id ON rental (customer_id);

CREATE INDEX rental_idx_inventory_id ON rental (inventory_id);

CREATE INDEX rental_idx_staff_id ON rental (staff_id);

CREATE UNIQUE INDEX rental_date ON rental (rental_date, inventory_id, customer_id);

--
-- Table: payment
--
DROP TABLE payment;

CREATE TABLE payment (
  payment_id INTEGER PRIMARY KEY NOT NULL,
  customer_id SMALLINT(5) NOT NULL DEFAULT '',
  staff_id TINYINT(3) NOT NULL DEFAULT '',
  rental_id INT(11),
  amount DECIMAL(5) NOT NULL DEFAULT '',
  payment_date DATETIME(19) NOT NULL DEFAULT '',
  last_update TIMESTAMP(14) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE INDEX payment_idx_customer_id ON payment (customer_id);

CREATE INDEX payment_idx_rental_id ON payment (rental_id);

CREATE INDEX payment_idx_staff_id ON payment (staff_id);

COMMIT;

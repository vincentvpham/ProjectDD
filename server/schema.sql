/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql (no mySQL password)
 *    mysql -u root -p < server/schema.sql (mySQL password)
 *  to create the database and the tables.
 *  Uncomment the line below to reset the database */
-- DROP DATABASE IF EXISTS property_maintenance_management;

CREATE DATABASE IF NOT EXISTS property_maintenance_management;

USE property_maintenance_management;

CREATE TABLE property (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  alias varchar(100),
  address varchar(100) NOT NULL,
  last_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE contact (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  type varchar(50),
  phone varchar(50),
  email varchar(50),
  last_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE property_contact (
  property_id int NOT NULL,
  contact_id int NOT NULL,
  PRIMARY KEY (property_id, contact_id),
  FOREIGN KEY (property_id) REFERENCES property(id),
  FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE access (
  id int NOT NULL AUTO_INCREMENT,
  property_id int NOT NULL,
  combo varchar(10),
  description varchar(100) NOT NULL,
  last_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE service (
  id int NOT NULL AUTO_INCREMENT,
  property_id int NOT NULL,
  type varchar(25) NOT NULL,
  timeFrame varchar(25) NOT NULL,
  frequncy int NOT NULL,
  schedule varchar(25),
  description varchar(100) NOT NULL,
  active boolean NOT NULL DEFAULT TRUE,
  last_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE note (
  id int NOT NULL AUTO_INCREMENT,
  property_id int NOT NULL,
  type varchar(25) NOT NULL,
  comment varchar(500) NOT NULL,
  last_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (property_id) REFERENCES property(id)
);

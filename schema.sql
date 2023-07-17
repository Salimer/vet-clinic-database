/* Database schema to keep the structure of entire database. */

billingdb=# create database vet_clinic;
CREATE DATABASE
billingdb=# \c vet_clinic
You are now connected to database "vet_clinic" as user "dragon10".
vet_clinic=# CREATE TABLE ANIMALS(
vet_clinic(# ID INT PRIMARY KEY NOT NULL,
vet_clinic(# NAME VARCHAR NOT NULL,
vet_clinic(# DATE_OF_BIRTH DATE NOT NULL,
vet_clinic(# ESCAPE_ATTEMPTS INT NOT NULL,
vet_clinic(# NEUTERED BOOL NOT NULL,
vet_clinic(# WEIGHT_KG DECIMAL(3,2) NOT NULL,
vet_clinic(# );
ERROR:  syntax error at or near ")"
LINE 8: );
        ^
vet_clinic=# CREATE TABLE ANIMALS (
vet_clinic(#   ID INT PRIMARY KEY NOT NULL,
vet_clinic(#   NAME VARCHAR(50) NOT NULL,
vet_clinic(#   DATE_OF_BIRTH DATE NOT NULL,
vet_clinic(#   ESCAPE_ATTEMPTS INT NOT NULL,
vet_clinic(#   NEUTERED BOOL NOT NULL,
vet_clinic(#   WEIGHT_KG DECIMAL(3, 2) NOT NULL
vet_clinic(# );
CREATE TABLE

vet_clinic=# ALTER TABLE animals
vet_clinic-# ADD COLUMN species VARCHAR;
ALTER TABLE

vet_clinic=# CREATE TABLE owners(
vet_clinic(# id SERIAL PRIMARY KEY,
vet_clinic(# full_name VARCHAR(255),
vet_clinic(# age INT 
vet_clinic(# );
CREATE TABLE

vet_clinic=# CREATE TABLE species(
vet_clinic(# id SERIAL PRIMARY KEY,
vet_clinic(# name VARCHAR(255)
vet_clinic(# );
CREATE TABLE

vet_clinic=# ALTER TABLE animals
vet_clinic-# DROP COLUMN species;
ALTER TABLE

vet_clinic=# ALTER TABLE animals
ADD COLUMN species_id INT;
ALTER TABLE

vet_clinic=# ALTER TABLE animals
ADD CONSTRAINT add_fk  
FOREIGN KEY(species_id)
REFERENCES species(id);
ALTER TABLE

vet_clinic=# ALTER TABLE animals
vet_clinic-# ADD COLUMN owner_id INT;
ALTER TABLE

vet_clinic=# ALTER TABLE animals                                                                                                              
ADD CONSTRAINT add_owners_fk                                                                                                                  
FOREIGN KEY(owner_id)                                                                                                                         
REFERENCES owners(id);
ALTER TABLE

vet_clinic=# CREATE TABLE vets(                                                                                          
        id SERIAL PRIMARY KEY,                                                                                                   
        name VARCHAR,                                                                                                            
        age INT,                                                                                                                 
        date_of_graduation DATE                                                                                                  
        );
CREATE TABLE

vet_clinic=# CREATE TABLE specializations(
vet_clinic(# species_id INT REFERENCES species(id),
vet_clinic(# vet_id INT REFERENCES vets(id),
vet_clinic(# PRIMARY KEY(species_id, vet_id)
vet_clinic(# );
CREATE TABLE

vet_clinic=# CREATE TABLE visits(
vet_clinic(# animal_id INT REFERENCES animals(id),
vet_clinic(# vet_id INT REFERENCES vets(id),
vet_clinic(# PRIMARY KEY(animal_id, vet_id));
CREATE TABLE

vet_clinic=# ALTER TABLE visits
vet_clinic-# ADD COLUMN visit_date DATE;
ALTER TABLE

vet_clinic=# CREATE INDEX idx_animal_id ON visits (animal_id);
CREATE INDEX

vet_clinic=# CREATE INDEX idx ON owners (id);
CREATE INDEX
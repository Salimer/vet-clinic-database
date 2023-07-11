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
CREATE TABLE                                                                                                                                              CREATE TABLE

vet_clinic=# ALTER TABLE animals
vet_clinic-# ADD COLUMN species VARCHAR;
ALTER TABLE
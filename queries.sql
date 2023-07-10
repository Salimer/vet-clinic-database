/*Queries that provide answers to the questions from all projects.*/

vet_clinic=# SELECT * FROM animals  WHERE NAME LIKE '%mon';
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  2 | Gabumon | 2018-11-15    |               2 | t        |      8.00
  4 | Devimon | 2017-05-12    |               5 | t        |     11.00
(3 rows)

vet_clinic=# SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
  2 | Gabumon | 2018-11-15    |               2 | t        |      8.00
  4 | Devimon | 2017-05-12    |               5 | t        |     11.00
(2 rows)

vet_clinic=# SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
  name   
---------
 Agumon
 Gabumon
(2 rows)

vet_clinic=# SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
 date_of_birth 
---------------
 2020-02-03
 2021-01-07
(2 rows)

vet_clinic=# SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
  name   | escape_attempts 
---------+-----------------
 Pikachu |               1
 Devimon |               5
(2 rows)

vet_clinic=# SELECT * FROM animals WHERE neutered = true;
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  2 | Gabumon | 2018-11-15    |               2 | t        |      8.00
  4 | Devimon | 2017-05-12    |               5 | t        |     11.00
(3 rows)

vet_clinic=# SELECT * FROM animals WHERE NOT (name = 'Gabumon');
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
  4 | Devimon | 2017-05-12    |               5 | t        |     11.00
(3 rows)

vet_clinic=# SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
  3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
  4 | Devimon | 2017-05-12    |               5 | t        |     11.00
(2 rows)


/* Populate database with sample data. */

vet_clinic=# INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
ERROR:  numeric field overflow
DETAIL:  A field with precision 3, scale 2 must round to an absolute value less than 10^1.
vet_clinic=# ALTER TABLE ANIMALS ALTER COLUMN WEIGHT_KG TYPE DECIMAL(6, 2);
ALTER TABLE
vet_clinic=# INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT 0 1
vet_clinic=# SELECT * FROM ANIMALS
vet_clinic-# SELECT * FROM ANIMALS;
ERROR:  syntax error at or near "SELECT"
LINE 2: SELECT * FROM ANIMALS;
        ^
vet_clinic=# SELECT * FROM ANIMALS;                                                                                                                              id |  name  | date_of_birth | escape_attempts | neutered | weight_kg 
----+--------+---------------+-----------------+----------+-----------
  1 | Agumon | 2020-02-03    |               0 | t        |     10.23
(1 row)

vet_clinic=# INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8 );
INSERT 0 1
vet_clinic=# SELECT * FROM ANIMALS;
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  2 | Gabumon | 2018-11-15    |               2 | t        |      8.00
(2 rows)

vet_clinic=# INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04 );
INSERT 0 1
vet_clinic=# INSERT INTO animals VALUES (4, 'Devimon', '2017-05-12', 5, true, 11 );
INSERT 0 1
vet_clinic=# SELECT * FROM ANIMALS;
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  2 | Gabumon | 2018-11-15    |               2 | t        |      8.00
  3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
  4 | Devimon | 2017-05-12    |               5 | t        |     11.00
(4 rows)

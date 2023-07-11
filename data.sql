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

vet_clinic=# INSERT INTO animals VALUES(5, 'Charmander', '2020-02-08', 0, false, 11),
vet_clinic-# (6, 'Plantmon', '2021-11-15', 2, true, 5.7),
vet_clinic-# (7, 'Squirtle', '1993-04-02', 3, false, 12.13),
vet_clinic-# (8, 'Angemon', '2005-06-12', 1, true, 45),
vet_clinic-# (9, 'Boarmon', '2005-06-07', 7, true, 20.4),
vet_clinic-# (10, 'Blossom', '1998-10-13', 3, true, 17),
vet_clinic-# (11, 'Ditto', '2022-05-14', 4, true, 22);
INSERT 0 7
vet_clinic=# SELECT * FROM animals;                                                                                  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | 
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | 
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | 
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | 
  5 | Charmander | 2020-02-08    |               0 | f        |     11.00 | 
  6 | Plantmon   | 2021-11-15    |               2 | t        |      5.70 | 
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | 
  8 | Angemon    | 2005-06-12    |               1 | t        |     45.00 | 
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | 
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | 
 11 | Ditto      | 2022-05-14    |               4 | t        |     22.00 | 
(11 rows)

--  I noticed the negative weight values much later so I'm shown down how my table should look like 

vet_clinic=*# UPDATE animals
vet_clinic-*# SET weight_kg = weight_kg * -1
vet_clinic-*# WHERE id IN (5, 6, 7, 8);
UPDATE 4
vet_clinic=*# SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t        |     22.00 | pokemon
  6 | Plantmon   | 2021-11-15    |               2 | t        |     -5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |    -45.00 | digimon
  5 | Charmander | 2020-02-08    |               0 | f        |    -11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
(11 rows)

vet_clinic=*# SELECT * FROM animals ORDER BY id;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | digimon
  5 | Charmander | 2020-02-08    |               0 | f        |    -11.00 | pokemon
  6 | Plantmon   | 2021-11-15    |               2 | t        |     -5.70 | digimon
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
  8 | Angemon    | 2005-06-12    |               1 | t        |    -45.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | digimon
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t        |     22.00 | pokemon
(11 rows)

vet_clinic=*# UPDATE animals
vet_clinic-*# SET species = NULL;
UPDATE 11
vet_clinic=*# SELECT * FROM animals ORDER BY id;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | 
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | 
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | 
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | 
  5 | Charmander | 2020-02-08    |               0 | f        |    -11.00 | 
  6 | Plantmon   | 2021-11-15    |               2 | t        |     -5.70 | 
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | 
  8 | Angemon    | 2005-06-12    |               1 | t        |    -45.00 | 
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | 
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | 
 11 | Ditto      | 2022-05-14    |               4 | t        |     22.00 | 
(11 rows)
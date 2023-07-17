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
vet_clinic=# SELECT * FROM ANIMALS;                                                                                                                              
id |  name  | date_of_birth | escape_attempts | neutered | weight_kg 
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
vet_clinic=# SELECT * FROM animals;                                                                                  
id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
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

vet_clinic=# INSERT INTO owners(full_name, age) VALUES                                                                                        
('Sam Smith', 34),                                                                                                                            
('Jennifer Orwell', 19),                                                                                                                      
('Bob', 45),                                                                                                                                  
('Melody Pond', 77),                                                                                                                          
('Dean Winchester', 14),                                                                                                                      
('Jodie Whittaker', 38);
INSERT 0 6

vet_clinic=# SELECT * FROM owners;
 id |    full_name    | age 
----+-----------------+-----
  1 | Sam Smith       |  34
  2 | Jennifer Orwell |  19
  3 | Bob             |  45
  4 | Melody Pond     |  77
  5 | Dean Winchester |  14
  6 | Jodie Whittaker |  38
(6 rows)

vet_clinic=# INSERT INTO species(name) VALUES
vet_clinic-# ('Pokemon'),('Digimon');
INSERT 0 2
vet_clinic=# SELECT * FROM species;
 id |  name   
----+---------
  1 | Pokemon
  2 | Digimon
(2 rows)

vet_clinic=# UPDATE animals
SET species_id = 1
WHERE name <> '%mon';
UPDATE 10

vet_clinic=# UPDATE animals  
SET species_id = 2 
WHERE name LIKE '%mon';
UPDATE 6

vet_clinic=# select * from animals;                                                                                                            
id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species_id | owner_id 
----+------------+---------------+-----------------+----------+-----------+------------+----------
  5 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |          1 |         
  6 | Blossom    | 1998-10-13    |               3 | t        |     17.00 |          1 |         
  9 | Charmander | 2020-02-08    |               0 | f        |     11.00 |          1 |         
 10 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 |          1 |         
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |          2 |         
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 |          2 |         
  3 | Devimon    | 2017-05-12    |               5 | t        |     11.00 |          2 |         
  4 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 |          2 |         
  7 | Plantmon   | 2021-11-15    |               2 | t        |      5.70 |          2 |         
  8 | Angemon    | 2005-06-12    |               1 | t        |     45.00 |          2 |         
(10 rows)

vet_clinic=# UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE 1
vet_clinic=# UPDATE animals SET owner_id = 2 WHERE name = 'Pikachu' OR name = 'Gabumon';
UPDATE 2
vet_clinic=# UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE 2
vet_clinic=# UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE 3
vet_clinic=# UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
UPDATE 2
vet_clinic=# SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species_id | owner_id 
----+------------+---------------+-----------------+----------+-----------+------------+----------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |          2 |        1
  5 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |          1 |        2
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 |          2 |        2
  3 | Devimon    | 2017-05-12    |               5 | t        |     11.00 |          2 |        3
  7 | Plantmon   | 2021-11-15    |               2 | t        |      5.70 |          2 |        3
  6 | Blossom    | 1998-10-13    |               3 | t        |     17.00 |          1 |        4
  9 | Charmander | 2020-02-08    |               0 | f        |     11.00 |          1 |        4
 10 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 |          1 |        4
  4 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 |          2 |        5
  8 | Angemon    | 2005-06-12    |               1 | t        |     45.00 |          2 |        5
(10 rows)

vet_clinic=# INSERT INTO vets(name, age, date_of_graduation) VALUES                                                      
('William Tatcher', 45, '2000-04-23'),                                                                                   
('Maisy Smith', 26, '2019-01-17'),                                                                                       
('Stephanie Mendez', 64, '1981-05-04'),                                                                                  
('Jack Harkness', 38, '2008-01-08');
INSERT 0 4
vet_clinic=# SELECT * FROM vets;
 id |       name       | age | date_of_graduation 
----+------------------+-----+--------------------
  1 | William Tatcher  |  45 | 2000-04-23
  2 | Maisy Smith      |  26 | 2019-01-17
  3 | Stephanie Mendez |  64 | 1981-05-04
  4 | Jack Harkness    |  38 | 2008-01-08
(4 rows)

vet_clinic=# INSERT INTO specializations(vet_id, species_id) VALUES
vet_clinic-# ((SELECT id FROM vets WHERE name = 'William Tatcher'),
vet_clinic(# (SELECT id FROM species WHERE name = 'Pokemon'));
INSERT 0 1

vet_clinic=# INSERT INTO specializations(vet_id, species_id) VALUES
vet_clinic-# ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
vet_clinic(# (SELECT id FROM species WHERE name = 'Pokemon')),
vet_clinic-# ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
vet_clinic(# (SELECT id FROM species WHERE name = 'Digimon')),
vet_clinic-# ((SELECT id FROM vets WHERE name = 'Jack Harkness'),
vet_clinic(# (SELECT id FROM species WHERE name = 'Digimon'));
INSERT 0 3

vet_clinic=# SELECT * FROM specializations;                                                                               
species_id | vet_id 
------------+--------
          1 |      1
          1 |      3
          2 |      3
          2 |      4
(4 rows)

INSERT INTO visits VALUES
(
  (SELECT id FROM animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2020-05-24'
);

INSERT INTO visits VALUES
(
  (SELECT id FROM animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2020-07-22'
);

INSERT INTO visits VALUES
(
  (SELECT id FROM animals WHERE name = 'Gabumon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2021-02-02'
);

INSERT INTO visits VALUES
(
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-01-05'
),
(
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-05-08'
),
(
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-05-14'
),
(
  (SELECT id FROM animals WHERE name = 'Devimon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2021-05-04'
),
(
  (SELECT id FROM animals WHERE name = 'Charmander'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2021-02-24'
),
(
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2019-12-21'
),
(
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2020-08-10'
),
(
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2021-04-07'
),
(
  (SELECT id FROM animals WHERE name = 'Squirtle'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2019-09-29'
),
(
  (SELECT id FROM animals WHERE name = 'Angemon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2020-10-03'
),
(
  (SELECT id FROM animals WHERE name = 'Angemon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2020-11-04'
),
(
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2019-01-24'
),
(
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2019-05-15'
),
(
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-02-27'
),
(
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-08-03'
),
(
  (SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2020-05-24'
),
(
  (SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2021-01-11'
);
vet_clinic=# select * from visits;                                                                                                                          
 animal_id | vet_id | visit_date 
-----------+--------+------------
         1 |      1 | 2020-05-24
         1 |      3 | 2020-07-22
         2 |      4 | 2021-02-02
         5 |      2 | 2020-01-05
         5 |      2 | 2020-05-08
         5 |      2 | 2020-05-14
         3 |      3 | 2021-05-04
         9 |      4 | 2021-02-24
         7 |      2 | 2019-12-21
         7 |      1 | 2020-08-10
         7 |      2 | 2021-04-07
        10 |      3 | 2019-09-29
         8 |      4 | 2020-10-03
         8 |      4 | 2020-11-04
         4 |      2 | 2019-01-24
         4 |      2 | 2019-05-15
         4 |      2 | 2020-02-27
         4 |      2 | 2020-08-03
         6 |      3 | 2020-05-24
         6 |      1 | 2021-01-11
(20 rows)

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT 0 3594280

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


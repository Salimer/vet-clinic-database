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

vet_clinic=# SELECT * FROM animals ORDER BY id;
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

vet_clinic=# BEGIN;
BEGIN
vet_clinic=*# UPDATE animals
vet_clinic-*# SET species = 'digimon'
vet_clinic-*# WHERE name LIKE '%mon';
UPDATE 6
vet_clinic=*# UPDATE animals
vet_clinic-*# SET species = 'pokemon'
vet_clinic-*# WHERE species IS NULL;
UPDATE 5
vet_clinic=*# SELECT * FROM animals ORDER BY id;                                                                     id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
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

vet_clinic=*# COMMIT;
COMMIT
vet_clinic=# SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t        |     -5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |    -45.00 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t        |     22.00 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f        |    -11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
(11 rows)

vet_clinic=# BEGIN;
BEGIN
vet_clinic=*# DELETE FROM animals;
DELETE 11
vet_clinic=*# SELECT * FROM animals;
 id | name | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------+---------------+-----------------+----------+-----------+---------
(0 rows)

vet_clinic=*# ROLLBACK;
ROLLBACK
vet_clinic=# SELECT * FROM animals ORDER BY id;
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

vet_clinic=# SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t        |     -5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |    -45.00 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t        |     22.00 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f        |    -11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
(11 rows)

vet_clinic=# BEGIN;
BEGIN
vet_clinic=*# DELETE FROM animals
vet_clinic-*# WHERE date_of_birth > '2022-01-01';
DELETE 1
vet_clinic=*# SAVEPOINT my_savepoint;
SAVEPOINT
vet_clinic=*# UPDATE animals
vet_clinic-*# SET weight_kg = weight_kg * -1;
UPDATE 10
vet_clinic=*# ROLLBACK TO SAVEPOINT my_savepoint;
ROLLBACK
vet_clinic=*# UPDATE animals
vet_clinic-*# SET weight_kg = weight_kg * -1
vet_clinic-*# WHERE weight_kg < 0;
UPDATE 4
vet_clinic=*# COMMIT;
COMMIT
vet_clinic=# SELECT * FROM animals;                                                                                  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | pokemon
  6 | Plantmon   | 2021-11-15    |               2 | t        |      5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |     45.00 | digimon
  5 | Charmander | 2020-02-08    |               0 | f        |     11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon
(10 rows)


-- How many animals are there?
vet_clinic=# SELECT COUNT(*) as animals FROM animals;
 animals 
---------
      10
(1 row)

-- How many animals have never tried to escape?

vet_clinic=# SELECT COUNT(name) as animals_never_escaped FROM animals                                               WHERE escape_attempts = 0;
 animals_never_escaped 
-----------------------
                     2
(1 row)

-- What is the average weight of animals?
vet_clinic=# SELECT AVG(weight_kg) as average_weight FROM animals;                                                     average_weight    
---------------------
 15.5500000000000000
(1 row)

-- Who escapes the most, neutered or not neutered animals?
vet_clinic=# SELECT neutered, MAX(escape_attempts) AS max_escape_attempts
vet_clinic-# FROM animals
vet_clinic-# GROUP BY neutered;
 neutered | max_escape_attempts 
----------+---------------------
 f        |                   3
 t        |                   7
(2 rows)

-- What is the minimum and maximum weight of each type of animal?
vet_clinic=# SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
vet_clinic-# FROM animals
vet_clinic-# GROUP BY species;
 species | min_weight | max_weight 
---------+------------+------------
 pokemon |      11.00 |      17.00
 digimon |       5.70 |      45.00
(2 rows)


-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
vet_clinic=# SELECT species, AVG(escape_attempts) AS average_escape_attempts
vet_clinic-# FROM animals
vet_clinic-# WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
vet_clinic-# GROUP BY species;
 species | average_escape_attempts 
---------+-------------------------
 pokemon |      3.0000000000000000
(1 row)

*****************************************************************************************************************************

-- What animals belong to Melody Pond?
vet_clinic=# SELECT full_name as owner, name as animal
FROM animals
INNER JOIN owners 
ON animals.owner_id = owners.id
WHERE owners.id = 4;
    owner    |   animal   
-------------+------------
 Melody Pond | Blossom
 Melody Pond | Charmander
 Melody Pond | Squirtle
(3 rows)

-- List of all animals that are pokemon (their type is Pokemon).
vet_clinic=# SELECT animals.name as animal, species.name as species                                                                           FROM animals                                                                                                                                  INNER JOIN species                                                                                                                            ON animals.species_id = species.id                                                                                                            WHERE species.id = 1;
   animal   | species 
------------+---------
 Pikachu    | Pokemon
 Blossom    | Pokemon
 Charmander | Pokemon
 Squirtle   | Pokemon
(4 rows)

-- List all owners and their animals, remember to include those that don't own any animal.
vet_clinic=# SELECT full_name as owner, name as animal                                                                                        FROM animals                                                                                                                                  RIGHT JOIN owners                                                                                                                             ON animals.owner_id = owners.id;
      owner      |   animal   
-----------------+------------
 Sam Smith       | Agumon
 Jennifer Orwell | Pikachu
 Jennifer Orwell | Gabumon
 Bob             | Devimon
 Bob             | Plantmon
 Melody Pond     | Blossom
 Melody Pond     | Charmander
 Melody Pond     | Squirtle
 Dean Winchester | Boarmon
 Dean Winchester | Angemon
 Jodie Whittaker | 
(11 rows)

-- How many animals are there per species?
vet_clinic=# SELECT s.name AS species_name, COUNT(*) AS animal_count
vet_clinic-# FROM animals a
vet_clinic-# JOIN species s ON a.species_id = s.id
vet_clinic-# GROUP BY s.name;
 species_name | animal_count 
--------------+--------------
 Pokemon      |            4
 Digimon      |            6
(2 rows)

-- List all Digimon owned by Jennifer Orwell.
vet_clinic=# SELECT a.name
vet_clinic-# FROM animals a
vet_clinic-# JOIN owners o ON a.owner_id = o.id
vet_clinic-# JOIN species s ON a.species_id = s.id
vet_clinic-# WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';
  name   
---------
 Gabumon
(1 row)

-- List all animals owned by Dean Winchester that haven't tried to escape.
vet_clinic=# SELECT name as animal  
FROM animals     
JOIN owners
ON animals.owner_id = owners.id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
 animal 
--------
(0 rows)

-- Who owns the most animals?
vet_clinic=# SELECT o.full_name as owner, COUNT(*) as total_animals
FROM animals a    
JOIN owners o         
ON a.owner_id = o.id
GROUP BY owner
ORDER BY total_animals DESC
LIMIT 1;
    owner    | total_animals 
-------------+---------------
 Melody Pond |             3
(1 row)
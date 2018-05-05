-- DROP TABLE adoptions;
DROP TABLE capybaras;
-- DROP TABLE owners;
--
CREATE TABLE capybaras
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  admission DATE,
  age INT2,
  available BIT
)
--
-- CREATE TABLE owners
-- (
  -- id SERIAL8 primary key,
  -- name VARCHAR(255) not null,
  -- run_speed INT2
-- );
--
-- CREATE TABLE adoptions
-- (
  -- id SERIAL8 primary key,
  -- victim_id INT8 references victims(id),
  -- zombie_id INT8 references zombies(id)
-- );

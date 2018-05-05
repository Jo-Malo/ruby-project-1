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
-- );
--
-- CREATE TABLE adoptions
-- (
-- );

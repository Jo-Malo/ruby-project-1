DROP TABLE adoptions;
DROP TABLE capybaras;
DROP TABLE owners;
--
CREATE TABLE capybaras
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  admission DATE,
  age INT2,
  available BIT
);

CREATE TABLE owners
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
  owner_id INT8 references owners(id),
  capybara_id INT8 references capybaras(id)
);

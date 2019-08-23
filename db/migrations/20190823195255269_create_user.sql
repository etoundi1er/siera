-- +micrate Up
CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  firstname VARCHAR,
  lastname VARCHAR,
  email VARCHAR,
  age INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS users;

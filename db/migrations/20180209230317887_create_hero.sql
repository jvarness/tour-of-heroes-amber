-- +micrate Up
CREATE TABLE heros (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  favorite BOOL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS heros;

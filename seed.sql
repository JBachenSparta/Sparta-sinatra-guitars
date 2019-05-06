-- 1
DROP TABLE IF EXISTS guitartable;

-- lower case for table name
CREATE TABLE guitartable (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT
);

                                     -- must be single quotes
INSERT INTO guitartable (title, body) VALUES ('guitarpage1', 'Body Text 1');
INSERT INTO guitartable (title, body) VALUES ('guitarpage2', 'Body Text 2');
INSERT INTO guitartable (title, body) VALUES ('guitarpage3', 'Body Text 3');
INSERT INTO guitartable (title, body) VALUES ('guitarpage4', 'Body Text 4');
INSERT INTO guitartable (title, body) VALUES ('guitarpage5', 'Body Text 5');

DROP TABLE IF EXISTS guitarplayer;

CREATE TABLE guitarplayer (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT
);

INSERT INTO guitarplayer (title, body) VALUES ('guitarpage1', 'Body Text 1');
INSERT INTO guitarplayer (title, body) VALUES ('guitarpage2', 'Body Text 2');
INSERT INTO guitarplayer (title, body) VALUES ('guitarpage3', 'Body Text 3');



-- command line run outside of psql
-- psql -d blog -f seed.sql
-- inside psql run
-- \c blog
-- you should now be connected to database "blog"
-- run to view database
-- SELECT * FROM post;

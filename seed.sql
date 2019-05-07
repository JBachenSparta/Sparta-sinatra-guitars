-- 1
DROP TABLE IF EXISTS guitartable;

-- lower case for table name
CREATE TABLE guitartable (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT
);

                                     -- must be single quotes
INSERT INTO guitartable (title, body) VALUES ('Gibson Les Paul', 'Description of Gibson Les Paul');
INSERT INTO guitartable (title, body) VALUES ('Gibson SG', 'Description of Gibson SG');
INSERT INTO guitartable (title, body) VALUES ('Fender Telecaster', 'Description of Fender Telecaster');
INSERT INTO guitartable (title, body) VALUES ('Fender Stratocaster', 'Description of Fender Stratocaster');
INSERT INTO guitartable (title, body) VALUES ('PRS Silver Sky', 'Description of PRS Silver Sky');

DROP TABLE IF EXISTS guitarplayer;

CREATE TABLE guitarplayer (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT
);

INSERT INTO guitarplayer (title, body) VALUES ('Slash', 'The lead guitarist from the band Guns n Roses, he is known for playing a Gibson Les Paul');
INSERT INTO guitarplayer (title, body) VALUES ('David Gilmore', 'The lead guitarist from the band Pink Floyd, he is famous for his black Fender Stratocaster');
INSERT INTO guitarplayer (title, body) VALUES ('Angus Young', 'The lead guitarist for AC/DC, he is known for playing a Gibson SG');

DROP TABLE IF EXISTS bookstable;

CREATE TABLE bookstable (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  author TEXT
);

INSERT INTO bookstable (title, author) VALUES ('Ninteen Eighty-Four', 'G Orwell');
INSERT INTO bookstable (title, author) VALUES ('The Hobbit', 'J R R Tolkien');
INSERT INTO bookstable (title, author) VALUES ('Moby Dick', 'H Melville');
INSERT INTO bookstable (title, author) VALUES ('Animal Farm', 'G Orwell');
INSERT INTO bookstable (title, author) VALUES ('The Silmarillion', 'J R R Tolkien');
INSERT INTO bookstable (title, author) VALUES ('White Jacket', 'H Melville');


DROP TABLE IF EXISTS bookscomparetable;

CREATE TABLE bookscomparetable (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  author TEXT
);





-- command line run outside of psql
-- psql -d guitarpage -f seed.sql
-- inside psql run
-- \c blog
-- you should now be connected to database "blog"
-- run to view database
-- SELECT * FROM post;

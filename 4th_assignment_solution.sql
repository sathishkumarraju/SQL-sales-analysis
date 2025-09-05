-- Create and use the database
CREATE DATABASE movies_db;
USE movies_db;

-- Create Movies table
CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255)
);

-- Create MovieTheaters table
CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,
  FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

-- Insert data into Movies
INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);

-- Insert data into MovieTheaters
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);

SELECT Title FROM Movies;

SELECT DISTINCT Rating FROM Movies;

SELECT * FROM Movies
WHERE Rating IS NULL;

SELECT * FROM MovieTheaters
WHERE Movie IS NULL;

SELECT mt.*, m.*
FROM MovieTheaters mt
LEFT JOIN Movies m ON mt.Movie = m.Code;

SELECT m.*, mt.*
FROM Movies m
LEFT JOIN MovieTheaters mt ON m.Code = mt.Movie;

SELECT Title
FROM Movies
WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Movie IS NOT NULL);

INSERT INTO Movies (Title, Rating)
VALUES ('One, Two, Three', NULL);

UPDATE Movies
SET Rating = 'G'
WHERE Rating IS NULL;

DELETE FROM MovieTheaters
WHERE Movie IN (
    SELECT Code FROM Movies WHERE Rating = 'NC-17'
);

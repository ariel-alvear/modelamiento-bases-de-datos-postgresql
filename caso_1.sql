CREATE DATABASE movies;

CREATE TABLE movies_table(
    id INT,
    movie VARCHAR(200),
    release_year INT,
    movie_director VARCHAR(50),
    PRIMARY KEY (id)
);
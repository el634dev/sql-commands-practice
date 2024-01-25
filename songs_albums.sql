/*
 * Create a table called 'songs' that has the following fields:
 * - id - integer, primary key
 * - name - string
 * - album_id - foreign key
 * 
 * Note that album - song is a one-to-many relationship, so no bridge table is needed.
 */

CREATE TABLE Songs (
    id INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(70) NOT NULL, --Text
    FOREIGN KEY (album_id) REFERENCES Album(id)
)

-- Table called Albums
CREATE TABLE Albums (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(70) NOT NULL,
    artist VARCHAR(70) NOT NULL,
    year_published INTEGER NOT NULL
);

/* 
 * Insert at least 4 rows of data into the songs table. You can change up the albums as well. :)
 */
 
 INSERT INTO Songs 
    (id, name, album_id)
VALUES
    (1, 'Come Together', 2);
    (2, 'Hotel California', 3);
    (3, 'Born in the U.S.A', 4);
    (4, 'Glory Days', 4);

 -- Insert data into Albums
INSERT INTO Albums
    (name, artist, year_published)
VALUES
    ('The Dark Side of the Moon', 'Pink Floyd', 1973),
    ('Abbey Road', 'The Beatles', 1969),
    ('Hotel California', 'Eagles', 1976),
    ('Born in the U.S.A.', 'Bruce Springsteen', 1984),
    ('California', 'Blink-182', 2016)
;

/* Required to get result in column format */
.headers on
.mode column


/* Queries */
--SELECT * FROM Songs;
SELECT * FROM Albums;

/* 
 * Write a table join query to construct a table of Song Name : Album Name
 */
SELECT Songs.name, Albums.name
FROM Songs, Album
JOIN Albums ON Songs.album_id = Albums.id;

/*
 * Find all albums published between 1970 and 1980.
 */
SELECT *
FROM Albums
WHERE year_published BETWEEN 1970 AND 1980;

/*
 * Find all songs on albums published between 1970 and 1980. 
 *(Hint: Use a table join.)
 */
 SELECT name
 FROM Albums
 JOIN Albums ON Songs.album_id = Albums.id 
 WHERE year_published BETWEEN 1970 AND 1980;

/*
 * Find all songs on albums with names containing 'California'.
 */
SELECT name
FROM Albums
WHERE name LIKE '%Caliornia%';
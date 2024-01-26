/*
 * Create a table called 'songs' that has the following fields:
 * - id - integer, primary key
 * - name - string
 * - album_id - foreign key
 * 
 * Note that album - song is a one-to-many relationship, so no bridge table is needed.
 */

CREATE TABLE Songs(
    song_id INTEGER PRIMARY KEY,
    song_name VARCHAR(70) NOT NULL UNIQUE,
    album_id INTEGER,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

-- Table called Albums
CREATE TABLE Albums(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    album_name VARCHAR(70) NOT NULL,
    artist VARCHAR(70) NOT NULL,
    year_published INTEGER NOT NULL
);

/* 
 * Insert at least 4 rows of data into the songs table. You can change up the albums as well. :)
 */
 
 INSERT INTO Songs 
    (song_name, album_id)
VALUES
    ('Time', 1),
    ('Come Together', 2),
    ('Hotel California', 3),
    ('Glory Days', 4),
    ('182', 5);

-- Insert data into Albums
INSERT INTO Albums
    (album_name, artist, year_published)
VALUES
    ('The Dark Side of the Moon', 'Pink Floyd', 1973),
    ('Abbey Road', 'The Beatles', 1969),
    ('Hotel California', 'Eagles', 1976),
    ('Born in the U.S.A.', 'Bruce Springsteen', 1984),
    ('California', 'Blink-182', 2016);

/* Required to get result in column format */
.headers on
.mode column

/* Queries */
/* Commented out for readiblity in the Command Line */
-- SELECT * FROM Songs;
-- SELECT * FROM Albums;

/* 
 * Write a table join query to construct a table of Song Name : Album Name
 */
SELECT song_name, album_name
FROM Songs
JOIN Albums ON Songs.album_id = Albums.id;

/*
 * Find all albums published between 1970 and 1980.
 */
SELECT album_name, year_published
FROM Albums
WHERE year_published BETWEEN 1970 AND 1980;

/*
 * Find all songs on albums published between 1970 and 1980. 
 *(Hint: Use a table join.)
 */
SELECT song_name, album_name, year_published
FROM Albums
JOIN Songs ON Songs.album_id = Albums.id
WHERE year_published BETWEEN 1970 AND 1980;

/*
 * Find all songs on albums with names containing 'California'.
 */
SELECT song_name
FROM Albums
JOIN Songs ON Songs.album_id = Albums.id
WHERE album_name LIKE '%California%';
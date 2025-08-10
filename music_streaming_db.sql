-- Create Database
CREATE DATABASE MusicStreamingDB;
USE MusicStreamingDB;

-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    country VARCHAR(50)
);

-- Artists Table
CREATE TABLE Artists (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(50),
    country VARCHAR(50)
);

-- Songs Table
CREATE TABLE Songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    artist_id INT,
    genre VARCHAR(30),
    streams INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

--Data
INSERT INTO Users (name, country) VALUES
('David', 'Canada'),
('Emma', 'Australia'),
('Farhan', 'Pakistan'),
('Grace', 'USA');

-- More Artists
INSERT INTO Artists (artist_name, country) VALUES
('Shawn Mendes', 'Canada'),
('Billie Eilish', 'USA'),
('Atif Aslam', 'Pakistan'),
('Tones and I', 'Australia');

-- More Songs
INSERT INTO Songs (title, artist_id, genre, streams) VALUES
-- Existing ones already inserted above
('Señorita', 4, 'Pop', 7200000),          -- Shawn Mendes
('Bad Guy', 5, 'Electropop', 9500000),    -- Billie Eilish
('Peaches', 4, 'R&B', 5300000),           -- Shawn Mendes (hypothetical)
('Dil Diyan Gallan', 7, 'Romantic', 3900000), -- Atif Aslam
('Jeene Laga Hoon', 7, 'Romantic', 3200000),  -- Atif Aslam
('Dance Monkey', 8, 'Pop', 8800000),      -- Tones and I
('Lovely', 5, 'Pop', 6100000),            -- Billie Eilish
('Faded', 5, 'Electronic', 7900000),      -- Billie Eilish (hypothetical)
('Blinding Lights', 4, 'Pop', 10300000);  -- Shawn Mendes (hypothetical)


--Queries
--Top artist per country (by total streams)
SELECT country, artist_name, SUM(streams) AS total_streams
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
GROUP BY country, artist_name
ORDER BY country, total_streams DESC;
This shows each country’s artists with their total streams.

--Average streams per genre
SELECT genre, ROUND(AVG(streams), 0) AS avg_streams
FROM Songs
GROUP BY genre
ORDER BY avg_streams DESC;
This tells which genre performs better on average.

--Most popular genre overall
SELECT genre, SUM(streams) AS total_streams
FROM Songs
GROUP BY genre
ORDER BY total_streams DESC
LIMIT 1;
Shows the single genre with the highest total streams.

--List songs above average streams
SELECT title, streams
FROM Songs
WHERE streams > (SELECT AVG(streams) FROM Songs);
Finds songs that are more popular than average.

--Artist with the most songs in the database
SELECT a.artist_name, COUNT(s.song_id) AS song_count
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
GROUP BY a.artist_name
ORDER BY song_count DESC
LIMIT 1;

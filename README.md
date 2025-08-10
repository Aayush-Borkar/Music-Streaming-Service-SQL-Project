🎵 Music Streaming Service Database
📌 Overview
This project is a SQL-based database designed to simulate a music streaming platform like Spotify or Apple Music.
It contains Users, Artists, Songs, Playlists, and PlaylistSongs tables, along with sample data and queries to generate insights.

🗂 Database Schema
The database includes:
Users – Stores listener information.
Artists – Stores artist details.
Songs – Stores song details with artist reference.
Playlists – Stores playlists created by users.
PlaylistSongs – Links songs to playlists.

🛠 Technologies Used
SQL (MySQL / PostgreSQL compatible)
Any SQL client (MySQL Workbench, DBeaver, pgAdmin, etc.)


📊 Example Queries
Here are some simple insight queries you can run:

-- 1. List all songs and their artists
SELECT s.title, a.artist_name 
FROM Songs s 
JOIN Artists a ON s.artist_id = a.artist_id;

-- 2. Count how many songs are in each genre
SELECT genre, COUNT(*) AS song_count 
FROM Songs 
GROUP BY genre;

-- 3. Find the most streamed song
SELECT title, streams 
FROM Songs 
ORDER BY streams DESC 
LIMIT 1;

-- 4. List all playlists created by a user
SELECT p.playlist_name 
FROM Playlists p 
JOIN Users u ON p.user_id = u.user_id 
WHERE u.name = 'Alice';

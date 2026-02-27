## DV1703-Database-Notefy
- Project in Database course
Johan Granli Larsson & Adam Visanji 

2026-02-18 Created repo and made it accsessable to the group. A.V  
2026-02-20 Created the 2 first tables Genre/Chord J.G.L  
2026-02-20 Created two more tables for Song and User A.V
2026-02-23 Created two more tables for SongChords and UserFavorites A.V
2026-02-23 Created a now file called data.py and began inserting some simple testData J.G.L
2026-02-23 Moved get_connection to database file and imported into data and setup_db A.V
2026-02-23 Fixed data and setup_dp to get it working A.V
2026-02-23 created testdate for songs J.G.L
2026-02-24 Fixed issue of duplicates in Songs by adding artist and making title+artist combo UNIQUE. First function made to get all songs.
2026-02-24 Created api-endpoints for songs and filtered songs by genre/difficulty and created the function get_filtered_genre_difficulty J.G.L
2024-02-24 Got HTML index working and filter by boxes to mark. made some changes to api endpoint and filter function. 
2024-02-27 Generated a list of songs to a csv file and imported it to our songs table throuh a new p-function where we match genre name and get the genre id to get the propper information to Songs" A.V
#TODO Add all Chords to chords table, add more genres ea. Punk and correct those songs in csv file
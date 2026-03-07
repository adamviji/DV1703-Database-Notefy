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

2026-02-24 Fixed issue of duplicates in Songs by adding artist and making title+artist combo UNIQUE. First function made to get all songs. A.V

2026-02-24 Created api-endpoints for songs and filtered songs by genre/difficulty and created the function get_filtered_genre_difficulty J.G.L

2026-02-24 Got HTML index working and filter by boxes to mark. made some changes to api endpoint and filter function. A.V

2026-02-27 Generated a list of songs to a csv file and imported it to our songs table throuh a new p-function where we match genre name and get the genre id to get the propper information to Songs" A.V

2026-03-02 Created 2 new functions for filtering only artists and titles. Also set up 2 endpoints in main. Also created one file (api.http) to be able to test our api with needing a website. J.G.L

2026-03-04 artists and html added, going to start working on Users and loggin. A.V

2026-03-04 Changed all chords to look better and more accurate. J.G.L

2026-03-04 Made user database and registration possible, had a video to help me for this. 
https://www.youtube.com/watch?v=ac4p2jelZdk
works after some trouble with missmatching passlib and bcrypt A.V

2026-03-04 Updated CSV file to match our new chords. J.G.L 

2026-03-04 added dummy users to test our database. and be able to create user favourite. J.G.L

2026-03-04 Created 3 functions for handling user favorites and created 3 api endpoints for the website using one join function to get one specific users favorites J.G.L

2026-03-04 Did some fixing up and created buttons to add/remove favorites, had some error handeling to implement and fix but all up and running in the end. A.V

2026-03-07 html fixes and created a procedure to search on title or artist A.V

#TODO Add all Chords to chords table, add more genres ea. Punk and correct those songs in csv file

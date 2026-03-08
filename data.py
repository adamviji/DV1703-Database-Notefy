import os
import csv
from dotenv import load_dotenv
from src.database import get_connection, pwd_context

def data_genres(conn):
    cursor = conn.cursor()
    genres = [
        ("Classic Rock", "A high-energy, amplified sound centered on the electric guitar, bass guitar, and drums, typically featuring a 4/4 time signature with a strong,, backbeat-driven rhythm"),
        ("Pop", "Mainstream music made for a broad audience"),
        ("Jazz", "Jazz is a 20th-century American musical art form originating in New Orleans, characterized by improvisation, syncopated rhythms, swing notes, and complex harmonies"),
        ("Country", "American folk music"),
        ("R&B", "Rhymes and beats usually slow paced"),
        ("Indie", " Indie music is a genre rooted in independent production, known for its creative freedom, authentic style, and often guitar-driven, introspective sound. "),
        ("Hard Rock", " A subgenre of rock music characterized by heavy guitar riffs, strong rhythms, powerful vocals, and a high-energy, aggressive sound. "),
        ("Metal", " a heavy and intense genre of rock music defined by distorted guitars, powerful drumming, aggressive vocals, and a dark, high-energy sound. ")
    ]
    cursor.executemany(
        "INSERT IGNORE INTO Genre(Name, Description) VALUES (%s, %s)", genres
    )
    conn.commit()
    cursor.close()
    print("Genres added")

def data_songs(conn):
    cursor = conn.cursor()
    songs = [
        ("Paranoid", "Black Sabbath", 1, "Em", "Intermediate", 1970),
        ("Smoke on the Water", "Deep Purple", 1, "Gm", "Beginner", 1973),
        ("Eye of the tiger", "Survivor", 1, "C", "Beginner", 1982),
        ("Let her go", "Passenger", 2, "G", "Beginner", 2012),
        ("Take me home Country Roads", "John Denver", 4, "G", "Beginner", 1971),
        ("Autumn Leaves", "Nat King Cole", 3, "Am", "Intermediate", 1945),
        ("Fallin", "Alicia Keys", 5, "Em", "Intermediate", 2001),
        ("Snow(Hey oh!)", "Red Hot Chilli Peppers", 1, "G#m", "Advanced", 2006)
    ]
    cursor.executemany(
        """
        INSERT IGNORE INTO Song (Title, Artist, Genre_ID, original_key, difficulty, year)
        VALUES (%s, %s, %s, %s, %s, %s)
        """,
        songs,
    )
    conn.commit()
    cursor.close()
    print("Songs added")

def data_users(conn):
    cursor = conn.cursor()
    users = [
        ("Adam", "Adam@mail.com", pwd_context.hash("password123")),
        ("Johan", "Johan@mail.com", pwd_context.hash("password123")),
        ("Gusav", "Gustav@mail.com", pwd_context.hash("password123")),
        ("Emil", "Emil@mail.com", pwd_context.hash("password123")),
        ("Ludvig", "Ludvig@mail.com", pwd_context.hash("password123")),
    ]
    cursor.executemany(
        """
        INSERT IGNORE INTO User (username, Email, password_hash)
        VALUES(%s, %s, %s)
        """,
        users
    )
    conn.commit()
    cursor.close()
    print("Users added")

def import_songs_from_csv(conn, filepath):
    cursor = conn.cursor(dictionary=True)
    with open(filepath, newline='', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            #Hämta Genre_ID baserat på genre-namn
            cursor.execute(
                "SELECT Genre_ID FROM Genre WHERE Name = %s", (row['Genre'],))
            genre = cursor.fetchone()

            if genre:
                genre_id = genre['Genre_ID']
            else:
                print(f"Genre '{row['Genre']}' was not found, skipping {row['Title']}")
                continue
            #lägger till låten i Song
            cursor.execute(
                """
                INSERT IGNORE INTO Song (Title, Artist, Genre_ID, original_key, difficulty, year)
                VALUES (%s, %s, %s, %s, %s, %s)
                """,
                (row['Title'], row['Artist'], genre_id, row['Key'], row['Difficulty'], row['Year'])
            )

            # Hämta song_id för den inlaggda låten i song
            cursor.execute(
                "SELECT Song_ID FROM Song WHERE Title = %s AND Artist = %s", (row['Title'], row['Artist'],)
                )
            song = cursor.fetchone()
            if not song:
                continue
            song_id = song["Song_ID"]

            # Hantera Chords
            chords = row["Chords"].split(":")
            for chord_name in chords:
                chord_name = chord_name.strip()
                if not chord_name:
                    continue

                # Lägg in Chords om de inte finns
                cursor.execute(
                    "INSERT IGNORE INTO Chord (Name) VALUES (%s)", (chord_name, )
                )
                # Hämta Chord_ID
                cursor.execute(
                    "SELECT Chord_ID FROM Chord WHERE  Name = %s", (chord_name,)
                )
                chords = cursor.fetchone()
                if not chords:
                    continue
                chord_id = chords["Chord_ID"]

                # Koppla SongChords song+chord
                cursor.execute(
                    "INSERT IGNORE INTO SongChords (Song_ID, Chord_ID) VALUES (%s, %s)", (song_id, chord_id,)
                )
        conn.commit()
        cursor.close()
        print("CSV imported!")

if __name__ == "__main__":
    conn = get_connection()
    data_genres(conn)
    # data_chords(conn)
    data_songs(conn)
    data_users(conn)
    import_songs_from_csv(conn, "songs_200_with_chords.csv")
    conn.close()
    print("Data Added!")
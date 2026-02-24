import os
from dotenv import load_dotenv
from src.database import get_connection

def data_genres(conn):
    cursor = conn.cursor()
    genres = [
        ("Rock", "a high-energy, amplified sound centered on the electric guitar, bass guitar, and drums, typically featuring a 4/4 time signature with a strong,, backbeat-driven rhythm"),
        ("Pop", "Mainstream music made for a broad audience"),
        ("Jazz", "Jazz is a 20th-century American musical art form originating in New Orleans, characterized by improvisation, syncopated rhythms, swing notes, and complex harmonies"),
        ("Country", "American folk music"),
        ("RmB", "Rhymes and beats usually slow paced")
    ]
    cursor.executemany(
        "INSERT IGNORE INTO Genre(Name, Description) VALUES (%s, %s)", genres
    )
    conn.commit()
    cursor.close()
    print("Genres added")

def data_chords(conn):
    cursor = conn.cursor()
    chords = [
        ("E",), ("Am",), ("G",), ("D",), ("C",),
        ("A",), ("Em",), ("F",), ("Bm",), ("B",),
    ]
    cursor.executemany(
        "INSERT IGNORE INTO Chord (Name) VALUES (%s)", chords
        )
    conn.commit()
    cursor.close()
    print("Chords added")


def data_songs(conn):
    cursor = conn.cursor()
    songs = [
        ("Paranoid", "Black Sabbath", 1, "E minor", "Intermediate", 1970),
        ("Smoke on the Water", "Deep Purple", 1, "G Minor", "Beginner", 1973),
        ("Eye of the tiger", "Survivor", 1, "C", "Beginner", 1982),
        ("Let her go", "Passenger", 2, "G", "Beginner", 2012),
        ("Take me home Country Roads", "John Denver", 4, "G", "Beginner", 1971),
        ("Autumn Leaves", "Nat King Cole", 3, "Am", "Intermediate", 1945),
        ("Fallin", "Alicia Keys", 5, "E minor", "Intermediate", 2001),
        ("Snow(Hey oh!)", "Red Hot Chilli Peppers", 1, "G# minor", "Advanced", 2001)
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



if __name__ == "__main__":
    conn = get_connection()
    data_genres(conn)
    data_chords(conn)
    data_songs(conn)
    conn.close()
    print("Data Added!")
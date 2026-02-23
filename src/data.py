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
    cursor.commit()
    print("Genres is added")
def data_chords(conn):


def data_songs(conn):

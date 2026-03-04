import os
import mysql.connector
from passlib.context import CryptContext
from dotenv import load_dotenv

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

load_dotenv()

DB_NAME = "notefy_db"

    

def get_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=int(os.getenv("DB_PORT", "3306")),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=DB_NAME,
    )

def create_user(username, email, password):
    conn = get_connection()
    cursor = conn.cursor()
    password_hash = pwd_context.hash(password)
    cursor.execute(
        "INSERT INTO User (Username, Email, Password_hash) VALUES(%s, %s, %s)", 
        (username, email, password_hash)
    )
    conn.commit()
    cursor.close()
    conn.close()

def get_user(username):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM User WHERE Username = %s", (username,))
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result

def verify_password(plain_password, hashed_password):
    return pwd_context.verify(plain_password, hashed_password)

def add_favourites(user_id, song_id):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        """INSERT IGNORE INTO UserFavorite (User_ID, Song_ID)
        VALUES(%s, %s)
        """,
        (user_id, song_id)
    )
    conn.commit()
    cursor.close
    conn.close()

def remove_favourites(user_id, song_id):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "DELETE FROM UserFavorite WHERE User_ID = %s AND Song_ID = %s",
        (user_id, song_id)
    )
    conn.commit()
    cursor.close
    conn.close()

def get_user_favorites(user_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        """
        SELECT Song.* FROM Song
        JOIN UserInterface On Song_ID = UserFavourite.Song_ID
        WHERE UserFavorite.User_ID = %s
        """,
        (user_id,)
    )
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result


def get_all_songs():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Song")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result

def get_all_genres():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Genre")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result

def get_all_artists():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT DISTINCT Artist FROM Song ORDER BY Artist")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result

def get_songs_by_artists(artist):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Song WHERE Artist = %s", (artist,))
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result

def get_all_titles():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT Title from Song")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result

# EX SELECT * FROM Song WHERE 1=1 AND Genre_ID IN (1, 3) AND difficulty IN ('beginner', 'intermediate')
def get_filtered_genre_difficulty(genre_ID = None, difficulty = None):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    query = "SELECT * FROM Song WHERE 1=1"
    params = []

    if genre_ID:
        placeholders = ", ".join(["%s"] * len(genre_ID))
        query += f" AND Genre_ID IN ({placeholders})"
        params.extend(genre_ID)

    if difficulty:
        placeholders = ", ".join(["%s"] * len(difficulty))
        query += f" AND difficulty IN ({placeholders})"
        params.extend(difficulty)

    cursor.execute(query, params if params else None)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result
import os
import mysql.connector
from dotenv import load_dotenv

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
    cursor.execute("SELECT Artist FROM Song")
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
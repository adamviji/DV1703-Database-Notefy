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

def get_filtered_genre_difficulty(genre_ID = None, difficulty = None):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    query = "SELECT * FROM Song WHERE 1=1"
    params = []
    if genre_ID:
        query += " AND Genre_ID = %s"
        params.append(genre_ID)

    if difficulty:
        query += " AND difficulty = %s"
        params.append(difficulty)
    cursor.execute(query, params)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result
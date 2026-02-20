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
    )


def init_db(conn):
    cursor = conn.cursor()
    cursor.execute(
        f"CREATE DATABASE IF NOT EXISTS `{DB_NAME}` "
        "CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
    )
    cursor.execute(f"USE `{DB_NAME}`")
    cursor.close()

def init_schema(conn) -> None:
    cursor = conn.cursor()
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Genre (
            Genre_ID INT AUTO_INCREMENT PRIMARY KEY,
            Name VARCHAR(100) NOT NULL,
            Description VARCHAR(255)
        )
        """
    )
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Chord (
            Chord_ID INT AUTO_INCREMENT PRIMARY KEY,
            Name VARCHAR(55) NOT NULL 
        )
        """
    )
    cursor.execute(
        """
    CREATE TABLE IF NOT EXISTS User (
        User_ID INT AUTO_INCREMENT PRIMARY KEY,
        Username VARCHAR(55) NOT NULL UNIQUE,
        Email VARCHAR(255) NOT NULL UNIQUE,
        password_hash VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    """
    )
    cursor.execute(
        """
    CREATE TABLE IF NOT EXISTS Song (
        Song_ID INT AUTO_INCREMENT PRIMARY KEY,
        Title VARCHAR(255) NOT NULL,
        Genre_ID INT,
        original_key VARCHAR(255),
        difficulty ENUM('beginner', 'intermediate', 'advanced') NOT NULL,
        year INT,
        FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID)
    )
    """
    )
    conn.commit()
    cursor.close()
    print("Table är skapade!")


if __name__ == "__main__":
    conn = get_connection()
    init_db(conn)
    init_schema(conn)
    conn.close()
    print("Uppkoppling lyckades och databasen är skapad!")

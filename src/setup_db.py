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


if __name__ == "__main__":
    conn = get_connection()
    init_db(conn)
    conn.close()
    print("Uppkoppling lyckades och databasen är skapad!")

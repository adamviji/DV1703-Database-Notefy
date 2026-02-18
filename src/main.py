import os
from dotenv import load_dotenv
import mysql.connector

DB_NAME = "notefy_db"


def get_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=int(os.getenv("DB_PORT", "3306")),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
    )


def init_db(conn, db_name: str) -> None:
    cur = conn.cursor()

    cur.execute(
        f"CREATE DATABASE IF NOT EXISTS {db_name} "
        "CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
    )
    cur.execute(f"USE {db_name}")

    cur.close()

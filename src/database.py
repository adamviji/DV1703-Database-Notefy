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

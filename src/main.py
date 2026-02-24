from fastapi import FastAPI
from src.database import get_all_songs, get_filtered_genre_difficulty
# to run 
# uvicorn src.main:app --reload
app = FastAPI()


@app.get("/")
def root():
    return {"message": "Welcome to Notefy API!"}

@app.get("/songs")
def get_songs():
    return get_all_songs()

@app.get("/filtered_songs")
def get_filtered_songs(genre_ID = None, difficulty = None):
    return get_filtered_genre_difficulty(genre_ID, difficulty)
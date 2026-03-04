from fastapi import FastAPI
from src.database import (
    get_all_songs,
    get_filtered_genre_difficulty,
    get_all_genres,
    get_all_artists,
    get_all_titles,
    get_songs_by_artists,
)
from fastapi.staticfiles import StaticFiles


# to run 
# uvicorn src.main:app --reload
app = FastAPI()

app.mount("/static", StaticFiles(directory="src/static"), name="static")

@app.get("/")
def root():
    return {"message": "Welcome to Notefy API!"}

@app.get("/songs")
def get_songs():
    return get_all_songs()

@app.get("/genres")
def get_genres():
    return get_all_genres()

@app.get("/artists")
def get_artist():
    return get_all_artists()

@app.get("/titles")
def get_titles():
    return get_all_titles()

@app.get("/artists/{artist}/songs")
def get_artist_songs(artist: str):
    return get_songs_by_artists(artist)

@app.get("/songs/filter")
def filter_songs(genre_ids: str = None, difficulties: str = None):
    genre_list = [int(g) for g in genre_ids.split(",")] if genre_ids else None
    difficulty_list = difficulties.split(",") if difficulties else None
    return get_filtered_genre_difficulty(genre_list, difficulty_list)
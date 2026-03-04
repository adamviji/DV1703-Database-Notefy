from fastapi import FastAPI
from fastapi import HTTPException
from pydantic import BaseModel
from fastapi.staticfiles import StaticFiles
from src.database import (
    get_all_songs,
    get_filtered_genre_difficulty,
    get_all_genres,
    get_all_artists,
    get_all_titles,
    get_songs_by_artists,
    create_user,
    get_user,
    verify_password,
    add_favourites,
    remove_favourites,
    get_user_favorites
)


# pip install -r requirements.txt
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

#User reg and login

class UserRegister(BaseModel):
    username: str
    email: str
    password: str

class UserLogin(BaseModel):
    username: str
    password: str

class FavoriteRequest(BaseModel):
    user_id: int
    song_id: int

@app.post("/register")
def register(user: UserRegister):
    existing = get_user(user.username)
    if existing:
        raise HTTPException(status_code=400, detail="Username already exists")
    create_user(user.username, user.email, user.password)
    return {"message": "User created successfully"}

@app.post("/login")
def login(user: UserLogin):
    try:
        db_user = get_user(user.username)
        if not db_user or not verify_password(user.password, db_user["password_hash"]):
            raise HTTPException(status_code=401, detail="Invalid username or password")
        return {"message": "Login successful", "user_id": db_user["User_ID"]}
    except HTTPException:
        raise
    except Exception as e:
        print(f"Login error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

#Favorites

@app.post("/favorites")
def add_favorite_ep(req: FavoriteRequest):
    try:
        add_favourites(req.user_id, req.song_id)
        return {"message": "Favorite added"}
    except Exception as e:
        print(f"Favorite error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.delete("/favorites")
def remove_favorite_ep(req: FavoriteRequest):
    remove_favourites(req.user_id, req.song_id)
    return{"message": "Favorite removed"}

@app.get("/favorites/{user_id}")
def get_favorites_endpoint(user_id: int):
    try:
        return get_user_favorites(user_id)
    except Exception as e:
        print(f"Get favorites error: {e}")
        raise HTTPException(status_code=500, detail=str(e))
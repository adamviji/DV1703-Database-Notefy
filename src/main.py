from fastapi import FastAPI
# to run 
# uvicorn src.main:app --reload
app = FastAPI()


@app.get("/")
def root():
    return {"message": "Välkommen till Notefy API!"}

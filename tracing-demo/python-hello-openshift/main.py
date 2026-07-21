from fastapi import FastAPI

app = FastAPI()

@app.get("/ping", tags=["ping"])
async def ping():
    return {"message":"pong"}


@app.get("/users/", tags=["users"])
async def read_users():
    return [{"username": "Rick"}, {"username": "Morty"}]


@app.get("/users/me", tags=["users"])
async def read_user_me():
    return {"username": "fakecurrentuser"}


@app.get("/users/{username}", tags=["users"])
async def read_user(username: str):
    return {"username": username}
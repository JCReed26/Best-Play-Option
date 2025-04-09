from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import json



app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Stub data as JSON
PLAYERS_JSON = json.dumps([
    {"id": 1, "name": "Tom Brady", "position": "QB"},
    {"id": 2, "name": "Patrick Mahomes", "position": "QB"},
    {"id": 3, "name": "Travis Kelce", "position": "TE"}
])

@app.get("/")
async def read_root():
    return JSONResponse(
        content={"message": "Hello World from FastAPI!"},
        media_type="application/json"
    )

@app.get("/players")
async def read_players():
    return JSONResponse(
        content=json.loads(PLAYERS_JSON),
        media_type="application/json"
    )

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)

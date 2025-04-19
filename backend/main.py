from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import json
from simulation.game2_sim import GameSimulation  # New simulation class

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Game instance and stub testing data
game_instance = None
PLAYERS_JSON = json.dumps([
    {"id": 1, "name": "Tom Brady", "position": "QB"},
    {"id": 2, "name": "Patrick Mahomes", "position": "QB"},
    {"id": 3, "name": "Travis Kelce", "position": "TE"}
])

input_json = {
    "OffenseTeam": "DET",
    "DefenseTeam": "GB",
    "Quarter": 3,
    "YardLine": 70,
    "Down": 3, 
    "ToGo": 4,
    "Minute": 12,
    "Second": 7  
}
        

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

from pydantic import BaseModel

class GameInput(BaseModel):
    OffenseTeam: str
    DefenseTeam: str 
    Quarter: int
    YardLine: int
    Down: int
    ToGo: int
    Minute: int
    Second: int

@app.post("/get-predictions")
async def get_predictions(input_data: GameInput):
    global game_instance
    try:
        if not game_instance:
            # create game and set offense and defense
            game_instance = GameSimulation()
            game_instance.offense = input_data.OffenseTeam
            game_instance.defense = input_data.DefenseTeam
            
            prediction = game_instance.get_model_prediction()
            return JSONResponse(
                content=prediction,
                media_type="application/json"
            )

        response = game_instance.next_iteration_handler(input_data.dict())
        return JSONResponse(
            content=response,
            media_type="application/json"
        )
    except Exception as e:
        return JSONResponse(
            status_code=500,
            content={"error": str(e)},
            media_type="application/json"
        )


@app.post("/end-game")
async def end_game():
    global game_instance
    game_instance = None
    return {"status": "game_ended"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)

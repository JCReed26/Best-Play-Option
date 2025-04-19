from fastapi import FastAPI, APIRouter
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import json
from simulation.game2_sim import GameSimulation  # New simulation class

app = FastAPI()
router = APIRouter()

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
        

@router.get("/")
async def read_root():
    return JSONResponse(
        content={"message": "Hello World from FastAPI!"},
        media_type="application/json"
    )

@router.get("/players")
async def read_players():
    return JSONResponse(
        content=json.loads(PLAYERS_JSON),
        media_type="application/json"
    )

from pydantic import BaseModel

class GameInput(BaseModel):
    offense: str = "DET"
    defense: str = "SF"
    quarters: int = 4
    quarter_time: int = 900  # 15*60 seconds
    current_quarter: int = 1
    game_clock: int = 900
    play_data: list = []
    running: bool = True
    user_input: dict = None
    prediction: dict = None

@router.post("/get-predictions", response_model=GameInput)
async def get_predictions(input_data: GameInput):
    print("get-predictions")
    print("input data", input_data)
    global game_instance
    try:
        if not game_instance:
            print("new-game-starting")
            # create game and set offense and defense
            game_instance = GameSimulation()
            game_instance.offense = input_data.offense
            game_instance.defense = input_data.defense
            
            result = input_data.dict()
            result["prediction"] = game_instance.get_model_prediction()
            return result 
            
        # just return game state here 
        print("starting-next-input->prediction")
        game_instance.next_iteration_handler(input_data.dict())
        return game_instance
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
    app.include_router(router)
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)

from fastapi import FastAPI, APIRouter
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from fastapi.middleware.cors import CORSMiddleware
import json
import asyncpg
import os
from fastapi import Depends, Query, HTTPException
from simulation.game2_sim import GameSimulation  

import logging 
logger = logging.getLogger(__name__)

app = FastAPI()
router = APIRouter()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

game_instance = None

async def get_db():
    return await asyncpg.connect(
        user="postgres",
        password="postgres_password",
        database="BPO",
        host="localhost"
    )

def load_sql_query(filename: str) -> str:
    filepath = os.path.join(os.path.dirname(__file__), "get_players.sql")
    with open(filepath, 'r') as f:
        return f.read()

@router.get("/players")
async def read_players(team_name: str, db=Depends(get_db)):
    try:
        query = load_sql_query() 
        rows = await db.fetch(query, team_name)

        if not rows:
            raise HTTPException(status_code=404, detail="No players found for the specified team")
        
        players = [{"name": row["player_name"], "position": row["position"]} for row in rows]

        return JSONResponse(content=players)
    
    except Exception as e:
        logger.error("Error fetching players", exc_info=True)
        raise HTTPException(status_code=500, detail="Internal Server Error")
    
    finally:
        await db.close()

@router.get("/")
async def read_root():
    return JSONResponse(
        content={"message": "Hello World from FastAPI!"},
        media_type="application/json"
    )

from pydantic import BaseModel, Field
from typing import Optional, List

class GameInput(BaseModel):
    OffenseTeam: str = "DET" 
    DefenseTeam: str = "SF"
    quarters: int = 4
    quarter_time: int = 900  # 15*60 seconds
    game_clock: int = 900
    Quarter: int = 1
    YardLine: int = 70
    Down: int = 1
    ToGo: int = 10
    Minute: int = 15
    Second: int = 59
    play_data: List[dict] = Field(default_factory=list) # explicit list
    running: bool = True
    user_input: Optional[dict] = None
    prediction: Optional[dict] = None

@router.post("/get-predictions")
async def get_predictions(input_data: GameInput):
    print("get-predictions")
    print("input data", input_data)
    global game_instance
    try:
        if not game_instance:
            print("new-game-starting")
            # create game and set offense and defense
            game_instance = GameSimulation()
            game_instance.update_state(input_data.dict())
            prediction = game_instance.get_model_predictions()
            print("first pred: ", prediction)
            return JSONResponse(
                content=jsonable_encoder({
                "OffenseTeam": game_instance.OffenseTeam,
                "DefenseTeam": game_instance.DefenseTeam,
                "quarters": game_instance.quarters,
                "quarter_time": game_instance.quarter_time,
                "game_clock": game_instance.game_clock,
                "Quarter": game_instance.Quarter,
                "YardLine": game_instance.YardLine,
                "Down": game_instance.Down,
                "ToGo": game_instance.ToGo,
                "Minute": game_instance.Minute,
                "Second": game_instance.Second,
                "play_data": game_instance.play_data,
                "running": game_instance.running,
                "user_input": game_instance.user_input,
                "prediction": prediction
                }),
                status_code=200,
                media_type="application/json"
            )
        else:
            # just return game state here 
            print("starting-next-input->prediction")
            game_instance.next_iteration_handler(input_data.dict())
            data = {
                "OffenseTeam": game_instance.OffenseTeam,
                "DefenseTeam": game_instance.DefenseTeam,
                "quarters": game_instance.quarters,
                "quarter_time": game_instance.quarter_time,
                "game_clock": game_instance.game_clock,
                "Quarter": game_instance.Quarter,
                "YardLine": game_instance.YardLine,
                "Down": game_instance.Down,
                "ToGo": game_instance.ToGo,
                "Minute": game_instance.Minute,
                "Second": game_instance.Second,
                "play_data": game_instance.play_data,
                "running": game_instance.running,
                "user_input": game_instance.user_input,
                "prediction": game_instance.prediction
            }
            return JSONResponse(
                content = jsonable_encoder(data), status_code=200, media_type="application/json"
            )
    except Exception as e:
        logger.error("prediction error", exc_info=True)
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

app.include_router(router)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)

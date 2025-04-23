from fastapi import FastAPI, APIRouter
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from fastapi.middleware.cors import CORSMiddleware
from simulation.game2_sim import GameSimulation  
import httpx

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

# to the front 
@router.get("/")
async def read_root():
    return JSONResponse(
        content={"message": "Hello World from FastAPI!"},
        media_type="application/json"
    )

# some reason this return 
@router.get("/test-db")
async def test_the_db():
    data = await db_test_db()
    return JSONResponse(
        content=data,
        media_type="application/json"
    )

@router.get("/all-users")
async def get_all_users(): 
    data = await db_all_users()
    return JSONResponse(
        content=data,
        media_type="application/json"
    )


# to the database 
db_url = "http://database:5000/"  # Use Docker service name

async def db_test_db(): 
    try:
        async with httpx.AsyncClient() as client:
            url = f"{db_url}/"
            print("database-url: ", url)
            response = await client.get(url)
            print("database-return: ", response.json())
            return response.json()
    except Exception as e:
        return {"error": str(e)}

async def db_all_users(): 
    try:
        async with httpx.AsyncClient() as client:
            url = f"{db_url}/api/all-users"
            print("database-url: ", url)
            response = await client.get(url)
            print("database-return: ", response.json())
            return response.json()
    except Exception as e:
        return {"error": str(e)}

async def db_aggregate():
    try:
        async with httpx.AsyncClient() as client:
            url = f"{db_url}/api/aggregate"
            print("database-url: ", url)
            response = await client.get(url)
            print("database-return: ", response.json())
            return response.json()
    except Exception as e:
        return {"error": str(e)}
    
async def db_delete_record():
    try:
        async with httpx.AsyncClient() as client:
            url = f"{db_url}/api/delete-record"
            print("database-url: ", url)
            response = await client.get(url)
            print("database-return: ", response.json())
            return response.json()
    except Exception as e:
        return {"error": str(e)}
    
async def db_insert_record():
    try:
        async with httpx.AsyncClient() as client:
            url = f"{db_url}/api/insert-record"
            print("database-url: ", url)
            response = await client.get(url)
            print("database-return: ", response.json())
            return response.json()
    except Exception as e:
        return {"error": str(e)}
    
async def db_join_tables():
    try:
        async with httpx.AsyncClient() as client:
            url = f"{db_url}/api/join-tables"
            print("database-url: ", url)
            response = await client.get(url)
            print("database-return: ", response.json())
            return response.json()
    except Exception as e:
        return {"error": str(e)}
    
async def db_search_print():   
    try:
        async with httpx.AsyncClient() as client:
            url = f"{db_url}/api/search-print"
            print("database-url: ", url)
            response = await client.get(url)
            print("database-return: ", response.json())
            return response.json()
    except Exception as e:
        return {"error": str(e)}
    
async def db_update_record():
    try:
        async with httpx.AsyncClient() as client:
            url = f"{db_url}/api/update-record"
            print("database-url: ", url)
            response = await client.get(url)
            print("database-return: ", response.json())
            return response.json()
    except Exception as e:
        return {"error": str(e)}



# specifically Game-View (this works)

from pydantic import BaseModel, Field
from typing import Optional, List

game_instance = None

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

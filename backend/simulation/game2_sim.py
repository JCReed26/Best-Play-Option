# it has gotten sloppy and messy and needs a redo 
from typing import Dict, List, Optional
import json
import sys
from pathlib import Path
sys.path.append(str(Path(__file__).parent.parent))  # Add project root to path
from simulation.ML.inference_main import get_predictions

class GameSimulation: 

    def __init__(self): 
        self.OffenseTeam = "DET"
        self.DefenseTeam = "SF"
        self.quarters = 4
        self.quarter_time = 15 * 60 #adjustment for minutes 
        self.game_clock = self.quarter_time
        self.Quarter = 1
        self.YardLine = 25
        self.Down = 1
        self.ToGo = 10
        self.Minute = self.game_clock // 60
        self.Second = self.game_clock % 60
        self.play_data = list() # stores play by play to retrain 
        self.running = True
        self.user_input = None
        self.prediction = None

    def print(self):
        print(self.OffenseTeam)
        print(self.DefenseTeam)
        print(self.quarters)
        print(self.quarter_time)
        print(self.game_clock)
        print(self.Quarter)
        print(self.YardLine)       
        print(self.Down)
        print(self.ToGo)
        print(self.Minute)
        print(self.Second)
        print(self.play_data)
        print(self.running)
        print(self.user_input)
        print(self.prediction)

    def update_state(self, new_state):
        for key, value in new_state.items():
            if hasattr(self, key): 
                setattr(self, key, value)

    def get_model_predictions(self):
        # Get predictions using current game state
        input_data = {
            "OffenseTeam": self.OffenseTeam,
            "DefenseTeam": self.DefenseTeam,
            "Quarter": self.Quarter,
            "YardLine": self.YardLine,
            "Down": self.Down,
            "ToGo": self.ToGo,
            "Minute": self.Minute,
            "Second": self.Second
        }
        return get_predictions(input_data)

    def next_iteration_handler(self, input_data):
        # grabs the data from the newStates user input
        # this input will tell how much
        # time passed, yards gained/lost, success/fail
        
        # should set the prediction before sending back

        self.user_input = input_data.get("user_input")
        self.game_clock -= 10
        self.prediction = self.get_model_predictions()
        print("next-iteration", self)
        pass

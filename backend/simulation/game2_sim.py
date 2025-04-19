# it has gotten sloppy and messy and needs a redo 
from typing import Dict, List, Optional
import sys
from pathlib import Path
sys.path.append(str(Path(__file__).parent.parent))  # Add project root to path
from simulation.ML.inference_main import get_predictions

class GameSimulation: 

    def __init__(self): 
        self.offense = "DET"
        self.defense = "SF"
        self.quarters = 4
        self.quarter_time = 15 * 60 #adjustment for minutes 
        self.current_quarter = 1
        self.game_clock = self.quarter_time
        self.play_data = list() # stores play by play to retrain 
        self.running = True
        self.user_input = None
        self.prediction = None

    def print(self):
        print(self.offense)
        print(self.defense)
        print(self.quarters)
        print(self.quarter_time)
        print(self.current_quarter)
        print(self.game_clock)
        print(self.play_data)
        print(self.running)
        print(self.user_input)
        print(self.prediction)

    def get_model_predictions(self):
        # Get predictions using current game state
        input_data = {
            "OffenseTeam": self.offense,
            "DefenseTeam": self.defense,
            "Quarter": self.current_quarter,
            "YardLine": 70,  # TODO: Get actual yard line from game state
            "Down": 3, 
            "ToGo": 4,
            "Minute": self.game_clock // 60,
            "Second": self.game_clock % 60
        }
        return get_predictions(input_data)

    def next_iteration_handler(self, input_data):
        # grabs the data from the newStates user input
        # this input will tell how much
        # time passed, yards gained/lost, success/fail
        self.print()
        print(input_data)
        pass

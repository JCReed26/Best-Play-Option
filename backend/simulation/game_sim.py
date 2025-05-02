# OLD FILE 
# TODO - create new game_sim class 

import asyncio
from typing import Dict, List, Optional
import sys
from pathlib import Path
sys.path.append(str(Path("backend/simulation/ML")))
from ML.inference_main import get_predictions 

class GameSimulation: 

    def __init__(self, startState): 
        self.offense = startState.offense
        self.defense = startState.defense
        self.quarters = 4
        self.quarter_time = 15 * 60 #adjustment for minutes 
        self.current_quarter = 1
        self.game_clock = self.quarter_time
        self.play_data = list() # stores play by play to retrain 
        self.running = True
        self.user_input = None
        self.prediction = None
        self.play_count = 0

    async def start_quarter(self):

        print(f"Starting Quarter {self.current_quarter}")
        
        #game/quarter loop
        while self.game_clock > 0 and self.running:
            self.print()
            plays = await self.next_play()
            print(plays)
            
            # waits for user to send data back to move his game along
            await self.user_post_play()
            formData = self.user_input
            if formData is None:
                break
                
            # print(f"Received data: {formData}")
            # await self.end_of_play(formData)
            # print(f"plays data: {self.play_data}")
            
        if self.current_quarter == 4:
            await self.clean_model()
            await self.end_of_quarter()
            self.end_game()
        else:
            await self.adjust_model()
            await self.end_of_quarter()
        
        
    # returns predictions of the plays
    async def next_play(self):
        plays = await self.get_model_prediction()
        # idk but we might have to sort the list here for cleaner output 

        return plays 
    
    # gets the Elapsed Seconds, S/F, DEF_POS
    async def user_post_play(self):
        self.user_input = None

        user_input = await asyncio.to_thread(input, "Enter data or 'stop' to exit: ")

        if user_input.lower() == 'stop':
            self.running = False
            print("Stopping simulation...")
            return None
        
        # Parse the input string into a list by splitting on spaces
        self.user_input = user_input.split()
        print(self.user_input)
    
 
    async def get_model_prediction(self): 
        response = get_predictions(self.user_input)
        return response
    
    # Takes end of play data [secElapsed, S/F, DEF_POS]
    # async def end_of_play(self, formdata): 
    #     self.play_data.append(formdata)
    #     self.game_clock -= int(formdata[0])

    # Adjusts model for better predictions through game play
    # @JIMMY - implement the POST to the model to 'fit'?
    async def adjust_model(self): 
        fit_data = self.play_data 
        print("Adjusting model with play data:")
        print(fit_data)
        self.play_data.clear()

    async def clean_model(self):
        # return the model back to its state
        # idfk bro
        # @JIMMY - implement however the model gotta get cleaned 
        pass

    # move to next or end
    async def end_of_quarter(self): 
        print(f"End of quarter {self.current_quarter}")
        self.current_quarter += 1
        if self.current_quarter <= self.quarters and self.running:
            self.game_clock = self.quarter_time
            await self.start_quarter()
        else: 
            print("Game Over")
            self.running = False

    def end_game(self): 
        print('end game')
        return None #AFTER THIS - the code ends printing 3 sets of self.print()?
        
    def start_game(self, stateState):

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

        print("sample input data looks like \n", input_json)

        game = GameSimulation(startState=stateState)
        
        asyncio.run(game.start_quarter())
        print("Simulation ended")
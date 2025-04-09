import time 
import asyncio
from typing import Dict, List, Optional

class GameSimulation: 

    def __init__(self): 
        self.quarters = 4 
        self.quarter_time = 15 * 60 #adjustment for minutes 
        self.current_quarter = 1
        self.game_clock = self.quarter_time
        self.play_data = list() # stores play by play to retrain 
        self.running = True
        self.user_input = None
        self.update_data()

    # duh - no comment 
    def print(self): 
        print(f'Quarter: {self.current_quarter}')
        print(f'Game Clock: {self.game_clock}')

    # @JIMMY - implement send of data 
    def update_data(self): 
        print(self.print())
        return
    
    # gets the Elapsed Seconds, S/F, DEF_POS
    # @JIMMY - implement the retrieval of data 
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
    
    async def start_quarter(self):
        print(f"Starting Quarter {self.current_quarter}")
        
        while self.game_clock > 0 and self.running:
            self.print()
            plays = await self.next_play()
            print(plays)
            
            # waits for user to send data back to move his game along
            await self.user_post_play()
            formData = self.user_input
            if formData is None:
                break
                
            print(f"Received data: {formData}")
            await self.end_of_play(formData)
            print(f"plays data: {self.play_data}")
            
        if self.current_quarter == 4:
            await self.clean_model()
            await self.end_of_quarter()
            self.end_game()
        else:
            await self.adjust_model()
            await self.end_of_quarter()
            self.update_data()
        
        
    # returns predictions of the plays
    async def next_play(self):
        plays = await self.get_model_prediction()
        # idk but we might have to sort the list here for cleaner output 
        return plays 
    
    # Makes call to sagemaker model 
    # @JIMMY - Implement the GET to sagemaker 
    async def get_model_prediction(self) -> List[List]: 
        data = [
            ["Pass Short", "Pass", 0.85],
            ["Run Outside", "Run", 0.80],
            ["Pass Deep", "Pass", 0.78],
            ["Run Inside", "Run", 0.76],
            ["Screen Pass", "Pass", 0.74],
            ["Option Play", "Run", 0.72],
            ["Play Action", "Pass", 0.70]
        ]
        ret_data = list(data)
        return ret_data
    
    # Takes end of play data [secElapsed, S/F, DEF_POS]
    async def end_of_play(self, formdata): 
        self.play_data.append(formdata)
        self.game_clock -= int(formdata[0])

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
        
if __name__ == "__main__":
    game = GameSimulation()
    # Simplified execution - assuming no errors will occur
    asyncio.run(game.start_quarter())
    print("Simulation ended")

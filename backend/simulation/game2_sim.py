# Proper football game simulation with realistic game mechanics
from typing import Dict, List, Optional
import json
import sys
from pathlib import Path
sys.path.append(str(Path(__file__).parent.parent))  # Add project root to path
from simulation.ML.inference_main import get_predictions

class GameSimulation: 

    def __init__(self): 
        # Team names will be set from user input in setup view
        self.OffenseTeam = None
        self.DefenseTeam = None
        self.quarters = 4
        self.quarter_time = 15 * 60  # 15 minutes in seconds
        self.game_clock = self.quarter_time
        self.Quarter = 1
        self.YardLine = 25  # Starting at 25-yard line after fair catch on kickoff
        self.Down = 1
        self.ToGo = 10
        self.Minute = self.game_clock // 60
        self.Second = self.game_clock % 60
        self.play_data = list()  # stores play by play to retrain
        self.running = True
        self.user_input = None
        self.prediction = None
        self.play_count = 0
        self.score = [0, 0]  # [Offense score, Defense score]
        self.game_over = False

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
        print(self.play_count)
        print(self.score)
        print(self.game_over)

    def update_state(self, new_state):
        """Update state from user inputs, including team names if provided."""
        for key, value in new_state.items():
            if hasattr(self, key):
                # Only set team names if they are provided and not None or empty
                if (key == "OffenseTeam" or key == "DefenseTeam") and not value:
                    # Use existing value if new value is empty/None
                    continue
                setattr(self, key, value)
        
        # Set default team names if not provided
        if not self.OffenseTeam:
            self.OffenseTeam = "Team A"
        if not self.DefenseTeam:
            self.DefenseTeam = "Team B"

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
        # Store user input
        self.user_input = input_data.get("user_input")
        
        # Extract play results from input data
        # Handle pendingChanges from frontend
        pending_changes = input_data.get("pendingChanges", {})
        yards_gained = pending_changes.get("yardChanges", 0) if pending_changes else 0
        time_elapsed = pending_changes.get("timeChanges", 0) if pending_changes else 0
        
        # Update yard line
        self.YardLine += yards_gained
        
        # Check for scoring
        if self.YardLine >= 100:  # Touchdown
            self.score[0] += 7  # Offense scores (simplified TD + PAT)
            self.reset_after_score()
        elif self.YardLine <= 0:  # Safety
            self.score[1] += 2  # Defense scores
            self.reset_after_safety()
        else:
            # Update down and distance
            if yards_gained >= self.ToGo:
                # First down achieved
                self.Down = 1
                self.ToGo = 10
            else:
                # Update distance to go
                self.ToGo -= yards_gained
                self.Down += 1
                
                # Check for turnover on downs
                if self.Down > 4:
                    self.change_possession()
        
        # Update clock
        self.update_game_clock(time_elapsed)
        
        # Increment play count
        self.play_count += 1
        
        # Get new predictions
        self.prediction = self.get_model_predictions()
        
        print("next-iteration", self)

    def update_game_clock(self, seconds):
        """Update the game clock by subtracting seconds and handle quarter changes."""
        self.game_clock -= seconds
        
        # Check for quarter end
        if self.game_clock <= 0:
            self.Quarter += 1
            
            # Check for game end
            if self.Quarter > self.quarters:
                self.game_over = True
                self.running = False
            else:
                # Reset clock for new quarter
                self.game_clock = self.quarter_time + self.game_clock  # Add overtime
        
        # Update minute and second
        self.Minute = self.game_clock // 60
        self.Second = self.game_clock % 60

    def change_possession(self):
        """Handle change of possession."""
        # Swap offense and defense
        self.OffenseTeam, self.DefenseTeam = self.DefenseTeam, self.OffenseTeam
        
        # Swap scores to maintain team association
        self.score.reverse()
        
        # Reset downs
        self.Down = 1
        self.ToGo = 10
        
        # Update yard line (flip field)
        self.YardLine = 100 - self.YardLine

    def reset_after_score(self):
        """Reset game state after a touchdown."""
        # Change possession
        self.change_possession()
        
        # Start at the 25
        self.YardLine = 25
        
        # Reset downs
        self.Down = 1
        self.ToGo = 10

    def reset_after_safety(self):
        """Reset game state after a safety."""
        # Change possession
        self.change_possession()
        
        # After safety, team gets ball at their own 25
        self.YardLine = 75  # 25 yard line on the other side
        
        # Reset downs
        self.Down = 1
        self.ToGo = 10

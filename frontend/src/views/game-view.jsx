// the view for when the simulation is running 

// a big wrapper for the main game view this is the second view in the app that is shown when started 
// from the page.tsx file 
// all components are for this view 

import React, { useState, useEffect, useRef } from 'react';


import '../styles/game-view.css';

import Game_Progression from '../components/game_progression';
import Play_Information from '../components/play_information';
import Play_Preview from '../components/play_preview';
import Plays_Window from '../components/plays_window';



// this is the return button DELETE AFTER SIMULATION IMPLEMENTATION 
// the simulation will end and switch back so this will be useless 
function MyButton({ onSwitchView }) {
    return (
        <button onClick={onSwitchView}>Go To Setup View</button>
    );
}

// game state class 
class gState {
    constructor() {
        // Teams should be set from setup view
        this.OffenseTeam = "";  // Will be populated from setup view
        this.DefenseTeam = "";  // Will be populated from setup view
        this.quarters = 4; 
        this.quarter_time = 15 * 60; // 15 minutes in seconds 
        this.game_clock = this.quarter_time; 
        this.Quarter = 1; 
        this.YardLine = 25; // Start at 25-yard line after fair catch
        this.Down = 1;
        this.ToGo = 10;
        this.Minute = Math.floor(this.game_clock / 60); 
        this.Second = this.game_clock % 60;
        this.play_data = [];
        this.running = true; 
        this.user_input = null;
        this.prediction = null;        
        this.play_count = 0;
        this.score = [0, 0]; // Track score [offense, defense]
        this.game_over = false;
    }
}

function GameView({ onSwitchView }) {

    const [gameState, setGameState] = useState(new gState());
    const [isLoading, setIsLoading] = useState(false);
    const [selectedPlay, setSelectedPlay] = useState(null);
    const isMounted = useRef(false);

    // Function to send data to backend and update state
    const sendData = async (updatedState = null) => {
        setIsLoading(true);
        
        // Use provided state or current state
        const stateToSend = updatedState || gameState;
        
        const gameStateToSend = {
            OffenseTeam: stateToSend.OffenseTeam,
            DefenseTeam: stateToSend.DefenseTeam,
            quarters: Number(stateToSend.quarters),
            quarter_time: Number(stateToSend.quarter_time),
            game_clock: Number(stateToSend.game_clock),
            Quarter: Number(stateToSend.Quarter),
            YardLine: Number(stateToSend.YardLine),
            Down: Number(stateToSend.Down),
            ToGo: Number(stateToSend.ToGo),
            Minute: Number(stateToSend.Minute),
            Second: Number(stateToSend.Second),
            play_data: stateToSend.play_data || [],
            running: stateToSend.running, 
            user_input: stateToSend.user_input, 
            prediction: stateToSend.prediction,
            play_count: stateToSend.play_count
        };

        try {
            console.log("Sending data to backend");
            const response = await fetch("http://localhost:8000/get-predictions", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(gameStateToSend),
            });
            
            if (!response.ok) {
                throw new Error('Game prediction was not ok')
            }
                
            const data = await response.json(); 
            console.log("Received data:", data); 
            
            let new_state = new gState(); 
            new_state.OffenseTeam = data.OffenseTeam;
            new_state.DefenseTeam = data.DefenseTeam;
            new_state.quarters = data.quarters; 
            new_state.quarter_time = data.quarter_time; 
            new_state.game_clock = data.game_clock;
            new_state.Quarter = data.Quarter; 
            new_state.YardLine = data.YardLine;
            new_state.Down = data.Down; 
            new_state.ToGo = data.ToGo;
            new_state.Minute = data.Minute;
            new_state.Second = data.Second;
            new_state.play_data = data.play_data || [];
            new_state.running = data.running; 
            new_state.user_input = data.user_input;
            new_state.prediction = data.prediction;
            new_state.play_count = data.play_count;
            new_state.score = data.score || [0, 0]; // Add score from backend
            new_state.game_over = data.game_over || false; // Add game_over status
            setGameState(new_state); 

        } catch (error) {
            console.error("Error:", error);
        } finally {
            setIsLoading(false);
        }
    };
    
    // Local state to track UI changes before sending to backend
    const [localGameState, setLocalGameState] = useState(null);

    // Update local state when gameState changes from backend
    useEffect(() => {
        setLocalGameState({...gameState});
    }, [gameState]);
    
    // Handle yard line changes (with option for local-only updates)
    const handleYardChange = (yards, localOnly = false) => {
        const updatedState = {...(localOnly ? localGameState : gameState)};
        updatedState.YardLine = Math.min(Math.max(updatedState.YardLine + yards, 0), 100); // Keep between 0-100
        
        // Update down and distance if needed
        if (yards > 0) {
            updatedState.ToGo = Math.max(updatedState.ToGo - yards, 0);
            if (updatedState.ToGo === 0) {
                updatedState.Down = 1;
                updatedState.ToGo = 10;
            }
        } else {
            // Negative yards (loss) increases distance to go
            updatedState.ToGo = updatedState.ToGo - yards;
        }
        
        if (localOnly) {
            // Only update local UI state
            setLocalGameState(updatedState);
        } else {
            // Send updated state to backend
            sendData(updatedState);
        }
    };
    
    // Handle time changes (with option for local-only updates)
    const handleTimeChange = (seconds, localOnly = false) => {
        const updatedState = {...(localOnly ? localGameState : gameState)};
        
        // Decrease game clock
        updatedState.game_clock = Math.max(updatedState.game_clock - seconds, 0);
        
        // Update minute and second
        updatedState.Minute = Math.floor(updatedState.game_clock / 60);
        updatedState.Second = updatedState.game_clock % 60;
        
        // Handle quarter change if clock reaches 0
        if (updatedState.game_clock === 0 && updatedState.Quarter < updatedState.quarters) {
            updatedState.Quarter += 1;
            updatedState.game_clock = updatedState.quarter_time;
            updatedState.Minute = Math.floor(updatedState.game_clock / 60);
            updatedState.Second = updatedState.game_clock % 60;
        }
        
        if (localOnly) {
            // Only update local UI state
            setLocalGameState(updatedState);
        } else {
            // Send updated state to backend
            sendData(updatedState);
        }
    };
    
    // Handle next play with pending changes
    const handleNextPlay = (pendingChanges = null) => {
        // Start with current game state from backend
        const updatedState = {...gameState};
        
        // Include the selected play in the user_input if available
        if (selectedPlay) {
            updatedState.user_input = {
                choice: selectedPlay.choice,
                formation: selectedPlay.formation,
                playType: selectedPlay.playType
            };
        }
        
        // Include any other pending changes from the UI
        if (pendingChanges && pendingChanges.hasChanges) {
            updatedState.pendingChanges = pendingChanges;
        }
        
        // Send updated state to backend
        sendData(updatedState);
        
        // Reset selected play after submission
        setSelectedPlay(null);
        
        console.log(gameState.prediction); // Log the prediction for debugging

        // Check for game over after backend response
        if (gameState.game_over) {
            setTimeout(() => {
                alert(`Game Over! Final Score: ${gameState.OffenseTeam} ${gameState.score[0]} - ${gameState.DefenseTeam} ${gameState.score[1]}`);
                onSwitchView(); // Return to setup view
            }, 500); // Short delay to ensure state is updated
        }
    };
    
    // Handle get prediction (just calls sendData with current state)
    const handleGetPrediction = () => {
        sendData();
    };

    // Beginning the game 
    useEffect(() => {
        if (isMounted.current) return;
        isMounted.current = true;
        
       
        sendData();
    }, []);

    return (
        <div className="game-view-main">
            <div className='top-gState-container'>
                <div className='score-team-box'>

                </div>
                <div className='time-box-container'>

                </div>
                <div className='progression-container'>

                </div>
            </div>
            <div className='left-side-container'>
                <div className='game-progression-container'>
                    <Game_Progression 
                        gameState={localGameState || gameState}
                        onGetPrediction={handleGetPrediction}
                        onYardChange={handleYardChange}
                        onTimeChange={handleTimeChange}
                        onNextPlay={handleNextPlay}
                        isLoading={isLoading}
                    />
                </div>
            </div>
            <div className='center-container'> 
                <div>
                    <Play_Information gameState={gameState}/>
                </div>
                <div>
                    <Play_Preview 
                        gameState={gameState}
                        selectedPlay={selectedPlay}
                    />
                </div>
            </div>
            <div className='right-side-container'>
                <div>
                    <Plays_Window 
                        gameState={gameState}
                        onSelectPlay={setSelectedPlay}
                    />
                </div>
            </div>
            <MyButton onSwitchView={onSwitchView} />
        </div>
        
    );
}

export default GameView;

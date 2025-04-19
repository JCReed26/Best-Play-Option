// the view for when the simulation is running 

// a big wrapper for the main game view this is the second view in the app that is shown when started 
// from the page.tsx file 
// all components are for this view 

import React, { useState, useEffect, useRef } from 'react'


import '../styles/game-view.css';

import Def_Formation from '../components/def_formation';
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
        this.OffenseTeam = "DET";
        this.DefenseTeam = "SF";
        this.quarters = 4; 
        this.quarter_time = 15 * 60; // user input will be in seconds 
        this.game_clock = this.quarter_time; // inits to this 
        this.Quarter = 1; 
        this.YardLine = 70; 
        this.Down = 1;
        this.ToGo = 10;
        this.Minute = Math.floor(this.game_clock / 60); 
        this.Second = this.game_clock % 60;
        this.play_data = [];
        this.running = true; 
        this.user_input = null;
        this.prediction = null;
    }
}

function GameView({ onSwitchView }) {

    const [gameState, setGameState] = useState(new gState());

    const isMounted = useRef(false)

    useEffect(() => {

        if (isMounted.current) return 
        isMounted.current = true

        const sendData = async() => {
            const gameStateToSend = {
                OffenseTeam: gameState.OffenseTeam,
                DefenseTeam: gameState.DefenseTeam,
                quarters: Number(gameState.quarters),
                quarter_time: Number(gameState.quarter_time),
                game_clock: Number(gameState.game_clock),
                Quarter: Number(gameState.Quarter),
                YardLine: Number(gameState.YardLine),
                Down: Number(gameState.Down),
                ToGo: Number(gameState.ToGo),
                Minute: Number(gameState.Minute),
                Second: Number(gameState.Second),
                play_data: gameState.play_data || [],
                running: gameState.running, 
                user_input: gameState.user_input, 
                prediction: gameState.prediction
            };

            try {
                console.log("pre-fetch-preds");
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
                new_state.running = data.running; 
                new_state.user_input = data.user_input;
                new_state.prediction = data.prediction;
                setGameState(new_state); 

            } catch (error) {
                console.error("Error:", error);
            }
        };

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
                <div className='def-play-choice'>
                    <Def_Formation gameState={gameState}/>
                </div>
                <div className='game-progression-container'>
                    <Game_Progression gameState={gameState}/>
                    <button>GetNextPlayPrediction</button>
                </div>
            </div>
            <div className='center-container'> 
                <div>
                    <Play_Information gameState={gameState}/>
                </div>
                <div>
                    <Play_Preview gameState={gameState}/>
                </div>
            </div>
            <div className='right-side-container'>
                <div>
                    <Plays_Window gameState={gameState}/>
                </div>
            </div>
            <MyButton onSwitchView={onSwitchView} />
        </div>
        
    );
}

export default GameView;

// the view for when the simulation is running 

// a big wrapper for the main game view this is the second view in the app that is shown when started 
// from the page.tsx file 
// all components are for this view 

import React, { useState, useEffect, useDebugValue } from 'react'


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
        this.offense = "DET";
        this.defense = "SF";
        this.quarters = 4; 
        this.quarter_time = 15 * 60; // user input will be in seconds 
        this.current_quarter = 1; 
        this.game_clock = this.quarter_time; // inits to this 
        this.running = true; 
        this.user_input = null;
        this.prediction = null;
    }
}

function GameView({ onSwitchView }) {


    const [gameState, setGameState] = useState(new gState());

    useEffect(() => {
        fetch('http://localhost:8000/get-predictions')
            .then(response => {
                if(!response.ok) {
                    throw new Error('game-predictions-response was not ok');
                }
                return response.json();
            })
            .then(data => {
                let new_state = new gState(); 
                new_state.offense = data.offense;
                new_state.defense = data.defense;
                new_state.quarters = data.quarters; 
                new_state.quarter_time = data.quarter_time; 
                new_state.current_quarter = data.current_quarter; 
                new_state.game_clock = data.game_clock;
                new_state.running = data.running; 
                new_state.user_input = data.user_input;
                new_state.prediction = data.prediction;
                setGameState(new_state); 
                // we need to add a call to update all the pages 
            })
            .catch(error => {
                console.error('Failed to fetch game-predictions-state: ', error)
            });
    }, [])

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
                    <Def_Formation gameState={Object.values(gameState)}/>
                </div>
                <div className='game-progression-container'>
                    <Game_Progression gameState={Object.values(gameState)}/>
                    <button>GetNextPlayPrediction</button>
                </div>
            </div>
            <div className='center-container'> 
                <div>
                    <Play_Information gameState={Object.values(gameState)}/>
                </div>
                <div>
                    <Play_Preview gameState={Object.values(gameState)}/>
                </div>
            </div>
            <div className='right-side-container'>
                <div>
                    <Plays_Window gameState={Object.values(gameState)}/>
                </div>
            </div>
            <MyButton onSwitchView={onSwitchView} />
        </div>
        
    );
}

export default GameView;

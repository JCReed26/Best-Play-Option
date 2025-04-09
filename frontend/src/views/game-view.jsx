// the view for when the simulation is running 

// a big wrapper for the main game view this is the second view in the app that is shown when started 
// from the page.tsx file 
// all components are for this view 

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

function GameView({ onSwitchView }) {

    return (
        <div className="game-view-main">
            <div className='left-side-container'>
                <div className='def-play-choice'>
                    <Def_Formation />
                </div>
                <div className='game-progression-container'>
                    <Game_Progression />
                </div>
            </div>
            <div className='center-container'> 
                <div>
                    <Play_Information />
                </div>
                <div>
                    <Play_Preview />
                </div>
            </div>
            <div className='right-side-container'>
                <div>
                    <Plays_Window />
                </div>
            </div>
            <MyButton onSwitchView={onSwitchView} />
        </div>
        
    );
}

export default GameView;

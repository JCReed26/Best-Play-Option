// box with buttons to log the progression of the game 

export default function Game_Progression(props) {
    return (
        <div>
            <div>Game Progression Buttons</div>
            <div>Image of Selected Play from Plays Window</div>
            <div>Offense: {props.gameState[0]}</div>
            <div>Defense: {props.gameState[1]}</div>
            <div>Current Quarter: {props.gameState[4]}</div>
            <div>Game Clock: {props.gameState[5] / 60}</div>
            <button>next play</button>
        </div>
    );
}
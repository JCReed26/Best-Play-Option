// the view for when the simulation is running 

// a big wrapper for the main game view this is the second view in the app that is shown when started 
// from the page.tsx file 
// all components are for this view 

function MyButton({ onSwitchView }) {
    return (
        <button onClick={onSwitchView}>Go To Setup View</button>
    );
}

function GameView({ onSwitchView }) {

    return (
        <div className="game-view-main">
            <h1>Game View</h1>
            <MyButton onSwitchView={onSwitchView} />
        </div>
        
    );
}

export default GameView;

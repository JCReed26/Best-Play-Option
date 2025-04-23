// this is where the image of the play with the arrows is displayed 
import '../styles/play-preview.css';

export default function Play_Preview(props) {
    const { gameState } = props;
    
    // Check if prediction data exists
    const hasPredictions = gameState && gameState.prediction;
    
    return (
        <div className="play-preview-container">
            <div>Image of Selected Play from Plays Window</div>
            <div>Offense: {gameState.OffenseTeam}</div>
            <div>Defense: {gameState.DefenseTeam}</div>
            <div>Current Quarter: {gameState.Quarter}</div>
            <div>Game Clock: {Math.floor(gameState.game_clock / 60)}:{gameState.game_clock % 60 < 10 ? '0' + (gameState.game_clock % 60) : gameState.game_clock % 60}</div>
            
            {hasPredictions ? (
                <div className="predictions-container">
                    <h3>Predictions</h3>
                    
                    <div className="prediction-section">
                        <h4>Formation Predictions</h4>
                        <ul>
                            {gameState.prediction.formation_predictions.map((pred, index) => (
                                <li key={`formation-${index}`}>
                                    {pred.label}: {(pred.confidence * 100).toFixed(2)}%
                                </li>
                            ))}
                        </ul>
                    </div>
                    
                    <div className="prediction-section">
                        <h4>Play Type Predictions</h4>
                        <ul>
                            {gameState.prediction.playtype_predictions.map((pred, index) => (
                                <li key={`playtype-${index}`}>
                                    {pred.label}: {(pred.confidence * 100).toFixed(2)}%
                                </li>
                            ))}
                        </ul>
                    </div>
                    
                    <div className="prediction-section">
                        <h4>Play Choice Predictions</h4>
                        <ul>
                            {gameState.prediction.choice_predictions.map((pred, index) => (
                                <li key={`choice-${index}`}>
                                    {pred.label}: {(pred.confidence * 100).toFixed(2)}%
                                </li>
                            ))}
                        </ul>
                    </div>
                </div>
            ) : (
                <div>No predictions available</div>
            )}
            
            <div>QUESTION: where we getting the play pictures</div>
        </div>
    );
}

// This component displays the currently selected play with detailed information
import React from 'react';
import '../styles/play-preview.css';

export default function Play_Preview(props) {
    const { gameState, selectedPlay } = props;
    
    // Format game clock for display
    const formattedGameClock = () => {
        if (!gameState || typeof gameState.game_clock === 'undefined') return "00:00";
        const minutes = Math.floor(gameState.game_clock / 60);
        const seconds = gameState.game_clock % 60;
        return `${minutes}:${seconds < 10 ? '0' + seconds : seconds}`;
    };
    
    // Display selected play if available, otherwise show basic game state
    return (
        <div className="play-preview-container">
            {/* Placeholder for future play diagram/image */}
            <div className="play-image-placeholder">
                <h3>Play Diagram</h3>
                <div className="image-placeholder">
                    {selectedPlay ? (
                        <div className="selected-play-name">{selectedPlay.choice}</div>
                    ) : (
                        <div>No play selected</div>
                    )}
                </div>
            </div>
            
            <div className="game-situation">
                <div>Offense: {gameState.OffenseTeam}</div>
                <div>Defense: {gameState.DefenseTeam}</div>
                <div>Quarter: {gameState.Quarter} | Time: {formattedGameClock()}</div>
                <div>Down: {gameState.Down} | Distance: {gameState.ToGo} | Yard Line: {gameState.YardLine}</div>
            </div>
            
            {selectedPlay ? (
                <div className="selected-play-details">
                    <h3>Selected Play</h3>
                    
                    <div className="play-detail-item">
                        <span className="detail-label">Play Choice:</span>
                        <span className="detail-value">{selectedPlay.choice}</span>
                        <span className="detail-confidence">
                            Confidence: {(selectedPlay.choiceConfidence * 100).toFixed(1)}%
                        </span>
                    </div>
                    
                    <div className="play-detail-item">
                        <span className="detail-label">Formation:</span>
                        <span className="detail-value">{selectedPlay.formation}</span>
                        <span className="detail-confidence">
                            Confidence: {(selectedPlay.formationConfidence * 100).toFixed(1)}%
                        </span>
                    </div>
                    
                    <div className="play-detail-item">
                        <span className="detail-label">Play Type:</span>
                        <span className="detail-value">{selectedPlay.playType}</span>
                        <span className="detail-confidence">
                            Confidence: {(selectedPlay.playTypeConfidence * 100).toFixed(1)}%
                        </span>
                    </div>
                </div>
            ) : (
                <div className="no-play-selected">
                    <p>Select a play from the Plays Window to view details</p>
                    {gameState && gameState.prediction ? (
                        <p className="prediction-hint">
                            {gameState.prediction.choice_predictions?.length || 0} play options available
                        </p>
                    ) : (
                        <p className="prediction-hint">No predictions available yet</p>
                    )}
                </div>
            )}
        </div>
    );
}

// This component displays a list of play choices from prediction data
import React, { useState, useEffect } from 'react';

export default function Plays_Window(props) {
    const { gameState, onSelectPlay } = props;
    const [plays, setPlays] = useState([]);
    
    // Transform prediction data into play choices
    useEffect(() => {
        if (gameState && gameState.prediction) {
            const transformedPlays = transformPredictionToPlays(gameState.prediction);
            setPlays(transformedPlays);
        }
    }, [gameState]);
    
    // Function to transform prediction data into play choices
    const transformPredictionToPlays = (prediction) => {



        // NEED TO REDO 
        // needs to handle as if it was json 
        // needs to actual get the data 

        console.log("Transforming prediction data:", prediction);

        console.log("formation:", prediction['formation_predictions']);
        console.log("playType:", prediction['playtype_predictions']);



        if (!prediction) {
            return [];
        }
        
        // Extract formations and playTypes with confidence > 1%
        const formations = prediction.formations ? 
            prediction.formations
                .filter(item => item.confidence > 0.01)
                .map(item => ({ name: item.formation, confidence: item.confidence })) 
            : [];
            
        const playTypes = prediction.playTypes ? 
            prediction.playTypes
                .filter(item => item.confidence > 0.01)
                .map(item => ({ name: item.playType, confidence: item.confidence })) 
            : [];
            
        // If either array is empty, we can't create combinations
        if (formations.length === 0 || playTypes.length === 0) {
            return [];
        }
        
        // Create all possible combinations and calculate average confidence
        const plays = [];
        let id = 0;
        
        formations.forEach(formation => {
            playTypes.forEach(playType => {
                // Average confidence between formation and playType
                const avgConfidence = (formation.confidence + playType.confidence) / 2;
                
                plays.push({
                    id: id++,
                    choice: `${formation.name} ${playType.name}`, // Combine as the choice name
                    choiceConfidence: avgConfidence,
                    formation: formation.name,
                    formationConfidence: formation.confidence,
                    playType: playType.name,
                    playTypeConfidence: playType.confidence
                });
            });
        });
        
        // Sort plays by confidence (highest first)
        return plays.sort((a, b) => b.choiceConfidence - a.choiceConfidence);
    };
    
    // Handle play selection
    const handlePlaySelect = (play) => {
        if (onSelectPlay) {
            onSelectPlay(play);
        }
    };
    
    return (
        <div className="plays-window-container">
            <h3>Available Plays</h3>
            
            {plays.length > 0 ? (
                <div className="play-options-list">
                    {plays.map((play) => (
                        <div 
                            key={play.id}
                            className="play-option-item"
                            onClick={() => handlePlaySelect(play)}
                        >
                            <div className="play-option-header">
                                <span className="play-choice">{play.choice}</span>
                                <span className="play-confidence">{(play.choiceConfidence * 100).toFixed(1)}%</span>
                            </div>
                            <div className="play-option-details">
                                <div>Formation: {play.formation} ({(play.formationConfidence * 100).toFixed(1)}%)</div>
                                <div>Play Type: {play.playType} ({(play.playTypeConfidence * 100).toFixed(1)}%)</div>
                            </div>
                        </div>
                    ))}
                </div>
            ) : (
                <div className="no-plays-message">
                    No play predictions available. Request predictions first.
                </div>
            )}
        </div>
    );
}

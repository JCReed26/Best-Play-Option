// Game progression component with minimalistic yet engaging style
import React, { useState, useEffect } from 'react';
import '../styles/game2_prog.css';


// im so tired of this i tried using ai it helped it some but the process still dont work 
// the math aint mathin but yeah we gotta fix that


export default function Game_Progression(props) {
    const { gameState, onGetPrediction, onYardChange, onTimeChange, onNextPlay, isLoading } = props;
    
    // State for button hover effects
    const [hoveredButton, setHoveredButton] = useState(null);
    
    // Simplified state for pending changes
    const [pendingYards, setPendingYards] = useState(0);
    const [pendingTime, setPendingTime] = useState(0);
    const [hasPendingChanges, setHasPendingChanges] = useState(false);
    
    // Format game clock properly
    const formatClock = (seconds) => {
        const mins = Math.floor(seconds / 60);
        const secs = seconds % 60;
        return `${mins}:${secs < 10 ? '0' + secs : secs}`;
    };
    
    // Reset pending changes after next play
    useEffect(() => {
        setPendingYards(0);
        setPendingTime(0);
        setHasPendingChanges(false);
    }, [gameState.play_count]);
    
    // Handle yard changes - track locally only
    const handleYardChange = (yards) => {
        setPendingYards(prevYards => prevYards + yards);
        setHasPendingChanges(true);
        
        // We no longer update the UI immediately
        // The changes are only shown in the Pending Updates section
    };
    
    // Handle time changes - track locally only
    const handleTimeChange = (seconds) => {
        setPendingTime(prevTime => prevTime + seconds);
        setHasPendingChanges(true);
        
        // We no longer update the UI immediately
        // The changes are only shown in the Pending Updates section
    };
    
    // Handle next play - send all changes to backend and update main game state only after confirmation
    const handleNextPlay = () => {
        if (onNextPlay) {
            const pendingChanges = {
                yardChanges: pendingYards,
                timeChanges: pendingTime,
                hasChanges: hasPendingChanges
            };
            
            // The parent component will:
            // 1. Send these changes to the backend
            // 2. Wait for confirmation
            // 3. Update the main game state with confirmed changes
            // 4. Get new predictions based on the updated state
            onNextPlay(pendingChanges);
        }
    };
    
    // Format time for display
    const formatTimeChange = (seconds) => {
        if (seconds === 0) return "0s";
        const mins = Math.floor(seconds / 60);
        const secs = seconds % 60;
        return `${mins > 0 ? mins + 'm ' : ''}${secs > 0 ? secs + 's' : ''}`;
    };
    
    return (
        <div className="gameprog-container">
            {/* Game state display with modern scoreboard style */}
            <div className="gameprog-header">
                <h2 className="gameprog-title">Game State</h2>
                
                <div className="gameprog-scoreboard">
                    <div className="gameprog-teams">
                        <div className="team offense">
                            <span className="team-label">OFF</span>
                            <span className="team-name">{gameState.OffenseTeam || "Team A"}</span>
                            <span className="team-score">{gameState.score ? gameState.score[0] : 0}</span>
                        </div>
                        <div className="team defense">
                            <span className="team-label">DEF</span>
                            <span className="team-name">{gameState.DefenseTeam || "Team B"}</span>
                            <span className="team-score">{gameState.score ? gameState.score[1] : 0}</span>
                        </div>
                    </div>
                    
                    <div className="gameprog-game-info">
                        <div className="game-stat">
                            <span className="stat-label">QTR</span>
                            <span className="stat-value">{gameState.Quarter}</span>
                        </div>
                        <div className="game-stat">
                            <span className="stat-label">CLOCK</span>
                            <span className="stat-value">{formatClock(gameState.game_clock)}</span>
                        </div>
                        <div className="game-stat">
                            <span className="stat-label">DOWN</span>
                            <span className="stat-value">{gameState.Down}</span>
                        </div>
                        <div className="game-stat">
                            <span className="stat-label">TO GO</span>
                            <span className="stat-value">{gameState.ToGo}</span>
                        </div>
                        <div className="game-stat">
                            <span className="stat-label">YARD LINE</span>
                            <span className="stat-value">{gameState.YardLine}</span>
                        </div>
                        <div className="game-stat">
                            <span className="stat-label">PLAY #</span>
                            <span className="stat-value">{gameState.play_count !== undefined ? gameState.play_count : '0'}</span>
                        </div>
                    </div>
                </div>
            </div>
            
            {/* Pending Changes Section */}
            <div className={`selections-container ${hasPendingChanges ? 'has-updates' : ''}`}>
                <h2 className="selections-title">Pending Updates</h2>
                
                <div className={`updates-wrapper ${hasPendingChanges ? 'has-updates' : ''}`}>
                    {!hasPendingChanges ? (
                        <div className="no-updates-container">
                            <div className="no-updates">No updates yet</div>
                        </div>
                    ) : (
                        <div className="pending-updates-container">
                            <div className="pending-updates-grid">
                                {pendingYards !== 0 && (
                                    <div className="game-stat">
                                        <span className="stat-label">YARDS</span>
                                        <span className={`stat-value ${pendingYards > 0 ? 'positive' : 'negative'}`}>
                                            {pendingYards > 0 ? `+${pendingYards}` : pendingYards}
                                        </span>
                                    </div>
                                )}
                                
                                {pendingTime !== 0 && (
                                    <div className="game-stat">
                                        <span className="stat-label">TIME</span>
                                        <span className="stat-value negative">-{formatTimeChange(pendingTime)}</span>
                                    </div>
                                )}
                            </div>
                        </div>
                    )}
                </div>
            </div>
            
            {/* Game progression controls with modern button styling */}
            <div className="selections-container">
                <h4 className="selections-title">Game Progression</h4>
                
                <div className="control-section">
                    <div className="control-label">Field Position</div>
                    <div className="yard-buttons">
                        {[-10, -5, -2, 0, 3, 8, 15, 25].map(yards => (
                            <button 
                                key={`yard-${yards}`}
                                type="button" 
                                className="game-stat yard-button"
                                onClick={() => handleYardChange(yards)}
                                onMouseEnter={() => setHoveredButton(`yard-${yards}`)}
                                onMouseLeave={() => setHoveredButton(null)}
                            >
                                <span className="stat-label">YARDS</span>
                                <span className="stat-value">{yards > 0 ? `+${yards}` : yards}</span>
                            </button>
                        ))}
                    </div>
                </div>
                
                <div className="control-section">
                    <div className="control-label">Game Clock</div>
                    <div className="time-buttons">
                        {[5, 15, 25, 40, 120].map(seconds => (
                            <button 
                                key={`time-${seconds}`}
                                type="button" 
                                className="game-stat time-button"
                                onClick={() => handleTimeChange(seconds)}
                                onMouseEnter={() => setHoveredButton(`time-${seconds}`)}
                                onMouseLeave={() => setHoveredButton(null)}
                            >
                                <span className="stat-label">TIME</span>
                                <span className="clock stat-value">
                                    {seconds >= 60 
                                        ? `+${Math.floor(seconds/60)}:00` 
                                        : `+0:${seconds < 10 ? '0' + seconds : seconds}`}
                                </span>
                            </button>
                        ))}
                    </div>
                </div>
                
                <div className="action-buttons">
                    <button 
                        type="button"
                        className="game-stat next-play"
                        onClick={handleNextPlay}
                        onMouseEnter={() => setHoveredButton('next-play')}
                        onMouseLeave={() => setHoveredButton(null)}
                    >
                        <span className="stat-value">Next Play</span>
                    </button>
                </div>
            </div>
        </div>
    );
}

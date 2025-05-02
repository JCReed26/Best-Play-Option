// this is all the data about the play selected in the plays_window
// this also should match the picture in play_preview
import React from 'react';
import '../styles/play_info.css';

export default function Play_Information(props) {
    const { gameState } = props;
    
    return (
        <div className="play-info-container">
            <div className="play-info-scoreboard">
                <div className="play-info-team play-info-offense"> 
                    <div className="play-info-team-header">
                        <div>
                            <div className="play-info-team-label">Offense</div>
                            <div className="play-info-team-name">{gameState.OffenseTeam || "Team A"}</div>
                        </div>
                        <div className="play-info-score">{gameState.score ? gameState.score[0] : 0}</div>
                    </div>
                </div>
                <div className="play-info-team play-info-defense">
                    <div className="play-info-team-header">
                        <div>
                            <div className="play-info-team-label">Defense</div>
                            <div className="play-info-team-name">{gameState.DefenseTeam || "Team B"}</div>
                        </div>
                        <div className="play-info-score">{gameState.score ? gameState.score[1] : 0}</div>
                    </div>
                </div>
            </div>
            
            <div className="play-info-game-stats"> 
                <div className="play-info-stat">
                    <span className="play-info-stat-label">Game Clock</span>
                    <span className="play-info-stat-value">{gameState.GameClock || "00:00"}</span>
                </div>
                <div className="play-info-stat">
                    <span className="play-info-stat-label">Quarter</span>
                    <span className="play-info-stat-value">{gameState.quarter || 1}</span>
                </div>
                <div className="play-info-stat">
                    <span className="play-info-stat-label">Ball on</span>
                    <span className="play-info-stat-value">{gameState.YardLine || "25"}</span>
                </div>
                <div className="play-info-stat">
                    <span className="play-info-stat-label">Down</span>
                    <span className="play-info-stat-value">{gameState.down || 1}</span>
                </div>
                <div className="play-info-stat">
                    <span className="play-info-stat-label">Yards to Go</span>
                    <span className="play-info-stat-value">{gameState.ToGo || 10}</span>
                </div>
                <div className="play-info-stat">
                    <span className="play-info-stat-label">Play #</span>
                    <span className="play-info-stat-value">{gameState.play_count || 0}</span>
                </div>
            </div>
        </div>
    );
}

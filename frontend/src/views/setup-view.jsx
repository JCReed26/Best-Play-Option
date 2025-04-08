'use client'

import Form from 'next/form';
import React, { useState, useEffect } from 'react';
import '../styles/setup-view.css';

function SetupView({ onSwitchView }) {

    /* User interactive states */
    const [team, setTeam] = React.useState();
    const [loading, setLoading] = useState(true);

    function homeTeamHandler(selectedTeam) {
        setTeam(selectedTeam);
    };

    const [opps, setOpps] = React.useState();

    function oppsHandler(selectedOpps) {
        setOpps(selectedOpps);
    }

    const teamOptions = [
        { value: '1', label: 'Bal Ravens'},
        { value: '2', label: 'Buff Bills' },
        { value: '3', label: 'Cin Bengals'},
        { value: '4', label: 'Cle Browns'},
        { value: '5', label: 'Den Broncos' },
        { value: '6', label: 'Hou Texans'},
        { value: '7', label: 'Ind Colts' },
        { value: '8', label: 'Jax Jaguars'},
        { value: '9', label: 'KC Chiefs'},
        { value: '10', label: 'LV Raiders'},
        { value: '11', label: 'LA Chargers'},
        { value: '12', label: 'Mia Dolphins' },
        { value: '13', label: 'NE Patriots' },
        { value: '14', label: 'NY Jets'},
        { value: '15', label: 'Pitt Steelers'},
        { value: '16', label: 'Ten Titans'},
        { value: '17', label: 'Ari Cardinals'},
        { value: '18', label: 'Atl Falcons'},
        { value: '19', label: 'Car Panthers'},
        { value: '20', label: 'Chi Bears'},
        { value: '21', label: 'Dal Cowboys'},
        { value: '22', label: 'Det Lions'},
        { value: '23', label: 'GB Packers'},
        { value: '24', label: 'LA Rams'},
        { value: '25', label: 'Min Vikings'},
        { value: '26', label: 'NO Saints'},
        { value: '27', label: 'NY Giants'},
        { value: '28', label: 'Phi Eagles'},
        { value: '29', label: 'SF 49ers'},
        { value: '30', label: 'Stl Seahawks'},
        { value: '31', label: 'TB Bucks'},
        { value: '32', label: 'Was Commanders'},
    ]

    /* API fetch & Data Connections */

    const [offense, setOffense] = useState(); 
    const [defense, setDefense] = useState(); 

    //when we can change to be the team selected 
    useEffect(() => {
        setLoading(true);
        Promise.all([
            fetch('http://localhost:8000/players'),
            fetch('http://localhost:8000/players')
        ])
        .then(([offenseRes, defenseRes]) => 
            Promise.all([offenseRes.json(), defenseRes.json()])
        )
        .then(([offenseData, defenseData]) => {
            setOffense(offenseData);
            setDefense(defenseData);
            setLoading(false);
        })
        .catch(error => {
            console.error('Failed to fetch players:', error);
            setLoading(false);
        });
    }, []);


    if (loading) return <div>Loading...</div>;

    /* React HTML Page */
    return (
        <div className="setup-main">
            <h1>Setup View</h1>
            <Form className='selection-form'>
                <select onChange={(e) => homeTeamHandler(e.target.value)}>
                    <option>Select Your Team</option>
                    {teamOptions.map((team) => (
                        <option key={team.value} value={team.value}>
                            {team.label}
                        </option>
                    ))}
                </select>
                <select onChange={(e) => oppsHandler(e.target.value)}>
                    <option>Select Defense To Face</option>
                    {teamOptions.map((team) => (
                        <option key={team.value} value={team.value}>
                            {team.label}
                        </option>
                    ))}
                </select>
                <button type='button' onClick={onSwitchView}>Start Game Simulation</button>
            </Form>
            <div className='selections-container'>
                    <div className='home-team-container'>
                        <ul>
                            <li className="bold-text">
                                view of selected team with list of active offensive players | 
                                when API ready add map out of players name, position | 
                                Team {team}
                            </li>
                            {offense.map((off) => (
                                <li key={off.id}>
                                {off.name} - {off.position}
                                </li>
                            ))}
                        </ul>
                    </div>
                    <div className='def-team-container'>
                        
                        <ul>
                            <li className="bold-text">
                                view of selected team with list of active defensive players | 
                                when API ready add map out of players name, position | 
                                Opps {opps}
                            </li>
                            {defense.map((def) => (
                                <li key={def.id}>
                                {def.name} - {def.position}
                                </li>
                            ))}
                        </ul>
                    </div>
            </div>
        </div>
    );
}

export default SetupView;

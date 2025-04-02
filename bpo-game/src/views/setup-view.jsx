'use client'

import Form from 'next/form';
import React from 'react';

function SetupView({ onSwitchView }) {

    const [team, setTeam] = React.useState(); 

    function homeTeamHandler(selectedTeam) {
        setTeam(selectedTeam);
    };

    const [opps, setOpps] = React.useState();

    function oppsHandler(selectedOpps) {
        setOpps(selectedOpps);
    }

    const teamOptions = [
        { value: '1', label: 'Buff Bills' },
        { value: '2', label: 'Cin Bengals'},
        { value: '3', label: 'Cle Browns'},
        { value: '4', label: 'Den Broncos' },
        { value: '5', label: 'KC Chiefs'},
        { value: '6', label: 'LA Chargers'},
        { value: '7', label: 'Mia Dolphins' },
        { value: '8', label: 'Bal Ravens'},
        { value: '9', label: 'Hou Texans'},
        { value: '10', label: 'Ind Colts' },
        { value: '11', label: 'LV Raiders'},
        { value: '12', label: 'Pitt Steelers'},
        { value: '13', label: 'NE Patriots' },
        { value: '14', label: 'NY Jets'},
        { value: '15', label: 'Jax Jaguars'},
        { value: '16', label: 'Ten Titans'},
    ]

    return (
        <div className="setup-main">
            <h1>setup view</h1>
            <Form>
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
        </div>
    );
}

export default SetupView;

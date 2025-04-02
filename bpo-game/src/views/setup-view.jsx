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

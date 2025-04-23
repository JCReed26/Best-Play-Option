'use client'

import Form from 'next/form';
import React, { useState, useEffect } from 'react';
import '../styles/setup-view.css';

function SetupView({ onSwitchView }) {

    /* User interactive states */
    const [team, setTeam] = React.useState('');
    const [opps, setOpps] = React.useState('');

    function homeTeamHandler(e) {
        setTeam(e.target.value);
    }

    function oppsHandler(e) {
        setOpps(e.target.value);
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

    const sortOptions = [
        { value: '1', label: 'Default'},
        { value: '2', label: 'Position'},
        { value: '3', label: 'Rating'},
        { value: '4', label: 'Position + Rating'},
    ]

    function getTeamLabel(teamValue) {
        const team = teamOptions.find(option => option.value == teamValue); 
        return team ? team.label : 'No team selected';
    }

    const [defOption, setDefOption] = useState('1');
    const [teamOption, setTeamOption] = useState('1'); 


    function teamOptionsHandler(choice) {
        const selectedValue = choice.target.value;
        console.log("team sort change to: ", selectedValue);
        setTeamOption(selectedValue);
        
        // Handle the fetch logic directly in the handler
        switch (selectedValue) {
            case '1': 
                console.log("fetching sort 1");
                fetchOffense(team);
                break;
            case '2': 
                console.log("fetching sort 2");
                fetchOffense_POS(team);
                break;
            case '3': 
                console.log("fetching sort 3");
                fetchOffense_RAT(team);
                break; 
            case '4': 
                console.log("fetching sort 4");
                fetchOffense_PR(team);
                break; 
        }
    }

    function defOptionsHandler(e) {
        const selectedValue = e.target.value;
        console.log("defense sort change to: ", selectedValue);
        setDefOption(selectedValue);
        
        switch (selectedValue) {
            case '1': 
                console.log("fetching defense sort 1");
                fetchDefense(team);
                break;
            case '2': 
                console.log("fetching defense sort 2");
                fetchDefense_POS(team);
                break;
            case '3': 
                console.log("fetching defense sort 3");
                fetchDefense_RAT(team);
                break; 
            case '4': 
                console.log("fetching defense sort 4");
                fetchDefense_PR(team);
                break; 
        }
    }


    /* API fetch & Data Connections */

    const [offense, setOffense] = useState([]); 
    const [defense, setDefense] = useState([]); 

    useEffect(() => {
        if (team) {
            console.log("sending team ", team);
            fetchOffense(team);
            setTeamOption('1')
        }
    }, [team]);

    useEffect(() => {
        if (opps) {
            console.log("sending opps ", opps)
            fetchDefense(opps);  
            setDefOption('1')
        } 
    }, [opps]);

    //when we can change to be the team selected 
    //offense calls

    //default
    function fetchOffense(team) {
        fetch(`http://localhost:8000/search-print`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ teamid: team })
        })
            .then(res => {
                if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
                return res.json();
            })
            .then(data => {
                if (!data || !data.players) {
                    console.error('Invalid offense data format:', data);
                    return;
                }
                setOffense(data);
                console.log("recieved team data: ", data);
            })
        .catch(err => console.error('Offense fetch error:', err));
    }

    //position *******change endpoint
    function fetchOffense_POS(team) {
        fetch(`http://localhost:8000/search-print`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ teamid: team })
        })
            .then(res => {
                if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
                return res.json();
            })
            .then(data => {
                if (!data || !data.players) {
                    console.error('Invalid offense data format:', data);
                    return;
                }
                setOffense(data);
                console.log("recieved team data: ", data);
            })
        .catch(err => console.error('Offense fetch error:', err));
    }

    //rating *****change endpoint 
    function fetchOffense_RAT(team) {
        fetch(`http://localhost:8000/search-print`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ teamid: team })
        })
            .then(res => {
                if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
                return res.json();
            })
            .then(data => {
                if (!data || !data.players) {
                    console.error('Invalid offense data format:', data);
                    return;
                }
                setOffense(data);
                console.log("recieved team data: ", data);
            })
        .catch(err => console.error('Offense fetch error:', err));
    }

    //pos+rat ****change endpoint
    function fetchOffense_PR(team) {
        fetch(`http://localhost:8000/search-print`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ teamid: team })
        })
            .then(res => {
                if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
                return res.json();
            })
            .then(data => {
                if (!data || !data.players) {
                    console.error('Invalid offense data format:', data);
                    return;
                }
                setOffense(data);
                console.log("recieved team data: ", data);
            })
        .catch(err => console.error('Offense fetch error:', err));
    }


    //when we can change to be the team that we called 
    //Defense call 

    //default 
    function fetchDefense(team) {
        fetch(`http://localhost:8000/search-print`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ teamid: team })
        })
        .then(res => {
            if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
            return res.json();
        })
        .then(data => {
            if (!data || !data.players) {
                console.error('Invalid defense data format:', data);
                return;
            }
            setDefense(data);
            console.log("recieved opps data: ", data);
        })
        .catch(err => console.error('Defense fetch error:', err));
    }

    //position *****change endpoint
    function fetchDefense_POS(team) {
        fetch(`http://localhost:8000/search-print`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ teamid: team })
        })
        .then(res => {
            if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
            return res.json();
        })
        .then(data => {
            if (!data || !data.players) {
                console.error('Invalid defense data format:', data);
                return;
            }
            setDefense(data);
            console.log("recieved opps data: ", data);
        })
        .catch(err => console.error('Defense fetch error:', err));
    }

    //rating ******change endpoint 
    function fetchDefense_RAT(team) {
        fetch(`http://localhost:8000/search-print`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ teamid: team })
        })
        .then(res => {
            if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
            return res.json();
        })
        .then(data => {
            if (!data || !data.players) {
                console.error('Invalid defense data format:', data);
                return;
            }
            setDefense(data);
            console.log("recieved opps data: ", data);
        })
        .catch(err => console.error('Defense fetch error:', err));
    }

    //pos+rat *****change endpoint 
    function fetchDefense_PR(team) {
        fetch(`http://localhost:8000/search-print`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ teamid: team })
        })
        .then(res => {
            if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
            return res.json();
        })
        .then(data => {
            if (!data || !data.players) {
                console.error('Invalid defense data format:', data);
                return;
            }
            setDefense(data);
            console.log("recieved opps data: ", data);
        })
        .catch(err => console.error('Defense fetch error:', err));
    }





    /* React HTML Page */
    return (
        <div className="setup-main">
            <h1>Setup View</h1>
            <Form className='selection-form'>
                <select value={team} onChange={homeTeamHandler}>
                    <option value="">Select Your Team</option>
                    {teamOptions.map((team) => (
                        <option key={team.value} value={team.value}>
                            {team.label}
                        </option>
                    ))}
                </select>
                <select value={opps} onChange={oppsHandler}>
                    <option value="">Select Defense To Face</option>
                    {teamOptions.map((team) => (
                        <option key={team.value} value={team.value}>
                            {team.label}
                        </option>
                    ))}
                </select>
                <button type='button' onClick={onSwitchView}>Start Game Simulation</button>
            </Form>
            <div className='selections-container'>
                <div className='home-team'>
                    <div className="home-team-header">
                        <div className="team-name">{getTeamLabel(team)}</div>
                        <div className="dropdown-button">
                            <select value={teamOption} onChange={teamOptionsHandler}>
                                {sortOptions.map((option) => (
                                    <option key={option.value} value={option.value}>
                                        {option.label}
                                    </option>
                                ))}
                            </select>
                        </div>
                    </div>
                    <div className='home-team-container'>
                        <ul>
                            <li className="bold-text">
                                {team} | {teamOption}
                            </li>
                            {offense?.players?.length > 0 ? (
                                offense.players.map((player, index) => (
                                    <li key={index}>
                                        {player.player} - {player.position} ({player.rating})
                                    </li>
                                ))
                            ) : (
                                <li className="error-message">
                                    No offensive players found - please check team selection
                                </li>
                            )}
                        </ul>
                    </div>
                </div>
                <div className='def-team'>
                    <div className="def-team-header">
                        <div className="opps-name">{getTeamLabel(opps)}</div>
                            <div className="dropdown-button">
                                <select value={defOption} onChange={defOptionsHandler}>
                                    {sortOptions.map((option) => (
                                        <option key={option.value} value={option.value}>
                                            {option.label}
                                        </option>
                                    ))}
                                </select>
                            </div>
                    </div>
                    <div className='def-team-container'>
                        <ul>
                            <li className="bold-text">
                                {opps} | {defOption}
                            </li>
                            {defense?.players?.length > 0 ? (
                                defense.players.map((player, index) => (
                                    <li key={index}>
                                        {player.player} - {player.position} ({player.rating})
                                    </li>
                                ))
                            ) : (
                                <li className="error-message">
                                    No defensive players found - please check team selection
                                </li>
                            )}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default SetupView;

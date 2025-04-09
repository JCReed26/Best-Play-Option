'use client'

import React, { useState, useEffect } from 'react';

export default function HelloWorld() {
  const [message, setMessage] = useState('Loading...');
  const [players, setPlayers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    // Fetch hello world message from backend
    fetch(`${process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000'}/`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        setMessage(data.message);
        setLoading(false);
      })
      .catch(error => {
        setError('Failed to fetch message: ' + error.message);
        setLoading(false);
      });

    // Fetch players from backend
    fetch(`${process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000'}/players`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        setPlayers(data);
      })
      .catch(error => {
        console.error('Failed to fetch players:', error);
      });
  }, []);

  if (loading) return <div>Loading...</div>;
  if (error) return <div className="error">{error}</div>;

  return (
    <div className="hello-world-container">
      <h2>Backend Connection Test</h2>
      <div className="message-box">
        <h3>Message from Backend:</h3>
        <p>{message}</p>
      </div>
      
      <div className="players-box">
        <h3>Players from Backend:</h3>
        <ul>
          {players.map(player => (
            <li key={player.id}>
              {player.name} - {player.position}
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}

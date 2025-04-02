// Main Directory Page Switcher 
// Basic 2 Pages switcher 
// ... for scaling it would be <pageName>Handler()

'use client'

import React from 'react';
import GameView from '../views/game-view';
import SetupView from '../views/setup-view';


export default function Page() {

  const [viewControl, setViewControl] = React.useState(false);

  function viewHandler() {
    setViewControl(prevState => !prevState);
  }

  return (
    <html>
      <body>
        <div className='app-container'>
          {viewControl ? <GameView onSwitchView={viewHandler} /> : <SetupView onSwitchView={viewHandler} />}
        </div>
      </body>
    </html>
  );
}


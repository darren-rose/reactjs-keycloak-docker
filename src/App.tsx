import React from 'react';
import './App.css';

function App() {

  console.log('process.env.REACT_APP_UI_IAM_AUTH', process.env.REACT_APP_UI_IAM_AUTH)
  console.log('process.env.REACT_APP_API_GATEWAY', process.env.REACT_APP_API_GATEWAY)

  return (
    <div className="App">
      <header className="App-header">
        <p>
          main ui
        </p>
      </header>
    </div>
  );
}

export default App;

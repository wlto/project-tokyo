import React from 'react';
import './App.css';

// Components
import FetchedImage from '../FetchedImage/FetchedImage';
import NeumorphismButton from '../NeumorphismButton/NeumorphismButton';
import ColourPalette from '../ColourPalette/ColourPalette';

function App() {
  return (
    <div className="App">
      <h1 className="App-title">tokyo</h1>
      <FetchedImage />
      <NeumorphismButton>REFRESH</NeumorphismButton>
      <ColourPalette />
      <p className="App-copyright">made for fun by <span className="App-copyright-author">william to</span></p>
    </div>
  );
}

export default App;

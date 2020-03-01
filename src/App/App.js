import React from 'react';
import './App.css';

function App() {
  return (
    <div className="App">
      <h1 className="App-title">tokyo</h1>
      <div className="FetchedImage">
        <div className="FetchedImage-image">some image</div>
        <p className="FetchedImage-author">an author</p>
      </div>
      <div className="NeumorphismButton">REFRESH</div>
      <div className="ColourPalette">
        <h3 className="ColourPalette">DONIMANT COLOURS</h3>
        <div className="ColourPalette-colour-container">
          <div className="ColourPalette-colour-box">blue</div>
          <p className="ColourPalette-colour-hex">#0000ff</p>
          <p className="ColourPalette-colour-percentage">100%</p>
        </div>
      </div>
      <p className="App-copyright">made for fun by <span className="App-copyright-author">william to</span></p>
    </div>
  );
}

export default App;

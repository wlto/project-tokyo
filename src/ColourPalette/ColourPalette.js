import React from 'react';
import './ColourPalette.css';

function ColourPalette(props) {
  return (
    <div className="ColourPalette">
      <h3 className="ColourPalette-title">DOMINANT COLOURS</h3>
      <div className="ColourPalette-colour-container">
        <div className="ColourPalette-colour-box">blue</div>
        <p className="ColourPalette-colour-hex">#0000ff</p>
        <p className="ColourPalette-colour-percentage">100%</p>
      </div>
    </div>
  );
}

export default ColourPalette;
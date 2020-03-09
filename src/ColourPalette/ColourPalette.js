import React from 'react';
import './ColourPalette.css';

function ColourPalette(props) {
  const { colours } = props;

  const colourBoxes = colours.map((colour, index) => {
    return (
      <div className="ColourPalette-colour-box">
        <div className="ColourPalette-colour-box-box" style={{
          backgroundColor: `${colour.hexValue}`
        }}></div>
        <p className="ColourPalette-colour-box-hex">{colour.hexValue}</p>
        <p className="ColourPalette-colour-box-percentage">{colour.percentage}</p>
      </div>
    );
  });

  return (
    <div className="ColourPalette">
      <h3 className="ColourPalette-title">DOMINANT COLOURS</h3>
      <div className="ColourPalette-colours-container">
        {colourBoxes}
      </div>
    </div>
  );
}

export default ColourPalette;
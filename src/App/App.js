import React from 'react';
import './App.css';

// Components
import FetchedImage from '../FetchedImage/FetchedImage';
import NeumorphismButton from '../NeumorphismButton/NeumorphismButton';
import ColourPalette from '../ColourPalette/ColourPalette';

// Environment variables
require('dotenv').config();

function App() {
  const unsplashAPIEndpoint = `https://api.unsplash.com/search/photos?client_id=${process.env.REACT_APP_UNSPLASH_ACCESS_KEY}&query=tokyo`;

  const handleOnClick = async (event) => {
    const response = await fetch(unsplashAPIEndpoint);
    const body = await response.json();
    console.log(body.results);
  }

  return (
    <div className="App">
      <h1 className="App-title">tokyo</h1>
      <FetchedImage />
      <NeumorphismButton onClickHandler={handleOnClick}>
        REFRESH
      </NeumorphismButton>
      <ColourPalette />
      <p className="App-copyright">made for fun by <span className="App-copyright-author">william to</span></p>
    </div>
  );
}

export default App;

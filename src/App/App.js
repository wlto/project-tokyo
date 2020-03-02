import React, { useState } from 'react';
import './App.css';

// Components
import FetchedImage from '../FetchedImage/FetchedImage';
import NeumorphismButton from '../NeumorphismButton/NeumorphismButton';
import ColourPalette from '../ColourPalette/ColourPalette';

// Environment variables
require('dotenv').config();

function App() {
  const unsplashAPIEndpoint = `https://api.unsplash.com/search/photos?client_id=${process.env.REACT_APP_UNSPLASH_ACCESS_KEY}&query=tokyo`;

  // State
  const [fetchedImage, setFetchedImage] = useState({});

  const handleOnClick = async (event) => {
    const response = await fetch(unsplashAPIEndpoint);
    const body = await response.json();
    const fetchedResult = body.results[0];

    setFetchedImage({
      url: fetchedResult.urls.regular,
      author: fetchedResult.user.name,
      unsplashUrl: fetchedResult.links.html
    });
  }

  return (
    <div className="App">
      <h1 className="App-title">tokyo</h1>
      <FetchedImage imageInfo={fetchedImage} />
      <NeumorphismButton onClickHandler={handleOnClick}>
        REFRESH
      </NeumorphismButton>
      <ColourPalette />
      <p className="App-copyright">made for fun by <span className="App-copyright-author">william to</span></p>
    </div>
  );
}

export default App;

import React, { useState, useEffect } from 'react';
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

  const fetchImage = async () => {
    const randomIndex = parseInt(Math.random() * 10);
    const response = await fetch(unsplashAPIEndpoint);
    const body = await response.json();
    const fetchedResult = body.results[randomIndex];

    setFetchedImage({
      url: fetchedResult.urls.regular,
      author: fetchedResult.user.name,
      unsplashUrl: fetchedResult.links.html
    });
  }

  // Effects
  useEffect(() => {
    fetchImage();
  }, []);

  const handleOnClick = (event) => {
    fetchImage();
  }

  return (
    <div className="App">
      <h1 className="App-title">tokyo</h1>
      <div className="App-FetchedImage">
        <FetchedImage imageInfo={fetchedImage} />
        <NeumorphismButton onClickHandler={handleOnClick}>
          REFRESH
        </NeumorphismButton>
      </div>
      <ColourPalette />
      <p className="App-copyright">made for fun by <span className="App-copyright-author">william to</span></p>
    </div>
  );
}

export default App;

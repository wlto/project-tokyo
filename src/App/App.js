import React, { useState, useEffect } from 'react';
import './App.css';

// Libraries
import { cover } from 'intrinsic-scale';

// Components
import FetchedImage from '../FetchedImage/FetchedImage';
import NeumorphismButton from '../NeumorphismButton/NeumorphismButton';
import ColourPalette from '../ColourPalette/ColourPalette';

// Environment variables
require('dotenv').config();

function App() {
  const unsplashAPIEndpoint = `https://api.unsplash.com/search/photos?client_id=${process.env.REACT_APP_UNSPLASH_ACCESS_KEY}&query=tokyo`;

  const colours = [
    {
      hexValue: '#000000',
      percentage: '20%'
    },
    {
      hexValue: '#914E72',
      percentage: '11%'
    },
    {
      hexValue: '#F15060',
      percentage: '9%'
    },
    {
      hexValue: '#3D5588',
      percentage: '6%'
    },
    {
      hexValue: '#00838A',
      percentage: '4%'
    }
  ]

  // State
  const [fetchedImage, setFetchedImage] = useState({
    url: '',
    author: '',
    unsplashUrl: ''
  });

  const fetchImage = async () => {
    const randomIndex = parseInt(Math.random() * 10);
    const response = await fetch(unsplashAPIEndpoint);
    const body = await response.json();
    const fetchedResult = body.results[randomIndex];

    setFetchedImage({
      url: fetchedResult.urls.full,
      author: fetchedResult.user.name,
      unsplashUrl: fetchedResult.links.html
    });
  }

  // Effects
  useEffect(() => {
    fetchImage();
  }, []);

  useEffect(() => {
    const image = new Image();

    var canvas = document.getElementById('App-image-canvas');
    var context = canvas.getContext('2d');
    canvas.width = window.innerWidth * 80 / 100;
    canvas.height = canvas.width;

    image.setAttribute("src", fetchedImage.url);

    // Credits: https://riptutorial.com/html5-canvas/example/19169/scaling-image-to-fit-or-fill-
    image.addEventListener('load', function () {
      var scale = Math.max(canvas.width / image.width, canvas.height / image.height);
      // Get the top left position of the image
      var x = (canvas.width / 2) - (image.width / 2) * scale;
      var y = (canvas.height / 2) - (image.height / 2) * scale;
      context.drawImage(image, x, y, image.width * scale, image.height * scale);
    });

    // context.drawImage(image, 0, 0);
    // var myData = context.getImageData(0, 0, 800, 400).data;
    // console.log(myData);
  }, [fetchedImage]);

  const handleOnClick = (event) => {
    fetchImage();
  }

  return (
    <div className="App">
      <h1 className="App-title">tokyo</h1>
      <div className="App-FetchedImage">
        {/* <FetchedImage imageInfo={fetchedImage} /> */}
        <canvas id="App-image-canvas" className="App-image-canvas-cl"></canvas>
        <NeumorphismButton onClickHandler={handleOnClick}>
          REFRESH
        </NeumorphismButton>
      </div>
      <ColourPalette
        colours={colours}
      />
      <p className="App-copyright">made for fun by <span className="App-copyright-author"><a href="https://github.com/wlto">william to</a></span></p>
    </div>
  );
}

export default App;

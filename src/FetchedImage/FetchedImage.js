import React from 'react';
import './FetchedImage.css';

function FetchedImage(props) {
  const { imageInfo } = props;

  return (
    <div className="FetchedImage">
      <div className="FetchedImage-image" style={{
        backgroundImage: `url(${imageInfo.url})`
      }}></div>
      <p className="FetchedImage-author">by {imageInfo.author} on <a href={imageInfo.unsplashUrl}>Unsplash</a></p>
    </div>
  );
}

export default FetchedImage;
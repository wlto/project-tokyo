import React from 'react';
import './FetchedImage.css';

function FetchedImage(props) {
  const { imageUrl, imageAuthor, imageUnsplashUrl } = props;

  return (
    <div className="FetchedImage">
      <div className="FetchedImage-image" style={{
        backgroundImage: `url(${imageUrl})`
      }}></div>
      <p className="FetchedImage-author">by {imageAuthor} on <a href={imageUnsplashUrl}>Unsplash</a></p>
    </div>
  );
}

export default FetchedImage;
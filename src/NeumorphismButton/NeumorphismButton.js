import React from 'react';
import './NeumorphismButton.css';

function NeumorphismButton(props) {
  const { children, onClickHandler } = props;
  return (
    <div className="NeumorphismButton" onClick={onClickHandler}>
      {children}
    </div>
  );
}

export default NeumorphismButton
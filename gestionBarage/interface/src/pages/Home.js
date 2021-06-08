import React from 'react';
import logo from "../images/logo.png";
function Home() {
  return (
    <div className='home'>
      
      <img 
        src={logo}
        alt="Logo Agence du Bassin Hydraulique de l'Oum Er Rbia"
        width="550px"
      ></img>
    </div>
  );
}

export default Home;

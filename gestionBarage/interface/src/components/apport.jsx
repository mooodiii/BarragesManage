import React from 'react';

import a1 from "../images/calcul apport/a1.png";
import a2 from "../images/calcul apport/a2.png";
import a3 from "../images/calcul apport/a3.png";
import a4 from "../images/calcul apport/a4.png";
import a5 from "../images/calcul apport/a5.png";
import a6 from "../images/calcul apport/a6.png";
import a7 from "../images/calcul apport/a7.png";
import a8 from "../images/calcul apport/a8.png";
import a9 from "../images/calcul apport/a9.png";



class Apport extends React.Component {

  constructor(props){
    super(props);
    this.state = {
    }

  }

  
  render(){ 
  return (
    <>
      <div className="guide">
        <div className="container">
          
          <p>1-	Dans le menu de navigation cliquez sur <span className="boldNav">‘Gestion barrage’</span>, puis sélectionnez <span className="boldNav">‘Calcul d’apport’</span>.</p>
          <img src={a1} alt="" />
        </div>
        <div className="container">
          
          <p>2-	Après avoir sélectionnez <span className="boldNav">‘calcul d’apport’</span> une fenêtre s’affichera pour sélectionnez le barrage, la fréquence et la période à calculer.</p>
          <img src={a2} alt="" />
        </div>
        <div className="container">
          
          <p>3-	Sélectionnez le barrage.</p>
          <img src={a3} alt="" />
        </div>
        <div className="container">
          
          <p>4-	Sélectionnez la fréquence.</p>
          <img src={a4} alt="" />
        </div>
        <div className="container">
          
          <p>5-	Sélectionnez la première date.</p>
          <img src={a5} alt="" />
        </div>
        <div className="container">
          
          <p>6-	Sélectionnez la deuxième date.</p>
          <img src={a6} alt="" />
        </div>
        <div className="container">
          
          <p>7-	Clickez sur le bouton <span className="boldNav">‘calculer’</span> et le résultat s’affichera dans la zone de texte <span className="boldNav">‘Résultat’</span>.</p>
          <img src={a7} alt="" />
        </div>
        <div className="container">
          
          <p>8-	Au cas où vous sélectionnez <span className="boldNav">‘Complexe A. El Hansali-Massira’</span> et que vous cliquez sur calculer, deux boutons s'affichent afin de calculer l'apport pour chacun des deux barrages.</p>
          <img src={a8} alt="" />
        </div>
        <div className="container">
          
          <p>9-	En fin le résultat du barrage sélectionner s’affichera.</p>
          <img src={a9} alt="" />
        </div>
      </div>
    </>);
    }
}

export default Apport;

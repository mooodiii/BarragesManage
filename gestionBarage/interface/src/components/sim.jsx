import React from 'react';

import a1 from "../images/simulation/a1.png";
import a2 from "../images/simulation/a2.png";
import a3 from "../images/simulation/a3.png";
import a4 from "../images/simulation/a4.png";
import a5 from "../images/simulation/a5.png";



class Sim extends React.Component {

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
          
          <p>1-	Dans le menu de navigation cliquez sur <span className="boldNav">‘Gestion barrage’</span>, puis sélectionnez <span className="boldNav">‘Simulation’</span>.</p>
          <img src={a1} alt="" />
        </div>
        <div className="container">
        
          <p>2-	Cliquez sur un barrage.</p>
          <img src={a2} alt="" />
        </div>
        <div className="container">
        
          <p>3-	Après avoir sélectionner sur un barrage, cliquez sur la barre <span className="boldNav">‘selectionner une periode’</span>, puis sélectionnez la periode et cliquez sur <span className="boldNav">‘Apply’</span>. </p>
          <img src={a3} alt="" />
        </div>
        <div className="container">
        
          <p>4-	Pour les champs <span className="boldNav">‘Reserve’</span>, <span className="boldNav">‘Apports’</span> et <span className="boldNav">‘Evap’</span> s’affichera automatiquement à partir du bilan hydraulique du barrage sélectionné. Les autres zones de texte on peut les saisir manuellement., pour les champs <span className="boldNav">‘Total’</span>, <span className="boldNav">‘Espérance de stock’</span> et <span className="boldNav">‘Taux de Remplissage’</span> sera calculé automatiquement. </p>
          <img src={a4} alt="" />
        </div>
        <div className="container">
        
          <p>5-	Finalement pour exporter cette tableau comme un fichier Excel il y a le bouton <span className="boldNav">‘exporter fichier Excel’</span>, cliquez sur cette bouton et saisissez le nom, puis cliquez sur ‘Save’.</p>
          <img src={a5} alt="" />
        </div>
      </div>
    </>);
    }
}

export default Sim;

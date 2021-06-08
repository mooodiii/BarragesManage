import React from 'react';

import a1 from "../images/suivi/a1.png";
import a2 from "../images/suivi/a2.png";
import a3 from "../images/suivi/a3.png";
import a4 from "../images/suivi/a4.png";
import a5 from "../images/suivi/a5.png";




class Suivi extends React.Component {

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
          
          <p>1-	Dans le menu de navigation cliquez sur <span className="boldNav">‘Fichier’</span>, puis sélectionnez <span className="boldNav">‘Suivi Les bilans des barrages’</span>.</p>
          <img src={a1} alt="" />
        </div>
        <div className="container">
          
          <p>2-	Sélectionnez l’année hydraulique à afficher.</p>
          <img src={a2} alt="" />
        </div>
        <div className="container">
          
          <p>3- Une table s’affichera, il y a des valeurs qui sont affiché automatiquement à partir du bilan hydraulique, et il y a aussi des valeurs on peut les saisir manuellement.</p>
          <img src={a3} alt="" />
        </div>
        <div className="container">
          
          <p>4-	Après avoir terminé la saisie des valeurs cliquez sur <span className="boldNav">‘submit’</span> pour valider les données.</p>
          <img src={a4} alt="" />
        </div>
        <div className="container">
          
          <p>5-	Pour exporter ce tableau on trouve plusieurs formats. Il suffit juste de sélectionner le format de fichier et le donner un nom, et en fin cliquez sur <span className="boldNav">‘Save’</span>.</p>
          <img src={a5} alt="" />
        </div>

      </div>
    </>);
    }
}

export default Suivi;

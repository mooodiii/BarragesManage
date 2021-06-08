import React from 'react';

import a1 from "../images/converter/a1.png";
import a1_5 from "../images/converter/a1_5.png";
import a2 from "../images/converter/a2.png";
import a3 from "../images/converter/a3.png";
import a4 from "../images/converter/a4.png";
import a5 from "../images/converter/a5.png";




class Converter extends React.Component {

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
          
          <p>1- Assurez-vous d'avoir sélectionné la feuille où se trouve <span className="boldNav">le bilan hydraulique</span>.</p>
          <img src={a1} alt="" />
        </div>
        <div className="container">
          
          <p>2- Assurez-vous que vous activez l'édition.</p>
          <img src={a1_5} alt="" />
        </div>
        <div className="container">
          
          <p>3-	Sélectionnez les données (en-têtes, du jour 1 à la fin du mois).</p>
          <img src={a2} alt="" />
        </div>
        <div className="container">
          
          <p>4- Après cela, ouvrez l'application Convertisseur Excel et cliquez sur le barrage lequelle vous sélectionnez ses données.</p>
          <img src={a3} alt="" />
        </div>
        <div className="container">
          
          <p>5-	Saisissez le nom du fichier mais assurez-vous qu'il contienne le nom du barage (ex : aitmessaoudNouveau). regarder la photo.</p>
          <img src={a4} alt="" />
        </div>
        <div className="container">
          
          <p>6-	Enfin, le fichier converti affichera, editez s'il y a une valeur ou un en-tête incorrect. Après l'édition, vous pouvez maintenant importer le fichier.</p>
          <img src={a5} alt="" />
        </div>

      </div>
    </>);
    }
}

export default Converter;

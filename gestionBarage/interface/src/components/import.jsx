import React from 'react';

import a1 from "../images/importFile/a1.png";
import a2 from "../images/importFile/a2.png";
import a3 from "../images/importFile/a3.png";
import a4 from "../images/importFile/a4.png";
import a5 from "../images/importFile/a5.png";
import a6 from "../images/importFile/a6.png";
import a7 from "../images/importFile/a7.png";




class Import extends React.Component {

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
          
          <p>1-	Dans le menu de navigation cliquez sur <span className="boldNav">‘Fichier’</span>, puis sélectionnez <span className="boldNav">‘Importer un fichier’</span>.</p>
          <img src={a1} alt="" />
        </div>
        <div className="container">
          
          <p>2-	Cliquez sur le bouton <span className="boldNav">‘Choose File’</span>, ensuite choisissez le fichier Excel que vous êtes convertis (au cas où vous voudriez importer le bilan de barrage <span className="boldNav">Bin Ouidane</span> sélectionnez le fichier excel d'origine) et cliquez sur <span className="boldNav">‘Open’</span>.</p>
          <img src={a2} alt="" />
        </div>
        <div className="container">
          
          <p>3-	Sélectionnez la feuille où se trouve le bilan hydraulique.</p>
          <img src={a3} alt="" />
        </div>
        <div className="container">
          
          <p>4-	Sélectionnez de quel mois cette bilan.</p>
          <img src={a4} alt="" />
        </div>
        <div className="container">
          
          <p>5-	Après avoir vérifier si le bilan hydraulique du mois selectionner n’existe pas le bouton <span className="boldNav">‘Importer’</span> s’activera, vous pouvez importer le fichier.</p>
          <img src={a5} alt="" />
        </div>
        <div className="container">
          
          <p>6-	Le fichier s’affichera pour vérifier si toutes les données sont correctes, et vous pouvez modifier les valeurs s’il y a une faute.</p>
          <img src={a6} alt="" />
        </div>
        <div className="container">
          
          <p>7-	Après avoir vérifié les valeurs cliquez sur le bouton <span className="boldNav">‘Submit’</span> pour valider les données.</p>
          <img src={a7} alt="" />
        </div>

      </div>
    </>);
    }
}

export default Import;

import React from 'react';

import a1 from "../images/adminP/a1.png";
import a2 from "../images/adminP/a2.png";
import a3 from "../images/adminP/a3.png";
import a2_1_1 from "../images/adminP/a2_1_1.png";
import a2_1_2 from "../images/adminP/a2_1_2.png";
import a2_1_3 from "../images/adminP/a2_1_3.png";
import a2_2_1 from "../images/adminP/a2_2_1.png";
import a2_2_2 from "../images/adminP/a2_2_2.png";
import a2_3 from "../images/adminP/a2_3.png";




class Admin extends React.Component {

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
          <p>1-	Dans le menu de navigation cliquez sur <span className="boldNav">‘Panneau administration’</span>.</p>
          <img src={a1} alt="" />
        </div>
        <div className="container">
          <p>2-	Pour utiliser la page d’administration il y a trois cas, faites défiler vers le bas pour voir cas séparément. </p>
          <img src={a2} alt="" />
        </div>
        <h1>Cas 1: Modification des utilisateurs</h1>
        <div className="container">
          <p>
          1. Cette bouton pour ajouter an nouveau Utilisateur.
          2. Cette bouton sert à modifier les informations d’utilisateur.
          </p>
          <img src={a3} alt="" />
        </div>
        <div className="container">
          <p>4-	Dans cette page on peut faire tous les mises à jour d'utilisateur.</p>
          <img src={a2_1_1} alt="" />
        </div>
        <div className="container">
          <p>5-	Vous ne pouvez pas voir le mot de passe d’un utilisateur à cause de la protection, mais vous pouvez le modifier si vous cliquez sur ce lien.</p>
          <img src={a2_1_2} alt="" />
        </div>
        <div className="container">
          <p>6-	Saisissez le nouveau mot de passe et appuyez sur <span className="boldNav">‘modifier le mot de passe’</span>.</p>
          <img src={a2_1_3} alt="" />
        </div>
        <h1>Cas 2: Modification des donnees d'apport</h1>
        <div className="container">
          <p>7-	Après avoir sélectionnez un barrage, une liste des fréquences s’affichera, choisissez une fréquence pour modifier ces valeurs.</p>
          <img src={a2_2_1} alt="" />
        </div>
        <div className="container">
          <p>8-	Maintenant vous pouvez saisir les nouvelles valeurs pour chaque mois.  </p>
          <img src={a2_2_2} alt="" />
        </div>
        <h1>Cas 3: Modification du mot de pass d'admin</h1>
        <div className="container">
          <p>9-	Après avoir cliquez sur <span className="boldNav">‘MODIFIER LE MOT DE PASSE’</span>, une formule s’affichera, saisissez l’ancien mot de passe, puis le nouveau. </p>
          <img src={a2_3} alt="" />
        </div>
      </div>
    </>);
    }
}

export default Admin;

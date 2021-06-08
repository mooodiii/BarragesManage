import React from 'react';

import './guide.css';
import { ImBooks } from "react-icons/im";

import Apport from '../components/apport'
import Sim from '../components/sim'
import Admin from '../components/admin';
import Import from '../components/import'
import Suivi from '../components/suivi';
import Converter from '../components/converter'


class Guide extends React.Component  {
    constructor(props){
        super(props)
        this.state ={
            show : "",
            superUser: false
        }
        this.ShowHide = this.ShowHide.bind(this);
        this.fetchData = this.fetchData.bind(this);
    }

    componentWillMount(){
        this.fetchData()
    }

    fetchData(){
        fetch('/APIs/isSuperUser')
        .then(Response => Response.json())
        .then(data => {
          this.setState({
            superUser: data.superUser
            })
        })
    }
    

    ShowHide(e){
        this.setState({
            show: e.target.name
        })
    }
    render(){
    
        return (
            <>
                <div className="nav" style={{textAlign : "center"}}>
                    <button className="btnM" name="apport" onClick={this.ShowHide}><ImBooks /> Calcul d'apport</button>
                    <button className="btnM" name="sim" onClick={this.ShowHide}><ImBooks /> Simulation</button>
                    {this.state.superUser ?  <button className="btnM" name="admin" onClick={this.ShowHide}><ImBooks /> Panneau d'administration</button> : console.log()}
                    <button className="btnM" name="converter" onClick={this.ShowHide}><ImBooks /> Convertisseur Excel</button>
                    <button className="btnM" name="import" onClick={this.ShowHide}><ImBooks /> Importer une fichier</button>
                    <button className="btnM" name="suivi" onClick={this.ShowHide}><ImBooks /> Suivi Bilan</button>
                </div>
                <div>
                    {this.state.show === "apport" ?
                        <div> <Apport /> </div> : 
                    this.state.show === "sim" ? 
                        <div> <Sim /> </div> : 
                    this.state.show ==="admin" ?
                        <div> <Admin /> </div> :
                    this.state.show ==="converter" ?
                        <div> <Converter /> </div> :
                    this.state.show ==="import" ?
                        <div> <Import /> </div> :
                    this.state.show ==="suivi" ?
                        <div> <Suivi /> </div> :
                    <div></div>
                    }
                </div>
            </>
        );
    }
}

export default Guide;
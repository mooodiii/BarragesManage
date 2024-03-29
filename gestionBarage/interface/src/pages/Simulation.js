import React from 'react';
import './GestionBarrage.css';
import {GestionBarrageData} from './GestionBarrageData';
import { Link } from 'react-router-dom';
import SimComplex from '../components/simComplex'
import SimBinOuidane from '../components/simBinOuidane'
import SimMyYoussef from '../components/simMyYoussef';
import { FcDam } from "react-icons/fc";


class Simulation extends React.Component {
    constructor(props){
        super(props)
        this.state ={
            show : ""
        }
        this.ShowHide = this.ShowHide.bind(this)
    }

    ShowHide(e){
        this.setState({
            show: e.target.name
        })
    }


    render(){
        return (
        <>
        <ul className="navv">
        {GestionBarrageData.map((item, index) => {
                return (
                    <li key={index} className={item.cName} id={item.idd}>
                    <Link to={item.path}>
                        <span>{item.title}</span>
                    </Link>
                    </li>

                );
                })}
        </ul>
        <div style={{textAlign : "center"}}>
            <button name="binOuidane" onClick={this.ShowHide}><FcDam /> Bin Ouidane</button>
            <button name="complex" onClick={this.ShowHide}><FcDam /> Complexe al Hansali-Al Massira</button>
            <button name="youssef" onClick={this.ShowHide}><FcDam /> My Youssef</button>
        </div>
        {this.state.show === "binOuidane" ?
         <div> <SimBinOuidane /> </div> : 
         this.state.show === "complex" ? 
         <div> <SimComplex /> </div> : this.state.show ==="youssef" ?
         <div> <SimMyYoussef /> </div> : <div></div>
         }
        
        
        
        </>
        )
    }
}

export default Simulation;

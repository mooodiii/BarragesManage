import { render } from '@testing-library/react';
import React from 'react';
import './GestionBarrage.css';
import {GestionBarrageData} from './GestionBarrageData';
import { Link } from 'react-router-dom';
import simComplex from '../components/simComplex'
import simBinOuidane from '../components/simBinOuidane'
import simMyYoussef from '../components/simMyYoussef'

class Simulation extends React.Component {
    render(){
        return (
        
        <div>
            <simBinOuidane />
            <simComplex />
            <simMyYoussef />
        </div>
        )
    }
}

export default Simulation;

import { render } from '@testing-library/react';
import React from 'react';
import './GestionBarrage.css';
import { Link } from 'react-router-dom';
import {GestionBarrageData} from './GestionBarrageData';

function GestionBarrage () {
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
    </>
  )
}

export default GestionBarrage;

import React from 'react';
import XLSX from 'xlsx';
import {FichierData} from './fichierData'
import { Link } from 'react-router-dom';

function Fichier ()  {
  return (
    <>
    <ul className="navv">
    {FichierData.map((item, index) => {
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

export default Fichier;
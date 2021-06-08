import React from 'react';
import './App.css';
import Navbar from './components/Navbar';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Home from './pages/Home';
import Fichier from './pages/Fichier'
import GestionBarrage from './pages/GestionBarrage';
import CalculApport from './pages/CalculApport';
import Simulation from './pages/Simulation';
import importFile from './pages/importFile';
import SuiviBilan from './pages/SuiviBilan';
import submitData from './pages/submitData';
import tableau from './pages/tableau';
import guide from './pages/guide';

function App() {
  return (
    <>
      <Router>
        <Navbar />
        <Switch>
          <Route path='/' exact component={Home} />
          <Route path='/home' exact component={Home} />
          <Route path='/GestionBarrage' exact component={GestionBarrage} />
          <Route path='/gestionBarrage/CalculApport' component={CalculApport} />
          <Route path='/gestionBarrage/simulation' component={Simulation} />
          <Route path='/tableauDeBord' exact component={tableau} />
          <Route path='/Fichier' exact component={Fichier} />
          <Route path='/Fichier/import' component={importFile} />
          <Route path='/Fichier/SuiviBilan' component={SuiviBilan} />
          <Route path='/Fichier/submitData' component={submitData} />
          <Route path='/Guide' exact component={guide} />
        </Switch>
      </Router>
    </>
  );
}

export default App;

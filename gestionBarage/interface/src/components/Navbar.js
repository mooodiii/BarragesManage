import React, { useState } from 'react';
import * as FaIcons from 'react-icons/fa';
import * as AiIcons from 'react-icons/ai';
import { Link } from 'react-router-dom';
import { SidebarData } from './SidebarData';
import './Navbar.css';
import { IconContext } from 'react-icons';
import logo from '../images/logo.png';


class Navbar extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      sidebar: false,
      superUser: false
    }
    this.fetchData = this.fetchData.bind(this)
    this.showSidebar = this.showSidebar.bind(this)
  }

  showSidebar = () => this.setState({sidebar: !this.state.sidebar }) ;

  componentWillMount(){
    this.fetchData()
  }
  fetchData(){
    fetch('http://127.0.0.1:8000/APIs/isSuperUser')
    .then(Response => Response.json())
    .then(data => {
      this.setState({
        superUser: data.superUser
      })
    })
    
  };
  render(){ 
  return (
    <>
      <IconContext.Provider value={{ color: '#fff' }}>
        <div className='navbar'>
          <Link to='#' className='menu-bars'>
            <FaIcons.FaBars onClick={this.showSidebar} />
          </Link>
        </div>
        <nav className={this.state.sidebar ? 'nav-menu active' : 'nav-menu'}>
          <ul className='nav-menu-items' onClick={this.showSidebar}>
            <li className='navbar-toggle'>
              <Link to='#' className='menu-bars'>
                <AiIcons.AiOutlineClose />
              </Link>
            </li>
            {SidebarData.map((item, index) => {

              if (item.title === "Panneau administration"){
                if (this.state.superUser){
                  return (
                  
                    <li key={index} className={item.cName}>
                      <a href="/fr/admin/">
                        {item.icon}
                        <span>{item.title}</span>
                      </a>
                    </li>
    
                  );
                }else{
                  return (
                  
                    <li style={{display: 'none'}} key={index} className={item.cName}>
                      <a href="/fr/admin/">
                        {item.icon}
                        <span>{item.title}</span>
                      </a>
                    </li>
    
                  );
                }
              }
              else if (item.title === "Log out"){
                return (
                
                  <li key={index} className={item.cName}>
                    <a href="/logout">
                      {item.icon}
                      <span>{item.title}</span>
                    </a>
                  </li>
  
                );
              }

              return (
                
                <li key={index} className={item.cName}>
                  <Link to={item.path}>
                    {item.icon}
                    <span>{item.title}</span>
                  </Link>
                </li>

              );
            })}
          </ul>
        </nav>
      </IconContext.Provider>
    </>
  );
          }
}

export default Navbar;

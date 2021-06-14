import React from 'react';
import {FichierData} from './fichierData'
import { Link, Redirect } from 'react-router-dom';
import LoadingOverlay from 'react-loading-overlay';
import RiseLoader from 'react-spinners/RiseLoader';
import { SiMicrosoftexcel } from "react-icons/si";
import { FaRegFilePdf, FaFileCsv } from "react-icons/fa";


class SuiviBilan extends React.Component  {
  constructor(props){
    super(props);
    this.state = {
      periodeList: [],
      data : [],
      trans: [],
      apport: [],
      show : false,
      periode:"",
      wait: true,
      redirect:false,
      allow: false
    }
    this.fetchData = this.fetchData.bind(this)
    this.getData = this.getData.bind(this)
    this.handleChangeValues = this.handleChangeValues.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)

  }

  componentWillMount(){
    this.fetchData()
  }

  getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
  }
  

  fetchData(){
    fetch('/APIs/suiviBilan')
    .then(Response => Response.json())
    .then(data => {
      this.setState({
        wait: false,
        redirect: data['redirect']
      })
      
      fetch('/APIs/periode')
      .then(Response => Response.json())
      .then(data =>{
        let list = [];
        console.log(data);
        data.forEach(element => {
          list.push(element.periode)
        });
        this.setState({
          periodeList: list
        })
      })
  })
  }

  getData(e){
    let periode = e.target.value.split("-");
    let periode2 = periode[0];
    periode = periode[1];
    let thisYear = new Date();
    thisYear = thisYear.getFullYear();
    if (periode >= thisYear && periode2 < thisYear){
      
      this.setState({
        allow : true
      })
    }
    else{
      this.setState({
        allow : false
      })
    }
    
    this.setState({
      periode: e.target.value,
      data : [],
      show : false,
    })
    fetch(`/APIs/suiviBilan/getData/${e.target.value}`)
    .then(Response => Response.json())
    .then(data =>{
      console.log(data);
      this.setState({
        data: data[0],
        trans: data[1],
        apport: data[2],
        show: true,
      })
    })
  }


  array = []
  handleChangeValues(e){
    
    let newValue = e.target.value;
    let name  = e.target.name;
    let id = e.target.id;
  
    this.array.push([newValue, name, id])
    console.log(this.array)
  }

  handleSubmit(){
    const csrftoken = this.getCookie('csrftoken');
    window.location.reload();
    if (this.array.length >= 1) {
      this.array.forEach(element => {
          fetch(`/APIs/suiviBilan/edit`, {
                  method: 'PUT',
                  headers:{
                    'content-type': 'application/json',
                    'X-CSRFToken': csrftoken
                  },
                  body: JSON.stringify({
                      periode: this.state.periode,
                      id: element[2],
                      column: element[1],
                      newValue: element[0]
                  })
              })
              .then(Response => Response.json())
              .then(data => {
                console.log()
              })
      })
  } else {
    return;
  }
  }


  render(){
    
    

    if (this.state.redirect) {
      //Affichage de la redirection
      return <Redirect to='/Fichier/import'/>;
    }
    return (
      <LoadingOverlay
      active={this.state.wait}
      spinner={<RiseLoader color="#0DCEEC"  size={30}  margin={3} />}
      styles={{
        overlay: (base) => ({
          ...base,
          background: 'transparent',
        })
      }}
    >
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
      <div className="SuiviBilan">
      
      <div className="choice">

        <div>
          <label for="periode">selectionner une periode</label>
          <select name="periode" id="periode" onChange={this.getData}>
            <option selected disabled>Selectioner une periode</option>
            {this.state.periodeList.map(item => {
              return(
                <option value={item}> {item}</option>
              )
            })}
          </select>
        </div>
        
        { this.state.show ? 
        <div>
          <button className="btn"><a href={`/APIs/exportCSV/${this.state.periode}`}><FaFileCsv /> Export CSV</a></button>
          <button className="btn"><a href={`/APIs/exportPDF/${this.state.periode}`}><FaRegFilePdf /> Export PDF</a></button>
          <button className="btn"><a href={`/APIs/exportEXCEL/${this.state.periode}`}><SiMicrosoftexcel /> Export EXCEL</a></button>
      </div>
      : null }
      </div>
      { this.state.show ? 
      <>
      <div id="suivi">
            <table id="export">
              <thead>
                <tr>
                  <th colSpan="2">Barrage</th>
                  <th>S</th>
                  <th>O</th>
                  <th>N</th>
                  <th>D</th>
                  <th>J</th>
                  <th>F</th>
                  <th>M</th>
                  <th>A</th>
                  <th>M</th>
                  <th>J</th>
                  <th>J</th>
                  <th>A</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                {this.state.data.map(item => {
                  if (this.state.allow){
                    if (item.suivi === 'Transfert Massira')
                      {
                        
                        return (
                          <tr className='massira'>
                            <td>{item.barage}</td>
                            <td>{item.suivi}</td>
                            <td><input type="number" className="numbers" id={item["id"]} name="sep" defaultValue={item.sep} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="oct" defaultValue={item.oct} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="nov" defaultValue={item.nov} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="dec" defaultValue={item.dec} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="jan" defaultValue={item.jan} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="feb" defaultValue={item.feb} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="mar" defaultValue={item.mar} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="apr" defaultValue={item.apr} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="may" defaultValue={item.may} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="jun" defaultValue={item.jun} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="jul" defaultValue={item.jul} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="aug" defaultValue={item.aug} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="total" defaultValue={item.total.toFixed(2)} onBlur={this.handleChangeValues}></input></td>
                          </tr>
                        )
                      }
                      else{
                      return (
                        <tr>
                          <td>{item.barage}</td>
                            <td>{item.suivi}</td>
                            <td><input type="number" className="numbers" id={item["id"]} name="sep" defaultValue={item.sep} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="oct" defaultValue={item.oct} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="nov" defaultValue={item.nov} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="dec" defaultValue={item.dec} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="jan" defaultValue={item.jan} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="feb" defaultValue={item.feb} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="mar" defaultValue={item.mar} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="apr" defaultValue={item.apr} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="may" defaultValue={item.may} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="jun" defaultValue={item.jun} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="jul" defaultValue={item.jul} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="aug" defaultValue={item.aug} onBlur={this.handleChangeValues}></input></td>
                            <td><input type="number" className="numbers" id={item["id"]} name="total" defaultValue={item.total.toFixed(2)} onBlur={this.handleChangeValues}></input></td>
                        </tr>
                      )
                    }
                  }
                  else{
                    if (item.suivi === 'Transfert Massira')
                    {
                      return (
                        <tr className='massira'>
                          <td>{item.barage}</td>
                          <td>{item.suivi}</td>
                          <td><input type="number" className="numbers" id={item["id"]} name="sep" readOnly value={item.sep} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="oct" readOnly value={item.oct} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="nov" readOnly value={item.nov} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="dec" readOnly value={item.dec} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="jan" readOnly value={item.jan} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="feb" readOnly value={item.feb} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="mar" readOnly value={item.mar} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="apr" readOnly value={item.apr} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="may" readOnly value={item.may} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="jun" readOnly value={item.jun} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="jul" readOnly value={item.jul} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="aug" readOnly value={item.aug} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="total" readOnly value={item.total.toFixed(2)} onBlur={this.handleChangeValues}></input></td>
                        </tr>
                      )
                    }
                    else{
                    return (
                      <tr>
                        <td>{item.barage}</td>
                          <td>{item.suivi}</td>
                          <td><input type="number" className="numbers" id={item["id"]} name="sep" readOnly value={item.sep} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="oct" readOnly value={item.oct} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="nov" readOnly value={item.nov} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="dec" readOnly value={item.dec} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="jan" readOnly value={item.jan} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="feb" readOnly value={item.feb} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="mar" readOnly value={item.mar} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="apr" readOnly value={item.apr} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="may" readOnly value={item.may} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="jun" readOnly value={item.jun} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="jul" readOnly value={item.jul} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="aug" readOnly value={item.aug} onBlur={this.handleChangeValues}></input></td>
                          <td><input type="number" className="numbers" id={item["id"]} name="total" readOnly value={item.total.toFixed(2)} onBlur={this.handleChangeValues}></input></td>
                      </tr>
                    )
                  }
                }
                  
                })}
                {
                  this.state.trans.map(item => {
                    return (
                      <tr className='massira'>
                        <td colSpan="2">{item.suivi}</td>
                        <td><input type="number" className="numbers" id={item["id"]} name="sep" readOnly value={item.sep} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="oct" readOnly value={item.oct} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="nov" readOnly value={item.nov} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="dec" readOnly value={item.dec} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="jan" readOnly value={item.jan} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="feb" readOnly value={item.feb} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="mar" readOnly value={item.mar} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="apr" readOnly value={item.apr} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="may" readOnly value={item.may} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="jun" readOnly value={item.jun} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="jul" readOnly value={item.jul} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="aug" readOnly value={item.aug} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="total" readOnly value={item.total.toFixed(2)} ></input></td>
                      </tr>
                    )
                  })
                }
              </tbody>
            </table>
          </div>
          
          <div id="suivi" style={{marginTop: "5%"}}>
            <table id="export">
            <thead>
                <tr>
                  <th>Barrage</th>
                  <th>S</th>
                  <th>O</th>
                  <th>N</th>
                  <th>D</th>
                  <th>J</th>
                  <th>F</th>
                  <th>M</th>
                  <th>A</th>
                  <th>M</th>
                  <th>J</th>
                  <th>J</th>
                  <th>A</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                {this.state.apport.map(item => {
                  if (item.barage === 'Al Massira Ap. Inter.')
                  {
                    return (
                      <tr className='massira'>
                        <td>{item.barage}</td>
                        <td><input type="number" className="numbers" id={item["id"]} name="sep" readOnly value={item.sep} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="oct" readOnly value={item.oct} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="nov" readOnly value={item.nov} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="dec" readOnly value={item.dec} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="jan" readOnly value={item.jan} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="feb" readOnly value={item.feb} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="mar" readOnly value={item.mar} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="apr" readOnly value={item.apr} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="may" readOnly value={item.may} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="jun" readOnly value={item.jun} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="jul" readOnly value={item.jul} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="aug" readOnly value={item.aug} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="total" readOnly value={item.total.toFixed(2)} ></input></td>
                      </tr>
                    )
                  }
                  else{
                  return (
                    <tr>
                      <td style={{padding:"10px 50px"}}>{item.barage}</td>
                      <td><input type="number" className="numbers" id={item["id"]} name="sep" value={item.sep} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="oct" value={item.oct} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="nov" value={item.nov} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="dec" value={item.dec} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="jan" value={item.jan} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="feb" value={item.feb} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="mar" value={item.mar} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="apr" value={item.apr} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="may" value={item.may} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="jun" value={item.jun} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="jul" value={item.jul} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="aug" value={item.aug} ></input></td>
                        <td><input type="number" className="numbers" id={item["id"]} name="total" value={item.total.toFixed(2)} ></input></td>
                    </tr>
                  )
                }
                })}
                </tbody>
            </table>
          </div>
          <div className="submiit">
          <Link to="/Fichier/SuiviBilan"> <button onClick={this.handleSubmit} id="submit">Submit</button></Link>
          </div>
          </>
          : null }
          </div>
          
      </>
      </LoadingOverlay> 
    )
  }


}

export default SuiviBilan;
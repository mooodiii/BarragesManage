import React from 'react';
import XLSX from 'xlsx';
import {FichierData} from './fichierData'
import { Link } from 'react-router-dom';
import './GestionBarrage.css'

class Fichier extends React.Component  {
  constructor(props){
    super(props);
    this.state = {
      sheetList : [],
      csrf: this.getCookie('csrftoken'),
      barageName:"",
      wait: false,
      exist: false,
      disabled: true
    };
    this.handleChange = this.handleChange.bind(this);
    this.getCookie = this.getCookie.bind(this);
    this.checkData = this.checkData.bind(this);
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

  handleChange(event){
    let nom = event.target.files[0].name;
    this.setState({
      barageName: nom,
      wait:true
    })
    
    let selectedFile = event.target.files[0];
        if (selectedFile) {
            let fileReader = new FileReader();
            fileReader.readAsBinaryString(selectedFile);
            fileReader.onload = (event) => {
            let data = event.target.result;
            let workbook = XLSX.read(data, {
                    type: "binary"
                });
                let sheets = []
                workbook.SheetNames.forEach(sheet => {
                  sheets.push(sheet)
                });
                this.setState({
                  sheetList: sheets,
                  wait:false
                })
             }
        }
    

  }

  checkData(event){
    let barage = this.state.barageName;
    let month = event.target.value;
    month = month.split('-');
    let year = parseInt(month[0]);
    month = parseInt(month[1]);
    this.setState({
      wait: true
    })
    fetch('http://127.0.0.1:8000/APIs/file/check',{
      method: 'POST',
      headers:{
        'content-type': 'application/json',
        'X-CSRFToken': this.csrf
      },
      body: JSON.stringify({
          month: month,
          barage: barage,
          annee: year
      })
    })
    .then(Request => Request.json())
    .then(data => {
      this.setState({
        wait:false,
        exist: data.exist,
        disabled: data.exist
      })

    })

  }



  render(){
    this.items = this.state.sheetList.map((item) =>
    <option key={item} value={item}>{item}</option>
    );
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
    <div>
          {this.state.wait ? <h1 style={{color: 'red'}}>"Attendez, s'il vous plaît"</h1> : <p></p>}
    </div>
    <div>
      {this.state.exist ? <h1 style={{color: 'red'}}>"Bilan deja exist"</h1> : <p></p>}
  </div>
    <div id="CalculApp">
      <form action="http://127.0.0.1:8000/APIs/file" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="csrfmiddlewaretoken" value={this.state.csrf}></input>
      <div>
        <label htmlFor="input">Selectionner un fichier:</label>
        <input className="baragList" type="file" id="input" name="input" accept=".xls,.xlsx" onChange={this.handleChange}/>
      </div>
      <div>
        <label htmlFor="sheet">Selectionner la feuille:</label>
        <select className="baragList" name="sheet" id="sheet">
            <option selected disabled>Select a sheet</option>
            {this.items}
        </select>
      </div>
      <div>
        <label htmlFor="month">Selectionner le date</label>
        <input type="month" className="baragList"  name="month" id="month" onChange={this.checkData} />
      </div>
        <div>
            <input disabled={this.state.disabled} type="submit" name="submit" value="Importer" id="convert" />
        </div>
      </form>
    </div>
    </>
  );
}
}

export default Fichier;
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
      csrf: this.getCookie('csrftoken')
    }
    this.handleChange = this.handleChange.bind(this)
    this.getCookie = this.getCookie.bind(this)
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
    console.log("changes")
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
                  sheetList: sheets
                })
             }
        }
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
        <input type="month" className="baragList"  name="month" id="month" />
      </div>
        <div>
            <input type="submit" name="submit" value="Importer" id="convert" />
        </div>
      </form>
    </div>
    </>
  );
}
}

export default Fichier;
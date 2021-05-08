import { render } from '@testing-library/react';
import React from 'react';
import './GestionBarrage.css';
import {GestionBarrageData} from './GestionBarrageData';
import { Link } from 'react-router-dom';

class CalculApport extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      barageList : [],
      freqList: [],
      startDate: "2020-09-01",
      endDate: "2020-09-01",
      barage: "",
      freq: "99",
      result : "",
      resultComplex: "",
      complex : "",
      complex2 : "",
    }
    
    this.fetchDataBarage = this.fetchDataBarage.bind(this)
    this.handleChancgeBarage = this.handleChancgeBarage.bind(this)
    this.handleClick = this.handleClick.bind(this)
    this.handleChangeFreq = this.handleChangeFreq.bind(this)
    this.SetDate = this.SetDate.bind(this)
    this.changeDebutDate = this.changeDebutDate.bind(this)
    this.changeEndDate = this.changeEndDate.bind(this)
    this.isLeap = this.isLeap.bind(this)
    this.handleClickHansali = this.handleClickHansali.bind(this)
    this.handleClickMassira = this.handleClickMassira.bind(this)
  }

  componentWillMount(){
    this.fetchDataBarage();
    this.SetDate();
  }


  isLeap(year) {
    if (year % 4 === 0) {
        if (year % 100 === 0) {
            if (year % 400 === 0) {
                return true;
            }
            return false
        }
        return true
    }
    return false
}

  SetDate(){
    const d = new Date();
    let day = d.getDate()
    let month = d.getMonth()
    let year = d.getFullYear()
    if (day < 10) {
        day = `0${day}`
    }
    if (month < 10) {
        month = `0${month}`
    }
    this.setState({
      startDate : `${year}-${month}-${day}`,
      endDate : `${year}-${month}-${day}`,
  })
  }

  fetchDataBarage(){
    fetch("http://127.0.0.1:8000/APIs/barages/")
        .then(Response => {
            return Response.json();
        })
        .then(data => {
          let list = []
          data.forEach(element => {
            list.push(element.name)
          })
          this.setState({
            barageList : list
          })
        })
  }

  handleChancgeBarage(e){
      this.setState({
        barage: e.target.value,
        result:"",
        resultComplex: "",
        complex : "",
        complex2 : "",
      })
      
      fetch(`http://127.0.0.1:8000/APIs/barages/${e.target.value}`)
          .then(Response => {
            console.log(Response)
              return Response.json();
          })
          .then(data => {
            console.log(data)
            let list = []
            data.forEach(element => {
              list.push(element.freq)
            })
            this.setState({
              freqList : list
            })
          });
  }

  handleClick(){
    this.setState({
      resultComplex: "",
      result: ""
    })
    
    fetch(`http://127.0.0.1:8000/APIs/barages/${this.state.barage}/${this.state.freq}`)
            .then(Response => {
                return Response.json();
            })
            .then(data => {
                console.log(data);
                data = data[1];
                    const d = new Date();
                    const dataMonth = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"];
                    const dataJperM = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                    if (this.isLeap(d.getFullYear())) {
                        dataJperM = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                    }
                    let start = this.state.startDate.split("-");
                    let end = this.state.endDate.split("-");
                    let mounth1 = parseInt(start[1]);
                    let mounth2 = parseInt(end[1]);
                    let day1 = parseInt(start[2]);
                    let day2 = parseInt(end[2]);
                    let res1 = dataJperM[mounth1 - 1] - day1;
                    let res2 = dataJperM[mounth2 - 1] - day2;
                    if (day1 === 1) {
                        res1 = dataJperM[mounth1 - 1];
                    }
                    if (day2 === dataJperM[mounth2 - 1]) {
                        res2 = dataJperM[mounth2 - 1];
                    }
                    let somme = 0;
                    let i = (mounth1 - 1)
                    while (true) {
                        if (mounth1 === mounth2) {
                          if (day1 === day2) {
                              somme = 0;
                                  break
                          }
                          somme = data[dataMonth[i]] - (((data[dataMonth[i]] / dataJperM[i]) * res1) + ((data[dataMonth[i]] / dataJperM[i]) * res2));
                          break;
                        } else {
                            if (i === 12) {
                                  i = 0;
                              }
                            if (i === (mounth1 - 1)) {
                                somme += ((data[dataMonth[i]] / dataJperM[i]) * res1);
                                i++
                                continue;
                            }
                            if (i === (mounth2 - 1)) {
                                somme += ((data[dataMonth[i]] / dataJperM[i]) * res2);
                                break;
                            } else {
                                somme += data[dataMonth[i]];
                                i++;
                            }
                        }
                    }
                    this.setState({
                      result: somme
                    })
                    if(this.state.barage === 'Complexe A.El Hansali-Massira'){
                      this.setState({
                        complex: <button onClick={this.handleClickMassira}> Barage El Massira</button>,
                        complex2: <button onClick={this.handleClickHansali}> Barage Ahmed El Hansali </button>
                      })
                    }
                    else {
                      this.setState({
                        complex: "",
                        complex2: ""
                      })
                    }
                  
                })       
  }


  handleChangeFreq(e){
    this.setState({ freq: e.target.value })
  }

  changeDebutDate(e){
    this.setState({
      startDate:  e.target.value
    })
  }
  changeEndDate(e){
    this.setState({
      endDate:  e.target.value
    })
  }
  
  handleClickHansali(){
    let result = this.state.result * (1/3);
    this.setState({
      resultComplex: result
    })
  }
  handleClickMassira(){
    let result = this.state.result * (2/3);
    this.setState({
      resultComplex: result
    })
  }


  render(){
    this.items = this.state.barageList.map((item) =>
    <option key={item} value={item}>{item}</option>
    );
    this.freq = this.state.freqList.map((item) =>
    <option key={item} value={item}>{item}</option>
    );

    
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
        <div id="CalculApp">
          <div>
              <label for="barage">Barrage:</label>
              <select name="ss" className="baragList" id="baragList" onChange={this.handleChancgeBarage}>
                <option selected disabled>Selectionner barrage</option>
                {this.items}
              
              </select>
          </div>
          <div>
              <label for="freq">frequence:</label>
              <select name="freq" className="baragList" id="freq" onChange={this.handleChangeFreq}>
                  <option selected disabled>Selectionner frequence</option>
                  {this.freq}
              </select>
          </div>

          <div>
              <label for="start">date de debut:</label>

              <input type="date" className="baragList"  id="start" min="2020-09-01" max="2021-08-31" value={this.state.startDate} onChange={this.changeDebutDate}></input>
          </div>
          <div>
              <label for="end">date de fin:</label>

              <input type="date" className="baragList" id="end" min={this.state.startDate} max="2021-08-31" value={this.state.endDate} onChange={this.changeEndDate}/>
          </div>
          <div id="result">
              <label for="result">Resultat:</label>
              <input type="number" className="baragList" readOnly  id="resulta" value={this.state.result}/>
          </div>


          <div>
              <input type="button" value="calculer" id="calculer" onClick={this.handleClick} />
          </div>

          <div id="complex">
            {this.state.complex}
            {this.state.complex2}
          </div>

          
          <div id="resultComplex">
            {this.state.resultComplex}
          </div>
        </div>
        </>
    );
  }
}

export default CalculApport;

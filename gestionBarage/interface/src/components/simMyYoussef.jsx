import React from 'react';
import './simulation.css';
import 'react-date-range/dist/styles.css'; 
import 'react-date-range/dist/theme/default.css';
import { DateRangePickerComponent } from '@syncfusion/ej2-react-calendars';
import ReactHTMLTableToExcel from 'react-html-table-to-excel';


class SimMyYoussef extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            first: "",
            beforeFirst: "",
            firstDate: "",
            secondDate: "",
            afterSecond:"",
            sign: 0,
            value:new Date(),
            reserve: "",
            evap:"",
            irrRealise : 0,
            irrReste: 0,
            irrTotal: "",
            aepiReste:0,
            esStock99: "",
            esStock98: "",
            esStock95: "",
            esStock90: "",
            tauxRemp99: "",
            tauxRemp98: "",
            tauxRemp95: "",
            tauxRemp90: "",
            app99:"",
            app98:"",
            app95:"",
            app90:"",
            startYear: "",
            endYear: "",
        }
        this.handleSelect = this.handleSelect.bind(this);
        this.onCalcul = this.onCalcul.bind(this);
        this.calcApport = this.calcApport.bind(this);
        
    }

    getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
      }

    handleSelect(e){
        const csrftoken = this.getCookie('csrftoken');
        let data = e.target.value;
        if(data == null){
            return;
        }
        let startDate = new Date(data[0])
        let endDate = new Date(data[1])
        let beforeFirst = new Date()
        beforeFirst.setDate(startDate.getDate() - 1);
        let fir = new Date(startDate.getFullYear(), 8, 1);
        let afterSecond = new Date()
        afterSecond.setDate(endDate.getDate() + 1);

        this.setState({
            startYear: startDate.getFullYear(),
            endYear: endDate.getFullYear(),
            firstDate: startDate.toDateString(),
            beforeFirst: beforeFirst.toDateString(),
            first : fir.toDateString(),
            secondDate: endDate.toDateString(),
            afterSecond: afterSecond.toDateString(),
        })
        let reserve = [startDate.getFullYear(), startDate.getMonth() + 1, startDate.getDate()]
        let evap = [[startDate.getFullYear(), startDate.getMonth() + 1, startDate.getDate()], [endDate.getFullYear(), endDate.getMonth() + 1, endDate.getDate()]]

        fetch(`/APIs/simulation`, {
                  method: 'POST',
                  headers:{
                    'content-type': 'application/json',
                    'X-CSRFToken': csrftoken
                  },
                  body: JSON.stringify({
                      reserve: reserve,
                      evap: evap,
                      barage: "youssef"
                  })
              })
              .then(Response => Response.json())
              .then(data => {
                  console.log(data);
                  if (data.error === false){
                    let data99 = data.serializer99
                    let data98 = data.serializer98
                    let data95 = data.serializer95
                    let data90 = data.serializer90
                    this.setState({
                        reserve: data.reserveResult,
                        evap: data.evap,
                        app90: this.calcApport(data90),
                        app99: this.calcApport(data99),
                        app95: this.calcApport(data95),
                        app98: this.calcApport(data98),
                    })
                }else{
                    alert("Il n'y a pas de données pour la période que vous avez saisie, essayez avec un autre mois de début")
                }
              })
      }

    onCalcul(e){
        
        this.setState({
            [e.target.name] : e.target.value,
        }, () =>{
            this.setState({
                irrTotal : parseFloat(this.state.irrRealise) + parseFloat(this.state.irrReste)
            })
            let esResult99 = parseFloat(this.state.reserve) + parseFloat(this.state.app99) - parseFloat(this.state.evap) - this.state.irrReste - this.state.aepiReste 
            let esResult98 = parseFloat(this.state.reserve) + parseFloat(this.state.app98) - parseFloat(this.state.evap) - this.state.irrReste - this.state.aepiReste 
            let esResult95 = parseFloat(this.state.reserve) + parseFloat(this.state.app95) - parseFloat(this.state.evap) - this.state.irrReste - this.state.aepiReste 
            let esResult90 = parseFloat(this.state.reserve) + parseFloat(this.state.app90) - parseFloat(this.state.evap) - this.state.irrReste - this.state.aepiReste 
            let taux99 = (esResult99 / 142.518) * 100
            let taux98 = (esResult98 / 142.518) * 100
            let taux95 = (esResult95 / 142.518) * 100
            let taux90 = (esResult90 / 142.518) * 100

            this.setState({
                esStock99: esResult99,
                esStock98: esResult98,
                esStock95 : esResult95,
                esStock90: esResult90,
                tauxRemp99: taux99,
                tauxRemp98: taux98,
                tauxRemp95: taux95,
                tauxRemp90: taux90,
            })
        })
        
    }

    calcApport(data){
        const d = new Date();
                    const dataMonth = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"];
                    let dataJperM = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                    if (this.isLeap(d.getFullYear())) {
                        dataJperM = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                    }
                    let start = new Date(this.state.firstDate)
                    let end = new Date(this.state.secondDate)
                    let mounth1 = parseInt(start.getMonth() + 1);
                    let mounth2 = parseInt(end.getMonth() + 1);
                    let day1 = parseInt(start.getDate());
                    let day2 = parseInt(end.getDate());
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
   
                    return somme;
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

    render(){
        return(
            <>

            <div className="title">
                <h4>Résultats de simulation de la gestion des retenues du barrage Moulay Youssef</h4>
                <h4> pour la période <div id="date"><DateRangePickerComponent 
                placeholder="selectionner une periode" 
                format="dd-MMM-yy"
                onChange={this.handleSelect}
                /></div></h4>
                             
            </div>
            
            <div  className="sim" >
            <ReactHTMLTableToExcel
                    id="test-table-xls-button"
                    className="downloadXls"
                    table="table-to-xls"
                    filename="tablexls"
                    sheet="simulation Moulay Youssef"
                    buttonText="Exporter comme fichier Excel"/>

                <table className="table">
                    <thead>
                        <tr>
                            <th rowSpan="3">Barrage</th>
                            <th rowSpan="1">Réserve</th>
                            <th rowSpan="3">Probabilités 
                            <br />d'Apports 
                            <br />%</th>
                            <th rowSpan="1">Apports</th>
                            <th rowSpan="1">Evap</th>
                            <th colSpan="3">Programme d'irrigation {this.state.startYear} - {this.state.endYear}</th>
                            <th>AEPI</th>
                            <th rowSpan="2">Espérance <br />de  stock au</th>
                            <th rowSpan="3">Taux de <br />rempl <br />%</th>
                        </tr>
                        <tr>
                            <th rowSpan="2" onChange={this.onchange}>{this.state.firstDate}</th>
                            <th rowSpan="2">{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th rowSpan="2">{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th rowSpan="1">réalisé</th>
                            <th rowSpan="1">Reste</th>
                            <th rowSpan="1">Total</th>
                            <th>Reste</th>
                        </tr>
                        <tr>
                            <th rowSpan="1">{this.state.first}<span style={{color: "red"}}>&gt; </span>{this.state.beforeFirst}</th>
                            <th rowSpan="1">{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th rowSpan="1">{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th>{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th>{this.state.afterSecond}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowSpan="4">Bin El Ouidane</td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="reserve" type="number" defaultValue={this.state.reserve} /></td>
                            <td >99</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app99" type="number" defaultValue={this.state.app99} /></td>
                            <td rowSpan="4"><input className="numbers " onBlur={this.onCalcul} name="evap" type="number" defaultValue={this.state.evap} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrRealise" type="number" defaultValue={this.state.irrRealise} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrReste" type="number" defaultValue={this.state.irrReste}/></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrTotal" type="number" defaultValue={this.state.irrTotal} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="aepiReste" type="number" defaultValue={this.state.aepiReste} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock99" type="number" defaultValue={this.state.esStock99}/></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp99" type="number" defaultValue={this.state.tauxRemp99}/></td>
                        </tr>
                        <tr>
                            <td>98</td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="app98" type="number" defaultValue={this.state.app98} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock98" type="number" defaultValue={this.state.esStock98} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp98" type="number" defaultValue={this.state.tauxRemp98} /></td>
                        </tr>
                        <tr>
                            <td >95</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app95"  type="number" defaultValue={this.state.app95} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock95" type="number" defaultValue={this.state.esStock95} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp95" type="number" defaultValue={this.state.tauxRemp95} /></td>
                        </tr>
                        <tr>
                            <td >90</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app90" type="number" defaultValue={this.state.app90} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock90" type="number" defaultValue={this.state.esStock90} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp90" type="number" defaultValue={this.state.tauxRemp90} /></td>
                        </tr>
                    </tbody>
                </table>
                <table className="table" id="table-to-xls" style={{display:"none"}}>
                    <thead>
                        <tr>
                            <th rowSpan="3">Barrage</th>
                            <th rowSpan="1">Réserve</th>
                            <th rowSpan="3">Probabilités 
                            <br />d'Apports 
                            <br />%</th>
                            <th rowSpan="1">Apports</th>
                            <th rowSpan="1">Evap</th>
                            <th colSpan="3">Programme d'irrigation {this.state.startYear} - {this.state.endYear}</th>
                            <th>AEPI</th>
                            <th rowSpan="2">Espérance <br />de  stock au</th>
                            <th rowSpan="3">Taux de <br />rempl <br />%</th>
                        </tr>
                        <tr>
                            <th rowSpan="2" onChange={this.onchange}>{this.state.firstDate}</th>
                            <th rowSpan="2">{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th rowSpan="2">{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th rowSpan="1">réalisé</th>
                            <th rowSpan="1">Reste</th>
                            <th rowSpan="1">Total</th>
                            <th>Reste</th>
                        </tr>
                        <tr>
                            <th rowSpan="1">{this.state.first}<span style={{color: "red"}}>&gt; </span>{this.state.beforeFirst}</th>
                            <th rowSpan="1">{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th rowSpan="1">{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th>{this.state.firstDate}<span style={{color: "red"}}>&gt; </span>{this.state.secondDate}</th>
                            <th>{this.state.afterSecond}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowSpan="4">Bin El Ouidane</td>
                            <td rowSpan="4">{this.state.reserve} </td>
                            <td >99</td>
                            <td >{this.state.app99} </td>
                            <td rowSpan="4">{this.state.evap} </td>
                            <td rowSpan="4">{this.state.irrRealise} </td>
                            <td rowSpan="4">{this.state.irrReste}</td>
                            <td rowSpan="4">{this.state.irrTotal} </td>
                            <td rowSpan="4">{this.state.aepiReste} </td>
                            <td>{this.state.esStock99}</td>
                            <td>{this.state.tauxRemp99}</td>
                        </tr>
                        <tr>
                            <td>98</td>
                            <td>{this.state.app98} </td>
                            <td>{this.state.esStock98} </td>
                            <td>{this.state.tauxRemp98} </td>
                        </tr>
                        <tr>
                            <td >95</td>
                            <td >{this.state.app95} </td>
                            <td>{this.state.esStock95} </td>
                            <td>{this.state.tauxRemp95} </td>
                        </tr>
                        <tr>
                            <td >90</td>
                            <td >{this.state.app90} </td>
                            <td>{this.state.esStock90} </td>
                            <td>{this.state.tauxRemp90} </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </>
        )
    }
}

export default SimMyYoussef;
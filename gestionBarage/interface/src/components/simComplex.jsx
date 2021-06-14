import React from 'react';
import './simulation.css';
import 'react-date-range/dist/styles.css'; 
import 'react-date-range/dist/theme/default.css';
import { DateRangePickerComponent } from '@syncfusion/ej2-react-calendars';
import ReactHTMLTableToExcel from 'react-html-table-to-excel';


class SimComplex extends React.Component{
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
            reserveH: "",
            evapH:0,
            irrRealiseH : 0,
            irrResteH: 0,
            irrTotalH: "",
            aepiResteH:0,
            debitSanitaireH:0,
            transfertH:0,
            esStock99H: "",
            esStock98H: "",
            esStock95H: "",
            esStock90H: "",
            tauxRemp99H: "",
            tauxRemp98H: "",
            tauxRemp95H: "",
            tauxRemp90H: "",
            app99H:"",
            app98H:"",
            app95H:"",
            app90H:"",
            reserveM: "",
            evapM:0,
            irrRealiseM : 0,
            irrResteM: 0,
            irrTotalM: "",
            aepiResteM:0,
            debitSanitaireM:0,
            transfertM:0,
            esStock99M: "",
            esStock98M: "",
            esStock95M: "",
            esStock90M: "",
            tauxRemp99M: "",
            tauxRemp98M: "",
            tauxRemp95M: "",
            tauxRemp90M: "",
            app99M:"",
            app98M:"",
            app95M:"",
            app90M:"",
            reserveC: "",
            evapC:"",
            irrRealiseC : "",
            irrResteC: "",
            irrTotalC: "",
            aepiResteC:"",
            debitSanitaireC:"",
            transfertC:"",
            esStock99C: "",
            esStock98C: "",
            esStock95C: "",
            esStock90C: "",
            tauxRemp99C: "",
            tauxRemp98C: "",
            tauxRemp95C: "",
            tauxRemp90C: "",
            app99C:"",
            app98C:"",
            app95C:"",
            app90C:"",
            startYear:"",
            endYear:""
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
                // Does this cookie string begin with the name we want?
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

        fetch(`http://127.0.0.1:8000/APIs/simulation`, {
                  method: 'POST',
                  headers:{
                    'content-type': 'application/json',
                    'X-CSRFToken': csrftoken
                  },
                  body: JSON.stringify({
                      reserve: reserve,
                      evap: evap,
                      barage: "complex"
                  })
              })
              .then(Response => Response.json())
              .then(data => {
                    
                    if (data.error === false){
                        let data99 = data.serializer99
                        let data98 = data.serializer98
                        let data95 = data.serializer95
                        let data90 = data.serializer90
                        this.setState({
                            reserveM: data.reserveResult.massira,
                            
                            reserveH: data.reserveResult.hansali,
                            
                            app90C: this.calcApport(data90).toFixed(2),
                            app99C: this.calcApport(data99).toFixed(2),
                            app95C: this.calcApport(data95).toFixed(2),
                            app98C: this.calcApport(data98).toFixed(2),
                        }, () =>{
                            this.setState({
                                    reserveC: parseFloat(this.state.reserveH) + parseFloat(this.state.reserveM),
                                    evapC: parseFloat(this.state.evapH) + parseFloat(this.state.evapM),
                                    app90M: this.state.app90C  * (1/3),
                                    app99M: this.state.app99C * (1/3),
                                    app95M: this.state.app95C * (1/3),
                                    app98M: this.state.app98C * (1/3),
                                    app90H: this.state.app90C  * (2/3),
                                    app99H: this.state.app99C * (2/3),
                                    app95H: this.state.app95C * (2/3),
                                    app98H: this.state.app98C * (2/3),
                            })
                        })
                    }else{
                        alert('there is no data for the periode you entred, try with other month')
                }
              })
      }

    onCalcul(e){
        
        this.setState({
            [e.target.name] : e.target.value,
            
        }, () =>{
            this.setState({
                irrTotalM : parseFloat(this.state.irrRealiseM) + parseFloat(this.state.irrResteM),
                irrTotalH : parseFloat(this.state.irrRealiseH) + parseFloat(this.state.irrResteH),
                evapC: parseFloat(this.state.evapH) + parseFloat(this.state.evapM),
                reserveC: parseFloat(this.state.reserveH) + parseFloat(this.state.reserveM),
            })
            //massira
            let esResult99M = parseFloat(this.state.reserveM) + parseFloat(this.state.app99M) - parseFloat(this.state.evapM) - ((this.state.irrResteM + this.state.aepiResteM) / 0.75 ) + this.state.debitSanitaireM + this.state.transfertM
            let esResult98M = parseFloat(this.state.reserveM) + parseFloat(this.state.app98M) - parseFloat(this.state.evapM) - ((this.state.irrResteM + this.state.aepiResteM) / 0.75 ) + this.state.debitSanitaireM + this.state.transfertM
            let esResult95M = parseFloat(this.state.reserveM) + parseFloat(this.state.app95M) - parseFloat(this.state.evapM) - ((this.state.irrResteM + this.state.aepiResteM) / 0.75 ) + this.state.debitSanitaireM + this.state.transfertM
            let esResult90M = parseFloat(this.state.reserveM) + parseFloat(this.state.app90M) - parseFloat(this.state.evapM) - ((this.state.irrResteM + this.state.aepiResteM) / 0.75 ) + this.state.debitSanitaireM + this.state.transfertM
            let taux99M = (esResult99M / 668.168) * 100
            let taux98M = (esResult98M / 668.168) * 100
            let taux95M = (esResult95M / 668.168) * 100
            let taux90M = (esResult90M / 668.168) * 100

            //hansali
            let esResult99H = parseFloat(this.state.reserveH) + parseFloat(this.state.app99H) - parseFloat(this.state.evapH) - ((this.state.irrResteH + this.state.aepiResteH) / 0.75 ) - this.state.debitSanitaireH
            let esResult98H = parseFloat(this.state.reserveH) + parseFloat(this.state.app98H) - parseFloat(this.state.evapH) - ((this.state.irrResteH + this.state.aepiResteH) / 0.75 ) - this.state.debitSanitaireH
            let esResult95H = parseFloat(this.state.reserveH) + parseFloat(this.state.app95H) - parseFloat(this.state.evapH) - ((this.state.irrResteH + this.state.aepiResteH) / 0.75 ) - this.state.debitSanitaireH
            let esResult90H = parseFloat(this.state.reserveH) + parseFloat(this.state.app90H) - parseFloat(this.state.evapH) - ((this.state.irrResteH + this.state.aepiResteH) / 0.75 ) - this.state.debitSanitaireH
            let taux99H = (esResult99H / 2656.993) * 100
            let taux98H = (esResult98H / 2656.993) * 100
            let taux95H = (esResult95H / 2656.993) * 100
            let taux90H = (esResult90H / 2656.993) * 100


            this.setState({
                esStock99M: esResult99M,
                esStock98M: esResult98M,
                esStock95M : esResult95M,
                esStock90M: esResult90M,
                tauxRemp99M: taux99M,
                tauxRemp98M: taux98M,
                tauxRemp95M: taux95M,
                tauxRemp90M: taux90M,
                esStock99H: esResult99H,
                esStock98H: esResult98H,
                esStock95H : esResult95H,
                esStock90H: esResult90H,
                tauxRemp99H: taux99H,
                tauxRemp98H: taux98H,
                tauxRemp95H: taux95H,
                tauxRemp90H: taux90H,
                
            } , () => {
                this.setState({
                    irrRealiseC : parseFloat(this.state.irrRealiseM) + parseFloat(this.state.irrRealiseH),
                irrResteC : parseFloat(this.state.irrResteM) + parseFloat(this.state.irrResteH),
                irrTotalC : parseFloat(this.state.irrTotalM) + parseFloat(this.state.irrTotalH),
                aepiResteC : parseFloat(this.state.aepiResteM) + parseFloat(this.state.aepiResteH),
                debitSanitaireC : parseFloat(this.state.debitSanitaireM) + parseFloat(this.state.debitSanitaireH),
                transfertC : parseFloat(this.state.transfertM),
                    esStock99C: this.state.esStock99M + this.state.esStock99H,
                    esStock98C: this.state.esStock98M + this.state.esStock98H,
                    esStock95C : this.state.esStock95M + this.state.esStock95H,
                    esStock90C: this.state.esStock90M + this.state.esStock90H,
                    
                }, () => {
                    this.setState({
                        tauxRemp99C: (this.state.esStock99C / (2656.993+668.168)) * 100 ,
                        tauxRemp98C: (this.state.esStock99C / (2656.993+668.168)) * 100,
                        tauxRemp95C: (this.state.esStock99C / (2656.993+668.168)) * 100,
                        tauxRemp90C: (this.state.esStock99C / (2656.993+668.168)) * 100,
                    })
                })
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
            <div>
            
    </div>
            <div className="title">
                <h4>Résultats de simulation de la gestion des retenues du barrage Complexe A.El Hansali-Massira</h4>
                <h4> pour la période <div id="date"><DateRangePickerComponent 
                placeholder="selectionner une periode" 
                format="dd-MMM-yy"
                onChange={this.handleSelect}
                /></div></h4>
                             
            </div>
            
            <div  className="sim">
            <ReactHTMLTableToExcel
                    id="test-table-xls-button"
                    className="downloadXls"
                    table="table-to-xls"
                    filename="tablexls"
                    sheet="simulation Bin Ouidane"
                    buttonText="Exporter comme fichier excel" />
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
                            <th rowSpan="3">transfert <br /> HANSALI</th>
                            <th rowSpan="3">Transfert BE</th>
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
                            <td rowSpan="4">A.El Hansali</td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="reserveH" type="number" defaultValue={this.state.reserveH} /></td>
                            <td >99</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app99H" type="number" defaultValue={this.state.app99H} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="evapH" type="number" defaultValue={this.state.evapH} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrRealiseH" type="number" defaultValue={this.state.irrRealiseH} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrResteH" type="number" defaultValue={this.state.irrResteH}/></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrTotalH" type="number" defaultValue={this.state.irrTotalH} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="aepiResteH" type="number" defaultValue={this.state.aepiResteH} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="debitSanitaireH" type="number" defaultValue={this.state.debitSanitaireH} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="transfertH" type="number" defaultValue={this.state.transfertH} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock99H" type="number" defaultValue={this.state.esStock99H}/></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp99H" type="number" defaultValue={this.state.tauxRemp99H}/></td>
                        </tr>
                        <tr>
                            <td>98</td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="app98H" type="number" defaultValue={this.state.app98H} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock98H" type="number" defaultValue={this.state.esStock98H} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp98H" type="number" defaultValue={this.state.tauxRemp98H} /></td>
                        </tr>
                        <tr>
                            <td >95</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app95H"  type="number" defaultValue={this.state.app95H} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock95H" type="number" defaultValue={this.state.esStock95H} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp95H" type="number" defaultValue={this.state.tauxRemp95H} /></td>
                        </tr>
                        <tr>
                            <td >90</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app90H" type="number" defaultValue={this.state.app90H} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock90H" type="number" defaultValue={this.state.esStock90H} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp90H" type="number" defaultValue={this.state.tauxRemp90H} /></td>
                        </tr>
                        <tr>
                            <td rowSpan="4">Al Massira</td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="reserve" type="number" defaultValue={this.state.reserveM} /></td>
                            <td >99</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app99M" type="number" defaultValue={this.state.app99M} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="evapM" type="number" defaultValue={this.state.evapM} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrRealiseM" type="number" defaultValue={this.state.irrRealiseM} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrResteM" type="number" defaultValue={this.state.irrResteM}/></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrTotalM" type="number" defaultValue={this.state.irrTotalM} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="aepiResteM" type="number" defaultValue={this.state.aepiResteM} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="debitSanitaireM" type="number" defaultValue={this.state.debitSanitaireM} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="transfertM" type="number" defaultValue={this.state.transfertM} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock99M" type="number" defaultValue={this.state.esStock99M}/></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp99M" type="number" defaultValue={this.state.tauxRemp99M}/></td>
                        </tr>
                        <tr>
                            <td>98</td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="app98M" type="number" defaultValue={this.state.app98M} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock98M" type="number" defaultValue={this.state.esStock98M} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp98M" type="number" defaultValue={this.state.tauxRemp98M} /></td>
                        </tr>
                        <tr>
                            <td >95</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app95M"  type="number" defaultValue={this.state.app95M} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock95M" type="number" defaultValue={this.state.esStock95M} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp95M" type="number" defaultValue={this.state.tauxRemp95M} /></td>
                        </tr>
                        <tr>
                            <td >90</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app90M" type="number" defaultValue={this.state.app90M} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock90M" type="number" defaultValue={this.state.esStock90M} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp90M" type="number" defaultValue={this.state.tauxRemp90M} /></td>
                        </tr>
                        <tr>
                            <td rowSpan="4">Complexe al Hansali-Al Massira</td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="reserveC" type="number" defaultValue={this.state.reserveC} /></td>
                            <td >99</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app99C" type="number" defaultValue={this.state.app99C} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="evapC" type="number" defaultValue={this.state.evapC} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrRealiseC" type="number" defaultValue={this.state.irrRealiseC} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrResteC" type="number" defaultValue={this.state.irrResteC}/></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="irrTotalC" type="number" defaultValue={this.state.irrTotalC} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="aepiResteC" type="number" defaultValue={this.state.aepiResteC} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="debitSanitaireC" type="number" defaultValue={this.state.debitSanitaireC} /></td>
                            <td rowSpan="4"><input className="numbers" onBlur={this.onCalcul} name="transfertC" type="number" defaultValue={this.state.transfertC} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock99C" type="number" defaultValue={this.state.esStock99C}/></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp99C" type="number" defaultValue={this.state.tauxRemp99C}/></td>
                        </tr>
                        <tr>
                            <td>98</td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="app98C" type="number" defaultValue={this.state.app98C} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock98C" type="number" defaultValue={this.state.esStock98C} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp98C" type="number" defaultValue={this.state.tauxRemp98C} /></td>
                        </tr>
                        <tr>
                            <td >95</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app95C"  type="number" defaultValue={this.state.app95C} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock95C" type="number" defaultValue={this.state.esStock95C} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp95C" type="number" defaultValue={this.state.tauxRemp95C} /></td>
                        </tr>
                        <tr>
                            <td >90</td>
                            <td ><input className="numbers" onBlur={this.onCalcul} name="app90C" type="number" defaultValue={this.state.app90C} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="esStock90C" type="number" defaultValue={this.state.esStock90C} /></td>
                            <td><input className="numbers" onBlur={this.onCalcul} name="tauxRemp90C" type="number" defaultValue={this.state.tauxRemp90C} /></td>
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
                            <th rowSpan="3">transfert <br /> HANSALI</th>
                            <th rowSpan="3">Transfert BE</th>
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
                            <td rowSpan="4">A.El Hansali</td>
                            <td rowSpan="4">{this.state.reserveH} </td>
                            <td >99</td>
                            <td >{this.state.app99H} </td>
                            <td rowSpan="4">{this.state.evapH} </td>
                            <td rowSpan="4">{this.state.irrRealiseH} </td>
                            <td rowSpan="4">{this.state.irrResteH}</td>
                            <td rowSpan="4">{this.state.irrTotalH} </td>
                            <td rowSpan="4">{this.state.aepiResteH} </td>
                            <td rowSpan="4">{this.state.debitSanitaireH} </td>
                            <td rowSpan="4">{this.state.transfertH} </td>
                            <td>{this.state.esStock99H}</td>
                            <td>{this.state.tauxRemp99H}</td>
                        </tr>
                        <tr>
                            <td>98</td>
                            <td>{this.state.app98H} </td>
                            <td>{this.state.esStock98H} </td>
                            <td>{this.state.tauxRemp98H} </td>
                        </tr>
                        <tr>
                            <td >95</td>
                            <td >{this.state.app95H} </td>
                            <td>{this.state.esStock95H} </td>
                            <td>{this.state.tauxRemp95H} </td>
                        </tr>
                        <tr>
                            <td >90</td>
                            <td >{this.state.app90H} </td>
                            <td>{this.state.esStock90H} </td>
                            <td>{this.state.tauxRemp90H} </td>
                        </tr>
                        <tr>
                            <td rowSpan="4">Al Massira</td>
                            <td rowSpan="4">{this.state.reserveM} </td>
                            <td >99</td>
                            <td >{this.state.app99M} </td>
                            <td rowSpan="4">{this.state.evapM} </td>
                            <td rowSpan="4">{this.state.irrRealiseM} </td>
                            <td rowSpan="4">{this.state.irrResteM}</td>
                            <td rowSpan="4">{this.state.irrTotalM} </td>
                            <td rowSpan="4">{this.state.aepiResteM} </td>
                            <td rowSpan="4">{this.state.debitSanitaireM} </td>
                            <td rowSpan="4">{this.state.transfertM} </td>
                            <td>{this.state.esStock99M}</td>
                            <td>{this.state.tauxRemp99M}</td>
                        </tr>
                        <tr>
                            <td>98</td>
                            <td>{this.state.app98M} </td>
                            <td>{this.state.esStock98M} </td>
                            <td>{this.state.tauxRemp98M} </td>
                        </tr>
                        <tr>
                            <td >95</td>
                            <td >{this.state.app95M} </td>
                            <td>{this.state.esStock95M} </td>
                            <td>{this.state.tauxRemp95M} </td>
                        </tr>
                        <tr>
                            <td >90</td>
                            <td >{this.state.app90M} </td>
                            <td>{this.state.esStock90M} </td>
                            <td>{this.state.tauxRemp90M} </td>
                        </tr>
                        <tr>
                            <td rowSpan="4">Complexe al Hansali-Al Massira</td>
                            <td rowSpan="4">{this.state.reserveC} </td>
                            <td >99</td>
                            <td >{this.state.app99C} </td>
                            <td rowSpan="4">{this.state.evapC} </td>
                            <td rowSpan="4">{this.state.irrRealiseC} </td>
                            <td rowSpan="4">{this.state.irrResteC}</td>
                            <td rowSpan="4">{this.state.irrTotalC} </td>
                            <td rowSpan="4">{this.state.aepiResteC} </td>
                            <td rowSpan="4">{this.state.debitSanitaireC} </td>
                            <td rowSpan="4">{this.state.transfertC} </td>
                            <td>{this.state.esStock99C}</td>
                            <td>{this.state.tauxRemp99C}</td>
                        </tr>
                        <tr>
                            <td>98</td>
                            <td>{this.state.app98C} </td>
                            <td>{this.state.esStock98C} </td>
                            <td>{this.state.tauxRemp98C} </td>
                        </tr>
                        <tr>
                            <td >95</td>
                            <td >{this.state.app95C} </td>
                            <td>{this.state.esStock95C} </td>
                            <td>{this.state.tauxRemp95C} </td>
                        </tr>
                        <tr>
                            <td >90</td>
                            <td >{this.state.app90C} </td>
                            <td>{this.state.esStock90C} </td>
                            <td>{this.state.tauxRemp90C} </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </>
        )
    }
}

export default SimComplex;
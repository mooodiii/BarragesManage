import React from 'react';
import XLSX from 'xlsx';
import {FichierData} from './fichierData'
import { Link } from 'react-router-dom';
import './GestionBarrage.css';
import {Bar, Line, Pie, Doughnut, PolarArea, Radar, Scatter} from 'react-chartjs-2';

class Tableau extends React.Component  {
  constructor(props){
    super(props);
    this.state = {
      csrf: this.getCookie('csrftoken'),
      chartData:{},
      options:{title:{
        display:true,
        text:'Apport mensuel',
        fontSize:25
      },}
    }

    this.getData = this.getData.bind(this);
  }

  componentWillMount(){
      this.getData()
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


  getData(){
    /*fetch(`http://127.0.0.1:8000/APIs/barages/Bin El Ouidane/99`)
    .then(Response => {
        return Response.json();
    })
    .then(data => {
        console.log(data);
        let listData = [];
        data[0].forEach(element => {
            listData.push(data[1][element])
        });
        console.log(listData)
        this.setState({
            chartData:{
                labels: data[0],
        datasets:[
          {
            label:'Apport',
            data:listData,
            backgroundColor:[
              'rgba(255, 99, 132, 0.6)',
              'rgba(54, 162, 235, 0.6)',
              'rgba(255, 206, 86, 0.6)',
              'rgba(75, 192, 192, 0.6)',
              'rgba(153, 102, 255, 0.6)',
              'rgba(255, 159, 64, 0.6)',
              'rgba(255, 99, 132, 0.6)',
              'rgba(255, 235, 132, 0.6)',
              'rgba(206, 162, 235, 0.6)',
              'rgba(255, 206, 192, 0.6)',
              'rgba(75, 255, 192, 0.6)',
              'rgba(153, 159, 255, 0.6)',
              'rgba(255, 99, 64, 0.6)',
            ]
          }
        ]
            }
        })
    })*/
  }
  
  render(){
    
  return (
    <>
        <div className="chart">
        <Bar
          data={this.state.chartData}
          options={this.state.options}
        />
        <Pie
          data={this.state.chartData}
          options={this.state.options}
        />
        <Line
          data={this.state.chartData}
          options={this.state.options}
        />
        <Doughnut
          data={this.state.chartData}
          options={this.state.options}
        />
        <PolarArea
          data={this.state.chartData}
          options={this.state.options}
        />
        <Radar
          data={this.state.chartData}
          options={this.state.options}
        />
        
        </div>
    </>
  );
}
}

export default Tableau;
import React from 'react';
import { Link } from 'react-router-dom';
import './submitData.css'

class submitData extends React.Component  {
  constructor(props){
    super(props);
    this.state = {
      title : [],
      headers:[],
      items: [],
      data : [],
      barage: "",
      newValue:"",
      name:"",
      id: "",
    }
    this.fetchData = this.fetchData.bind(this)
    this.handleChangeValues = this.handleChangeValues.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
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

  componentWillMount(){
    this.fetchData()
    this.handleSubmit()
  }


  fetchData(){
    console.log('fetching .....')
    fetch('/APIs/file')
    .then(Response => {
      console.log(Response);
      return Response.json()
    })
    .then(data=>{
      console.log(data)
      this.setState({
        data: data[0],
        title:data[1],
        headers: data[2],
        items: data[3],
        barage: data[4],
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
    
    if (this.array.length >= 1) {
      this.array.forEach(element => {
          fetch(`/APIs/file/edit`, {
                  method: 'PUT',
                  headers:{
                    'content-type': 'application/json',
                    'X-CSRFToken': csrftoken
                  },
                  body: JSON.stringify({
                      barage: this.state.barage,
                      id: element[2],
                      column: element[1],
                      newValue: element[0]
                  })
              })
              .then(Response => Response.json())
              .then(data => console.log(data))
      })
  } else {
      fetch(`/APIs/`)
          .then(Response => Response.json())
          .then(data => console.log(data))
  }
  }






  render(){
    this.titles = this.state.title.map((item) =>
    <h1 key={item}>{item}</h1>
    ); 

    this.headers = this.state.headers.map((item) =>
    <th key={item}>{item}</th>
    );
    return (
      <>
      {this.titles}
      <div >
      <table className="submitData">
        <tr>{this.headers}</tr>
        {this.state.data.map((item) =>
          <tr>
            {this.state.items.map(element => {
              if (element === 'mois' || element === 'jour'){
                return (
                  <td><input className="numbers" type="number" id={item["id"]} name={element} defaultValue={item[element]} onBlur={this.handleChangeValues}></input></td>
                )
              }
              else if (element === 'fuite'){
                return (
                  <td><input className="numbers" type="number" id={item["id"]} name={element} defaultValue={item[element]} onBlur={this.handleChangeValues}></input></td>
                )}
              else{
                return (
                  <td><input className="numbers" type="number" id={item["id"]} name={element} defaultValue={item[element].toFixed(3)} onBlur={this.handleChangeValues}></input></td>
                )
              }
              
            })}
          </tr>
        )}
      </table>
      <Link to="/Fichier/SuiviBilan"> <button onClick={this.handleSubmit} id="submit">Submit</button></Link>
      </div>
      </>
    )
  }

}

export default submitData;
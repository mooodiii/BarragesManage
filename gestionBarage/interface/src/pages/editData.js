import React from 'react';
import XLSX from 'xlsx';

class Fichier extends React.Component  {
  constructor(props){
    super(props);
    this.state = {
      sheetList : []
    }
    this.handleChange = this.handleChange.bind(this)
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
    <div className='Fichier'>
      <h1>Import Fichier</h1>
      <form action="http://127.0.0.1:8000/APIs/file" method="post" enctype="multipart/form-data">
      <input type="hidden" name="csrfmiddlewaretoken" value="M0QkKCIlbXFgMp2PzseqK39mBWhCN6FaMbBZAymzMW93ZR0elYSFHtLb42JIiCC4"></input>
        <input class="form-control" type="file" id="input" name="input" accept=".xls,.xlsx" onChange={this.handleChange}/>
        <select name="sheet" id="sheet">
            <option selected disabled>Select a sheet</option>
            {this.items}
        </select>
        <input type="month" name="month" id="month" />
        <div class="col-md-2">
            <input type="submit" name="submit" value="Import" id="convert" />
        </div>
      </form>
    </div>
  );
}
}

export default Fichier;
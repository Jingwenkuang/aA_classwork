import React from 'react';
import Tile from './tile';

export default class Board extends React.Component {
  constructor(props) {
    super(props);
    // this.renderRow = this.renderRow.bind(this);
    // this.renderCol = this.renderCol.bind(this);
    
  }

  render() {
      const board = this.props.board;
      //this is this class Board 
    return (
        <div> 
           {this.renderRow()}
        </div>
    )

  }

  renderRow() {
    const board = this.props.board; 
    return board.grid.map((row, idx) => {
      return (
        <div className="row" key={idx}>
          {this.renderCol(row, idx)}
        </div>
     );
    });
  
  }


  renderCol(row, idx) {
    const board = this.props.board; 
    return row.map((tile, i) => {
      return (
      
        <Tile tile={tile} updateGame={this.props.updateGame} key={i*board.gridSize}/>

      )
    })
  }
}
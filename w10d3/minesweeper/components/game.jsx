import React from 'react'; //react is a library
import * as Minesweeper from '../minesweeper'
import Board from './board'

export default class Game extends React.Component {
  constructor(props) {
    super(props); //no props for game class
    const board = new Minesweeper.Board(9, 10); 
    this.state = { board: board }
    this.updateGame = this.updateGame.bind(this);
  }


  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState({ board: this.state.board });
  }


  render() {
    return (
      <div>
       <Board board={this.state.board} updateGame={this.updateGame} />
      
      </div>
    )

  }
}
let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid() {
  let grid = new Array(8);
  for (let i = 0; i < 8; i++) {
    grid[i] = new Array(8);
  };

  grid[3][3] = new Piece("white");
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[4][4] = new Piece("white");
  return grid;
};

/**
 * Constructs a Board with a starting grid set up.
 */
function Board() {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [0, 1], [1, 1], [1, 0],
  [1, -1], [0, -1], [-1, -1],
  [-1, 0], [-1, 1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let [x,y] = pos;
  if (x < 0 || y < 0){
    return false;
  }
  else if (x > 7 || y > 7) {
    return false;
  }
  else {
    return true;
  };
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw new Error("Not valid pos!");
  };
  let [x,y] = pos;
  return this.grid[x][y];
};


/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.getPiece(pos) === undefined) {
    return 0;
  }
  else if (color === this.getPiece(pos).color) {
    return true;
  } 
  else {
    return false;
  };
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos) === undefined) {
    return false;
  }
  else {
    return true;
  };
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function (pos, color, dir, piecesToFlip) {
  if (!piecesToFlip) {
    piecesToFlip = []
  } else {
    piecesToFlip.push(pos)
  }
    
  let [x, y] = pos;
  let [x1, y1] = dir;
  let newPos = [x + x1, y + y1];
  if(!this.isValidPos(newPos)) {
    return [];
  } 
  else if(!this.isOccupied(newPos)) {
    return [];
  }

  else if(this.isMine(newPos, color)) {
    return piecesToFlip;
  } // b w w w w b
  
  else {
    return this._positionsToFlip(newPos, color, dir, piecesToFlip)
  } // b w w w....b
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }
  for (i = 0; i < Board.DIRS.length; i++){
    let dir = Board.DIRS[i];
    if (this._positionsToFlip(pos, color, dir).length !== 0) {
      return true;
    } 
  }
  return false;
  // else if(this._positionsToFlip(pos, color).length === 0) {
  //   return false;
  // }
  // else {
  //   return true;
  // }
  // ._positions to flip returns an empty array if no positions are captured
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error("Invalid Move");
  };
  let [x, y] = pos;
  this.grid[x][y] = new Piece(color);

  let positionsToFlip = [];
  for (let i = 0; i < Board.DIRS.length; i++) {
    let dir = Board.DIRS[i];
    positionsToFlip = positionsToFlip.concat(
      this._positionsToFlip(pos, color, dir));
  }

  for (let posIdx = 0; posIdx < positionsToFlip.length; posIdx++) {
    this.getPiece(positionsToFlip[posIdx]).flip();
  }
};

  

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validMoves = [];

  for(let i = 0; i < this.grid.length; i++) {
    for(let j = 0; j < this.grid.length; j++) {
      if (this.validMove([i, j], color)) {
        validMoves.push([i, j]);
      }
    }
  }
  return validMoves;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length === 0) {
    return false;
  }
  return true;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if((this.hasMove("black")) && (this.hasMove("white"))) {
    return false;
  }else {
    return true;
  }
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < 8; i++) {
    let rowString = " " + i + " |";

    for (let j = 0; j < 8; j++) {
      let pos = [i, j];
      rowString +=
        (this.getPiece(pos) ? this.getPiece(pos).toString() : ".");
    }

    console.log(rowString);
  }
};



module.exports = Board;

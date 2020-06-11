import React from 'react';

export default class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        //if I need to use like e.target, e.currentTarget 
        //if flagged = altKey
        
        let flagged = e.altKey ? true : false 
        this.props.updateGame(this.props.tile, flagged )
    }


    render() {
       const tile = this.props.tile;
       let name = "";
       let unicode = "";
       let count = 0;

        if (tile.explored) {
          if (tile.bombed) {
            name = 'bombed';
            unicode = '\u2622';

            } else {
              name = 'explored';
              count = tile.adjacentBombCount();
              unicode = (count > 0 ? `${count} ` : "");
            }
        } else if (tile.flagged) {
            name = 'flagged';
          unicode = '\u2691';
        } else {
           name = 'empty'
        }

        name = `tile ${name}`;
        return (
          <div className={name} onClick={this.handleClick}>{unicode}
        
          </div>
        );
    }
}


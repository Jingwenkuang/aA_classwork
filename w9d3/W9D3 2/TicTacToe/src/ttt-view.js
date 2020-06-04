class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (event) => {
      const $square = $(event.currentTarget)
      this.makeMove($square)
    })
  }

  makeMove($square) {
    // we need to know whos turn it is (X or O)
    // place mark and change background color to white 
    const pos = $square.data("x")
    const currentPlayer = this.game.currentPlayer
    try {
  
      this.game.playMove(pos)
    } catch (e) {
      alert (`Invalid Move Try Again`)
    }

    $square.addClass(currentPlayer)

    if (this.game.isOver()) {
      this.$el.off("click")
      this.$el.addClass("gameover")
      const $figcaption = $("<figcaption>")

      if (this.game.winner()) {
        this.$el.addClass(`winner-${currentPlayer}`)
        $figcaption.html(`You Win, ${currentPlayer}!`)
      } else {
        $figcaption.html("It's a draw!")
      }

      this.$el.append($figcaption)

      //win 
      // background green 
      // text color white 

      // text you win X or O ! 

      // loser 
      // text is red 

      // draw all is red 

    }

  }

  setupBoard() {
    let $ul = $("<ul>");
    for (let i = 0; i < 3; i++){
      for (let j = 0; j < 3; j++){
        let $li = $("<li>");
        $li.data("x", [i, j] );
        // debugger
        //appened our li to our ul 
        $ul.append($li)
      }
    }
    // debugger
    this.$el.append($ul)
  }
}

module.exports = View;

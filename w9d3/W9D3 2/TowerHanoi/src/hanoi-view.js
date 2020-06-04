class View {
  constructor(game, $el) {
    this.game = game; 
    this.$el = $el; 

    this.setupTowers();
    this.render();
  }

  setupTowers() {

    for (let i = 0; i < 3; i++) {
        let $stack = $("<ul>");
        for (let j = 0; j < 3; j++) {
            let $disk = $("<li>");
            $stack.append($disk);
        }
        this.$el.append($stack);
    }
  }


  render () {

    

      const stacks = this.game.towers // each ul 
                    // [[], [3, 2, 1], []];
        for (let i = 0; i < stacks.length; i ++){
            // debugger
            let disks = stacks[i];
            const $disks = this.$el.find('ul').eq(i)
            $disks.removeClass();
            for (let j = 0; j < disks.length; j++) {
                 
                if (disks[j] === 3) {
                    // const $disk = this.$el.find("li").eq(j)
                    $disks.eq(j).addClass("disk-1")
                } else if (disks[j] === 2) {
                    // const $disk = this.$el.find("li").eq(j)
                    $disks.eq(j).addClass("disk-2")   
                } else if (disks[j] === 1) {
                    // const $disk = this.$el.find("li").eq(j)
                    $disks.eq(j).addClass("disk-3")   
                }

            }
        }

  }
}

module.exports = View;

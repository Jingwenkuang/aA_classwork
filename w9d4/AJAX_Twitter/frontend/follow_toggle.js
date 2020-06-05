const APIUtil = require("./api_util");
class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId =  this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.$el.on("click", this.handleClick.bind(this))
    this.$el.prop("disabled", false); 
  }

  render(){
    // console.log(this.followState);
    if (this.followState === "unfollowed") {
      this.$el.html('Follow');
      this.$el.prop("disabled", true);
    } else if (this.followState === "followed"){
      this.$el.html('Unfollow');
      this.$el.prop("disabled", true);
    }


  }
  handleClick(event){
    event.preventDefault();
    let redraw = function(result){
      console.log(this.followState)
      if (this.followState === "unfollowed"){
      this.followState = "followed";
      } else {
        this.followState = "unfollowed"
      }
      this.render();
    };
  
    if (this.followState === "unfollowed") {
      this.render();
      APIUtil.followUser(this.userId).then(redraw.bind(this));    

    } else {
      this.render();
      APIUtil.unfollowUser(this.userId).then(redraw.bind(this));
    }
  }
}

module.exports = FollowToggle; 
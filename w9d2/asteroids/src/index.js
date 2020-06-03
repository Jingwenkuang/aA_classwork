console.log("Webpack is working!")


const MovingObject = require("./moving_object.js");
const mo = new MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00"
});
console.log(mo);
window.MovingObject = MovingObject; 


document.addEventListener('DOMContentLoaded', () => {
const canvasElement = document.getElementById('game-canvas'); 
  canvasElement.height = window.innerHeight;
  canvasElement.width = window.innerWidth;
  const ctx = canvasElement.getContext("2d");
  window.ctx = ctx;
  mo.draw(ctx);
  // window.test1 = mo.draw(ctx);

});






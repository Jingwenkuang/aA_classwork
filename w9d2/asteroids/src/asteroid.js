const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

const DEFAULTAST = {
  COLOR: 'yellow',
  RADIUS: 4,
  SPEED: 5
}

function Asteroid(options) {
  //pre-populate the key-value pairs 
  options = options || {}
  options.color = DEFAULTAST.COLOR;
  options.radius = DEFAULTAST.RADIUS;
  options.pos = options.pos;
  options.vel = options.vel || Util.randomVec(DEFAULTAST.SPEED);

  MovingObject.call(this, options);
  //this refer to Asteorid 
  //ES5 syntax, using call instead of SUPER
}   
// Must inherit before adding any properties (usually functions) to the Asteroid prototype
Util.inherits(Asteroid, MovingObject);



module.exports = Asteroid;
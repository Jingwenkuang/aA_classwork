function sum(){
    let total = 0;
    for (let i = 0; i < arguments.length; i++){
        total += arguments[i];
    }
    return total
};

function sum(...arguments) {
  let total = 0;
  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }
  return total
};
// console.log(sum(1,2,3,4));

Function.prototype.myBind = function (context) {
  const bindArgs = Array.from(arguments).slice(1); //(meow, kush)
  const func = this;

  return function () {
    
    const callArgs = Array.from(arguments);
    return func.apply(context, bindArgs.concat(callArgs));
    //call  don't take in array, 'meow', 'kush'
    //apply   ['meow', 'kush']
  }
}
// markov.says.myBind(pavlov, "meow", "Kush")();
// markov.says.myBind(pavlov, "meow")("Markov");
Function.prototype.myBind = function(context, ...args) {
  const bindArgs = Array.from(args); 
  // const func = this;
  return (...callArgs) => {
    // debugger
    return this.apply(context, bindArgs.concat(callArgs));
}};


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// console.log(markov.says.myBind(pavlov, "meow", "Kush"));
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true


  function curriedSum(numArgs) {
    let numbers = [];

    function _curriedSum(num) {
      numbers.push(num);

      if (numbers.length === numArgs) {
        let total = 0; 

        for (let i = 0; i < numbers.length; i++) {
           total += numbers[i];  
        } 
        return total;
        } else {
          return _curriedSum;
      }
    }
    return _curriedSum;
  }  


// sum(5)(30)(20)(1); // => 56
console.log(curriedSum(4)(5)(30)(20)(1))

// using spread
Function.prototype.curry = function(numArgs) {
  let args =[];
  let fn = this; 
  debugger

  function _curriedFn(arg) {
    args.push(arg);
debugger
    if (args.length === numArgs) {
      return fn(...args);
    } else {
      return _curriedFn;
    }
  }
  return _curriedFn;
};

console.log(curry(4)(5)(30)(20)(1))

// using apply
Function.prototype.curry1 = function (numArgs) {
  let args = []
  let fn = this;

  function _curriedFn(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return fn.apply(null, args);
    } else {
      return _curriedFn;
    }
  }
  return _curriedFn;
};

//ES6
Function.prototype.curry2 = function (numArgs) {
  let args = [];

  let _curriedFn = (arg) => {
    args.push(arg);
    if (args.length === numArgs) {
      return this(...args);
    } else {
      return _curriedFn;
    }
  }
  return _curriedFn;
}
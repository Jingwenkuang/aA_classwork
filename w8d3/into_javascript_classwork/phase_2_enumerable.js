Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i])
  }
}


///////////////////////////////////////
// this works but uses callback, not closure
// Array.prototype.myMap = function (callback) {
//   let mapped = [];
  
//   for (let i = 0; i < this.length; i++) {
//     mapped.push(callback(this[i]))
//   }
//   return mapped
// }

// console.log(a.myMap(double))
// // [2,4,6,8,10,12]

// console.log(a.myMap(add2))
// // [3,4,5,6,7,8]

// console.log(things.myMap(addBanana))
// // ['']

// // let's do it with closure
////////////////////////////////////
Array.prototype.myMap = function (callback) {
  const result = [];

  const innerFunction = function(ele) {
    result.push(callback(ele)); 
  }

  this.myEach(innerFunction);
  return result;
}

let arr = [1,2,3,4,5];
console.log(arr.myMap(callback))

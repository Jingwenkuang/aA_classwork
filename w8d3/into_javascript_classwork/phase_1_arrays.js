// Array.prototype.myUniq = function() { 
//     let uniqueArray = [];

//     this.forEach((ele) => {
//         if(!uniqueArray.includes(ele)) {
//             uniqueArray.push(ele)
//         }
//     })
//     return uniqueArray
// };

// console.log([1,2,2,55,3,3,3,100, 55, 3].myUniq());
// const example = function() {
//     console.log("test")
// }


Array.prototype.twoSum = function(){
  let sumArr = [];

  for(i = 0; i < this.length; i++){
    for (j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        sumArr.push([i, j])
      }
    }
  }
  return sumArr
}

console.log([1,4,5,-1,9,-5].twoSum())
[[0,3],[2,5]]

Array.prototype.myTranspose = function(){
  let transArr = [];

  for (i = 0; i < this[0].length; i++) {
    let subArr = []
    for (j = 0; j < this.length; j++) {
      subArr.push(this[j][i])
    }
    transArr.push(subArr)
  }
  return transArr
}
let arr = [[0, 1, 2], [20, 30, 40]];
console.log(arr.myTranspose());

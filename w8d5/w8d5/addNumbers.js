const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        reader.question("Please enter a number: ", function (numString) {
            const num = parseInt(numString);
            sum += num;
            console.log(sum);

            addNumbers(sum, numsLeft - 1, completionCallback);
        });
    } else {
        completionCallback(sum);
    }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`);
//  reader.close();



addNumbers(0, 3, function (sum) {
  console.log(`Total Sum: ${sum}`);
  reader.close();
});
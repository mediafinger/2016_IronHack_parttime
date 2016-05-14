var exampleArray = [2, -5, 10, 5, 4, -10, 0];

// create the function 'process'
// it takes an Array and searches for pairs
// that together have the sum 0

var process = function (array) {
  var result = [];

  for(var i = 0; i < array.length; i++) {
    for(var j = i; j < array.length; j++) {
      if ((array[i] + array[j]) === 0) {
        result.push(i + "," + j);
      }
    }
  }

  return result;
};

var result = process(exampleArray);

console.log(result); // [ "1,3", "2,5" "6,6"]

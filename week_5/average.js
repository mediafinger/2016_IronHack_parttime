function average(input) {
  numbers = input.split(":"); // [ '10', '20', '30', '40' ]

  sum = numbers.reduce( function(sum, n) {
    return parseInt(sum) + parseInt(n);
  } );

  return sum / numbers.length;
}

var input = "10:20:30:40";

result = average(input);

console.log(result);

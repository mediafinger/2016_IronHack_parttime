var x = 5; // global scope

function oneAndAHalf() {
  var x; // local scope
  x = 1;
  console.log("local: " + x);
}

oneAndAHalf();
console.log("global: " + x);

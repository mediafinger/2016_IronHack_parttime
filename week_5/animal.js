var Animal = function (name, noise) {
  this.name = name;
  this.noise = noise;

  this.makeNoise = function () {
    console.log(this.noise + "!!!!!");
  };
};

var dog = new Animal("Pluto", "Woof-a-roof");
var cat = new Animal("Pussy", "Meeeooww");

dog.makeNoise();
cat.makeNoise();

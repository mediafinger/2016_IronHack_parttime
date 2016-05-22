var Parser = (function() {

  var fs = require('fs');
  var public = {};

  public.fileActions = function(err, file) {
    console.log("reading file...");

    if (err) {
      throw err;
    } else {
      var episodes = JSON.parse(file);

      console.log("Title: " + episodes[0].title);
      return episodes;
    }
  };

  public.parse = function(path, callback) {
    console.log("parsing...");
    fs.readFile(path, "utf8", callback);
  };

  return public;
})();

module.exports = Parser;

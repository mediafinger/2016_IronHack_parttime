var Parser = require("./parser_2.js");
var path = "./episodes.json";

console.log("Parser: " + Parser);
console.log("path: " + path);

var episodes = Parser.parse(path, format_got_episodes);

function format_got_episodes(err, file) {
  episodes = Parser.fileActions(err, file);

  // my formatter

  console.log(episodes);
}

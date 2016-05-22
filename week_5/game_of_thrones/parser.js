var fs = require('fs');
function fileActions(err, file){
  if (err) {
    throw err;
  } else {
    var unsorted_episodes = JSON.parse(file);

    var episodes = sortArray(unsorted_episodes, "episode_number");

    return episodes;
  }
}

function filter(err, file) {
  episodes = fileActions(err, file);

  great_episodes = episodes.filter(function(episode) {
    return episode.rating > 8.5;
  });

  formatter(great_episodes);
}

function formatter(episodes) {
  // episodes = fileActions(err, file);

  for (var i = 0; i < episodes.length; i++) {
    var output = "";

    output += "Title: " + episodes[i].title;
    output += "  Episode #: " + episodes[i].episode_number;
    output += "\n";
    output += episodes[i].description;
    output += "\n";
    output += "Rating: " + episodes[i].rating;
    output += " " + printRating(episodes[i].rating);
    output += "\n";

    console.log(output);
  }
}

function sortArray(array, attribute) {
  return array.sort(function(a, b) {
    return a[attribute] - b[attribute];
  });
}

function printRating(rating) {
  var stars = "";
  for(var x = 0; x < rating; x++) {
    stars += "*";
  }
  return stars;
}

fs.readFile("./episodes.json", "utf8", filter);

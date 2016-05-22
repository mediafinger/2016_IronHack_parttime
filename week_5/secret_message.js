var secretMessage = ['dead', 'bygone', 'landing', 'cheaply', 'assumed', 'incorrectly', 'attention', 'agent'];

function decode(secretMessage) {
  var decodedMessage = [];
  var word = '';
  var index = 0;
  for (var i = 0; i < secretMessage.length; i++) {
    word = secretMessage[i];
    decodedMessage.push(word[index]);

    if (index > 3) {
      index = 0;
    } else {
      index++;
    }
  }

  return decodedMessage.join("");
}

console.log(decode(secretMessage));

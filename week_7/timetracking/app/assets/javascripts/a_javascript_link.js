






console.log("javascript.js loaded");

$(document).ready(function() {
  console.log("document ready");

  $("#foo").bind("click", function(event) {
    event.preventDefault();
    console.log("link clicked");
    alert($(this).text());
  });
});

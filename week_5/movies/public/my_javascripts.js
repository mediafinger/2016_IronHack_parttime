console.log("my_javascripts.js loaded");

$(document).ready(function() {
  // wait until the DOM was loaded
  // https://learn.jquery.com/using-jquery-core/document-ready/
  console.log("document ready");

  // bind this function to the click event of the element with the id foo
  $("#foo").bind("click", function(event) {
    // do not follow the link / do not open another page
    event.preventDefault();

    console.log("link clicked");

    // 'this' is the element with the id foo
    alert($(this).text());
  });

  // bind this function to the click event of the element with the id bar
  $("#bar").bind("click", function(event) {
    console.log("div clicked");

    alert($(this).text());
  });
});

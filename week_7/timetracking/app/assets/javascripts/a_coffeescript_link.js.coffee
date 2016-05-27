# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# same logic as in the .js file - but in CoffeeScript and binding to #bar

# if you have a file name.js and name.js.coffee only the .js file will be loaded!
console.log 'coffeescript loaded'

$(document).ready ->
  console.log 'document ready'

  $('#bar').bind 'click', (event) ->
    event.preventDefault()
    console.log 'link clicked'
    alert $(this).text()
    return

  return

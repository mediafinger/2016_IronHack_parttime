# README

Read the script to understand what is done here: <http://ironhack.com:3000/#/learning_unit/445>

## Get the code and run it

* `git clone ...` the app
* run `bundle install`
* run `ruby app.rb`
* visit <http://localhost:4567/>
* login with one of the combinations in **lib/authentication.rb**

## Learnings

Simple Sinatra app with:

* login _route_ and login _view_
* login _form_ with target route _POST /session_
* the _action_ passes the values of the _params_ hash to a required class
* the class Authentication validates the given user credentials
* the _action_ sets the current_user in the _session_ Hash
* the _action_ of the POST route _redirects_ to another view or _back_
* logout _form_ supports HTTP method _DELETE_
* route /session supports HTTP method _DELETE_

# Hello Sinatra!

This repo contains a hello world Sinatra app with:

 * two routes in `app.rb`
 * one ruby class under `models/hello_world.rb`
 * a layout template under `views/layout.erb`
 * stylesheets under `public/hello_world.css`
 * one view under `views/hello_world.rb`
 * tests under `spec/hello_world_spec.rb`
 * also `spec/spec_helper`, `Gemfile` and `.ruby_version` for easy setup

## Setup

* clone this repo from GitHub: `git clone ...`
* change into the folder and run: `bundle install`
* run the tests to see everything works: `bundle exec rspec spec`

If that went smoothly you can start the server: `ruby app.rb`

And open the app in your browser: <http://localhost:4567>

## Sinatra

Read more about Sinatra: <http://www.sinatrarb.com/intro.html>

And about testing Sinatra: <http://www.sinatrarb.com/testing.html>

And if you do not know why 200 is ok or what it means to have a 500 or a 404, you really have to learn about **HTTP status codes**.

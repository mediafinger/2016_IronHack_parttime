# README

This short tutorial guides you through the steps necessary to create a new Rails app, create one new Model and add one Route + Controller action + View to it.

In case you do not use RVM, prefix all `rails ...` and `rake ...` commands with `bundle exec`.

## Creating a new Rails app

Let's assume you want to create a new app called iron_hacker. First of all, you will need to get the rails gem, so run in your terminal:

`gem install rails`

Then change to your projects folder and run:

`rails new iron_hacker`

Or, if you want to add a some options, run instead:

`rails new iron_hacker --database=postgresql --skip-bundle --skip-spring --skip-test-unit`

This will create a Rails app but:

 * with a postgres database instead of the default sqlite database
 * it will not run `bundle install` so you can make changes to the Gemfile before you run it yourself
 * it will not use the spring preloader (believe, it is more pain than gain)
 * it will not use minitest and should not create the /test directory - which is not needed, if you want to use rspec

Change to the just create directory `iron_hacker` and open the content in you editor.

### Add rspec to your Rails app

Open the `Gemfile` and add the **rspec-rails** gem to the development and test group:

```ruby
group :development, :test do
  gem 'rspec-rails'
end
```

Afterwards run `bundle install` in the terminal.

Then run: `rails generate rspec:install`

In case your app still has a /test directory, you can remove this if you do not use it.

To run the tests either use `rspec spec/` or just `rake` (running the test suite is the default rake task).

### Create the database

In the terminal run `rake db:create`

## Adding data to the database

Let's assume we want to add a `User` model and its corresponding `users` table to the database.

For every User we want to be able to access `name` and `age`.

### Option 1: Use the Model generator

In the terminal run:

`rails g model User name:string age:integer`

Check the files Rails generated for you. Then run:

`rake db:migrate`

Check the file **config/schema.rb** to see if the new users table looks as expected.

Then open the `rails console` and create and save an instance of User to check if everything works.

### Option 2: generate only the Migration

In case you already have the User model (or you feel perfectly capable of creating this file yourself), you can also just run:

`rails g migration CreateUsers name:string age:integer`

The naming right naming of the migration is important! It has to start with _Create_ and end with _Users_.  
If you later want to add a column _admin_, your migration has to be named like this: _AddAdminToUsers_

 Open the migration and add the line: `t.timestamps` to the create_table block if it is missing. Then run:

 `rake db:migrate`

 Check the file **config/schema.rb** to see if the new users table looks as expected.

 Then open the `rails console` and create and save an instance of User to check if everything works.

## Adding a new view

Let's assume we want to add a view to display the profile of one User. To make this work we need to have a User model and a users database table with at least one user in it. And we will have to follow these steps:

1. Create a route
2. Create a controller action
3. Create a view

### Creating the route

Open `config/routes.rb` and add the line:

`get "/users/:id" => "users#show"`

Start the `rails server` open <http://localhost:3000/users/1> in your browser and let yourself be guided by the error messages.

### Creating the controller action

Create the new controller:

`app/controllers/users_controller.rb`

and add the action:

```ruby
class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end
end
```

Start the `rails server` open <http://localhost:3000/users/1> in your browser and let yourself be guided by the error messages.

### Creating the view

Create the new view:

`app/views/users/show.html.erb`

and add code to display the user's profile:

```ruby
<h2>User profile:</h2>

<p>
  <%= @user.name %> is <%= @user.age %> years old.
</p>
```

Start the `rails server` open <http://localhost:3000/users/1> in your browser and enjoy the beauty of your creation.

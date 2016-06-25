# Add Authentication to Timetracking app

## User Model

Attributes:
- name  / _Validate that name is present_
- email / _Validate that email is present and unique_
- password_digest

Use `has_secure_password` and add the __bcrypt__ gem to the Gemfile

Create the migration

Add seeds to create at least two users
(we do not create a UsersController or Views now)


## User - Project Association

A project should belong to one user
and one user can have many Projects

Validate in the Project model that the associated user exists

Update the Project seeds


## Session Controller

Add routes and actions for login and logout

Add login form

Display in the header the name of the current_user and the logout button, or the login button


## TimeEntries

Ensure that Users can only create, update and destroy TimeEntries for their own Projects.

## Authentication and Authorization Bonus Tasks

### 1.

Refactor the `ProjectController#index` action so it lists all Projects of the current_user

If current_user is not present, list all Projects.

### 2.

Refactor the `ProjectController#show` action so it only returns a Project if it is owned by the current_user

If current_user is not the owner, redirect to projects_path and display a flash error message.

If current_user is not present, redirect to the login page.

### 3.

Add a `UsersController#show` action that shows how many hours the current_user worked in total (summed up TimeEntries).

For this associate the TimeEntries with the User (through Projects).

## 4.

Add the attribute _role_ to the users table, ensure it has the default value _'user'_.  
In the User model _validate that role either has the value 'user' or 'admin'_.  
Modify your seeds so you have one admin and at least two users.

Ensure that admin Users can update and destroy TimeEntries of all Projects.

## Email Bonus Tasks

### Send Email to Creator of new TimeEntry

- create a TimeEntryMailer through `rails g mailer TimeEntryMailer`
- add a method `created(time_entry)` to send a notification to the creator
- add a template `views/time_entry_mailer/created.html.erb` and inform the creator about the TimeEntry that was created, include the Project name in the email
- optionally add a clear text template `views/time_entry_mailer/created.txt.erb`
- set up your email configuration in `config/environments/development.rb`

Test it!

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

## Bonus Tasks

### 1.

Add a `UsersController#index` action that lists all Projects of the current_user

If current_user is not present, redirect to the login page.

### 2.

Add a `UsersController#show` action that shows how many hours the current_user worked in total (summed up TimeEntries).

For this associate the TimeEntries with the User (through Projects).

## 3.

Add the attribute _role_ to the users table, ensure it has the default value _'user'_.  
In the User model _validate that role either has the value 'user' or 'admin'_.  
Modify your seeds so you have one admin and at least two users.

Ensure that admin Users can update and destroy TimeEntries of all Projects.

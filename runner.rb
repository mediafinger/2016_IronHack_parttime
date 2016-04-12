# Beware!
# I require the new classes here in the runner.rb
# to not 'polute' the other classes with the requires
# in case you want to use the Login class without this file
# you have to require the files yourself.
# If you want to use the login class in irb, just
# copy & paste all lines below and the program will run.

require_relative "./user.rb"
require_relative "./hardcoded.rb"
require_relative "./file_storage.rb"

load "./login.rb"

Login.new.prompt

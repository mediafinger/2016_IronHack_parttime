# DEPRECATED
# The files are now required in chess_validator.rb

# "#{Dir.pwd}/models/**/*.rb" finds all *.rb files of the project
# - Dir.pwd the absolute path to the current directory
# - the subfolder "models/"
# - all subfolders of models "**/"
# - files with the suffix "*.rb"
#
Dir["#{Dir.pwd}/lib/**/*.rb", "#{Dir.pwd}/models/**/*.rb"].each { |file| require_relative file }

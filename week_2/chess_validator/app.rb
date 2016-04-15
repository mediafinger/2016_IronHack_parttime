# This "models/**/*.rb" loads all files automatically that:
# - are in the subfolder "models/"
# - and all subfolders of models "**/"
# - and have the suffix "*.rb"
#
Dir.glob("models/**/*.rb").each do |file|
  load file
end

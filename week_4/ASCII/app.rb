require "artii"
require "sinatra"
require "sinatra/reloader" if development?

get "/ascii/:word" do
  word = params.fetch("word")

  artii = Artii::Base.new
  @ascii = artii.asciify(word)

  erb :ascii
end

# I did not add method to persist new user / password combinations.
# To do that the right way, some special cases have to be handled.
# Also it does not make much sense to save passwords in clear text ;-)
class FileStorage
  def self.get_users
    hash = {}
    # exercise: use a .csv or .json with the correct library
    File.open("users.txt", "r").each_line do |line|
      # line.split(" ") does return an Array with 2 elements
      # name, password = ["element1", "element2"]
      # assigns the two elements in one step to the two variables
      name, password = line.split(" ")
      hash[name] = password
    end

    hash
  end
end

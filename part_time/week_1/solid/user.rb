class User
  def initialize(storage = Hardcoded)
    @users = storage.get_users
  end

  def valid?(name, password)
    @users[name] == password
  end
end

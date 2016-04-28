class Authentication
  USERS = {
    "andy"  => "foobar",
    "jose"  => "barfoo",
    "allan" => "1234",
    "nikki" => "password",
    "toni"  => "$x6tqA@m5",
  }.freeze

  def login(username, password)
    return username if USERS[username] == password
  end
end

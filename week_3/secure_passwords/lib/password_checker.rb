class PasswordChecker
  def initialize
  end

  def check_password?(email, password)
    check_length?(password) &&
      check_uppercase_letters?(password) &&
      check_lowercase_letters?(password) &&
      check_numbers?(password) &&
      check_special_characters?(password) &&
      check_name_not_included?(password, email) &&
      check_domain_not_included?(password, email)
  end

  def check_length?(password, min = 7)
    password.length >= min
  end

  def check_uppercase_letters?(password, min = 1)
    password.scan(/[A-Z]/).count >= min
  end

  def check_lowercase_letters?(password, min = 1)
    password.scan(/[a-z]/).count >= min
  end

  def check_numbers?(password, min = 1)
    password.scan(/[0-9]/).count >= min
  end

  def check_special_characters?(password, min = 1)
    password.scan(/\W/).count >= min
  end

  def check_name_not_included?(password, email)
    (password =~ /#{name(email)}/).nil?
  end

  def check_domain_not_included?(password, email)
    (password =~ /#{domain(email)}/).nil?
  end

  def domain(email)
    email_parts(email).last
  end

  def name(email)
    email_parts(email).first
  end

  def email_parts(email)
    email.scan( /(\w+)@(\w+)\.[a-z]+/ ).first
  end
end

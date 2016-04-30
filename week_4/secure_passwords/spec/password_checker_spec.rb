require "password_checker"

describe PasswordChecker do
  let(:checker) { PasswordChecker.new }
  let(:email)   { "rafa@ironhack.com" }
  let(:valid_password) { "1aZ@ooo" }

  describe "#check_password?" do
    context "with valid password" do
      it "passes" do
        expect(checker.check_password?(email, valid_password)).to be true
      end

      it "passes with Rafa's password and a different email" do
        other_email = "andy@example.com"
        password = "12ironhackT$LLL"
        expect(checker.check_password?(other_email, password)).to be true
      end
    end
    context "with invalid password" do
      it "fails" do
        expect(checker.check_password?(email, "abcABC123456")).to be false
      end

      it "fails with the rafa in the password" do
        expect(checker.check_password?(email, "12rafaT$LLL")).to be false
      end

      it "fails with ironhack in the password" do
        expect(checker.check_password?(email, "12ironhackT$LLL")).to be false
      end
    end
  end

  describe "#check_length?" do
    context "with long password" do
      it "passes" do
        expect(checker.check_length?(valid_password)).to be true
      end
    end
    context "with short password" do
      it "fails" do
        expect(checker.check_length?("123456")).to be false
      end
    end
  end

  describe "#check_uppercase_letters?" do
    context "with password containing uppercase letters" do
      it "passes" do
        expect(checker.check_uppercase_letters?(valid_password)).to be true
      end
    end
    context "with password missing uppercase letters" do
      it "fails" do
        expect(checker.check_uppercase_letters?("abc123456")).to be false
      end
    end
  end

  describe "#check_lowercase_letters?" do
    context "with password containing lowercase letters" do
      it "passes" do
        expect(checker.check_lowercase_letters?(valid_password)).to be true
      end
    end
    context "with password missing lowercase letters" do
      it "fails" do
        expect(checker.check_lowercase_letters?("ABC123456")).to be false
      end
    end
  end

  describe "#check_numbers?" do
    context "with password containing numbers" do
      it "passes" do
        expect(checker.check_numbers?(valid_password)).to be true
      end
    end
    context "with password missing numbers" do
      it "fails" do
        expect(checker.check_numbers?("abcABC")).to be false
      end
    end
  end

  describe "#check_special_characters?" do
    context "with password containing special characters" do
      it "passes" do
        expect(checker.check_special_characters?(valid_password)).to be true
      end
    end
    context "with password missing special characters" do
      it "fails" do
        expect(checker.check_special_characters?("abcABC123")).to be false
      end
    end
  end

  describe "#check_name_not_included?" do
    context "with password not containing the email name" do
      it "passes" do
        expect(checker.check_name_not_included?(valid_password, email)).to be true
      end
    end
    context "with password containing the email name" do
      it "fails" do
        expect(checker.check_name_not_included?(email, email)).to be false
      end
    end
  end

  describe "#check_domain_not_included?" do
    context "with password not containing the email domain" do
      it "passes" do
        expect(checker.check_domain_not_included?(valid_password, email)).to be true
      end
    end
    context "with password missing email_not_included" do
      it "fails" do
        expect(checker.check_domain_not_included?(email, email)).to be false
      end
    end
  end
end

require "spec_helper"

describe "The HelloWorld App" do
  context "/" do
    # test if an important link is included as expected
    #
    it "provides a link" do
      get "/"
      expect(last_response).to be_ok
      expect(last_response.body).to include("<a href='/hello'>Click me!</a>")
    end
  end

  context "/hello" do
    # test for the correct response code 200 / ok
    #
    it "is successful" do
      get "/hello"
      expect(last_response).to be_ok
    end

    # test for content of the page
    #
    it "includes the generic text" do
      get "/hello"
      expect(last_response.body).to include("Enjoy your day!")
    end

    # instead of testing the output itself,
    # we can test if the right methods are called
    # as we do not have access to the same instance in the spec than in the app
    # we have to use the expectation: expect_any_instance_of(Class).to
    #
    it "calls HelloWorld#message" do
      expect_any_instance_of(HelloWorld).to receive(:message).and_call_original
      get "/hello"
    end
  end
end

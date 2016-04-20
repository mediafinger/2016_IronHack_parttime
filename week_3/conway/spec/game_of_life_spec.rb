require "game_of_life"

describe GameOfLife do
  before do
    @game = GameOfLife.new
  end

  describe ".new" do
    # this test_case is somewhat worthless
    # I just added it to check if the setup of this exercise is working
    #
    it "instantiates an object" do
      expect(@game.class).to eql GameOfLife
    end
  end

  # I would recommend to only write one test case for the run method
  # and test the grid and the methods with the generation logic and so on separately
  # (That is, if you separate the logic. If you do everything in #run
  # you can not test any functionality separately.)
  #
  describe "#run" do
    # replace those tests with you own tests!
    #
    # HERE BE DRAGONS!
    #
    # the following specs use the
    # receive(:message)".with(arguments) matcher
    # this matcher actually OVERWRITES your method
    # and only checks IF it is being called with the given arguments
    # unless you add .and_call_original your method is never executed
    # (this is often a good idea and could be also used here)
    # (when we call external sources or slow operation we don`t want to wait for them to return)
    #
    # this technique is called working with "partial doubles"
    #
    # instead of calling the original implementation (or not calling the method)
    # you could also give a return value that you need in you test case
    # just add: .and_return(5) instead of .and_call_original and
    # in this test the method will always return 5
    #
    context "the given implementation which should be replaced by the students" do
      it "writes to STDOUT" do
        expect(STDOUT).to receive(:puts).with("hello").and_call_original
        expect(@game).to receive(:system).with("clear") # we don't want to clear the output in the test run
        expect(@game).to receive(:sleep).with(2) # we don't want to wait 2 seconds in each test run
        expect(STDOUT).to receive(:puts).with("bye").and_call_original

        @game.run
      end
    end
  end
end

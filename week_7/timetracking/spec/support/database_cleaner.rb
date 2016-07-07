RSpec.configure do |config|
  # TODO add more settings:
  # http://ironhack.com:3000/#/learning_unit/518 / Slide 5

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

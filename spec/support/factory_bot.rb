RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
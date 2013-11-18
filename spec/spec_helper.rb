require 'retrotoolkit'
require 'factory_girl'

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.order = 'random'
  config.include FactoryGirl::Syntax::Methods
end

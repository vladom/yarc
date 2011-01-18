require 'yarc'
require File.join(File.dirname(__FILE__), '..', 'example', 'example.rb')
require 'rack/test'

include Rack::Test::Methods  # ?? should this be in an context ?

def app
  App
end

app.set :environment, :text

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = :documentation
end


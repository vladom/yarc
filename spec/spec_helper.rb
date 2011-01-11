require 'yarc'
require 'rack/test'

Rspec.configure do |config|
  config.color_enabled = true
  config.formatter     = :documentation
end


$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sinatra/base'
require 'yarc'

class App < Sinatra::Base
  register Sinatra::Yarc

  yarc do |y|
    y.prefix     = '/fuga'
    y.home       = '/doma'
    y.edit       = '/edito/*'
#   y.public     = '/'
#   y.json       = '/jsono'
#   y.templates  = '/tempolates'
  end

  get '/test' do
    '<h1>toto je test veru</h1>'
  end

end

App.run! :port=>2000

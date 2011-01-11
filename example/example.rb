$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sinatra/base'
require 'yarc'

class App < Sinatra::Base
  register Sinatra::Yarc do
    extend Sinatra::Yarc::Options

    options do |o|
      o.login      '/login'
      o.logout     '/logout'
      o.home       '/home'  # could be a summary of all urls and navigations groups
      o.content    '/home/content/*'
      o.javascript '/home/javascript/:file_name'
    end
  end

  get '/vlado' do
    '<h1>vlado</h1>'
  end
end

App.run! :port=>2000

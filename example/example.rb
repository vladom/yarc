$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sinatra/base'
require 'yarc'

class App < Sinatra::Base
  register Sinatra::Yarc

  yarc do |y|
    y.prefix     = '/yarco'
    y.public     = '/'
    y.home       = '/doma'
    y.edit       = '/edito/*'
    y.json       = '/jsono'
  end

  get '/suhaj' do
    'hej'
  end
  get '/vlado' do
    urls = []
    p self.class.routes#'GET']
    #self.class.routes['GET'].each {|r| r[0] = /^\/kopa$/ }
    settings.routes['GET'].each {|r| urls << r.first }
    puts settings.routes['GET'].each {|r| urls << r.first }
    urls.to_s
  end
end

App.run! :port=>2000

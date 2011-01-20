$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sinatra/base'
require 'yarc'

class App < Sinatra::Base
  register Sinatra::Yarc

  set :environment, :development

  yarc do |y|
    y.datamapper :setup => [ :default, ENV['DATABASE'] ||'postgres://vlad:vlad@localhost/vlad' ]
    y.warden     :active => false if development?
    y.prefix     :path => '/fuga'
    y.home       :path => '/doma', :widget => Yarc::Widgets::Page::Edit
    y.edit       :path => '/edito*'
    y.json       :path => '/jsono*'
    y.templates  :path => '/tempolates', :widget => Yarc::Widgets::Page::Edit
  end


  get '/test' do
    '<h1>toto je test veru</h1>'
  end

  get '/testa' do
    path = Yarc::Path.first
    widgets = path.widgets.all if path
    "<h2 style='color:green'>najdene bolo: #{widgets.first.name}</h2>"
  end

  get '/post*' do |splat|
    path = ::Yarc::Path.first_or_create(:name=>splat)

    #!TODO how to save the widgets of the path ??
    # loop throu all attributes params[:widgets] to find out wheter there exists any?
    # what should be returned back? the same data with new ids?? or ids only?

    e = path.widgets.new(params[:widgets]) if path
    puts e.saved?
    e.to_json if path
  end

end

App.run! :port=>2000

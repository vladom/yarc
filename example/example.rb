$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
widgets = File.expand_path File.join(File.dirname(__FILE__), '..', 'example', 'widgets.rb')

require 'sinatra/base'
require 'yarc'
require widgets

class App < Sinatra::Base
  register Sinatra::Yarc

  set :environment, :development

  yarc do |y|
    y.datamapper :setup => [ :default, ENV['DATABASE'] ||'postgres://vlad:vlad@localhost/vlad' ]
    y.warden     :active => false if development?
    y.prefix     :path => '/fuga'
    y.home       :path => '/doma', :widget => Yarc::Widgets::Page::Edit
    y.templates  :widget => Yarc::Widgets::Page::Edit
    # y.public     :path => '/public*'
    # y.admin :email => 'vm@gmail.com'
    # y.user  :email => 'user@gmail.com'
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

require 'sinatra/base'

module Sinatra
  module Yarc
    def self.registered(app)
      # TODO
      # add routes into the app class for:
      #   - templates
      #   - content
      #   - jQuery + jQuery UI
      #   - javascript lib
      #   - other constants of the Yarc lib

      app.register ::Yarc::Settings
      app.register ::Yarc::Routes
    end

    module Options
      include ::Yarc::Options
    end

  end

  register Yarc

end

require 'sinatra/base'

module Sinatra
  module Yarc

    def self.registered(app)
      ::Yarc::Config.register app
    end

    # to be used exclusively within the Sinatra app definition
    # the block is mandatory modifying the Yarc configuration

    def yarc &block
      ::Yarc::Config.update &block
    end
  end

  # register Sinatra::Yarc

end

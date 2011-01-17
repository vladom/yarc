require 'sinatra/base'

module Sinatra
  module Yarc

    def self.registered(app)
      ::Yarc::Setup.start app
    end

    # to be used exclusively within the Sinatra app definition
    # the block is mandatory modifying the Yarc configuration

    def yarc &block
      yield ::Yarc::Setup.update(self)
    end
  end

  # register Sinatra::Yarc

end

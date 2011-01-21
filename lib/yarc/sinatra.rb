module Sinatra
  module Yarc

    def self.registered(app)
      # app.use Warden
      ::Yarc::Config.register app
    end

    # to be used exclusively within the Sinatra app definition
    # the block is mandatory modifying the Yarc configuration

    def yarc &block
      ::Yarc::Config.update &block
    end
  end

end

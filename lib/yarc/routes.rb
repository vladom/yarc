module Yarc
  module Routes
    def self.registered(app)
      app.__send__ :get, '/yarc/*' do
        self.class.routes['GET'].grep /yarc/
      end
    end

    class Options
      def templates
  end
end

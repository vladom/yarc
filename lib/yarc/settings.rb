module Yarc
  module Settings
    def self.registered(app)
      
      app.__send__ :set, :hovna do
        'sending hovna to app'
      end
    end
  end
end

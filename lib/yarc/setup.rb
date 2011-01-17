module Yarc
  module Setup
    def self.start app
      @config ||= Config.new app
    end

    def self.update app, &block
      @config.update &block
    end

  end
end

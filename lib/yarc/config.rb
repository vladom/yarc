module Yarc
  class Config

    def initialize app
      @options = Options.new
      @routes = Routes.new app, @options.routes
    end

    def update &block
      return yield self
    end

    include Options::Config
    include Routes::Config

  end
end

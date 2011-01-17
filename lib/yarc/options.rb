module Yarc
  class Options

    attr_reader :routes

    def initialize
      @routes = {}
      routes.update :prefix=>'/yarc'
    end

    module Config

      def prefix path
        @routes.update { prefix = path }
      end

    end

  end
end


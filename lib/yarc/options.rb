module Yarc
  module Options
    class Config
      def path_name route
        puts 'a toto je zmena ' + route
      end
    end

    def options &blk
      yield Config.new
    end

    alias :config :options

  end
end

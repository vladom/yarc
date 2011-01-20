module Yarc
  class Config

    class << self

      def register app
        @config            = self.new app
        @config.options    = Options
        @config.routes     = Routes.new(app, @config.options)
      end

      def update &block
        yield @config
      end

    end

    attr_accessor :options, :routes
    attr_writer   :datamapper
    attr_reader   :app

    def initialize app
      @app = app
    end

    def prefix opts
      routes.prefix = opts[:path]
    end

    def datamapper opts
      DataMapper::Logger.new(STDOUT,:debug) if app.environment == :development
      DataMapper.setup *opts[:setup]
      DataMapper.auto_upgrade! if app.environment == :development
    end

    def home opts
      routes.home = opts
    end

    def edit opts
      routes.edit = opts
    end

    def json opts
      routes.json = opts
    end

    def templates opts
      routes.templates = opts
    end

    def warden opts
      puts opts
    end

  end
end

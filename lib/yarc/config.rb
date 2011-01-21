module Yarc
  class Config

    class << self

      def register app
        @config            = self.new app
        @config.options    = Options
        @config.routes     = Routes.new(app, @config.options)
      end

      def update &block
        @config.save_public_route
        yield @config
        @config.restore_public_route
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

    def public opts={}
      @public_route = opts
    end

    def restore_public_route
      app.routes['GET'] << @public['GET']
      app.routes['HEAD'] << @public['HEAD']
    end

    def save_public_route
      ( @public ||={} ).merge! 'GET' => app.routes['GET'].pop, 'HEAD' => app.routes['HEAD'].pop
    end

  end
end

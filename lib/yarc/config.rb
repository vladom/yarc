module Yarc
  class Config

    class << self

      def register app
        @app            = app
        @config         = self.new
        @config.options = Options.new
        @config.routes  = Routes.new(app, @config.options)
      end

      def update &block
        yield @config
        @config.update_all
      end

    end

    attr_accessor :options, :routes

    def initialize
      @update = { :routes=>{} }
    end

    def update_all
      routes.update @update[:routes]
    end

    def prefix=(prefix)
      @update[:routes].merge! :prefix => prefix
    end

    def home=(path=nil,widget=nil)
      @update[:routes].merge! :home => { :path=>path, :widget=>widget }
    end

    def edit=(path=nil,widget=nil)
      @update[:routes].merge! :edit => { :path=>path, :widget=>widget }
    end

  end
end

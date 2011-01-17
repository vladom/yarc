module Yarc
  class Routes

    DEFAULT_OPTIONS  = {
      :home  =>{:path=>'',       :widget=> Widgets::Home::Page},
      :edit  =>{:path=>'/edit/*',:widget=> Widgets::Edit::Page}
    }

    attr_reader :app
    attr_accessor :prefix, :edit

    def initialize app, options
      @app = app
      @prefix = options[:prefix]
      @home   = home(DEFAULT_OPTIONS[:home])
      @edit   = edit(DEFAULT_OPTIONS[:edit])
    end

    def update name=nil, &blk
      if name
        self.__send__(name) &blk
        yield if block_given?
      else
        yield
      end
    end

    private

    def edit options
      widget = options[:widget]
      path = "#{prefix}/edit/*"
      [:get,:post,:put,:delete].each do |method|
        app.__send__ method path do |splat|
          url = Url.first(:name => splat)
          url ? widget.new(:data=>url.widgets).to_html : widget.new.to_html
        end
      end
      options
    end

    def home options
      widget = options[:widget]
      path   = "#{prefix}#{options[:path]}"
      app.get path do
        options[:widget].new.to_html
      end
    end

  end
end

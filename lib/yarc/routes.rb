module Yarc
  class Routes

    DEFAULT_OPTIONS  = {
      :home  =>{:path=>'/home',  :widget=> Yarc::Widgets::Page::Home },
      :edit  =>{:path=>'/edit/*',:widget=> Yarc::Widgets::Page::Edit }
    }

    attr_reader :app, :edit, :home
    attr_accessor :prefix

    def initialize app, options
      @app = app
      @prefix = options.prefix
      home DEFAULT_OPTIONS[:home]
      edit DEFAULT_OPTIONS[:edit]
    end

    def update opts={}, &blk
      self.prefix = opts.delete(:prefix) if opts[:prefix]
      opts.each_pair do |name,settings|
        self.__send__ name, settings
      end
    end

    def edit options
      raise RuntimeError, 'Wrong edit path, it must end with a backslash and a splat, like "/edit/*"' \
      unless options[:path] =~ /(\/\*)$/
      options[:widget] = DEFAULT_OPTIONS[:edit][:widget] unless options[:widget]
      [:get,:post,:put,:delete].each do |method|
        app.__send__ method, "#{prefix}#{options[:path]}" do |splat|
          options[:widget].new(:path=>splat).to_html
        end
      end
      @edit = options
    end

    def home options
      options[:widget] = DEFAULT_OPTIONS[:home][:widget] unless options[:widget]
      app.get "#{prefix}#{options[:path]}" do
        options[:widget].new.to_html
      end
      @home = options
    end

  end
end

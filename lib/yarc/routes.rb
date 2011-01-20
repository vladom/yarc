module Yarc
  class Routes

    DEFAULT_OPTIONS  = {
      :home  =>{:path=>'/home',  :widget=> Yarc::Widgets::Page::Home },
      :edit  =>{:path=>'/edit*', :widget=> Yarc::Widgets::Page::Edit }
    }

    attr_reader :app, :edit, :prefix

    def initialize app, options
             @app = app
      self.prefix = options.prefix
        self.home = DEFAULT_OPTIONS[:home]
        self.edit = DEFAULT_OPTIONS[:edit]
    end

    def prefix= prefix
      @prefix = prefix
      app.before "#{prefix}*" do
        puts "you must authenticate!" # authenticate!
      end
    end


    def edit= options
      edit = (@edit ? @edit.merge!(options) : @edit = options)
      raise RuntimeError, 'Wrong edit path, you must specify a splat, ie. "/edit*"' unless @edit[:path] =~ /\*$/
      app.get "#{prefix}#{edit[:path]}" do |splat|
        edit[:widget].new(:path=>splat).to_html
      end
    end

    def home= options
      home = (@home ? @home.merge!(options) : @home = options)
      app.get "#{prefix}#{home[:path]}" do
        home[:widget].new.to_html
      end
    end

    def json= options
      json = (@json ? @json.merge!(options) : @json = options)
      route = "#{prefix}#{json[:path]}"
      # GET
      app.get route do |splat|
        path = ::Yarc::Path.first(:name => splat, :limit => 1)
        path.widgets.to_json if path
      end
      # POST
      app.post route do |splat|
        path = Path.first_or_create(splat, params)
        path.widgets.to_json if path
      end
    end

    def templates= options
    end

  end
end

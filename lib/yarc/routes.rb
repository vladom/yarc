module Yarc
  class Routes

    DEFAULT_OPTIONS  = {
      :public=>{:path=>'/*?',    :widget=> Yarc::Widgets::Page::Public },
      :home  =>{:path=>'/home',  :widget=> Yarc::Widgets::Page::Home   },
      :edit  =>{:path=>'/edit/*?', :widget=> Yarc::Widgets::Page::Edit   },
      :login =>{:path=>'/login', :widget=> Yarc::Widgets::Page::Login  },
      :not_found=>{              :widget=> Yarc::Widgets::Page::NotFound },
      :logout=>{:path=>'/logout'} ,
      :json=>{:path=>'/json/*?' }
    }

    attr_reader :app, :edit, :prefix, :public

    def initialize app, options
      @app = app
      self.prefix = options.prefix
      self.home = DEFAULT_OPTIONS[:home]
      self.edit = DEFAULT_OPTIONS[:edit]
      self.json = DEFAULT_OPTIONS[:json]
      self.login = DEFAULT_OPTIONS[:login]
      self.logout = DEFAULT_OPTIONS[:logout]
      self.not_found = DEFAULT_OPTIONS[:not_found]
      self.public = DEFAULT_OPTIONS[:public]
    end

    def update
      puts 'updating everything you need'
    end

    def not_found= options
      notfound = ( @not_found ? @not_found.merge!(options) : @not_found = options )

      # GET not_found
      app.not_found do
        notfound[:widget].new(:referer=>request.referer).to_html
      end
    end

    def login= options
      login = ( @login ? @login.merge!(options) : @login = options )
 
      # GET
      app.get login[:path] do
        login[:widget].new(:path=>login[:path]).to_html
      end

      # POST
      app.post login[:path] do
        puts 'authenticate! me'# authenticate!
        raise RuntimeError, 'No authentication implemented'
      end
    end

    def logout= options
      logout = ( @logout ? @logout.merge!(options) : @logout = options )

      # GET
      app.get logout[:path] do
        puts 'session to be cleared' # delete session
        redirect '/'
        raise RuntimeError, 'Session system to be done'
      end
    end

    def prefix= prefix
      @prefix = prefix
      app.before "#{prefix}*" do
        puts "you must authenticate!" # authenticate!
      end
    end


    def edit= options
      edit = (@edit ? @edit.merge!(options) : @edit = options)
      raise RuntimeError, 'Wrong edit path, you must specify a splat, ie. "/edit*"' unless @edit[:path] =~ /(\/.*?)$/

      # GET
      app.get "#{prefix}#{edit[:path]}" do |splat|
        edit[:widget].new(:path=>splat).to_html
      end
    end

    def home= options
      home = (@home ? @home.merge!(options) : @home = options)

      # GET
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

    def public= options
      public_ = (@public ? @public.merge!(options) : @public = options)

      # GET
      app.get public_[:path] do |splat|
        path = Path.first(:name=>splat)
        if path
          page = path.page
          puts page
          page ? public_[:widget].new(:path=>path, :page=>page).to_html : not_found
        else
          not_found
        end
      end
    end

    def templates= options
    end

  end
end

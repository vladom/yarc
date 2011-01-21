module Yarc
  module Widgets
    module Page
      class Home < Erector::Widgets::Page
        def body_content
          h2 'Here we need:'
          ul do
            li { h3 'List of all urls (paths) in the public zone' }
            li { h3 'List of all urls (paths) not yet published'  }
            li { h3 'Various kinds of widgets - navigation, menu, articles .. ' }
          end
        end
      end

      class Edit < Erector::Widgets::Page
        def body_content
          h2 'toto je Edit widget baby'
        end
      end

      class Login < Erector::Widgets::Page

        needs :path

        def body_content
          form :method=>:post, :action=>@path do
            input :type=>:text,     :name=>:email
            input :type=>:password, :name=>:password
            input :type=>:submit,   :name=>:login_button, :value=>'Login..', :action=>@path
          end
        end
      end

      class Public < Erector::Widgets::Page

        needs :path, :page

        def body_content
          h1 self.class.name
          h2 :style => [:color=>:gree] do
            text 'toto je setko public'
          end
        end
      end

      class NotFound < Erector::Widgets::Page

        needs :referer

        def body_content
          h1 self.class.name
          h2 :style => "color:green" do
            text 'nekde sa stala chyba a nic sme nenasli'
          end
          a :href=>@referer do
            h3 :style=>"color:red" do
              text "Chod spat na #{@referer}, frajer"
            end
          end
        end
      end

    end

  end
end

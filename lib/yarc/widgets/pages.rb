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

    end
  end
end

module Yarc
  class Page
    include  DataMapper::Resource

    property :id, Serial
    property :html, Text

    belongs_to :path
  end
end

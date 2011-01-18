module Yarc
  class Widget
    include DataMapper::Resource

    property :id, Serial
    property :name, String

    belongs_to :path
  end
end

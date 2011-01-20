module Yarc
  class Widget
    include DataMapper::Resource

    property :id,      Serial
    property :name,    String,  :unique_index => :name
    property :path_id, Integer, :unique_index => :name

    belongs_to :path
  end
end

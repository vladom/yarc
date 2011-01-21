module Yarc
  class Path
    include DataMapper::Resource

    property :id, Serial
    property :name, String, :required=>true

    has n, :widgets
    has 1, :page
  end
end

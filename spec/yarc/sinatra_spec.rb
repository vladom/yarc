require 'spec_helper'

describe Sinatra do
  describe Sinatra::Yarc do
    it 'is to be registered by the Sinatra controller' do
      Sinatra::Yarc.should respond_to :registered
    end
  end
end


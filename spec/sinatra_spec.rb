require 'spec_helper'

describe Sinatra do
  describe Sinatra::Yarc do
    it 'is to be registered by the Sinatra controller' do
      Sinatra::Yarc.should respond_to :registered
    end
  end

  describe Sinatra::Yarc do
    describe 'Options' do
      it 'responds with a callback #included?(module)' do
        Sinatra::Yarc::Options.should respond_to :included?
      end
    end
  end
end

describe Yarc do
  describe Yarc::Routes do
    it 'is to be registered by the Sinatra controller' do
      Yarc::Routes.should respond_to :registered
    end
  end
end

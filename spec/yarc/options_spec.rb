require 'spec_helper'
describe Yarc::Options do
  it { should respond_to :setup }
  context 'Anonymous module extended by Yarc::Options' do
    it 'should have public method #options' do
      mod = Module.new
      mod.extend ::Yarc::Options
      mod.should respond_to :options
    end
  end
end

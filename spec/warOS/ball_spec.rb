require File.expand_path(File.dirname(__FILE__) + '/../lib/ship.rb')

describe Ship do
  it 'should be the truth' do
    Ship.truth.should be_true
  end
end

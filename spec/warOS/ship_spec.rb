require File.expand_path(File.dirname(__FILE__) + '/../lib/ball.rb')

describe Ball do
  it 'should instantiate a ball object with a image loaded' do
    Ball.truth.should be_true
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../lib/ball.rb')

describe Ball do
  it 'should be the truth' do
    Ball.truth.should be_true
  end
end

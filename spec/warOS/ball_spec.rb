require File.dirname(__FILE__) + "/../spec_helper"

describe Ball do
  before(:each) do
    @window = WarOS.new
  end

  it 'should instantiate a ball object with a image loaded' do
    ball = Ball.new @window
    ball.instance_variable_get("@ball").class.should == Gosu::Image
  end
end

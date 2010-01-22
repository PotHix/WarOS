require File.dirname(__FILE__) + "/../spec_helper"

describe Ball do
  before(:each) do
    @window = WarOS.new
    @ball   = Ball.new @window
  end

  it 'should instantiate a ball object with a image loaded' do
    @ball.instance_variable_get("@ball").class.should == Gosu::Image
  end

  context 'when moving' do
    it 'should ' do
    pending
      
    end
  end
end

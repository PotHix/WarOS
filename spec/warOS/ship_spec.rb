require File.dirname(__FILE__) + "/../spec_helper"

describe Ship do
  before(:each) do
    @window = WarOS.new
  end

  it 'should instantiate a ship object with a image loaded' do
    ship = Ship.new @window
    ship.instance_variable_get("@ship").class.should == Gosu::Image
  end
end

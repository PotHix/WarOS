require File.dirname(__FILE__) + "/../spec_helper"

describe Ship do
  before(:each) do
    @window ||= WarOS.new
    @ship   ||= Ship.new @window
  end

  it 'should instantiate a ship object with a image loaded' do
    @ship.instance_variable_get("@ship").class.should == Gosu::Image
  end

  context 'when moving to the right' do
    it 'should subtract the shipvelocity to the x position of the ship' do
      before_move_x = @ship.instance_variable_get("@x") 
      @ship.move_right.should eql(before_move_x + Ship::SHIPVELOCITY)
    end

    it 'should not add value to x coordinate if is the end of the window size' do
      @ship.instance_variable_set("@x", WarOS::HEIGHT-Ship::SHIPWIDTH) 
      @ship.move_right
      @ship.instance_variable_get("@x").should eql(WarOS::HEIGHT-Ship::SHIPWIDTH)
    end
  end

  context 'when moving to the left' do
    it 'should add the shipvelocity to the x position of the ship' do
      before_move_x = @ship.instance_variable_get("@x") 
      @ship.move_left.should eql(before_move_x - Ship::SHIPVELOCITY)
    end

    it 'should not subtract value of x coordinate if is the beggining of the window size' do
      @ship.instance_variable_set("@x", Ship::SHIPSECUREMARGIN) 
      @ship.move_left
      @ship.instance_variable_get("@x").should eql(Ship::SHIPSECUREMARGIN)
    end
  end

  it 'should draw the ship on the screen' do
    pending
    @ship.should_receive(:draw).with(0,0,0)
    @ship.draw 
  end

  it 'should return the actual x position of the ship' do
    x_position = @ship.instance_variable_get("@x")
    @ship.position.should eql(x_position..x_position+Ship::SHIPWIDTH) 
  end
end

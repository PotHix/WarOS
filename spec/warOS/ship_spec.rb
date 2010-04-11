require File.dirname(__FILE__) + "/../spec_helper"

describe Ship do
  before(:each) do
    @window = WarOS.new
    @ship   = Ship.new @window
  end

  it 'should instantiate a ship object with a image loaded' do
    @ship.instance_variable_get("@ship").class.should == Gosu::Image
  end

  context 'when moving to the right' do
    it 'should subtract the shipvelocity to the x position of the ship' do
      before_move_x = @ship.x
      @ship.move_right.should eql(before_move_x + Ship::SHIPVELOCITY)
    end

    it 'should not add value to x coordinate if is the end of the window size' do
      @ship.x = WarOS::HEIGHT-Ship::DIMENSIONS[@ship.state][:width]
      @ship.move_right
      @ship.x.should eql(WarOS::HEIGHT-Ship::DIMENSIONS[@ship.state][:width])
    end
  end

  context 'when moving to the left' do
    it 'should add the shipvelocity to the x position of the ship' do
      before_move_x = @ship.x
      @ship.move_left.should eql(before_move_x - Ship::SHIPVELOCITY)
    end

    it 'should not subtract value of x coordinate if is the beggining of the window size' do
      @ship.x = Ship::SHIPSECUREMARGIN
      @ship.move_left
      @ship.x.should eql(Ship::SHIPSECUREMARGIN)
    end
  end

  it 'should return the actual x position of the ship' do
    x_position = @ship.x
    @ship.position.should eql(x_position..x_position+Ship::DIMENSIONS[@ship.state][:width]) 
  end

  context 'to get the correct width' do
    it 'for mac pad' do
      @ship.state = :mac
      @ship.width.should eql(Ship::DIMENSIONS[:mac][:width])
    end
    it 'for lin pad' do
      @ship.state = :lin
      @ship.width.should eql(Ship::DIMENSIONS[:lin][:width])
    end
    it 'for win pad' do
      @ship.state = :win
      @ship.width.should eql(Ship::DIMENSIONS[:win][:width])
    end
  end

  context 'to get the correct height' do
    it 'for mac pad' do
      @ship.state = :mac
      @ship.height.should eql(Ship::DIMENSIONS[:mac][:height])
    end
    it 'for lin pad' do
      @ship.state = :lin
      @ship.height.should eql(Ship::DIMENSIONS[:lin][:height])
    end
    it 'for win pad' do
      @ship.state = :win
      @ship.height.should eql(Ship::DIMENSIONS[:win][:height])
    end
  end
end

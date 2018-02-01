require File.dirname(__FILE__) + "/../spec_helper"

describe Ship do
  before(:each) do
    @window = WarOS.new
    @ship   = Ship.new @window
  end

  it 'instantiates a ship object with a image loaded' do
    expect(@ship.instance_variable_get("@image").class).to eql(Gosu::Image)
  end

  context 'when moving to the right' do
    it 'subtracts the shipvelocity to the x position of the ship' do
      before_move_x = @ship.x
      expect(@ship.move_right).to eql(before_move_x + Ship::VELOCITY)
    end

    it 'does not add value to x coordinate if is the end of the window size' do
      @ship.x = WarOS::HEIGHT-@ship.width
      @ship.move_right
      expect(@ship.x).to eql(WarOS::HEIGHT-@ship.width)
    end
  end

  context 'when moving to the left' do
    it 'adds the shipvelocity to the x position of the ship' do
      before_move_x = @ship.x
      expect(@ship.move_left).to eql(before_move_x - Ship::VELOCITY)
    end

    it 'does not subtract value of x coordinate if is the beggining of the window size' do
      @ship.x = Ship::SECUREMARGIN
      @ship.move_left
      expect(@ship.x).to eql(Ship::SECUREMARGIN)
    end
  end

  it 'returns the actual x position of the ship' do
    x_position = @ship.x
    expect(@ship.position).to eql(x_position..x_position+@ship.width)
  end

  context 'for lin state' do
    it 'sets ship to the correct graphic image' do
      @ship.state = :lin
      graphics = @ship.instance_variable_get("@graphics")
      expect(@ship.image).to eql(graphics[@ship.state])
    end
  end

  context 'for mac state' do
    it 'sets ship to the correct graphic image' do
      @ship.state = :mac
      graphics = @ship.instance_variable_get("@graphics")
      expect(@ship.image).to eql(graphics[@ship.state])
    end
  end

  context 'for win state' do
    it 'sets ship to the correct graphic image' do
      @ship.state = :win
      graphics = @ship.instance_variable_get("@graphics")
      expect(@ship.image).to eql(graphics[@ship.state])
    end
  end
end

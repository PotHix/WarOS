require File.dirname(__FILE__) + "/../spec_helper"

describe WarOS do
  before(:each) do
    @window = WarOS.new
    @ball   = @window.instance_variable_get("@ball")
    @ship   = @window.instance_variable_get("@ship")
  end

  it 'should return true if the ball is out of bounds' do
    @ball.instance_variable_set("@y", WarOS::HEIGHT)
    @window.game_over?.should be_true 
  end

  it 'should return true for the same position of the ship and the ball' do
    @ball.instance_variable_set("@y", WarOS::SHIPCOLISIONPOSITION)
    @ship.instance_variable_set("@x", @ball.instance_variable_get('@x'))
    @window.has_ship_and_ball_colision?.should be_true
  end
end

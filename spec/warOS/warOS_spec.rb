require File.dirname(__FILE__) + "/../spec_helper"

describe WarOS do
  before(:each) do
    @window = WarOS.new
    @ball   = @window.ball
    @ship   = @window.ship
  end

  it 'should return true if the ball is out of bounds' do
    @ball.y = WarOS::HEIGHT
    @window.game_over?.should be_true 
  end

  it 'should return true for the same position of the ship and the ball' do
    @ball.y = WarOS::SHIPCOLISIONPOSITION
    @ship.x = @ball.x
    @window.has_ship_and_ball_colision?.should be_true
  end

  it 'should have more than one ball'
end

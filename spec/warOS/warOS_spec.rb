require File.dirname(__FILE__) + "/../spec_helper"

describe WarOS do
  before(:each) do
    @window = WarOS.new
    @ball   = @window.ball
    @ship   = @window.ship
  end

  it 'returns true if the ball is out of bounds' do
    @ball.y = WarOS::HEIGHT
    expect(@window.game_over?).to be_truthy
  end

  it 'returns true for the same position of the ship and the ball' do
    @ball.y = WarOS::SHIPCOLISIONPOSITION
    @ship.x = @ball.x
    expect(@window.has_ship_and_ball_colision?).to be_truthy
  end

  it 'should have more than one ball'
end

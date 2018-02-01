require File.dirname(__FILE__) + "/../spec_helper"

describe Ball do
  before(:each) do
    @window = WarOS.new
    @ball   = Ball.new @window
  end

  it 'instantiates a ball object with a image loaded' do
    expect(@ball.instance_variable_get("@image").class).to eql(Gosu::Image)
  end

  context 'when moving' do
    it 'decreases by a "ball_velocity" the y coordinate for a true top moving space' do
      @ball.moving_state = {:top => true, :right => true}
      before_move, after_move = move_ball_and_return :y
      expect(after_move).to eql(before_move - @ball.velocity)
    end

    it 'increases by a "ball_velocity" the y coordinate for a false top moving space' do
      @ball.moving_state = {:top => false, :right => true}
      before_move, after_move = move_ball_and_return :y
      expect(after_move).to eql(before_move + @ball.velocity)
    end

    it 'increases by a "ball_velocity" the x coordinate for a true right moving space' do
      @ball.moving_state = {:top => true, :right => true}
      before_move, after_move= move_ball_and_return :x
      expect(after_move).to eql(before_move + @ball.velocity)
    end

    it 'decreases by a "ball_velocity" the x coordinate for a false right moving space' do
      @ball.moving_state = {:top => true, :right => false}
      before_move, after_move = move_ball_and_return :x
      expect(after_move).to eql(before_move - @ball.velocity)
    end

    context 'and colliding' do
      it 'in `top` it should change moving_state[top] to false' do
        @ball.y = 0
        @ball.directions_changing
        expect(@ball.moving_state[:top]).to be_falsy
      end

      it 'in `bottom` it should change moving_state[top] to true' do
        @ball.y = WarOS::HEIGHT
        @ball.directions_changing
        expect(@ball.moving_state[:top]).to be_truthy
      end

      it 'in `right` it should change moving_state[right] to false' do
        @ball.x = WarOS::WIDTH-Ball::BALLWIDTH
        @ball.directions_changing
        expect(@ball.moving_state[:right]).to be_falsy
      end

      it 'in `left` it should change moving_state[right] to true' do
        @ball.x = 0
        @ball.directions_changing
        expect(@ball.moving_state[:right]).to be_truthy
      end
    end
  end

  it 'returns the current ball position' do
    position = { :x => @ball.x, :y => @ball.y }
    expect(@ball.position).to eql(position)
  end

  it 'returns a secure margin for the diretion changing' do
    expect(@ball.direction_change_margin).to eql(@ball.velocity / 2)
  end

  it 'increases ball velocity'

  private

  def move_ball_and_return coordinate
    result = []
    result << @ball.instance_variable_get("@#{coordinate.to_s}") 
    @ball.move
    result << @ball.instance_variable_get("@#{coordinate.to_s}")
  end
end

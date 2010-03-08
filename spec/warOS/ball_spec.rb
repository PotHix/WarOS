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
    it 'should decrease by a "ball_velocity" the y coordinate for a true top moving space' do
      @ball.moving_state = {:top => true, :right => true}
      before_move, after_move = move_ball_and_return :y
      after_move.should eql(before_move - @ball.ball_velocity)
    end

    it 'should increase by a "ball_velocity" the y coordinate for a false top moving space' do
      @ball.moving_state = {:top => false, :right => true}
      before_move, after_move = move_ball_and_return :y
      after_move.should eql(before_move + @ball.ball_velocity)
    end

    it 'should increase by a "ball_velocity" the x coordinate for a true right moving space' do
      @ball.moving_state = {:top => true, :right => true}
      before_move, after_move= move_ball_and_return :x
      after_move.should eql(before_move + @ball.ball_velocity)
    end

    it 'should decrease by a "ball_velocity" the x coordinate for a false right moving space' do
      @ball.moving_state = {:top => true, :right => false}
      before_move, after_move = move_ball_and_return :x
      after_move.should eql(before_move - @ball.ball_velocity)
    end

    context 'and coliding' do
      it 'in top it should change moving_state[top] to false' do
        @ball.y = 0
        @ball.directions_changing
        @ball.moving_state[:top].should be_false
      end

      it 'in bottom it should change moving_state[top] to true' do
        @ball.y = WarOS::HEIGHT
        @ball.directions_changing
        @ball.moving_state[:top].should be_true
      end

      it 'in right it should change moving_state[right] to false' do
        @ball.x = WarOS::WIDTH-Ball::BALLWIDTH
        @ball.directions_changing
        @ball.moving_state[:right].should be_false
      end

      it 'in left it should change moving_state[right] to true' do
        @ball.x = 0
        @ball.directions_changing
        @ball.moving_state[:right].should be_true
      end
    end
  end

  it 'should return the current ball position' do
    position = { :x => @ball.x, :y => @ball.y }
    @ball.position.should eql(position)
  end

  private
  def move_ball_and_return coordinate
    result = []
    result << @ball.instance_variable_get("@#{coordinate.to_s}") 
    @ball.move
    result << @ball.instance_variable_get("@#{coordinate.to_s}")
  end
end

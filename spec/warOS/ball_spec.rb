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
      @ball.instance_variable_set("@moving_state", {:top => true, :right => true}) 
      before_move, after_move = move_ball_and_return :y
      after_move.should eql(before_move - @ball.instance_variable_get("@ball_velocity"))
    end

    it 'should increase by a "ball_velocity" the y coordinate for a false top moving space' do
      @ball.instance_variable_set("@moving_state", {:top => false, :right => true}) 
      before_move, after_move = move_ball_and_return :y
      after_move.should eql(before_move + @ball.instance_variable_get("@ball_velocity"))
    end

    it 'should increase by a "ball_velocity" the x coordinate for a true right moving space' do
      @ball.instance_variable_set("@moving_state", {:top => true, :right => true}) 
      before_move, after_move= move_ball_and_return :x
      after_move.should eql(before_move + @ball.instance_variable_get("@ball_velocity"))
    end

    it 'should decrease by a "ball_velocity" the x coordinate for a false right moving space' do
      @ball.instance_variable_set("@moving_state", {:top => true, :right => false}) 
      before_move, after_move = move_ball_and_return :x
      after_move.should eql(before_move - @ball.instance_variable_get("@ball_velocity"))
    end

    context 'and coliding' do
      it 'in top it should change moving_state[top] to false' do
        @ball.instance_variable_set("@y", 0) 
        @ball.directions_changing
        @ball.instance_variable_get("@moving_state")[:top].should be_false
      end

      it 'in bottom it should change moving_state[top] to true' do
        @ball.instance_variable_set("@y", WarOS::HEIGHT) 
        @ball.directions_changing
        @ball.instance_variable_get("@moving_state")[:top].should be_true
      end

      it 'in right it should change moving_state[right] to false' do
        @ball.instance_variable_set("@x", WarOS::WIDTH-Ball::BALLWIDTH) 
        @ball.directions_changing
        @ball.instance_variable_get("@moving_state")[:right].should be_false
      end

      it 'in left it should change moving_state[right] to true' do
        @ball.instance_variable_set("@x", 0) 
        @ball.directions_changing
        @ball.instance_variable_get("@moving_state")[:right].should be_true
      end
    end
  end

  it 'should return the current ball position' do
    position = { :x => @ball.instance_variable_get("@x"),
      :y => @ball.instance_variable_get("@y") }

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

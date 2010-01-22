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
  end

  private
  def move_ball_and_return coordinate
    result = []
    result << @ball.instance_variable_get("@#{coordinate.to_s}") 
    @ball.move
    result << @ball.instance_variable_get("@#{coordinate.to_s}")
  end
end

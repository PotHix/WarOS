class Ball
  BALLWIDTH = 20

  attr_accessor :x, :y, :moving_state, :ball_velocity

  def initialize(window)
    @ball = Gosu::Image.new(window, File.join(File.dirname(__FILE__), "../media", "ball.png"), true)

    @ball_velocity = 5.0
    @y = WarOS::HEIGHT/2
    @x = WarOS::WIDTH/3
 
    # Ball is always moving
    # True point to the key direction and false to its opposite
    @moving_state = {:top => true, :right => true}
  end

  def move
    @moving_state[:top]   ? @y -= @ball_velocity : @y += @ball_velocity
    @moving_state[:right] ? @x += @ball_velocity : @x -= @ball_velocity
  end

  def draw
    @ball.draw(@x, @y, 0)
  end

  def directions_changing(allow = {})
    @moving_state[:top] = false if ((0-direction_change_margin)..(0+direction_change_margin)).include?(@y)
    @moving_state[:top] = true if allow[:to_top]
    @moving_state[:right] = false if ((WarOS::WIDTH - BALLWIDTH - direction_change_margin)..(WarOS::WIDTH - BALLWIDTH + direction_change_margin)).include?(@x)
    @moving_state[:right] = true  if ((0-direction_change_margin)..(0+direction_change_margin)).include?(@x)
  end
  
  def position
    {:x => @x, :y => @y}
  end

  def direction_change_margin
    @ball_velocity / 2
  end
end

class Ball

  def initialize(window)
    @ball = Gosu::Image.new(window, File.join(File.dirname(__FILE__), "../media", "ball.png"), true)

    @ball_velocity = 2.5
    @y = WarOS::HEIGHT/2
    @x = WarOS::WIDTH/3
 
    # Ball is always moving
    # True point to the key direction and false to its opposite
    @moving_state = {:top => true, :right => true}
  end

  def move
    if @moving_state[:top]
      @y -= @ball_velocity
    else
      @y += @ball_velocity
    end

    if @moving_state[:right]
      @x += @ball_velocity
    else
      @x -= @ball_velocity
    end
  end

  def draw
    @ball.draw(@x, @y, 0)
  end
end

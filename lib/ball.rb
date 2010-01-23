class Ball
  BALLWIDTH = 30

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
    colision_detect
    @moving_state[:top]   ? @y -= @ball_velocity : @y += @ball_velocity
    @moving_state[:right] ? @x += @ball_velocity : @x -= @ball_velocity
  end

  def draw
    @ball.draw(@x, @y, 0)
  end

  def colision_detect
    if @y == WarOS::HEIGHT-BALLWIDTH
      @moving_state[:top] = true
    end

    if @y == 0
      @moving_state[:top] = false
    end

    if @x == WarOS::WIDTH-BALLWIDTH
      @moving_state[:right] = false
    end

    if @x == 0
      @moving_state[:right] = true
    end
  end
end

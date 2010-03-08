class Ship
  SHIPWIDTH, SHIPHEIGHT = 170, 30

  SHIPSECUREMARGIN = 10
  SHIPVELOCITY     = 5.0

  attr_accessor :x, :y

  def initialize(window)
    @ship = Gosu::Image.new(window, File.join(File.dirname(__FILE__), "../media", "ship.png"), true)
    @y = WarOS::HEIGHT-30
    @x = WarOS::WIDTH/3
  end

  def move_left 
    @x -= SHIPVELOCITY if @x > SHIPSECUREMARGIN
  end

  def move_right
    @x += SHIPVELOCITY if @x <= WarOS::WIDTH - SHIPWIDTH
  end

  def draw
    @ship.draw(@x, @y, 0)
  end
  
  def position
    @x..(@x+SHIPWIDTH)
  end
end

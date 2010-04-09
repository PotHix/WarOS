class Ship
  SHIPWIDTH, SHIPHEIGHT = 170, 30
  INITIALPOSITION = {:y => 510, :x => 210}

  SHIPSECUREMARGIN = 5
  SHIPVELOCITY     = 5.0

  attr_accessor :x, :y

  def initialize(window)
    @ship = Gosu::Image.new(window, File.join(File.dirname(__FILE__), "../media", "ship.png"), true)
    @y = INITIALPOSITION[:y]
    @x = INITIALPOSITION[:x]
  end

  def move_left 
    @x -= SHIPVELOCITY if @x > SHIPSECUREMARGIN
  end

  def move_right
    @x += SHIPVELOCITY if @x < WarOS::WIDTH - SHIPWIDTH
  end

  def draw
    @ship.draw(@x, @y, 0)
  end
  
  def position
    @x..(@x+SHIPWIDTH)
  end
end

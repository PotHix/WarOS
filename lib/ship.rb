class Ship
  INITIALPOSITION = {:y => 510, :x => 210}

  SHIPSECUREMARGIN = 5
  SHIPVELOCITY     = 5.0

  attr_accessor :x, :y, :state, :width, :height

  def initialize(window)
    win = Gosu::Image.new(window, File.join(File.dirname(__FILE__), "../media", "win.png"), true)
    mac = Gosu::Image.new(window, File.join(File.dirname(__FILE__), "../media", "mac.png"), true)
    lin = Gosu::Image.new(window, File.join(File.dirname(__FILE__), "../media", "lin.png"), true)

    @state = :mac
    @y = INITIALPOSITION[:y]
    @x = INITIALPOSITION[:x]

    @ship = mac

    @width = @ship.width
    @height = @ship.height
  end

  def move_left 
    @x -= SHIPVELOCITY if @x > SHIPSECUREMARGIN
  end

  def move_right
    @x += SHIPVELOCITY if @x < WarOS::WIDTH - self.width
  end

  def draw
    @ship.draw(@x, @y, 0)
  end
  
  def position
    @x..(@x+self.width)
  end
end

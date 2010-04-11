class Ship
  DIMENSIONS = {
    :win => { :width  => 213, :height => 24 },
    :mac => { :width  => 160, :height => 24 },
    :lin => { :width  => 108, :height => 24 }
  }

  INITIALPOSITION = {:y => 510, :x => 210}

  SHIPSECUREMARGIN = 5
  SHIPVELOCITY     = 5.0

  attr_accessor :x, :y, :state

  def initialize(window)
    @ship = Gosu::Image.new(window, File.join(File.dirname(__FILE__), "../media", "ship.png"), true)
    @y = INITIALPOSITION[:y]
    @x = INITIALPOSITION[:x]

    @state = :mac
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

  def height
    DIMENSIONS[@state][:height]
  end

  def width
    DIMENSIONS[@state][:width]
  end
end

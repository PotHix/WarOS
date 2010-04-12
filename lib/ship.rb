class Ship
  INITIALPOSITION = {:y => 510, :x => 210}

  SECUREMARGIN = 5
  VELOCITY     = 5.0

  attr_reader :state, :image
  attr_accessor :x, :y

  def initialize(window)
    @graphics = {
      :win => Gosu::Image.new(window, File.join(File.dirname(__FILE__), '../media', 'win.png'), true),
      :mac => Gosu::Image.new(window, File.join(File.dirname(__FILE__), '../media', 'mac.png'), true),
      :lin => Gosu::Image.new(window, File.join(File.dirname(__FILE__), '../media', 'lin.png'), true)
    }

    @state = :mac

    @y = INITIALPOSITION[:y]
    @x = INITIALPOSITION[:x]

    @image = build_graphic
  end

  def move_left 
    @x -= VELOCITY if @x > SECUREMARGIN
  end

  def move_right
    @x += VELOCITY if @x < WarOS::WIDTH - self.width
  end

  def draw
    @image.draw(@x, @y, 0)
  end
  
  def position
    @x..(@x+self.width)
  end

  def state=(new_state)
    @state = new_state.to_sym
    build_graphic
  end

  def width
    @image.width
  end

  def height
    @image.height
  end

  private
    def build_graphic
      @image = @graphics[@state]
    end
end

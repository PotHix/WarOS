require 'rubygems'
require 'gosu'

require 'lib/ball'
require 'lib/ship'

class WarOS < Gosu::Window
  WINDOWMARGIN  = 10
  WIDTH, HEIGHT = 480, 640

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "WarOS Game!"

    @ship = Ship.new(self)
    @ball = Ball.new(self)
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft
      @ship.move_left
    end

    if button_down? Gosu::KbRight or button_down? Gosu::GpRight
      @ship.move_right
    end

    @ball.move
  end

  def draw
    @ship.draw
    @ball.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

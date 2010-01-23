require 'rubygems'
require 'gosu'

require 'lib/ball'
require 'lib/ship'

class WarOS < Gosu::Window
  WIDTH, HEIGHT = 480, 640

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "WarOS Game!"

    @ship = Ship.new(self)
    @ball = Ball.new(self)

    @text = Gosu::Font.new(self,'Arial',15)
    @moving_state_text = Gosu::Font.new(self,'Arial',15)
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

    @text.draw("x = #{@ball.instance_variable_get('@x')} | y = #{@ball.instance_variable_get('@y')}",10,10,0)
    @text.draw("top = #{@ball.instance_variable_get('@moving_state')[:top]} | right = #{@ball.instance_variable_get('@moving_state')[:right]}",10,20,0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

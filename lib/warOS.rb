require 'rubygems'
require 'gosu'

require_relative "ball"
require_relative "ship"
require_relative "enemy"
require_relative "item"

class WarOS < Gosu::Window
  WIDTH, HEIGHT = 640, 640
  SHIPCOLISIONPOSITION = Ship::INITIALPOSITION[:y] - Ball::BALLWIDTH

  DELAY = 20

  attr_reader :ship, :ball

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "WarOS Game!"

    @@button_press_control = 0

    @ship = Ship.new(self)
    @ball = Ball.new(self)

    @background_image = Gosu::Image.new(self, "media/background.png", true)

    @text = Gosu::Font.new(self,'Arial',15)
    @moving_state_text = Gosu::Font.new(self,'Arial',15)
  end

  def update
    close if game_over?

    @@button_press_control+=1

    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft
      @ship.move_left
    end

    if button_down? Gosu::KbRight or button_down? Gosu::GpRight
      @ship.move_right
    end

    if button_down?(Gosu::KbSpace) && @@button_press_control-DELAY > 0

      @@button_press_control = 0
      case @ship.state
        when :win
          @ship.state = :mac
        when :mac
          @ship.state = :lin
        when :lin
          @ship.state = :win
      end
    end

    @ball.directions_changing :to_top => has_ship_and_ball_colision?
    @ball.move
  end

  def draw
    @background_image.draw(0, 0, 0)

    @ship.draw
    @ball.draw

    @text.draw("x = #{@ball.instance_variable_get('@x')} | y = #{@ball.instance_variable_get('@y')}",10,10,0)
    @text.draw("top = #{@ball.instance_variable_get('@moving_state')[:top]} | right = #{@ball.instance_variable_get('@moving_state')[:right]}",10,20,0)
    @text.draw("state = #{@ship.state}",10,30,0)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def game_over?
    @ball.position[:y] >= (HEIGHT - Ball::BALLWIDTH)
  end

  def has_ship_and_ball_colision?
    secure_margin_range = SHIPCOLISIONPOSITION-@ball.direction_change_margin..SHIPCOLISIONPOSITION+@ball.direction_change_margin
    secure_margin_range.include?(@ball.position[:y]) && @ship.position.include?(@ball.position[:x])
  end
end

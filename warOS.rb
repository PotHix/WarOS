require 'rubygems'
require 'gosu'

require 'lib/ball'
require 'lib/ship'

class WarOS < Gosu::Window
  def initialize
    super(480, 640, false)
    self.caption = "WarOS Game!"
  end

  def update
  end

  def draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

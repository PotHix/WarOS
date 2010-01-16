class Ship
  def initialize(window)
    @ship = Gosu::Image.new(window, File.join(File.dirname(__FILE__), "../media", "ship.png"), true)
  end

  def self.truth
    true
  end
end

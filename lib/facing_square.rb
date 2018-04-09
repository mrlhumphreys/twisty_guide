class FacingSquare
  def initialize(x: , y:, units:, colour:, opacity:)
    @x, @y = x, y
    @units = units
    @colour = colour
    @opacity = opacity
  end

  attr_reader :x, :y, :units, :colour, :opacity

  def max_x
    x + units
  end

  def max_y
    y + units
  end
end

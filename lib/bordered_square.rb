class BorderedSquare
  def initialize(x: , y:, width:, height:, colour:, opacity:)
    @x, @y = x, y
    @width, @height = width, height
    @colour = colour
    @opacity = opacity
  end

  attr_reader :x, :y, :width, :height, :colour, :opacity

  def max_x
    x + width 
  end

  def max_y
    y + height 
  end
end

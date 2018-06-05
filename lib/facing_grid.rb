class FacingGrid
  def initialize(x:, y:, units:, squares: )
    @x, @y = x, y
    @units = units
    @squares = squares
  end

  attr_reader :x, :y, :units, :squares

  def width
    squares.first.size 
  end

  def height
    squares.size
  end

  def max_x 
    x + width * units
  end 

  def max_y
    y + height * units
  end

  def rows
    (1..(height-1)).to_a
  end

  def columns
    (1..(width-1)).to_a
  end

  def unit_x(n)
    x + n * units
  end

  def unit_y(n)
    y + n * units
  end

  def unit_width(n)
    units
  end

  def unit_height(n)
    units
  end
end


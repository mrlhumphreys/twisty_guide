class BorderedGrid
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

  def border_unit
    units / 4
  end

  def max_x 
    x + (width - 2) * units + (2 * border_unit)
  end 

  def max_y
    y + (height - 2) * units + (2 * border_unit)
  end

  def rows
    (1..(height-1)).to_a
  end

  def columns
    (1..(width-1)).to_a
  end

  def unit_x(n)
    if n == 0
      x
    else
      x + border_unit + (n - 1) * units 
    end
  end

  def unit_y(n)
    if n == 0
      y
    else
      y + border_unit + (n - 1) * units
    end
  end

  def unit_width(n)
    if n == 0 || n == (width - 1)
      border_unit
    else
      units
    end
  end

  def unit_height(n)
    if n == 0 || n == (height - 1)
      border_unit
    else
      units
    end
  end
end


require './lib/position'

class Grid
  def initialize(x:, y:, units: , squares: ) 
    @x, @y = x, y
    @units = units
    @squares = squares
  end

  attr_reader :x, :y, :units, :squares

  def width
    @width ||= squares.first.size 
  end

  def height
    @height ||= squares.size
  end

  # positioning squares

  def top_left_square
    @top_left_square ||= Position.new(x, y) + offset_unit*(height-1)
  end

  def square_position(row, col)
    top_left_square + width_unit*col + height_unit*row
  end

  # positioning lines

  def top_left
    @top_left ||= Position.new(x,y) + offset_unit*height
  end

  def top_right
    @top_right ||= top_left + width_unit*width
  end

  def bottom_right
    @bottom_right ||= top_left + width_unit*width + height_unit*height
  end

  def bottom_left
    @bottom_left ||= top_left + height_unit*height
  end

  def row_line_start(n)
    top_left + height_unit*n
  end

  def row_line_end(n)
    top_right + height_unit*n 
  end

  def column_line_start(n)
    top_left + width_unit*n
  end

  def column_line_end(n)
    bottom_left + width_unit*n
  end
end



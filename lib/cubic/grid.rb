require './lib/position'

module Cubic
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

    def rows
      Array.new(height) do |i|
        {
          x1: row_line_start(i+1).x,
          y1: row_line_start(i+1).y,
          x2: row_line_end(i+1).x,
          y2: row_line_end(i+1).y
        }
      end
    end

    def columns 
      Array.new(width) do |i|
        {
          x1: column_line_start(i+1).x,
          y1: column_line_start(i+1).y,
          x2: column_line_end(i+1).x,
          y2: column_line_end(i+1).y
        }
      end
    end

    def points
      [
        [
          top_left.x,
          top_left.y
        ],
        [
          top_right.x,
          top_right.y
        ],
        [
          bottom_right.x,
          bottom_right.y
        ],
        [
          bottom_left.x,
          bottom_left.y
        ]
      ]
    end

    def points_string
      points.map { |x,y| [x,y].join(',') }.join(' ')
    end
  end
end


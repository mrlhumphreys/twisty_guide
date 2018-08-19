require 'lib/cubic/facing_square'

module Cubic
  class FacingGrid
    def initialize(x:, y:, units:, squares: )
      @x, @y = x, y
      @units = units
      @squares = case squares
      when String
        FaceParser.new(squares).to_a
      when Array
        squares
      else
        raise ArgumentErro, "squares must be array or string" 
      end
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

    def rows
      Array.new(height) do |i|
        {
          x1: x,
          y1: unit_y(i+1),
          x2: max_x,
          y2: unit_y(i+1)
        }
      end
    end

    def columns 
      Array.new(width) do |i|
        {
          x1: unit_x(i+1),
          y1: y,
          x2: unit_x(i+1),
          y2: max_y
        }
      end
    end

    def element_shapes
      squares.map.each_with_index do |row, row_num|
        row.map.each_with_index do |col, col_num|
          if col 
            Cubic::FacingSquare.new(x: unit_x(col_num), y: unit_y(row_num), width: unit_width(col_num), height: unit_height(row_num), colour: col[:colour], opacity: col[:opacity])
          end
        end
      end.flatten.compact
    end

    def points
      [
        [
          x,
          y
        ],
        [
          max_x,
          y
        ],
        [
          max_x,
          max_y
        ],
        [
          x,
          max_y
        ]
      ]
    end

    def points_string
      points.map { |x,y| [x,y].join(',') }.join(' ')
    end
  end
end

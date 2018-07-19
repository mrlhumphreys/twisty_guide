module Cubic
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


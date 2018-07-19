module Cubic
  class FacingSquare
    def initialize(x:, y:, width:, height: , colour:, opacity:)
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

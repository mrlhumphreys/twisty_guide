module Skewb
  class SkewbElement
    def initialize(x:, y:, units: , colour: , opacity:)
      @x, @y = x, y
      @units = units
      @colour = colour
      @opacity = opacity
    end

    attr_reader :x, :y, :units, :colour, :opacity
    
    def points
      []
    end

    def points_string
      points.map { |p| p.join(',') }.join(' ')
    end
  end
end

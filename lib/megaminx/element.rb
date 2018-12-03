module Megaminx
  class Element
    def initialize(points: , colour: , opacity:)
      @points = points
      @colour = colour
      @opacity = opacity
    end

    attr_reader :points, :colour, :opacity

    def points_string
      points.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
    end
  end
end

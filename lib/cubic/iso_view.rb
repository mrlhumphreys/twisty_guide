module Cubic
  class IsoView
    def initialize(x: , y: , units: , top: , front: , right:)
      @x, @y = x, y
      @units = units
      @top = FaceParser.new(top).to_a 
      @front = FaceParser.new(front).to_a 
      @right = FaceParser.new(right).to_a 
    end

    attr_reader :x, :y, :units, :top, :front, :right

    def top_position
      { 
        x: x,
        y: y
      }
    end

    def front_position
      {
        x: x,
        y: y + top.size * units / 2,
      }
    end

    def right_position
      {
        x: x + top.first.size * units,
        y: y + top.first.size * units / 2
      }
    end
  end
end

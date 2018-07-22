require 'lib/square_one/edge'
require 'lib/square_one/corner'

module SquareOne
  class Face 
    def initialize(x:, y: , units: , elements:)
      @x, @y = x, y
      @units = units
      @elements = elements
    end

    attr_reader :x, :y, :units, :elements

    def half_edge_width 
      @half_edge_width ||= half_face_size * Math.tan(Math::PI/12) 
    end

    def half_face_size 
      @half_face_size ||= face_size / 2 
    end

    def face_size
      @face_size ||= 3 * units
    end

    def axis
      {
        x1: x+half_face_size+half_edge_width,
        y1: y,
        x2: x+half_face_size-half_edge_width,
        y2: y+face_size
      }
    end

    def element_shapes
      elements.map do |element|
        case element[:shape]
        when :edge 
          SquareOne::Edge.new(x: x, y: y, units: units, offset: element[:offset], colour: element[:colour], opacity: element[:opacity])
        when :corner 
          SquareOne::Corner.new(x: x, y: y, units: units, offset: element[:offset], colour: element[:colour], opacity: element[:opacity])
        else
          nil
        end
      end
    end
  end
end

require './lib/cubic/square'

module Cubic
  class SquareFactory
    def initialize(x:, y:, units:, colour:, opacity:)
      @x, @y = x, y
      @units = units
      @colour, @opacity = colour, opacity 
    end

    attr_reader :x, :y, :units, :colour, :opacity

    def build
      Cubic::Square.new(x: x, y: y, width_unit: width_unit, height_unit: height_unit, offset_unit: offset_unit, colour: colour, opacity: opacity)
    end
  end
end

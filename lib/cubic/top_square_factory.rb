require './lib/cubic/square_factory'

module Cubic
  class TopSquareFactory < SquareFactory
    def width_unit
      @width_unit ||= Position.new(units, units/2)
    end

    def height_unit
      @height_unit ||= Position.new(-units, units/2)
    end

    def offset_unit
      @offset_unit ||= Position.new(units, 0)
    end
  end
end

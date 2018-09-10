require './lib/cubic/grid'

module Cubic
  class TopGrid < Cubic::Grid
    def width_unit
      @width_unit ||= Position.new(units, units/2)
    end

    def height_unit
      @height_unit ||= Position.new(-units, units/2)
    end

    def offset_unit
      @offset_unit ||= Position.new(units,0)
    end

    def line_offset_amount
      height
    end

    def square_offset_amount
      height - 1
    end
  end
end


require './lib/cubic/grid'

module Cubic
  class RightGrid < Cubic::Grid
    def width_unit
      @width_unit ||= Position.new(units, units*-0.5)
    end

    def height_unit
      @height_unit ||= Position.new(0, units)
    end

    def offset_unit
      @offset_unit ||= Position.new(0,units*0.5)
    end

    def line_offset_amount
      width
    end

    def square_offset_amount
      width - 1 
    end
  end
end

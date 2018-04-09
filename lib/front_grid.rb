require './lib/grid'

class FrontGrid < Grid
  def width_unit
    @width_unit ||= Position.new(units, units/2)
  end

  def height_unit
    @height_unit ||= Position.new(0, units)
  end

  def offset_unit
    @offset_unit ||= Position.new(0,0)
  end
end


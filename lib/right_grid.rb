require './lib/grid'

class RightGrid < Grid
  def width_unit
    @width_unit ||= Position.new(units, units*-0.5)
  end

  def height_unit
    @height_unit ||= Position.new(0, units)
  end

  def offset_unit
    @offset_unit ||= Position.new(0,units*0.5)
  end
end


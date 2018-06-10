require './lib/position'

class Square
  def initialize(x:, y:, width_unit:, height_unit:, offset_unit:, colour:, opacity:)
    @x, @y = x, y
    @width_unit, @height_unit, @offset_unit = width_unit, height_unit, offset_unit
    @colour = colour
    @opacity = opacity
  end

  attr_reader :x, :y, :width_unit, :height_unit, :offset_unit, :colour, :opacity

  def top_left
    Position.new(x, y) + offset_unit
  end

  def top_right
    top_left + width_unit
  end 

  def bottom_right
    top_left + width_unit + height_unit
  end 

  def bottom_left
    top_left + height_unit
  end 

  def points
    [
      [
        top_left.x,
        top_left.y
      ],
      [
        top_right.x,
        top_right.y
      ],
      [
        bottom_right.x,
        bottom_right.y
      ],
      [
        bottom_left.x,
        bottom_left.y
      ]
    ]
  end

  def points_string
    points.map { |x,y| [x,y].join(',') }.join(' ')
  end
end


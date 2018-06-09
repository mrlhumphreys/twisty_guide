class PyraminxTriangle
  def initialize(x: , y: , units: , direction:, colour: , opacity:)
    @x, @y = x, y
    @units = units
    @direction = direction
    @colour = colour
    @opacity = opacity
  end

  attr_reader :x, :y, :units, :direction, :colour, :opacity

  def up_points
    [
      [
        x+units,
        y 
      ],
      [
        x+2*units,
        y+units
      ],
      [
        x,
        y+units
      ]
    ]
  end

  def down_points
    [
      [
        x+units,
        y+units
      ],
      [
        x+2*units,
        y
      ],
      [
        x,
        y 
      ]
    ]
  end

  def points
    if direction == :up
      up_points
    else
      down_points
    end
  end

  def points_string
    points.map { |x,y| [x,y].join(',') }.join(' ')
  end
end

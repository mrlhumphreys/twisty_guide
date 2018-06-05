class HorizontalArrow
  def initialize(x:, y:)
    @x, @y = x, y
  end

  attr_reader :x, :y

  def points
    [
      [x,y+7],
      [x+7,y],
      [x+7,y+4],
      [x+33,y+4],
      [x+33,y],
      [x+40,y+7],
      [x+33,y+14],
      [x+33,y+10],
      [x+7,y+10],
      [x+7,y+14]
    ]
  end

  def points_string
    points.map { |p| p.join(',') }.join(' ')
  end

end

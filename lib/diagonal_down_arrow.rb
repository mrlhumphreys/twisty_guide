class DiagonalDownArrow
  def initialize(x:, y:)
    @x, @y = x, y
  end

  attr_reader :x, :y

  def points
    [
      [x,y],
      [x+10,y],
      [x+7,y+3],
      [x+37,y+33],
      [x+40,y+30],
      [x+40,y+40],
      [x+30,y+40],
      [x+33,y+37],
      [x+3,y+7],
      [x,y+10]
    ]
  end

  def points_string
    points.map { |p| p.join(',') }.join(' ')
  end

end

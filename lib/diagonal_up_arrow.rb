class DiagonalUpArrow
  def initialize(x:, y:)
    @x, @y = x, y
  end

  attr_reader :x, :y

  def points
    [
      [x,y+40],
      [x,y+30],
      [x+3,y+33],
      [x+33,y+3],
      [x+30,y],
      [x+40,y],
      [x+40,y+10],
      [x+37,y+7],
      [x+7,y+37],
      [x+10,y+40]
    ]
  end

  def points_string
    points.map { |p| p.join(',') }.join(' ')
  end

end

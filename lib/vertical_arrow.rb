class VerticalArrow
  def initialize(x:, y:)
    @x, @y = x, y
  end

  attr_reader :x, :y

  def points
    [
      [x+8,y],
      [x+16,y+8],
      [x+11,y+8],
      [x+11,y+32],
      [x+16,y+32],
      [x+8,y+40],
      [x,y+32],
      [x+5,y+32],
      [x+5,y+8],
      [x,y+8]
    ]
  end

  def points_string
    points.map { |p| p.join(',') }.join(' ')
  end

end

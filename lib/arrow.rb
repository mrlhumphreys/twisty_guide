class Arrow
  def initialize(x:, y:, length:, direction: :uni)
    @x, @y = x, y
    @length = length
    @direction = direction
  end

  attr_reader :x, :y, :length, :direction

  def points
    []
  end

  def points_string
    points.map { |p| p.join(',') }.join(' ')
  end
end
